<%@ WebHandler Language="C#" Class="ProjectOutlineChanges" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;


public class ProjectOutlineChanges : IHttpHandler {
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest (HttpContext context) {

        string command = context.Request["Command"];
        switch (command)
        {
            case "getProjectOutline": getProjectOutline(context); break;

        }
    }
    public void getProjectOutline(HttpContext context) {
        String projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT TOP 1 ObjectID ,SkillsRequirement FROM I_ProjectOutlineChanges WHERE Status = '1' " +
            "AND ProjectId =" + "'" + projectId + "'ORDER BY CreatedTime DESC");
        if (dt.Rows.Count > 0)
        {

            String  SkillsRequirement = dt.Rows[0]["SkillsRequirement"].ToString();
             //技术要求
            resultDic.Add("SkillsRequirement", SkillsRequirement);
            //项目大纲变更存在，获取最新的修改记录
            String objectId = dt.Rows[0]["ObjectID"].ToString();
            //项目人员
            List<Dictionary<string,object>> projectMemberList = new List<Dictionary<string,object>>();
            System.Data.DataTable projectMemberdt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                " UserRole,Department,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd ,UserId FROM " +
                "I_ProjectChangeMember WHERE ParentObjectID = '" +objectId + "' ORDER BY AppointmentDate");
            if (projectMemberdt.Rows.Count > 0)
            {
                foreach (DataRow dr in projectMemberdt.Rows)
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
                resultDic.Add("projectMemberList",projectMemberList);
            }


            //专家人员

            List<Dictionary<string,object>> projectExpertList = new List<Dictionary<string,object>>();
            System.Data.DataTable projectExpertDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                    " UserRole,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                    "I_ProjectChangeExpert WHERE ParentObjectID = '" +objectId + "' ORDER BY AppointmentDate");
            if (projectExpertDt.Rows.Count > 0)
            {
                foreach (DataRow dr in projectExpertDt.Rows)
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
                resultDic.Add("projectExpertList",projectExpertList);
            }

