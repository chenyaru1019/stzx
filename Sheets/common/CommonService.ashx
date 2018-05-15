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
            case "GetSequenceNum": GetSequenceNum(context); break;
            case "UpdateSequenceNum": UpdateSequenceNum(context); break;
            case "GetProjectDepart": GetProjectDepart(context); break;

        }
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

        object JSONObj = JsonConvert.SerializeObject(resultDic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
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

    //获取项目组织部门
    public void GetProjectDepart(HttpContext context)
    {
        string projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        System.Data.DataTable taskDt;
        //优先从任务变更获取，不存在则从任务书获取
        System.Data.DataTable taskChangeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
               "SELECT TOP 1 ObjectID ,ProjectName,xmfzr,RDepartment,JDepartment,fgld  FROM I_TaskChange  WHERE  Status='1'" +
               "AND ProjectId =" + "'" + projectId + "' ORDER BY CreatedTime DESC");
        if (taskChangeDt.Rows.Count > 0)
        {
            taskDt = taskChangeDt;
        }
        else
        {
            //查询任务书id
            System.Data.DataTable projectInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
              " SELECT ProjectTaskId FROM I_ProjectInfo WHERE ObjectID = " + "'" + projectId + "'");

            string projectTaskId = projectInfoDt.Rows[0]["ProjectTaskId"].ToString();
            taskDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
               "SELECT  ObjectID,ProjectName,xmfzr,RDepartment,JDepartment,fgld FROM I_ProjectTask  WHERE  Status='1'" +
               "AND ObjectID =" + "'" + projectTaskId + "'");
        }

        //项目名称
        resultDic.Add("ProjectName", taskDt.Rows[0]["ProjectName"].ToString());
        //项目负责人
        resultDic.Add("xmfzr", taskDt.Rows[0]["xmfzr"].ToString());
        //负责部门
        resultDic.Add("RDepartment", taskDt.Rows[0]["RDepartment"].ToString());
        //参加部门
        if (taskDt.Rows[0]["JDepartment"].ToString() != "")
        {
            resultDic.Add("JDepartment", ConvertStringToXmlDocument(taskDt.Rows[0]["JDepartment"].ToString()));
        }
        else
        {
            resultDic.Add("JDepartment", null);
        }
        //分管领导
        if (taskDt.Rows[0]["fgld"].ToString() != "")
        {
            resultDic.Add("fgld", ConvertStringToXmlDocument(taskDt.Rows[0]["fgld"].ToString()));
        }
        else
        {
            resultDic.Add("fgld", null);
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