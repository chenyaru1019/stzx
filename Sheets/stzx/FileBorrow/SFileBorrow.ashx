<%@ WebHandler Language="C#" Class="SArchiveInfo" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;


public class SArchiveInfo : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "GetProjectInfo": GetProjectInfo(context); break;

        }
    }
   


    public void GetProjectInfo(HttpContext context)
    {

        String projectId = context.Request["projectId"];

        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        string sql = "SELECT ProjectName ,ProjectNum FROM [dbo].[I_ProjectInfo] WHERE ObjectID='" + projectId + "'";
        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            resultDic.Add("ProjectName", dt.Rows[0]["ProjectName"].ToString());
            resultDic.Add("ProjectNum", dt.Rows[0]["ProjectNum"].ToString());
        }



        object JSONObj = JsonConvert.SerializeObject(resultDic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
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