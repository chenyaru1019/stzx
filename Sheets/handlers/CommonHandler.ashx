<%@ WebHandler Language="C#" Class="CommonHandler" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Xml;
using System.Data;

public class CommonHandler : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {

            case "ViewAllNavigate": ViewAllNavigate(context); break;
            case "GetNavigationsUpByUrl": GetNavigationsUpByUrl(context); break;
            case "GetNavigationsByCid": GetNavigationsByCid(context); break;
            //更具类别查询序号，并更新
            case "GetSequenceNum": GetSequenceNum(context); break;
            case "UpdateSequenceNum": UpdateSequenceNum(context); break;
            case "GetNameById": GetNameById(context); break;


        }
    }
    public void GetNameById(HttpContext context)
    {
        string userId = context.Request["UserId"];
        string name = this.Engine.Organization.GetName(userId);
        object JSONObj = JsonConvert.SerializeObject(name);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    public void ViewAllNavigate(HttpContext context)
    {

        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        string sql = "SELECT Id,Cid,Mark,Pid,url FROM Navigation";
        System.Data.DataTable navigationDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (navigationDt.Rows.Count > 0)
        {
            foreach (DataRow dr in navigationDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("id", dr["Id"].ToString());
                dic.Add("cid", dr["Cid"].ToString());
                dic.Add("mark", dr["Mark"].ToString());
                dic.Add("pid", dr["Pid"]);
                dic.Add("url", dr["url"]);
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    private void GetNavigationsUpByUrl(HttpContext context)
    {
        string url = context.Request["url"];
        url = HttpUtility.UrlDecode(url);
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable cidDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Cid FROM Navigation WHERE Url = '" + url + "'");
        if (cidDt.Rows.Count > 0)
        {
            string cid = cidDt.Rows[0]["Cid"].ToString();
            int length = cid.Length;
            List<string> list = new List<string>();
            list.Add(cid);
            while (length > 2)
            {
                length = length - 2;
                list.Add(cid.Substring(0, length));
            }
            string sql = "SELECT Cid,Mark,Pid,Url FROM Navigation WHERE Cid IN ";
            string str = "(";

            for (int i = 0; i < list.Count; i++)
            {
                if (i == list.Count - 1)
                    str += "'" + list[i] + "'";
                else
                    str += "'" + list[i] + "',";

            }
            sql += str + ")";
            System.Data.DataTable navigationDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
            if (navigationDt.Rows.Count > 0)
            {
                foreach (DataRow dr in navigationDt.Rows)
                {
                    Dictionary<string, object> dic = new Dictionary<string, object>();
                    dic.Add("cid", dr["Cid"].ToString());
                    dic.Add("mark", dr["Mark"].ToString());
                    dic.Add("pid", dr["Pid"]);
                    dic.Add("url", dr["url"]);
                    resultList.Add(dic);
                }
            }


        }





        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    private void GetNavigationsByCid(HttpContext context)
    {
        string cid = context.Request["Cid"];
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();

        string sql = "SELECT Cid,Mark,Pid,Url FROM Navigation WHERE Cid ='" + cid + "'";

        System.Data.DataTable navigationDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (navigationDt.Rows.Count > 0)
        {
            foreach (DataRow dr in navigationDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("cid", dr["Cid"].ToString());
                dic.Add("mark", dr["Mark"].ToString());
                dic.Add("pid", dr["Pid"]);
                dic.Add("url", dr["url"]);
                resultList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }





    public void GetSequenceNum(HttpContext context)
    {
        string type = context.Request["Type"];
        string smallNum = context.Request["SmallNum"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        System.Data.DataTable NumLibraryDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT SequenceNum FROM NumLibrary " +
            " WHERE Type= '" + type + "'AND SmallNum = '" + smallNum + "'");
        if (NumLibraryDt.Rows.Count > 0)
        {
            resultDic.Add("status", "success");
            resultDic.Add("SequenceNum", NumLibraryDt.Rows[0]["SequenceNum"].ToString());
        }
        UpdateSequence(type, smallNum);
        object JSONObj = JsonConvert.SerializeObject(resultDic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void UpdateSequence(string type, string smallNum)
    {
        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        //发文号不为空，更新发文号
        System.Data.DataTable NumLibraryDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT SequenceNum FROM NumLibrary " +
            " WHERE Type= '" + type + "'AND SmallNum = '" + smallNum + "'");
        if (NumLibraryDt.Rows.Count > 0)
        {
            string updateMun = converStr(NumLibraryDt.Rows[0]["SequenceNum"].ToString());
            System.Data.DataTable updateDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "UPDATE NumLibrary SET SequenceNum ='" + updateMun + "' WHERE Type= '" + type + "'  AND SmallNum = '" + smallNum + "'");
        }
        if (NumLibraryDt.Rows.Count == 1)
        {
            resultDic.Add("status", "success");
        }
    }


    //更新编号
    public void UpdateSequenceNum(HttpContext context)
    {
        string type = context.Request["Type"];
        string smallNum = context.Request["SmallNum"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        //发文号不为空，更新发文号
        System.Data.DataTable NumLibraryDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT SequenceNum FROM NumLibrary " +
            " WHERE Type= '" + type + "'AND SmallNum = '" + smallNum + "'");
        if (NumLibraryDt.Rows.Count > 0)
        {
            string updateMun = converStr(NumLibraryDt.Rows[0]["SequenceNum"].ToString());
            System.Data.DataTable updateDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "UPDATE NumLibrary SET SequenceNum ='" + updateMun + "' WHERE Type= '" + type + "'  AND SmallNum = '" + smallNum + "'");
        }
        if (NumLibraryDt.Rows.Count == 1)
        {
            resultDic.Add("status", "success");
        }
        object JSONObj = JsonConvert.SerializeObject(resultDic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);


    }

    public XmlDocument ConvertStringToXmlDocument(string xmlString)
    {
        XmlDocument document = new XmlDocument();
        document.LoadXml(xmlString);
        return document;
    }


    //转换为001-999  加1
    public string converStr(String str)
    {
        int num = int.Parse(str);// 转换
        num = num + 1;
        num = num == 999 ? 1 : num;
        String reslut = num >= 10 ? (num >= 100 ? num + "" : "0" + num) : "00" + num; // 计算 转型
        return reslut;

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