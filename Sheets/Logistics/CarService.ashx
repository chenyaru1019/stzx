<%@ WebHandler Language="C#" Class="CommonService" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.Xml;


public class CommonService : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "QueryByInstanceId": QueryByInstanceId(context); break;
         

        }
    }


    public void QueryByInstanceId(HttpContext context)
    {
        string instanceId = context.Request["InstanceID"];
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "SELECT cr.UseTime1 FROM I_Car cr INNER JOIN OT_InstanceContext ic ON ic.ObjectID = cr.RunningInstanceId WHERE ic.ObjectID  ='" + instanceId + "'";
        System.Data.DataTable carDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (carDt.Rows.Count > 0)
        {
            result.Add("beginTime", carDt.Rows[0]["UseTime1"].ToString());
        }
        object JSONObj = JsonConvert.SerializeObject(result);
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