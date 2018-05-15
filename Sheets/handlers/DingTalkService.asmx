<%@ WebService Language="C#" Class="OThinker.H3.DingTalk.DingTalkService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Net;
using System.Net.Security;
using System.Data;
using OThinker.H3.Controllers;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Text;


namespace OThinker.H3.DingTalk
{

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DingTalkService : System.Web.Services.WebService
    {
        public static string corpID = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDCorpID);
        public static string secretID = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDSecret);

        public static string DDAgentId = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDAgentId);

        public static string DDMsgUrl = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDUrl);
        public static string DDPcMsgUrl = OThinker.H3.Controllers.AppUtility.Engine.SettingManager.GetCustomSetting(OThinker.H3.Settings.CustomSetting.Setting_DDPcUrl);

        public static string DDUnFinishedWork = "http://140.206.138.190:8010/Portal/Hybrid/index.html?target=home.index&state=DefaultEngine&loginfrom=dingtalk#/home/unfinishedworkitem";
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

        [WebMethod]
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

        //待办提醒
        [WebMethod]
        public string SendNoticeByActivityCode(string ActivityCode, string InstanceID)
        {
            //判断
            if (string.IsNullOrEmpty(ActivityCode))
                return "ActivityCode不能为空";
            else if (string.IsNullOrEmpty(InstanceID))
                return "InstanceID不能为空";

            string Title = "";
            string Body = "";
            string msg = "";
            //取当前节点的所有任务
            string sql = "select wi.ObjectID,wi.Participant,wi.TokenId ,wi.Delegant,wa.WorkflowName from OT_WorkItem wi" +
                " INNER JOIN OT_WorkflowClause wa ON wi.WorkflowCode = wa.WorkflowCode  where wi.InstanceId='" + InstanceID + "' and wi.ActivityCode='" + ActivityCode + "'";
            DataTable dtworkitem = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
            foreach (DataRow item in dtworkitem.Rows)
            {
                Title = "待办通知:" + item["WorkflowName"];
                Body = "您有1件新的" + item["WorkflowName"] + string.Empty + "需要审核，请及时处理！";
                if (item["TokenId"] + string.Empty == "1")//手工保存环节，不发送
                    continue;
                if (item["Delegant"] + string.Empty == "")
                {
                    OThinker.Organization.User us = (OThinker.Organization.User)OThinker.H3.Controllers.AppUtility.Engine.Organization.GetUnit(item["Participant"] + string.Empty);

                    msg += SendNotice(us.Code, us.Mobile, item["ObjectID"] + string.Empty, Title, Body) + "\r\n";
                }
                else
                {
                    OThinker.Organization.User us = (OThinker.Organization.User)OThinker.H3.Controllers.AppUtility.Engine.Organization.GetUnit(item["Delegant"] + string.Empty);
                    msg += SendNotice(us.Code, us.Mobile, item["ObjectID"] + string.Empty, Title, Body) + "\r\n";
                }
            }

            return msg;
        }

        /// <summary>
        /// 发送通知(钉钉通知、手机短信)
        /// </summary>
        /// <param name="userid">钉钉登录Code</param>
        /// <param name="tel">手机号码（发送手机短信）</param>
        /// <param name="workitemid">任务ID</param>
        /// <param name="title">消息标题</param>
        /// <param name="body">消息内容</param>
        /// <returns></returns>
        [WebMethod]
        public string SendNotice(string userid, string tel, string workitemid, string title, string body)
        {


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
            return respText;
        }

        //定时查询所有待办流程
        [WebMethod]
        public List<DingTalkParam> QueryList()
        {
            List<DingTalkParam> list = new List<DingTalkParam>();
            string sql = "SELECT wi.Participant,ur.Code,COUNT (wi.ObjectID) as count  FROM OT_WorkItem wi  " +
                " INNER JOIN OT_User ur ON wi.Participant = ur.ObjectID GROUP BY wi.Participant, ur.Code";
            DataTable dtworkitem = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);

            if (dtworkitem.Rows.Count > 0)
            {
                foreach (DataRow dr in dtworkitem.Rows)
                {

                    DingTalkParam dp = new DingTalkParam();
                    dp.Title = "待办任务提醒";
                    dp.Body = "截止当前日期:" + DateTime.Now.ToString() + " 您有" + dr["count"] + "件（待办事件数量）业务需要办理，请及时处理！";
                    dp.UserCode = dr["Code"].ToString().Trim();
                    list.Add(dp);
                }
            }

            return list;
        }


        /// <summary>
        /// 定时发送发送通知(钉钉通知)（根据定时查询的所有待办流程发送通知
        /// </summary>
        /// <param name="userCode">钉钉登录Code</param>
        /// <param name="title">消息标题</param>
        /// <param name="body">消息内容</param>
        /// <returns></returns>
        [WebMethod]
        public string SendNoticeTimer(string userCode, string title, string body)
        {
            string tel = "";
            string workitemid = "";
            WriteLog("开始发送钉钉待办消息提醒：userid-->" + userCode + ",workitemid-->" + workitemid + ",title-->" + title + ",body-->" + body);
            //获取access_token
            string tokenid = GetToken(corpID, secretID);

            string strUrl = "https://oapi.dingtalk.com/message/send?access_token=" + tokenid;
            string json = "{\"touser\":\"" + userCode + "\",\"toparty\":\"\",\"agentid\":\"" + DDAgentId + "\",\"msgtype\":\"oa\",\"text\":null,\"oa\":{\"message_url\":\"" + DDUnFinishedWork + "\",\"pc_message_url\":\"" + DDPcMsgUrl.Replace("{WorkItemID}", workitemid) + "\",\"head\":{\"bgcolor\":\"99104E8B\",\"text\":\"" + title + "\"},\"body\":{\"title\":\"" + title + "\",\"form\":null,\"content\":\"" + body + "\",\"image\":null,\"file_count\":null,\"author\":null}}}";
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
                    //SendMsg(tel, title + "\r\n" + body + "（钉钉）");
                }
                response.Close();
            }
            WriteLog("Result:" + respText);
            return respText;
        }

        /// <summary>
        /// 完成通知
        /// </summary>
        /// <param name="instanceid">任务ID</param>
        /// <returns></returns>
        [WebMethod]
        public string SendCompleteNotice(string instanceid)
        {
            string workitemid = instanceid;
            string title = "";
            string body = "";
            string userid = "";
            if (!string.IsNullOrEmpty(instanceid))
            {
                //取当OT_WorkItemFinished 最新的id
                string sql = "SELECT TOP 1 wf.ObjectID,wc.WorkflowName,ur.Code FROM OT_WorkItemFinished wf " +
                    " INNER JOIN OT_WorkflowClause wc ON wf.WorkflowCode = wc.WorkflowCode " +
                    " INNER JOIN OT_User ur ON ur.ObjectID = wf.Originator WHERE wf.InstanceId = '" + instanceid + "'" +
                    " ORDER BY wf.FinishTime DESC";
                DataTable dtworkitem = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);

                if (dtworkitem.Rows.Count > 0)
                {
                    workitemid = dtworkitem.Rows[0]["ObjectID"].ToString();
                    userid = dtworkitem.Rows[0]["Code"].ToString();
                    title = "申请完成通知:" + dtworkitem.Rows[0]["WorkflowName"];
                    body = "您的" + dtworkitem.Rows[0]["WorkflowName"] + string.Empty + "已审核通过！";
                }
            }

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
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                response.Close();
            }
            WriteLog("Result:" + respText);
            return respText;
        }

        /// <summary>
        /// 发送待阅事务提醒
        /// </summary>
        /// <param name="instanceid">任务ID</param>
        /// <returns></returns>
        [WebMethod]
        public string SendCirculateNotice(string instanceid, string activitycode)
        {
            string workitemid = instanceid;
            string title = "";
            string body = "";
            string userid = "";
            string resultText = "";
            //取当OT_WorkItemFinished 最新的id
            string sql = "SELECT ci.ObjectID, ci.DisplayName,wc.WorkflowName, ur.Code FROM OT_CirculateItem ci " +
                " INNER JOIN OT_User ur ON ci.Participant = ur.ObjectID " +
                " INNER JOIN OT_WorkflowClause wc ON ci.WorkflowCode = wc.WorkflowCode " +
                " WHERE ci.InstanceId = '" + instanceid + "' AND ci.ActivityCode = '" + activitycode + "'";
            DataTable dtCirculateItem = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);

            if (dtCirculateItem.Rows.Count > 0)
            {
                foreach (DataRow dr in dtCirculateItem.Rows)
                {
                    workitemid = dr["ObjectID"].ToString();
                    userid = dr["Code"].ToString();
                    body = "您有1件新的" + dr["WorkflowName"].ToString() + "需要查阅，请及时处理！";
                    title = "待阅通知:" + dr["DisplayName"].ToString();
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
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        response.Close();
                    }
                    WriteLog("Result:" + respText);
                    resultText += respText;
                }
            }


            return resultText;
        }


        [WebMethod]
        public void WriteLog(string Msg)
        {
            OThinker.H3.Controllers.AppUtility.Engine.LogWriter.Write(Msg);
        }

        [WebMethod]
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
                    param = H3.BizBus.BizService.BizStructureUtility.Create(method.ParamSchema);
                    foreach (var item in dicParams)
                    {
                        param[item.Key] = item.Value;
                    }
                }
                // 调用方法返回结果
                OThinker.H3.BizBus.BizService.BizStructure ret = null;

                // 调用方法，获得返回结果
                ret = OThinker.H3.Controllers.AppUtility.Engine.BizBus.Invoke(
                     new BizBus.BizService.BizServiceInvokingContext(
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





        /// 数据项参数
        /// </summary>
        [Serializable]
        public class DingTalkParam
        {
            private string title = string.Empty;
            /// <summary>
            /// 获取或设置数据项名称
            /// </summary>
            public string Title
            {
                get { return title; }
                set { this.title = value; }
            }
            private string body = string.Empty;
            /// <summary>
            /// 获取或设置数据项名称
            /// </summary>
            public string Body
            {
                get { return body; }
                set { this.body = value; }
            }

            private string userCode = string.Empty;
            /// <summary>
            /// 获取或设置数据项的值
            /// </summary>
            public string UserCode
            {
                get { return userCode; }
                set { this.userCode = value; }
            }
        }


    }
}

