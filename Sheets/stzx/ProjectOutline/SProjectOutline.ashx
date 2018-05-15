<%@ WebHandler Language="C#" Class="SProjectOutline" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;


public class SProjectOutline : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "checkProject": checkProject(context); break;
            case "GetProjectMember": GetProjectMember(context); break;
        }
    }
    //检查项目大纲是否存在
    public void checkProject(HttpContext context)
    {
        String projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT ObjectID FROM I_ProjectOutline WHERE Status = '1' " +
                "AND ProjectId =" + "'" + projectId + "' ORDER BY CreatedTime DESC");
        if (dt.Rows.Count > 0)
        {
            resultDic.Add("status", "error");
        }
        else
        {
            resultDic.Add("status", "success");
        }
        object JSONObj = JsonConvert.SerializeObject(resultDic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    //从项目任务书获取项目人员信息
    public void GetProjectMember(HttpContext context)
    {

        String projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        List<Dictionary<string, object>> projectMemberList = new List<Dictionary<string, object>>();
        List<Dictionary<string, object>> projectExpertList = new List<Dictionary<string, object>>();
        System.Data.DataTable projectInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT ProjectTaskId FROM I_ProjectInfo WHERE ObjectID = '" + projectId + "'");
        string projectTaskId = projectInfoDt.Rows[0]["ProjectTaskId"].ToString();
        System.Data.DataTable taskChangeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
         "SELECT TOP 1 ObjectID FROM I_TaskChange WHERE Status='1' AND  ProjectTaskId='" + projectTaskId + "' ORDER BY CreatedTime DESC ");
        if (taskChangeDt.Rows.Count > 0)
        {
            //存在任务书变更记录，查询最新的一天，获取人员数据
            string taskChangeId = taskChangeDt.Rows[0]["ObjectID"].ToString();


            //项目人员
            System.Data.DataTable taskChangeMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
             " SELECT FullName,Department,PersonRole,Profession,JobTitle,Qualification,AppointmentDate," +
             " ResidentBegin,ResidentEnd,UserId FROM I_TaskChangeMember " +
             " WHERE ParentObjectID='" + taskChangeId + "' ");
            foreach (DataRow dr in taskChangeMemberDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("FullName", dr["FullName"].ToString());
                dic.Add("UserRole", dr["PersonRole"].ToString());
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



            //项目专家
            System.Data.DataTable taskChangeExpertDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            " SELECT FullName,PersonRole,Profession,JobTitle,Qualification,AppointmentDate," +
            " ResidentBegin,ResidentEnd FROM I_TaskChangeExpert " +
            " WHERE ParentObjectID='" + taskChangeId + "' ");
            foreach (DataRow dr in taskChangeExpertDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("FullName", dr["FullName"].ToString());
                dic.Add("UserRole", dr["PersonRole"].ToString());
                dic.Add("Profession", dr["Profession"].ToString());
                dic.Add("JobTitle", dr["JobTitle"].ToString());
                dic.Add("Qualification", dr["Qualification"].ToString());
                dic.Add("AppointmentDate", dr["AppointmentDate"]);
                dic.Add("ResidentBegin", dr["ResidentBegin"]);
                dic.Add("ResidentEnd", dr["ResidentEnd"]);;
                projectExpertList.Add(dic);
            }
            resultDic.Add("projectExpertList", projectExpertList);


        }
        else
        {
            //任务变更不存在，则查询任务书

            //项目人员
            System.Data.DataTable taskMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
             " SELECT FullName,Department,UserRole,Profession,JobTitle,Qualification,AppointmentDate," +
             " ResidentBegin,ResidentEnd,UserId FROM I_TaskMember " +
             " WHERE ParentObjectID='" + projectTaskId + "' ");
            foreach (DataRow dr in taskMemberDt.Rows)
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



            //项目专家
            System.Data.DataTable taskExpertDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            " SELECT FullName,UserRole,Profession,JobTitle,Qualification,AppointmentDate," +
            " ResidentBegin,ResidentEnd FROM I_TaskExpert " +
            " WHERE ParentObjectID='" + projectTaskId + "' ");
            foreach (DataRow dr in taskExpertDt.Rows)
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