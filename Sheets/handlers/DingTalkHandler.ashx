<%@ WebHandler Language="C#" Class="DingTalkHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Net;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Text;
using System.Web.Script.Serialization;
using OThinker.H3;

public class DingTalkHandler : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public static string corpID = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDCorpID);
    public static string secretID = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDSecret);
    public static string DDAgentId = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDAgentId);

    public static string DDMsgUrl = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDUrl);
    public static string DDPcMsgUrl = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDPcUrl);

    public static string DDReminderStr = "催办流程:";
    public static string NewsCode = "I_NewsView";
    public static string NoticeCode = "I_NewNotice";
    public void ProcessRequest(HttpContext context)
    {


        string command = context.Request["Command"];
        switch (command)
        {

            case "SendNoticeByInstanceId": SendNoticeByInstanceId(context); break;
            case "DDQueryNewsAndNotice": DDQueryNewsAndNotice(context); break;

            case "DDViewNews": DDViewNews(context); break;

        }
    }

    public void DDQueryNewsAndNotice(HttpContext context)
    {
        string searchingStr = context.Request["SearchingStr"];
        string isNews = context.Request["IsNews"];
        string lastTime = context.Request["LastTime"];

        string workFlowCode = (isNews == "1") ? NewsCode : NoticeCode;
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        string resLastTime = DateTime.Now.ToLocalTime().ToString();

        string sql = " SELECT T.Title,T.PublishTime,T.WorkItemId FROM " +
            " (SELECT ROW_NUMBER () OVER (ORDER BY nv.PublishTime DESC) AS RowNumber_, " +
            " wf.ObjectID AS WorkItemId,nv.Title,nv.PublishTime " +
            " FROM " + workFlowCode + " nv INNER JOIN OT_InstanceContext ic ON ic.BizObjectId = nv.ObjectID " +
            " INNER JOIN OT_WorkItemFinished wf ON wf.InstanceId = ic.ObjectID WHERE nv.Status = '上线'";

        if (!string.IsNullOrEmpty(lastTime))
        {
            sql += "AND nv.PublishTime <= '" + lastTime + "'";
        }
        if (!string.IsNullOrEmpty(searchingStr))
        {
            sql += "AND nv.Title LIKE '%" + searchingStr + "%'";
        }
        sql += " ) T WHERE RowNumber_ >= 1 AND RowNumber_ <= 10";


        System.Data.DataTable resultDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (resultDt.Rows.Count > 0)
        {
            resLastTime = resultDt.Rows[resultDt.Rows.Count - 1]["PublishTime"].ToString();
            foreach (DataRow dr in resultDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("Title", dr["Title"].ToString());
                dic.Add("ObjectID", dr["WorkItemId"].ToString());
                DateTime publishTime = DateTime.Parse(dr["PublishTime"].ToString());
                string publishTimeStr = publishTime.ToShortDateString().ToString().Replace("/", "-");
                dic.Add("PublishTime", publishTimeStr);
                resultList.Add(dic);
            }
        }
        var result = new
        {
            LoadComplete = resultDt.Rows.Count < 10, // 是否加载完成
            LastTime = resLastTime,                        // 最后加载时间                     
            TotalCount = resultList.Count,                 // 记录总数
            NewsList = resultList                         // 新闻内容

        };
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }


    public void DDViewNews(HttpContext context)
    {
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            " SELECT TOP 5 nv.ObjectID,wf.ObjectID as WorkItemId,nv.Title,nv.PublishTime " +
            " FROM I_NewsView nv INNER JOIN OT_InstanceContext ic ON ic.BizObjectId = nv.ObjectID " +
            " INNER JOIN OT_WorkItemFinished wf ON wf.InstanceId = ic.ObjectID " +
            " WHERE Status = '上线' ORDER BY IsTop DESC, PublishTime DESC ");
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        if (newsDt.Rows.Count > 0)
        {
            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                System.Data.DataTable ImageDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                   "SELECT TOP 1 ac.ObjectID FROM OT_Attachment ac WHERE ac.DataField = 'Image' AND BizObjectId = '" + dr["ObjectID"].ToString() + "' ORDER BY ac.CreatedTime ASC");
                if (ImageDt.Rows.Count > 0)
                {
                    string imageUrl = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=NewsView&BizObjectID=" + dr["ObjectID"].ToString() + "&AttachmentID=" + ImageDt.Rows[0]["ObjectID"].ToString() + "&OpenMethod=0";
                    dic.Add("firstimage", imageUrl);
                }
                else
                {
                    dic.Add("firstimage", "");
                }
                dic.Add("NewsId", dr["WorkItemId"].ToString());
                dic.Add("object", dr["ObjectID"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                resultList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public static string GetToken(string corpid, string corpsecret)
    {
        string respText = string.Empty;
        string Url = "https://oapi.dingtalk.com/gettoken?corpid=" + corpid + "&corpsecret=" + corpsecret;
        OThinker.H3.Controllers.AppUtility.Engine.LogWriter.Write("gettoken:" + Url);
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
        request.KeepAlive = false;
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        try
        {
            using (Stream resStream = response.GetResponseStream())
            {
                StreamReader reader = new StreamReader(resStream, Encoding.UTF8);
                respText = reader.ReadToEnd();
                resStream.Close();
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            response.Close();
        }
        JObject obj = (JObject)JsonConvert.DeserializeObject(respText);
        string tokenid = obj["access_token"].ToString();
        return tokenid;

    }

    public void SendNoticeByInstanceId(HttpContext context)
    {
        string tel = context.Request["Tel"];
        string instanceid = context.Request["Instanceid"];
        string body = "催办内容:" + context.Request["Body"];
        string resultText = "";
        if (!string.IsNullOrEmpty(instanceid))
        {
            //取当OT_WorkItemFinished 最新的id
            string sql = "SELECT wi.ObjectID , wi.Participant , wl.WorkflowName  " +
                "  FROM OT_WorkItem wi INNER JOIN OT_WorkflowClause wl ON" +
                "  wi.WorkflowCode = wl.WorkflowCode WHERE wi.InstanceId= '" + instanceid + "'";
            DataTable dtworkitem = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);

            if (dtworkitem.Rows.Count > 0)
            {
                foreach (DataRow dr in dtworkitem.Rows)
                {
                    string title = DDReminderStr + dr["WorkflowName"].ToString();
                    string workitemid = dr["ObjectID"].ToString();   //模板id
                    string userid = GetUserCode(dr["Participant"].ToString());  //催办对象

                    WriteLog("开始发送钉钉待办消息提醒：userid-->" + userid + ",workitemid-->" + workitemid + ",title-->" + title + ",body-->" + body);
                    //获取access_token
                    string tokenid = GetToken(corpID, secretID);

                    string strUrl = "https://oapi.dingtalk.com/message/send?access_token=" + tokenid;
                    string json = "{\"touser\":\"" + userid + "\",\"toparty\":\"\",\"agentid\":\"" + DDAgentId + "\",\"msgtype\":\"oa\",\"text\":null,\"oa\":{\"message_url\":\"" + DDMsgUrl.Replace("{WorkItemID}", workitemid) + "\",\"pc_message_url\":\"" + DDPcMsgUrl.Replace("{WorkItemID}", workitemid) + "\",\"head\":{\"bgcolor\":\"99104E8B\",\"text\":\"" + title + "\"},\"body\":{\"title\":\"" + title + "\",\"form\":null,\"content\":\"" + body + "\",\"image\":null,\"file_count\":null,\"author\":null}}}";
                    WriteLog("messageContent--" + json);
                    ServicePointManager.DefaultConnectionLimit = 100;
                    if (strUrl.ToLower().Contains("https"))
                    {
                        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;
                    }

                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strUrl);
                    request.Method = "POST";
                    request.ContentType = "application/json";
                    request.CookieContainer = new CookieContainer();
                    request.KeepAlive = false;
                    request.CookieContainer.Add(new Cookie("test", "i love u", "/", "localhost"));
                    byte[] data = System.Text.Encoding.GetEncoding("UTF-8").GetBytes(json);
                    request.ContentLength = data.Length;
                    request.GetRequestStream().Write(data, 0, data.Length);

                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    string respText = "";
                    try
                    {
                        using (System.IO.Stream resStream = response.GetResponseStream())
                        {
                            System.IO.StreamReader reader = new System.IO.StreamReader(resStream, System.Text.Encoding.UTF8);
                            respText = reader.ReadToEnd();
                            resStream.Close();
                            resultText += respText;
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        //发送手机短信
                        if (!string.IsNullOrEmpty(tel))
                        {
                            SendMsg(tel, title + "\r\n" + body + "（钉钉）");
                        }
                        response.Close();
                    }
                    WriteLog("Result:" + respText);
                }

            }
        }


        object JSONObj = JsonConvert.SerializeObject(resultText);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void WriteLog(string Msg)
    {
        OThinker.H3.Controllers.AppUtility.Engine.LogWriter.Write(Msg);
    }

    public bool SendMsg(string tel, string msg)
    {
        bool success = false;
        Dictionary<string, object> para = new Dictionary<string, object>();
        para.Add("strMobile", tel);
        para.Add("strMsg", msg);
        Dictionary<string, object> ret = ExecuteBizNonQuery("SendMobileMsg", "SendMsg", para);
        if (ret != null && ret.Count > 0)
        {
            success = Convert.ToBoolean(ret["Return"]);
        }
        if (success)
            OThinker.H3.Controllers.AppUtility.Engine.LogWriter.Write("发送手机短信提醒成功，手机号-->" + tel + ",短信内容-->" + msg);
        else
            OThinker.H3.Controllers.AppUtility.Engine.LogWriter.Write("发送手机短信提醒失败，手机号-->" + tel + ",短信内容-->" + msg);
        return success;
    }


    /// <summary>
    /// 后台调用业务服务
    /// </summary>
    /// <param name="serviceCode">业务服务编码</param>
    /// <param name="serviceMethod">方法名称</param>
    /// <param name="dicParams">参数字典</param>
    public static Dictionary<string, object> ExecuteBizNonQuery(string serviceCode, string serviceMethod, Dictionary<string, object> dicParams)
    {
        try
        {
            // 获得业务方法
            OThinker.H3.BizBus.BizService.MethodSchema method = OThinker.H3.Controllers.AppUtility.Engine.BizBus.GetMethod(serviceCode, serviceMethod);
            // 获得参数列表
            OThinker.H3.BizBus.BizService.BizStructure param = null;
            if (dicParams != null)
            {
                // 填充业务方法需要的参数
                param = OThinker.H3.BizBus.BizService.BizStructureUtility.Create(method.ParamSchema);
                foreach (var item in dicParams)
                {
                    param[item.Key] = item.Value;
                }
            }
            // 调用方法返回结果
            OThinker.H3.BizBus.BizService.BizStructure ret = null;

            // 调用方法，获得返回结果
            ret = OThinker.H3.Controllers.AppUtility.Engine.BizBus.Invoke(
                 new OThinker.H3.BizBus.BizService.BizServiceInvokingContext(
                     OThinker.Organization.User.AdministratorID,
                     serviceCode,
                     method.ServiceVersion,
                     method.MethodName,
                     param));
            Dictionary<string, object> result = new Dictionary<string, object>();
            if (ret != null && ret.Schema != null)
            {
                foreach (OThinker.H3.BizBus.BizService.ItemSchema item in ret.Schema.Items)
                {
                    result.Add(item.Name, ret[item.Name]);
                }
            }
            return result;
        }
        catch (Exception ex)
        {
            // 调用错误日志记录
            OThinker.H3.Controllers.AppUtility.Engine.LogWriter.Write("业务服务调用错误：" + ex);
            return null;
        }
    }
    public string GetUserCode(string UserId)
    {
        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "SELECT Code FROM OT_User WHERE ObjectID= '" + UserId + "'");

        return dt.Rows[0]["Code"].ToString();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    private IEngine _Engine = null;
    /// <summary>
    /// 流程引擎的接口，该接口会比this.Engine的方式更快，因为其中使用了缓存
    /// </summary>
    public IEngine Engine
    {
        get
        {
            if (OThinker.H3.Controllers.AppConfig.ConnectionMode == ConnectionStringParser.ConnectionMode.Mono)
            {
                return OThinker.H3.Controllers.AppUtility.Engine;
            }
            return _Engine;
        }
        set
        {
            _Engine = value;
        }
    }

}