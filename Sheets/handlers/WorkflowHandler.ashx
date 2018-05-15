<%@ WebHandler Language="C#" Class="WorkflowHandler" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Xml;
using System.Data;

public class WorkflowHandler : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {
        string command = context.Request["Command"];
        switch (command)
        {
            //分组待阅,已阅
            case "GetUnReadWorkItemsByGroup": GetUnReadWorkItemsByGroup(context); break;

            //分组已阅
            case "GetReadWorkItemsByGroup": GetReadWorkItemsByGroup(context); break;

            //分组已办
            case "GetFinishWorkItemsByGroup": GetFinishWorkItemsByGroup(context); break;

            //我的流查询，分组
            case "QueryMyInstanceByGroup": QueryMyInstanceByGroup(context); break;

            //我的流查询
            case "QueryMyInstance": QueryMyInstance(context); break;

            //查询流程实例
            case "QueryInstance": QueryInstance(context); break;

            //查询任务
            case "QueryParticipantWorkItems": QueryParticipantWorkItems(context); break;



        }
    }


    public void GetFinishWorkItemsByGroup(HttpContext context)
    {
        string userId = context.Request["UserId"];
        //string title = context.Request["Title"];
        //string workflowCode = context.Request["WorkflowCode"];
        ////接受时间
        //string beginTime = context.Request["BeginTime"];
        //string endTime = context.Request["EndTime"];
        List<Dictionary<string, object>> dataList = new List<Dictionary<string, object>>();

        string sql = "SELECT wf.ActivityCode,wf.AssistantFinished,wf.Assisted,wf.Consulted, " +
            " wf.DisplayName,wf.FinishTime,wf.InstanceId,ic.InstanceName, " +
            " wf.ObjectID,wf.Originator,ou.Name,wf.Participant,wf.ParticipantName, " +
            " wf.PlanFinishTime,wf.ReceiveTime,wf.Priority,wf.State,wf.StartTime, " +
            " wf.Urged,wf.WorkflowCode,wc.WorkflowName FROM OT_WorkItemFinished wf " +
            " INNER JOIN OT_InstanceContext ic ON wf.InstanceId = ic.ObjectID " +
            " INNER JOIN OT_OrganizationUnit ou ON ic.OrgUnit = ou.ObjectID " +
            " INNER JOIN OT_WorkflowClause wc ON wc.WorkflowCode = wf.WorkflowCode " +
            " WHERE wf.Participant = '" + userId + "'";
        //if (!string.IsNullOrEmpty(title))
        //{
        //    sql += "AND  ic.InstanceName like '%" + title + "%'";
        //}
        //if (!string.IsNullOrEmpty(workflowCode))
        //{
        //    sql += "AND  wf.WorkflowCode = '" + workflowCode + "'";
        //}
        //if (!string.IsNullOrEmpty(beginTime) && !string.IsNullOrEmpty(endTime))
        //{
        //    sql += "AND wf.ReceiveTime >='" + beginTime + "' AND wf.ReceiveTime <= '" + endTime + "'";
        //}


        System.Data.DataTable finishWorkItemsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (finishWorkItemsDt.Rows.Count > 0)
        {
            foreach (DataRow dr in finishWorkItemsDt.Rows)
            {

                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("ActivityCode", dr["ActivityCode"].ToString());
                dic.Add("AssistantFinished", dr["AssistantFinished"].ToString());
                dic.Add("Assisted", dr["Assisted"].ToString());
                dic.Add("Consulted", dr["Consulted"]);
                dic.Add("DisplayName", dr["DisplayName"]);
                dic.Add("FinishTime", ConverDate((DateTime)(dr["FinishTime"])));
                dic.Add("InstanceId", dr["InstanceId"].ToString());
                dic.Add("InstanceName", dr["InstanceName"]);
                dic.Add("ObjectID", dr["ObjectID"]);
                dic.Add("Originator", dr["Originator"]);
                dic.Add("Name", dr["Name"].ToString());
                dic.Add("Participant", dr["Participant"]);
                dic.Add("ParticipantName", dr["ParticipantName"]);
                dic.Add("PlanFinishTime", (dr["PlanFinishTime"] == null || dr["PlanFinishTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["PlanFinishTime"]));
                dic.Add("ReceiveTime", (dr["ReceiveTime"] == null || dr["ReceiveTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["ReceiveTime"]));
                dic.Add("Priority", dr["Priority"]);
                dic.Add("State", dr["State"]);
                dic.Add("StartTime", ConverDate((DateTime)dr["StartTime"]));
                dic.Add("Urged", dr["Urged"].ToString());
                dic.Add("WorkflowCode", dr["WorkflowCode"]);
                dic.Add("WorkflowName", dr["WorkflowName"]);

                dataList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(GetResult(dataList));
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    //分组已阅
    public void GetReadWorkItemsByGroup(HttpContext context)
    {
        string userId = context.Request["UserId"];
        //string title = context.Request["Title"];
        //string workflowCode = context.Request["WorkflowCode"];
        ////接受时间
        //string beginTime = context.Request["BeginTime"];
        //string endTime = context.Request["EndTime"];

        List<Dictionary<string, object>> dataList = new List<Dictionary<string, object>>();
        string sql = "SELECT it.ObjectID,it.InstanceId,ic.InstanceName,it.DisplayName,ic.OriginatorName," +
            " ou.Name,it.ReceiveTime,it.FinishTime,it.State,it.WorkflowCode,wf.WorkflowName " +
            " FROM OT_CirculateItemFinished it " +
            " INNER JOIN OT_InstanceContext ic ON it.InstanceId = ic.ObjectID " +
            " INNER JOIN OT_OrganizationUnit ou ON ic.OrgUnit = ou.ObjectID " +
            " INNER JOIN OT_WorkflowClause wf ON it.WorkflowCode = wf.WorkflowCode " +
            " WHERE it.Participant = '" + userId + "'";

        //if (!string.IsNullOrEmpty(title))
        //{
        //    sql += "AND  ic.InstanceName like '%" + title + "%'";
        //}
        //if (!string.IsNullOrEmpty(workflowCode))
        //{
        //    sql += "AND  it.WorkflowCode = '" + workflowCode + "'";
        //}
        //if (!string.IsNullOrEmpty(beginTime) && !string.IsNullOrEmpty(endTime))
        //{
        //    sql += "AND it.ReceiveTime >='" + beginTime + "' AND it.ReceiveTime <= '" + endTime + "'";
        //}

        System.Data.DataTable unReadWorkItemsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (unReadWorkItemsDt.Rows.Count > 0)
        {
            foreach (DataRow dr in unReadWorkItemsDt.Rows)
            {

                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("InstanceId", dr["InstanceId"].ToString());
                dic.Add("InstanceName", dr["InstanceName"].ToString());
                dic.Add("DisplayName", dr["DisplayName"]);
                dic.Add("OriginatorName", dr["OriginatorName"]);
                dic.Add("Name", dr["Name"].ToString());
                dic.Add("ReceiveTime", (dr["ReceiveTime"] == null || dr["ReceiveTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["ReceiveTime"]));
                dic.Add("FinishTime", (dr["FinishTime"] == null || dr["FinishTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["FinishTime"]));
                dic.Add("State", dr["State"]);
                dic.Add("WorkflowCode", dr["WorkflowCode"]);
                dic.Add("WorkflowName", dr["WorkflowName"]);
                dataList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(GetResult(dataList));
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    //分组待阅
    public void GetUnReadWorkItemsByGroup(HttpContext context)
    {
        string userId = context.Request["UserId"];
        List<Dictionary<string, object>> dataList = new List<Dictionary<string, object>>();
        string sql = "SELECT it.ObjectID,it.InstanceId,ic.InstanceName,it.DisplayName,ic.OriginatorName," +
            " ou.Name,it.ReceiveTime,it.State,it.WorkflowCode,wf.WorkflowName " +
            " FROM OT_CirculateItem it " +
            " INNER JOIN OT_InstanceContext ic ON it.InstanceId = ic.ObjectID " +
            " INNER JOIN OT_OrganizationUnit ou ON ic.OrgUnit = ou.ObjectID " +
            " INNER JOIN OT_WorkflowClause wf ON it.WorkflowCode = wf.WorkflowCode " +
            " WHERE it.Participant = '" + userId + "' ORDER BY it.WorkflowCode ";
        System.Data.DataTable unReadWorkItemsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (unReadWorkItemsDt.Rows.Count > 0)
        {
            foreach (DataRow dr in unReadWorkItemsDt.Rows)
            {

                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("InstanceId", dr["InstanceId"].ToString());
                dic.Add("InstanceName", dr["InstanceName"].ToString());
                dic.Add("DisplayName", dr["DisplayName"]);
                dic.Add("OriginatorName", dr["OriginatorName"]);
                dic.Add("Name", dr["Name"].ToString());
                dic.Add("ReceiveTime", (dr["ReceiveTime"] == null || dr["ReceiveTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["ReceiveTime"]));
                dic.Add("State", dr["State"]);
                dic.Add("WorkflowCode", dr["WorkflowCode"]);
                dic.Add("WorkflowName", dr["WorkflowName"]);
                dataList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(GetResult(dataList));
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public XmlDocument ConvertStringToXmlDocument(string xmlString)
    {
        XmlDocument document = new XmlDocument();
        document.LoadXml(xmlString);
        return document;
    }


    //我的流程分组
    public void QueryMyInstanceByGroup(HttpContext context)
    {
        string userId = context.Request["UserId"];
        //string state = context.Request["State"];
        //string title = context.Request["Title"];
        //string workflowCode = context.Request["WorkflowCode"];
        ////接受时间
        //string beginTime = context.Request["BeginTime"];
        //string endTime = context.Request["EndTime"];

        List<Dictionary<string, object>> dataList = new List<Dictionary<string, object>>();
        string sql = "SELECT ic.ObjectID,ic.InstanceName,ic.CreatedTime,ic.FinishTime, " +
            " it.DisplayName,it.ParticipantName,ic.Originator,ic.OriginatorName,ic.State, " +
            " wf.WorkflowName,ic.WorkflowCode,ic.Exceptional FROM OT_InstanceContext ic " +
            " INNER JOIN OT_WorkflowClause wf ON ic.WorkflowCode = wf.WorkflowCode " +
            " LEFT JOIN OT_WorkItem it ON ic.ObjectID = it.InstanceId " +
            " WHERE ic.Originator = '" + userId + "'";

        //if (!string.IsNullOrEmpty(title))
        //{
        //    sql += "AND  ic.InstanceName like '%" + title + "%'";
        //}
        //if (!string.IsNullOrEmpty(state))
        //{
        //    sql += "AND  ic.state ='" + state + "'";
        //}
        //if (!string.IsNullOrEmpty(workflowCode))
        //{
        //    sql += "AND  ic.WorkflowCode = '" + workflowCode + "'";
        //}
        //if (!string.IsNullOrEmpty(beginTime) && !string.IsNullOrEmpty(endTime))
        //{
        //    sql += "AND ic.CreatedTime >='" + beginTime + "' AND it.CreatedTime <= '" + endTime + "'";
        //}

        System.Data.DataTable myInstanceDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (myInstanceDt.Rows.Count > 0)
        {
            foreach (DataRow dr in myInstanceDt.Rows)
            {

                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("InstanceID", dr["ObjectID"].ToString());
                dic.Add("InstanceName", dr["InstanceName"].ToString());
                dic.Add("CreatedTime", (dr["CreatedTime"] == null || dr["CreatedTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["CreatedTime"]));
                dic.Add("FinishTime", (dr["FinishTime"] == null || dr["FinishTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["FinishTime"]));
                dic.Add("ApproverLink", dr["DisplayName"] == null ? "" : dr["DisplayName"].ToString());
                dic.Add("Approver", dr["ParticipantName"] == null ? "" : dr["ParticipantName"].ToString());
                dic.Add("Originator", dr["Originator"].ToString());
                dic.Add("OriginatorName", dr["OriginatorName"]);
                dic.Add("State", dr["State"]);
                dic.Add("WorkflowCode", dr["WorkflowCode"]);
                dic.Add("WorkflowName", dr["WorkflowName"]);
                dic.Add("Exceptional", dr["Exceptional"]);
                dataList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(GetResult(dataList));
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    //我的流程
    public void QueryMyInstance(HttpContext context)
    {

        string userId = context.Request["UserId"];
        string state = context.Request["State"];
        string instanceName = context.Request["InstanceName"];
        string workflowCode = context.Request["WorkflowCode"];
        ////接受时间
        string beginTime = context.Request["BeginTime"];
        string endTime = context.Request["EndTime"];

        List<Dictionary<string, object>> Rows = new List<Dictionary<string, object>>();
        string sql = "SELECT ic.ObjectID,ic.InstanceName,ic.CreatedTime,ic.FinishTime, " +
            " it.DisplayName,it.ParticipantName,ic.Originator,ic.OriginatorName,ic.State, " +
            " wf.WorkflowName,ic.WorkflowCode,ic.Exceptional FROM OT_InstanceContext ic " +
            " INNER JOIN OT_WorkflowClause wf ON ic.WorkflowCode = wf.WorkflowCode " +
            " LEFT JOIN OT_WorkItem it ON ic.ObjectID = it.InstanceId " +
            " WHERE ic.Originator = '" + userId + "'";

        if (!string.IsNullOrEmpty(instanceName))
        {
            sql += "AND  ic.InstanceName like '%" + instanceName + "%'";
        }
        if (!string.IsNullOrEmpty(state))
        {
            sql += "AND  ic.state ='" + state + "'";
        }
        if (!string.IsNullOrEmpty(workflowCode))
        {
            sql += "AND  ic.WorkflowCode = '" + workflowCode + "'";
        }
        if (!string.IsNullOrEmpty(beginTime) && !string.IsNullOrEmpty(endTime))
        {
            sql += "AND ic.CreatedTime >='" + beginTime + "' AND ic.CreatedTime <= '" + endTime + "'";
        }

        System.Data.DataTable myInstanceDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (myInstanceDt.Rows.Count > 0)
        {
            foreach (DataRow dr in myInstanceDt.Rows)
            {

                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("InstanceID", dr["ObjectID"].ToString());
                dic.Add("InstanceName", dr["InstanceName"].ToString());
                dic.Add("CreatedTime", (dr["CreatedTime"] == null || dr["CreatedTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["CreatedTime"]));
                dic.Add("FinishTime", (dr["FinishTime"] == null || dr["FinishTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["FinishTime"]));
                dic.Add("ApproverLink", dr["DisplayName"] == null ? "" : dr["DisplayName"].ToString());
                dic.Add("Approver", dr["ParticipantName"] == null ? "" : dr["ParticipantName"].ToString());
                dic.Add("Originator", dr["Originator"].ToString());
                dic.Add("OriginatorName", dr["OriginatorName"]);
                dic.Add("State", dr["State"]);
                dic.Add("WorkflowCode", dr["WorkflowCode"]);
                dic.Add("WorkflowName", dr["WorkflowName"]);
                dic.Add("Exceptional", dr["Exceptional"]);
                Rows.Add(dic);
            }
        }

        Dictionary<string, object> result = new Dictionary<string, object>();
        result.Add("Rows", Rows);
        result.Add("Total", Rows.Count);
        result.Add("iTotalDisplayRecords", Rows.Count);
        result.Add("WorkflowCode", Rows.Count);
        result.Add("sEcho", 0);

        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public Dictionary<string, object> GetResult(List<Dictionary<string, object>> dataList)
    {

        Dictionary<string, object> dataItem; // 数据库中查询到的每条记录
        Dictionary<string, object> resultMap = new Dictionary<string, object>(); // 最终要的结果
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        for (int i = 0; i < dataList.Count; i++)
        {
            dataItem = dataList[i];
            int flag = 0;
            for (int j = 0; j < resultList.Count; j++)
            {
                Dictionary<string, object> d2 = resultList[j];
                if (Convert.ToString(dataItem["WorkflowCode"]) == Convert.ToString(d2["WorkflowCode"]))
                {
                    List<Dictionary<string, object>> list = (List<Dictionary<string, object>>)d2["WorkItems"];
                    list.Add(dataItem);
                    d2["TotalCount"] = list.Count;
                    flag = 1;
                    continue;
                }
            }
            if (flag == 0)
            {
                Dictionary<string, object> map = new Dictionary<string, object>();
                List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();
                list.Add(dataItem);
                map.Add("Open", false);
                map.Add("TotalCount", list.Count);
                map.Add("WorkItems", list);
                map.Add("WorkflowCode", Convert.ToString(dataItem["WorkflowCode"]));
                map.Add("WorkflowName", Convert.ToString(dataItem["WorkflowName"]));
                resultList.Add(map);
            }
        }
        Dictionary<string, object> result = new Dictionary<string, object>();
        result.Add("Rows", resultList);
        result.Add("Total", resultList.Count);
        result.Add("iTotalDisplayRecords", resultList.Count);
        result.Add("iTotalRecords", resultList.Count);
        result.Add("sEcho", 0);
        return result;
    }



    //查询流程实例
    public void QueryInstance(HttpContext context)
    {
        string searchKey = context.Request["SearchKey"];
        string workflowCode = context.Request["WorkflowCode"];
        string unitID = context.Request["UnitID"];
        string startTime = context.Request["StartTime"];
        string endTime = context.Request["EndTime"];
        string instanceState = context.Request["InstanceState"];

        List<Dictionary<string, object>> Rows = new List<Dictionary<string, object>>();
        string sql = "SELECT it.ParticipantName ,it.DisplayName ,ic.CreatedTime, " +
            " ic.FinishTime,ic.ObjectID ,ic.InstanceName,ic.State , " +
            " ic.Originator,ic.OriginatorName,wf.WorkflowName,ic.WorkflowCode , ic.SequenceNo FROM OT_InstanceContext ic " +
            " INNER JOIN OT_WorkflowClause wf ON ic.WorkflowCode = wf.WorkflowCode LEFT JOIN " +
            " OT_WorkItem it ON ic.ObjectID = it.InstanceId WHERE 1=1";

        if (!string.IsNullOrEmpty(workflowCode))
        {
            if (workflowCode == "Car")
            {
                //用车申请，增加用车开始时间列
                sql = "SELECT it.ParticipantName ,it.DisplayName ,ic.CreatedTime, " +
                " ic.FinishTime,ic.ObjectID ,ic.InstanceName,ic.State , " +
                " ic.Originator,ic.OriginatorName,wf.WorkflowName,ic.WorkflowCode ,ic.SequenceNo ,cd.UseTime1  FROM OT_InstanceContext ic " +
                " INNER JOIN I_Car cd ON cd.ObjectID = ic.BizObjectId " +
                " INNER JOIN OT_WorkflowClause wf ON ic.WorkflowCode = wf.WorkflowCode LEFT JOIN " +
                " OT_WorkItem it ON ic.ObjectID = it.InstanceId WHERE ic.WorkflowCode ='Car'";
            }
            else if (workflowCode == "ExternalDocument")
            {
                //外部公文
                sql = "SELECT it.ParticipantName ,it.DisplayName ,ic.CreatedTime, " +
                " ic.FinishTime,ic.ObjectID ,ic.InstanceName,ic.State , " +
                " ic.Originator,ic.OriginatorName,wf.WorkflowName,ic.WorkflowCode,ic.SequenceNo ,cd.LWNumbering FROM OT_InstanceContext ic " +
                " INNER JOIN I_ExternalDocument cd ON cd.ObjectID = ic.BizObjectId " +
                " INNER JOIN OT_WorkflowClause wf ON ic.WorkflowCode = wf.WorkflowCode LEFT JOIN " +
                " OT_WorkItem it ON ic.ObjectID = it.InstanceId WHERE ic.WorkflowCode ='ExternalDocument'";
            }
            else
            {
                sql += "AND ic.WorkflowCode ='" + workflowCode + "'";
            }



        }
        if (!string.IsNullOrEmpty(unitID))
        {
            if (IsUnit(unitID))
            {
                //参数为部门id
                sql += "AND ic.Originator in(SELECT ObjectID FROM OT_User WHERE ParentID ='" + unitID + "')";
            }
            else
            {
                sql += "AND ic.Originator ='" + unitID + "'";
            }
        }
        if (!string.IsNullOrEmpty(searchKey))
        {
            sql += "AND  ic.InstanceName like '%" + searchKey + "%'";
        }
        if (!string.IsNullOrEmpty(instanceState))
        {
            sql += "AND  ic.State ='" + instanceState + "'";
        }
        if (!string.IsNullOrEmpty(startTime) && !string.IsNullOrEmpty(endTime))
        {
            sql += "AND ic.CreatedTime >='" + startTime + "' AND ic.CreatedTime <= '" + endTime + "'";
        }
        System.Data.DataTable myInstanceDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (myInstanceDt.Rows.Count > 0)
        {
            foreach (DataRow dr in myInstanceDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("InstanceID", dr["ObjectID"].ToString());
                dic.Add("InstanceName", dr["InstanceName"].ToString());
                dic.Add("CreatedTime", (dr["CreatedTime"] == null || dr["CreatedTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["CreatedTime"]));
                dic.Add("FinishTime", (dr["FinishTime"] == null || dr["FinishTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["FinishTime"]));
                dic.Add("ApproverLink", dr["DisplayName"] == null ? "" : dr["DisplayName"].ToString());
                dic.Add("Approver", dr["ParticipantName"] == null ? "" : dr["ParticipantName"].ToString());
                dic.Add("Originator", dr["Originator"].ToString());
                dic.Add("OriginatorName", dr["OriginatorName"]);
                dic.Add("State", dr["State"]);
                dic.Add("WorkflowCode", dr["WorkflowCode"]);
                dic.Add("WorkflowName", dr["WorkflowName"]);
                dic.Add("SequenceNo", dr["SequenceNo"]);
                if (workflowCode == "Car")
                {
                    //用车申请增加用车开始时间
                    dic.Add("beginTime", (dr["UseTime1"] == null || dr["UseTime1"].ToString() == "") ? "" : ConverDate((DateTime)dr["UseTime1"]));
                }
                if (workflowCode == "ExternalDocument")
                {
                    //外部公文申请增加来文编号
                    dic.Add("RDNo", dr["LWNumbering"] == null ? "" : dr["LWNumbering"].ToString());
                }
                Rows.Add(dic);
            }
        }
        Dictionary<string, object> result = new Dictionary<string, object>();
        result.Add("Rows", Rows);
        result.Add("Total", Rows.Count);
        result.Add("iTotalDisplayRecords", Rows.Count);
        result.Add("WorkflowCode", Rows.Count);
        result.Add("sEcho", 0);

        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    //查询任务
    public void QueryParticipantWorkItems(HttpContext context)
    {
        //审批人
        string instanceName = context.Request["InstanceName"];
        string participant = context.Request["Participant"];
        string workflowCode = context.Request["WorkflowCode"];
        string startTime = context.Request["StartTime"];
        string endTime = context.Request["EndTime"];
        string state = context.Request["State"];

        List<Dictionary<string, object>> Rows = new List<Dictionary<string, object>>();
        string sql = "SELECT wt.ObjectID,wt.Participant, wt.ActivityCode,ic.InstanceName,wt.DisplayName, " +
            " wt.ParticipantName,wt.ReceiveTime,ic.CreatedTime,ic.SequenceNo ,ic.State " +
            " FROM OT_WorkItem wt LEFT JOIN OT_InstanceContext ic ON wt.InstanceId = ic.ObjectID WHERE 1=1";

        if (!string.IsNullOrEmpty(workflowCode))
        {
            if (workflowCode == "Car")
            {
                //用车申请，增加用车开始时间列
                sql = "SELECT wt.ObjectID,wt.Participant, wt.ActivityCode,ic.InstanceName,wt.DisplayName, " +
                " wt.ParticipantName,wt.ReceiveTime,ic.CreatedTime,ic.SequenceNo,ic.State,cd.UseTime1 " +
                " FROM OT_WorkItem wt LEFT JOIN OT_InstanceContext ic ON wt.InstanceId = ic.ObjectID" +
                " INNER JOIN I_Car cd ON cd.RunningInstanceId = wt.InstanceId WHERE 1=1";
            }
            else if (workflowCode == "ExternalDocument")
            {
                //外部公文
                sql = "SELECT wt.ObjectID,wt.Participant, wt.ActivityCode,ic.InstanceName,wt.DisplayName, " +
            " wt.ParticipantName,wt.ReceiveTime,ic.CreatedTime,ic.SequenceNo ,ic.State,cd.LWNumbering" +
            " FROM OT_WorkItem wt LEFT JOIN OT_InstanceContext ic ON wt.InstanceId = ic.ObjectID" +
            " INNER JOIN I_ExternalDocument cd ON cd.RunningInstanceId = wt.InstanceId WHERE 1=1";
            }
            else
            {
                sql += "AND wt.WorkflowCode ='" + workflowCode + "'";
            }
        }
        if (!string.IsNullOrEmpty(participant))
        {
            sql += "AND wt.participant ='" + participant + "'";
        }
        if (!string.IsNullOrEmpty(instanceName))
        {
            sql += "AND  ic.InstanceName like '%" + instanceName + "%'";
        }
        if (!string.IsNullOrEmpty(state))
        {
            sql += "AND  ic.State ='" + state + "'";
        }
        if (!string.IsNullOrEmpty(startTime) && !string.IsNullOrEmpty(endTime))
        {
            sql += "AND ic.ReceiveTime >='" + startTime + "' AND ic.ReceiveTime <= '" + endTime + "'";
        }
        System.Data.DataTable myInstanceDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (myInstanceDt.Rows.Count > 0)
        {
            foreach (DataRow dr in myInstanceDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("InstanceName", dr["InstanceName"].ToString());
                dic.Add("CreatedTime", (dr["CreatedTime"] == null || dr["CreatedTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["CreatedTime"]));
                dic.Add("ReceiveTime", (dr["ReceiveTime"] == null || dr["ReceiveTime"].ToString() == "") ? "" : ConverDate((DateTime)dr["ReceiveTime"]));
                dic.Add("ApproverLink", dr["DisplayName"] == null ? "" : dr["DisplayName"].ToString());
                dic.Add("Approver", dr["ParticipantName"] == null ? "" : dr["ParticipantName"].ToString());
                dic.Add("Participant", dr["Participant"] == null ? "" : dr["Participant"].ToString());
                dic.Add("ActivityCode", dr["ActivityCode"].ToString());
                dic.Add("SequenceNo", dr["SequenceNo"]);
                dic.Add("State", dr["State"]);
                if (workflowCode == "Car")
                {
                    //用车申请增加用车开始时间
                    dic.Add("beginTime", (dr["UseTime1"] == null || dr["UseTime1"].ToString() == "") ? "" : ConverDate((DateTime)dr["UseTime1"]));
                }
                if (workflowCode == "ExternalDocument")
                {
                    //外部公文申请增加来文编号
                    dic.Add("RDNo", dr["LWNumbering"] == null ? "" : dr["LWNumbering"].ToString());
                }
                Rows.Add(dic);
            }
        }
        Dictionary<string, object> result = new Dictionary<string, object>();
        result.Add("Rows", Rows);
        result.Add("Total", Rows.Count);
        result.Add("iTotalDisplayRecords", Rows.Count);
        result.Add("WorkflowCode", Rows.Count);
        result.Add("sEcho", 0);

        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    public bool IsUnit(string unitID)
    {
        System.Data.DataTable UnitDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT ObjectID FROM OT_OrganizationUnit");
        List<string> unitList = new List<string>();
        if (UnitDt.Rows.Count > 0)
        {
            foreach (DataRow dr in UnitDt.Rows)
            {
                unitList.Add(dr["ObjectID"].ToString());
            }
        }

        return unitList.Contains(unitID);
    }


    //日期去秒
    public string ConverDate(DateTime dt)
    {
        return string.Format("{0:u}", dt).Substring(0, 10) + " " + string.Format("{0:t}", dt);
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