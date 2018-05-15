<%@ WebHandler Language="C#" Class="ViewNews" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.Xml;


public class ViewNews : IHttpHandler {
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest (HttpContext context) {

        string command = context.Request["Command"];
        switch (command)
        {
            case "QueryNotice": QueryNotice(context); break;
        }
    }
    public void QueryNotice(HttpContext context) {
        String title = context.Request["title"];
        String department = context.Request["department"];
        var startDate = context.Request["startDate"];
        var endDate = context.Request["endDate"];
        string sql = "SELECT ObjectID,Title,PublishTime ,IsTop FROM I_NewNotice WHERE Status='上线'";
        if (title!="") {
            sql += "AND Title like '%" + title + "%'";
        }
        if (department!="") {
            sql += "AND Department like '%" + department + "%'";
        }
        if (startDate!="" && endDate!="") {
            sql += "AND PublishTime >'" + startDate + "' AND PublishTime < '" + endDate+"'";
        }
        sql += " ORDER BY IsTop DESC,PublishTime DESC";
        List<Dictionary<string,object>> resultList = new List<Dictionary<string,object>>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (newsDt.Rows.Count > 0)
        {
            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
               
                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                dic.Add("PublishTime", dr["PublishTime"]);
                dic.Add("IsTop", dr["IsTop"]);
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public XmlDocument ConvertStringToXmlDocument(string xmlString)
    {
        XmlDocument document = new XmlDocument();
        document.LoadXml(xmlString);
        return document;
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