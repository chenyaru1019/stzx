<%@ WebHandler Language="C#" Class="Logistics_execute" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.IO;
using System.Xml.Serialization;
using System.Xml;

public class Logistics_execute : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {
        string command = context.Request["Command"];
        switch (command)
        {
            case "GetProjectProcess": GetProjectProcess(context); break;
        }
    }
    //获取项目进度信息
    public void GetProjectProcess(HttpContext context)
    {
        String projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        string status = "1";
        //项目大纲状态
        System.Data.DataTable projectOutlineDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "SELECT po.ObjectID ,ic.State FROM I_ProjectOutline po INNER JOIN OT_InstanceContext ic ON  po.ObjectID = ic.BizObjectId " +
            " where  po.ProjectId= " + "'" + projectId + "'");
        if (projectOutlineDt.Rows.Count > 0)
        {

            string state = projectOutlineDt.Rows[0]["State"].ToString();
            if (state == "2")
            {
                //大纲审核过程标识状态为2
                status = "2";
            }
            else if (state == "4")
            {
                //大纲审核完成标识状态为3
                status = "3";
            }
            //流程取消不考虑

        }
        //项目归档
        System.Data.DataTable projectArchiveDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
           "SELECT pa.ObjectID FROM I_ProjectArchive pa INNER JOIN OT_InstanceContext ic on pa.ObjectID = ic.BizObjectId " +
           "WHERE ic.State='4' AND pa.ProjectId= " + "'" + projectId + "'");
        if (projectArchiveDt.Rows.Count > 0)
        {
            //归档完成设置状态为4
            status = "4";
        }

        //项目销项
        System.Data.DataTable projectRevokedDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
           "SELECT pr.ObjectID FROM I_ProjectRevoked pr INNER JOIN OT_InstanceContext ic ON pr.ObjectID = ic.BizObjectId  " +
           "WHERE ic.State = '4' AND pr.ProjectId = " + "'" + projectId + "'");
        if (projectRevokedDt.Rows.Count > 0)
        {
            //归档完成设置状态为4
            status = "5";
        }

        resultDic.Add("Status", status);
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