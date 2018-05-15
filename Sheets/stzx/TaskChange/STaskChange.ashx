<%@ WebHandler Language="C#" Class="STaskChange" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Xml;


public class STaskChange : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "GetTaskChangeInfo": GetTaskChangeInfo(context); break;
        }
    }

    public void GetTaskChangeInfo(HttpContext context)
    {

        Console.WriteLine("sss"); 
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        String projectId = context.Request["projectId"];
        String projectTaskId = context.Request["ProjectTaskId"];
        System.Data.DataTable taskInfoDt = null;
        System.Data.DataTable projectMemberDt = null;
        System.Data.DataTable projectExperDt = null;
        //查询任务变更记录最新一条流程，存在
        System.Data.DataTable taskChangeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "SELECT TOP 1 ObjectID, ProjectName,xmfzr,RDepartment,JDepartment,fgld," +
            "EntrustedUnit,TaskBasis,Content,ServiceCycle,ServiceResults,ChangeContent," +
            "ContractAmount,Outside,TechnicalValidation FROM I_TaskChange WHERE  Status='1'" +
            "AND ProjectId =" + "'" + projectId + "' ORDER BY CreatedTime DESC");
        if (taskChangeDt.Rows.Count > 0)
        {
            taskInfoDt = taskChangeDt;
            string taskChangeObjectId = taskInfoDt.Rows[0]["ObjectID"].ToString();
            projectMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
               " PersonRole as UserRole,Department,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd,UserId FROM " +
               "I_TaskChangeMember WHERE ParentObjectID = '" + taskChangeObjectId + "' ORDER BY AppointmentDate");

            projectExperDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                   " PersonRole as UserRole,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                   "I_TaskChangeExpert WHERE ParentObjectID = '" + taskChangeObjectId + "' ORDER BY AppointmentDate");

        }
        else
        {
            //不存在任务变更记录，则从任务书获取信息
            taskInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                   "SELECT TOP 1 ProjectName,xmfzr,RDepartment,JDepartment,fgld," +
                   "EntrustedUnit,TaskBasis,Content,ServiceCycle,ServiceResults," +
                   "ContractAmount,Outside,TechnicalValidation FROM I_ProjectTask WHERE  Status='1'" +
                   "AND ObjectID =" + "'" + projectTaskId + "' ORDER BY CreatedTime DESC");

            //项目人员
            projectMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
               " UserRole,Department,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd ,UserId  FROM " +
               "I_TaskMember WHERE ParentObjectID = '" + projectTaskId + "' ORDER BY AppointmentDate");

            //项目专家
            projectExperDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                " UserRole,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                "I_TaskExpert  WHERE ParentObjectID = '" + projectTaskId + "' ORDER BY AppointmentDate");

        }
        //基本信息
        //项目负责人
        resultDic.Add("xmfzr", taskInfoDt.Rows[0]["xmfzr"].ToString());
        //负责部门
        resultDic.Add("RDepartment", taskInfoDt.Rows[0]["RDepartment"].ToString());
        //参加部门
        if (taskInfoDt.Rows[0]["JDepartment"].ToString() != "")
        {
            resultDic.Add("JDepartment", ConvertStringToXmlDocument(taskInfoDt.Rows[0]["JDepartment"].ToString()));
        }
        else
        {
            resultDic.Add("JDepartment", null);
        }
        //分管领导
        if (taskInfoDt.Rows[0]["fgld"].ToString() != "")
        {
            resultDic.Add("fgld", ConvertStringToXmlDocument(taskInfoDt.Rows[0]["fgld"].ToString()));
        }
        else
        {
            resultDic.Add("fgld", null);
        }
        resultDic.Add("ProjectName", taskInfoDt.Rows[0]["ProjectName"].ToString());
        resultDic.Add("EntrustedUnit", taskInfoDt.Rows[0]["EntrustedUnit"].ToString());
        resultDic.Add("TaskBasis", taskInfoDt.Rows[0]["TaskBasis"].ToString());
        resultDic.Add("Content", taskInfoDt.Rows[0]["Content"].ToString());
        resultDic.Add("ServiceCycle", taskInfoDt.Rows[0]["ServiceCycle"].ToString());
        resultDic.Add("ServiceResults", taskInfoDt.Rows[0]["ServiceResults"].ToString());
        resultDic.Add("ContractAmount", taskInfoDt.Rows[0]["ContractAmount"].ToString());
        resultDic.Add("Outside", taskInfoDt.Rows[0]["Outside"].ToString());
        resultDic.Add("TechnicalValidation", taskInfoDt.Rows[0]["TechnicalValidation"].ToString());

        if (taskInfoDt.Rows[0].ItemArray.Length !=13)
        {
            resultDic.Add("ChangeContent", taskInfoDt.Rows[0]["ChangeContent"].ToString());
        }







        //设置项目成员
        List<Dictionary<string, object>> projectMemberList = new List<Dictionary<string, object>>();

        foreach (DataRow dr in projectMemberDt.Rows)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("FullName", dr["FullName"].ToString());
            dic.Add("UserRole", dr["UserRole"].ToString());
            dic.Add("Department", dr["Department"].ToString());
            dic.Add("Profession", dr["Profession"].ToString());
            dic.Add("JobTitle", dr["JobTitle"].ToString());
            dic.Add("Qualification", dr["Qualification"].ToString());
            dic.Add("AppointmentDate", dr["AppointmentDate"]);
            dic.Add("ResidentBegin", dr["ResidentBegin"]);
            dic.Add("ResidentEnd", dr["ResidentEnd"]);
            dic.Add("UserId", dr["UserId"]);
            projectMemberList.Add(dic);
        }
        resultDic.Add("projectMemberList", projectMemberList);

        //项目专家信息
        List<Dictionary<string, object>> projectExpertList = new List<Dictionary<string, object>>();
        foreach (DataRow dr in projectExperDt.Rows)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("FullName", dr["FullName"].ToString());
            dic.Add("UserRole", dr["UserRole"].ToString());
            dic.Add("Profession", dr["Profession"].ToString());
            dic.Add("JobTitle", dr["JobTitle"].ToString());
            dic.Add("Qualification", dr["Qualification"].ToString());
            dic.Add("AppointmentDate", dr["AppointmentDate"]);
            dic.Add("ResidentBegin", dr["ResidentBegin"]);
            dic.Add("ResidentEnd", dr["ResidentEnd"]);
            projectExpertList.Add(dic);
        }
        resultDic.Add("projectExpertList", projectExpertList);


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