            //项目Payment plan
            List<Dictionary<string,object>> paymentPlanList = new List<Dictionary<string,object>>();
            System.Data.DataTable paymentPlanDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                 "PlanTitle,PlanDate,PaymentDescription,PaymentPercentage" +
                   " FROM I_sfkjhbg WHERE ParentObjectID ='" + objectId + "' ORDER BY PlanTitle");
            if (paymentPlanDt.Rows.Count > 0)
            {
                foreach (DataRow dr in paymentPlanDt.Rows)
                {
                    Dictionary<string, object> dic = new Dictionary<string, object>();
                    dic.Add("PlanTitle", dr["PlanTitle"].ToString());
                    dic.Add("PlanDate", dr["PlanDate"]);
                    dic.Add("PaymentDescription", dr["PaymentDescription"].ToString());
                    dic.Add("PaymentPercentage", dr["PaymentPercentage"].ToString());
                    paymentPlanList.Add(dic);
                }
                resultDic.Add("paymentPlanList",paymentPlanList);
            }

            //项目形象进度计划
            List<Dictionary<string,object>> ProjectProgressList = new List<Dictionary<string,object>>();
            System.Data.DataTable ProjectProgressDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                 "ScheduleBegin,ScheduleEnd,ItemDescription,ProjectSchedule" +
                   " FROM I_xmjtjh WHERE ParentObjectID ='" + objectId + "' ORDER BY ScheduleBegin");
            if (ProjectProgressDt.Rows.Count > 0)
            {
                foreach (DataRow dr in ProjectProgressDt.Rows)
                {
                    Dictionary<string, object> dic = new Dictionary<string, object>();
                    dic.Add("ScheduleBegin", dr["ScheduleBegin"]);
                    dic.Add("ScheduleEnd", dr["ScheduleEnd"]);
                    dic.Add("ItemDescription", dr["ItemDescription"].ToString());
                    dic.Add("ProjectSchedule", dr["ProjectSchedule"].ToString());
                    ProjectProgressList.Add(dic);
                }
                resultDic.Add("projectProgressList",ProjectProgressList);
            }
        }
        else
        {
            //不存在，查询项目大纲

            System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT ObjectID ,SkillsRequirement FROM I_ProjectOutline WHERE Status = '1' " +
             "AND ProjectId =" + "'" + projectId + "' ORDER BY CreatedTime DESC");
            if (dt1.Rows.Count > 0) {
                String objectId = dt1.Rows[0]["ObjectID"].ToString();
                String  SkillsRequirement = dt1.Rows[0]["SkillsRequirement"].ToString();
                //技术要求
                resultDic.Add("SkillsRequirement", SkillsRequirement);
                //项目人员
                List<Dictionary<string,object>> projectMemberList = new List<Dictionary<string,object>>();
                System.Data.DataTable projectMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                    " UserRole,Department,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd,UserId  FROM " +
                    "I_ProjectMember WHERE ParentObjectID = '" +objectId + "' ORDER BY AppointmentDate");
                if (projectMemberDt.Rows.Count > 0)
                {
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
                    resultDic.Add("projectMemberList",projectMemberList);
                }


                //专家人员

                List<Dictionary<string,object>> projectExpertList = new List<Dictionary<string,object>>();
                System.Data.DataTable projectExpertDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                        " UserRole,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                        "I_ProjectExpert WHERE ParentObjectID = '" +objectId + "' ORDER BY AppointmentDate");
                if (projectExpertDt.Rows.Count > 0)
                {
                    foreach (DataRow dr in projectExpertDt.Rows)
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
                    resultDic.Add("projectExpertList",projectExpertList);
                }

                //项目Payment plan
                List<Dictionary<string,object>> paymentPlanList = new List<Dictionary<string,object>>();
                System.Data.DataTable paymentPlanDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                     "PlanTitle,PlanDate,PaymentDescription,PaymentPercentage" +
                       " FROM I_sfkjhb WHERE ParentObjectID ='" + objectId + "' ORDER BY PlanTitle");
                if (paymentPlanDt.Rows.Count > 0)
                {
                    foreach (DataRow dr in paymentPlanDt.Rows)
                    {
                        Dictionary<string, object> dic = new Dictionary<string, object>();
                        dic.Add("PlanTitle", dr["PlanTitle"].ToString());
                        dic.Add("PlanDate", dr["PlanDate"]);
                        dic.Add("PaymentDescription", dr["PaymentDescription"].ToString());
                        dic.Add("PaymentPercentage", dr["PaymentPercentage"].ToString());
                        paymentPlanList.Add(dic);
                    }
                    resultDic.Add("paymentPlanList",paymentPlanList);
                }

                //项目形象进度计划
                List<Dictionary<string,object>> ProjectProgressList = new List<Dictionary<string,object>>();
                System.Data.DataTable ProjectProgressDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                     "ScheduleBegin,ScheduleEnd,ItemDescription,ProjectSchedule" +
                       " FROM I_ProjectProgressTable WHERE ParentObjectID ='" + objectId + "' ORDER BY ScheduleBegin");
                if (ProjectProgressDt.Rows.Count > 0)
                {
                    foreach (DataRow dr in ProjectProgressDt.Rows)
                    {
                        Dictionary<string, object> dic = new Dictionary<string, object>();
                        dic.Add("ScheduleBegin", dr["ScheduleBegin"]);
                        dic.Add("ScheduleEnd", dr["ScheduleEnd"]);
                        dic.Add("ItemDescription", dr["ItemDescription"].ToString());
                        dic.Add("ProjectSchedule", dr["ProjectSchedule"].ToString());
                        ProjectProgressList.Add(dic);
                    }
                    resultDic.Add("projectProgressList",ProjectProgressList);
                }


            }
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