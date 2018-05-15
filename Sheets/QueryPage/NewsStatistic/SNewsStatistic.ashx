<%@ WebHandler Language="C#" Class="SNewsStatistic" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.Xml;


public class SNewsStatistic : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "NewsStatistic": NewsStatistic(context); break;
        }
    }
    public void NewsStatistic(HttpContext context)
    {
        String strYear = context.Request["Year"];
        int year = int.Parse(strYear);
        DateTime dateFirst = new DateTime(year, 1, 1);
        DateTime dateLast = new DateTime(year, 12, 30);

        string sql = "SELECT ne.Department, ne.Publisher,ne.Title,ne.PublishTime FROM  " +
            " I_News ne INNER JOIN OT_InstanceContext ic ON ne.ObjectID = ic.BizObjectId WHERE ic.State = '4' ";
        if (strYear != "")
        {
            sql += "AND  ne.PublishTime>= '" + dateFirst + "' AND ne.PublishTime <= '" + dateLast + "'";
        }
        sql += " ORDER BY ne.Department ";
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);

        //统计数量
        System.Data.DataTable CountDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT COUNT (ne.ObjectID) as num, ne.Publisher FROM " +
            "I_News ne INNER JOIN OT_InstanceContext ic ON ne.ObjectID = ic.BizObjectId WHERE ic.State = '4' GROUP BY ne.Publisher");

        if (newsDt.Rows.Count > 0)
        {

            string publisher = "";
            string depart = "";
            for (int i = 0; i < newsDt.Rows.Count; i++)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                if (newsDt.Rows[i]["Publisher"].ToString() != publisher)
                {
                    for (int j = 0; j < CountDt.Rows.Count; j++)
                    {

                        if (newsDt.Rows[i]["Publisher"].ToString() == CountDt.Rows[j]["Publisher"].ToString())
                        {
                            dic.Add("Total", CountDt.Rows[j]["num"].ToString());
                            publisher = CountDt.Rows[j]["Publisher"].ToString();
                        }
                    }

                }
                else
                {
                    dic.Add("Total", "");
                }

                if (newsDt.Rows[i]["Department"].ToString() != depart)
                {
                    dic.Add("Department", newsDt.Rows[i]["Department"].ToString());
                }
                else
                {
                    dic.Add("Department", "");
                }
                dic.Add("Publisher", newsDt.Rows[i]["Publisher"].ToString());
                dic.Add("Title", newsDt.Rows[i]["Title"].ToString());
                dic.Add("PublishTime", newsDt.Rows[i]["PublishTime"]);
                depart = newsDt.Rows[i]["Department"].ToString();
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