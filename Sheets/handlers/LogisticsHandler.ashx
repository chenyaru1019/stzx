<%@ WebHandler Language="C#" Class="LogisticsHandler" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;
using System.Xml;


public class LogisticsHandler : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            //新闻统计查询
            case "CountNews": CountNews(context); break;
            //新闻查询列表
            case "QueryNews": QueryNews(context); break;
            //（首页）公告查询列表
            case "QueryNotice": QueryNotice(context); break;
            //首页新闻查询窗口
            case "ViewNews": ViewNews(context); break;
            //首页会议日程查询窗口(今天和明天)
            case "ViewMeetingInfo": ViewMeetingInfo(context); break;
            //用车申请根据instanceId 查询流程表单内容增加用车开始时间字段
            case "QueryCarByInstanceId": QueryCarByInstanceId(context); break;
            //获取出差申请详情
            case "QueryBusinessTrip": QueryBusinessTrip(context); break;
            //查询流水号
            case "QuerySequenceNo": QuerySequenceNo(context); break;
            //车辆信息
            case "GetVehicleinfo": GetVehicleinfo(context); break;
            //获取车辆申请详情  1:已审批   2:已归还   3:使用中
            case "QueryCarInfo": QueryCarInfo(context); break;
            //会议室信息
            case "GetMeetingroominfo": GetMeetingroominfo(context); break;
            //获取会议申请详情
            case "QueryMeetingInfo": QueryMeetingInfo(context); break;
            //地铁期刊首页显示
            case "QuerySubwayJournals": QuerySubwayJournals(context); break;
            //地铁新闻首页显示
            case "QuerySubwayNews": QuerySubwayNews(context); break;
            //查询集团新闻和地铁新闻浏览次数和点击次数
            case "QueryHitAndVoteCount": QueryHitAndVoteCount(context); break;
            //集团新闻和地铁新闻点赞
            case "NewsVote": NewsVote(context); break;
            //客饭单汇总
            case "GuestMealSummary": GuestMealSummary(context); break;

            case "GetFAPurchase": GetFAPurchase(context); break;
        }
    }

    public void CountNews(HttpContext context)
    {
        String strYear = context.Request["Year"];
        int year = int.Parse(strYear);
        DateTime dateFirst = new DateTime(year, 1, 1);
        DateTime dateLast = new DateTime(year, 12, 30);

        string sql = "SELECT ne.Department, ne.Publisher,ne.Title,ne.PublishTime FROM  " +
            " I_News ne INNER JOIN OT_InstanceContext ic ON ne.ObjectID = ic.BizObjectId WHERE ic.State = '4'";
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

    public void QueryNews(HttpContext context)
    {
        String title = context.Request["title"];
        String department = context.Request["department"];
        var startDate = context.Request["startDate"];
        var endDate = context.Request["endDate"];
        string sql = "SELECT ObjectID,Title,PublishTime,IsTop FROM I_NewsView WHERE Status='上线'";
        if (title != "")
        {
            sql += "AND Title like '%" + title + "%'";
        }
        if (department != "")
        {
            sql += "AND Department like '%" + department + "%'";
        }
        if (startDate != "" && endDate != "")
        {
            sql += "AND PublishTime >'" + startDate + "' AND PublishTime < '" + endDate + "'";
        }
        sql += " ORDER BY IsTop DESC,PublishTime DESC";
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (newsDt.Rows.Count > 0)
        {

            string nowDateStr = DateTime.Now.ToShortDateString().Replace("/", "-");
            //昨天
            string ydDateStr = DateTime.Now.AddDays(-1).ToShortDateString().Replace("/", "-");
            //前天
            string tdbyDateStr = DateTime.Now.AddDays(-2).ToShortDateString().Replace("/", "-");
            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                DateTime publishTime = (DateTime)dr["PublishTime"];
                string publishTimeStr = publishTime.ToShortDateString().ToString().Replace("/", "-");
                if (ydDateStr == publishTimeStr || tdbyDateStr == publishTimeStr || nowDateStr == publishTimeStr)
                {
                    dic.Add("Flag", "1");
                }
                else
                {
                    dic.Add("Flag", "0");
                }
                dic.Add("PublishTime", publishTimeStr);
                dic.Add("IsTop", dr["IsTop"]);
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void QueryNotice(HttpContext context)
    {
        String title = context.Request["title"];
        String department = context.Request["department"];
        var startDate = context.Request["startDate"];
        var endDate = context.Request["endDate"];
        string sql = "SELECT ObjectID,Title,PublishTime ,IsTop FROM I_NewNotice WHERE Status='上线'";
        if (title != "" && title != null)
        {
            sql += "AND Title like '%" + title + "%'";
        }
        if (department != "" && department != null)
        {
            sql += "AND Department like '%" + department + "%'";
        }
        if (startDate != "" && endDate != "" && startDate != null && endDate != null)
        {
            sql += "AND PublishTime >'" + startDate + "' AND PublishTime < '" + endDate + "'";
        }
        sql += " ORDER BY IsTop DESC,PublishTime DESC";
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (newsDt.Rows.Count > 0)
        {
            string nowDateStr = DateTime.Now.ToShortDateString().Replace("/", "-");
            //昨天
            string ydDateStr = DateTime.Now.AddDays(-1).ToShortDateString().Replace("/", "-");
            //前天
            string tdbyDateStr = DateTime.Now.AddDays(-2).ToShortDateString().Replace("/", "-");

            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("Title", dr["Title"].ToString());

                DateTime publishTime = (DateTime)dr["PublishTime"];
                string publishTimeStr = publishTime.ToShortDateString().ToString().Replace("/", "-");
                if (ydDateStr == publishTimeStr || nowDateStr == publishTimeStr)
                {
                    dic.Add("Flag", "1");
                }
                else
                {
                    dic.Add("Flag", "0");
                }
                dic.Add("PublishTime", publishTimeStr);
                dic.Add("IsTop", dr["IsTop"]);
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void ViewNews(HttpContext context)
    {
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "SELECT ObjectID,Title,PublishTime FROM I_NewsView WHERE Status = '上线'  ORDER BY IsTop DESC,PublishTime DESC ");
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        if (newsDt.Rows.Count > 0)
        {
            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                System.Data.DataTable ImageDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                   "SELECT TOP 1 ac.ObjectID FROM OT_Attachment ac WHERE ac.DataField = 'Image' AND BizObjectId = '" + dr["ObjectID"].ToString() + "' ORDER BY ac.CreatedTime ASC");
                if (ImageDt.Rows.Count > 0)
                {
                    string imageUrl = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=NewsView&BizObjectID=" + dr["ObjectID"].ToString() + "&AttachmentID=" + ImageDt.Rows[0]["ObjectID"].ToString() + "&OpenMethod=0";
                    dic.Add("firstimage", imageUrl);
                }
                else
                {
                    dic.Add("firstimage", "");
                }
                dic.Add("NewsId", dr["ObjectID"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                resultList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    public void ViewMeetingInfo(HttpContext context)
    {

        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        System.Data.DataTable meetingInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "SELECT ic.ObjectID as InstanceId,mt.Title, mt.StartTime , " +
            " mt.MeetingRoom  FROM I_meeting mt " +
            " INNER JOIN OT_InstanceContext ic ON mt.ObjectID = ic.BizObjectId " +
            " WHERE mt.Status = '2' AND ic.State != '5' ORDER BY mt.MeetingRoom ASC ,mt.StartTime ASC");
        Dictionary<string, object> result = new Dictionary<string, object>();
        List<Dictionary<string, object>> todayList = new List<Dictionary<string, object>>();
        List<Dictionary<string, object>> tomorrowList = new List<Dictionary<string, object>>();
        if (meetingInfoDt.Rows.Count > 0)
        {
            string nowStr = DateTime.Now.ToShortDateString().ToString();
            string nextDate = DateTime.Now.AddDays(1).ToShortDateString().ToString();
            foreach (DataRow dr in meetingInfoDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                DateTime startTime = (DateTime)dr["StartTime"];
                string startTimeStr = startTime.ToShortDateString().ToString();

                dic.Add("InstanceId", dr["InstanceId"].ToString());
                dic.Add("MeetingRoom", dr["MeetingRoom"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                dic.Add("StartTime", startTime.ToShortTimeString().ToString());

                if (startTimeStr == nowStr)
                {
                    //今日会议
                    todayList.Add(dic);
                }
                else if (startTimeStr == nextDate)
                {
                    //明日会议
                    tomorrowList.Add(dic);
                }
            }
        }

        result.Add("todayList", todayList);
        result.Add("tomorrowList", tomorrowList);
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void QueryCarByInstanceId(HttpContext context)
    {
        string instanceId = context.Request["InstanceID"];
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "SELECT cr.UseTime1 FROM I_Car cr INNER JOIN OT_InstanceContext ic ON ic.BizObjectId = cr.ObjectID WHERE ic.ObjectID  ='" + instanceId + "'";
        System.Data.DataTable carDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (carDt.Rows.Count > 0)
        {
            result.Add("beginTime", ConverDate((DateTime)carDt.Rows[0]["UseTime1"]));
        }
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }




    public void QueryBusinessTrip(HttpContext context)
    {
        string year = context.Request["Year"];
        string month = context.Request["Month"];
        string searchStr = context.Request["SearchStr"];
        DateTime date = new DateTime(int.Parse(year), int.Parse(month), 1);
        string startDate = year + "-" + month + "-1";
        string nextDate = date.AddMonths(1).ToShortDateString().ToString();
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();

        string sql = "              SELECT r.ObjectId,r.Applyer,r.TotalPeople,r.Status, " +
            " LEFT (TraverList,	LEN(TraverList) - 1 ) AS Travers, " +
            " LEFT ( TripAddress, LEN(TripAddress) - 1 ) AS TripAddress, " +
            " LEFT (TripDate, LEN(TripDate) - 1) AS TripDate, " +
            " LEFT (  TripDetails, LEN(TripDetails) - 1  ) AS TripDetails FROM " +
            " (SELECT  ic.ObjectID,ic.BizObjectId,bt.Applyer,bt.TotalPeople,bt.Status, " +
            " (SELECT FullName + '、' FROM I_Traveler WHERE " +
            " ParentObjectID = ic.BizObjectId FOR XML PATH ('') ) AS TraverList, " +
            " ( SELECT StartAddress + '-' + EndAddress + '、' FROM I_BusinessTripDetails " +
            " WHERE ParentObjectID = ic.BizObjectId ORDER BY " +
            " BeginTime FOR XML PATH ('') ) AS TripAddress,( SELECT " +
            " CONVERT (VARCHAR(100), BeginTime, 120) + '~' + CONVERT (VARCHAR(100), EndTime, 120) + '、' " +
            " FROM I_BusinessTripDetails WHERE ParentObjectID = ic.BizObjectId ORDER BY " +
            " BeginTime FOR XML PATH ('') ) AS TripDate, ( SELECT StartAddress + '-' + EndAddress + ' ~ '," +
            " CONVERT (VARCHAR(100), BeginTime, 23) + ' ' + CONVERT (VARCHAR(100), EndTime, 23) + '、'     FROM " +
            " I_BusinessTripDetails WHERE ParentObjectID = ic.BizObjectId ORDER BY " +
            " BeginTime FOR XML PATH ('') ) AS TripDetails FROM I_BusinessTravel bt " +
            " INNER JOIN OT_InstanceContext ic ON bt.ObjectID = ic.BizObjectId WHERE bt.ObjectID IN ( " +
            " SELECT DISTINCT (bd.ParentObjectID) FROM I_BusinessTravel bt " +
            " INNER JOIN OT_InstanceContext ic ON bt.ObjectID = ic.BizObjectId " +
            " INNER JOIN I_BusinessTripDetails bd ON bt.ObjectID = bd.ParentObjectID " +
            " INNER JOIN I_Traveler tl ON bt.ObjectID = tl.ParentObjectID " +
            " WHERE  ic.State != '5' AND bd.BeginTime >= '" + startDate + "' " +
            " AND bd.EndTime < '" + nextDate + "'";
        if (searchStr != "" && searchStr != null)
            sql += " AND tl.FullName LIKE '%" + searchStr + "%' OR tl.Depart LIKE '%" + searchStr + "%' ) GROUP BY ic.ObjectID, ic.BizObjectId, bt.Applyer, bt.TotalPeople, bt.Status ) r ";
        else
            sql += " )GROUP BY ic.ObjectID, ic.BizObjectId, bt.Applyer, bt.TotalPeople, bt.Status) r";

        System.Data.DataTable BusinessTripDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (BusinessTripDt.Rows.Count > 0)
        {
            foreach (DataRow dr in BusinessTripDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("ObjectId", dr["ObjectId"].ToString());
                dic.Add("Applyer", dr["Applyer"].ToString());
                dic.Add("Num", dr["TotalPeople"].ToString());
                dic.Add("Status", dr["Status"].ToString());
                dic.Add("Travers", dr["Travers"].ToString());
                dic.Add("TripAddress", dr["TripAddress"].ToString());
                dic.Add("TripDate", dr["TripDate"].ToString());
                dic.Add("TripDetails", dr["TripDetails"].ToString());
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    public void QuerySequenceNo(HttpContext context)
    {
        string instanceID = context.Request["InstanceID"];


        string sql = " SELECT SequenceNo FROM [dbo].[OT_InstanceContext] WHERE ObjectID='"+instanceID+"'";
        string SequenceNo = "";
        System.Data.DataTable SequenceNoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (SequenceNoDt.Rows.Count > 0)
        {
             SequenceNo =SequenceNoDt.Rows[0]["SequenceNo"].ToString();
        }
        object JSONObj = JsonConvert.SerializeObject(SequenceNo);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }
    public void GetVehicleinfo(HttpContext context)
    {
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable vehicleInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT ObjectID,FullName,Model,Type,Plate,GDate FROM I_VehicleInfo  WHERE Enable = '启用'");
        if (vehicleInfoDt.Rows.Count > 0)
        {
            foreach (DataRow dr in vehicleInfoDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                System.Data.DataTable imageDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT TOP 1 ObjectID FROM OT_Attachment WHERE BizObjectSchemaCode='VehicleInfo' AND DataField='Image'AND BizObjectId = '" + dr["ObjectID"].ToString() + "' ORDER BY CreatedTime ASC");

                if (imageDt.Rows.Count > 0)
                {
                    string imageUrl = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=VehicleInfo&BizObjectID=" + dr["ObjectID"].ToString() + "&AttachmentID=" + imageDt.Rows[0]["ObjectID"].ToString() + "&OpenMethod=0";
                    dic.Add("photo", imageUrl);
                }
                else
                {
                    dic.Add("photo", null);
                }

                dic.Add("objectId", dr["ObjectID"].ToString());
                dic.Add("fullname", dr["FullName"].ToString());
                dic.Add("model", dr["Model"].ToString());
                dic.Add("type", dr["Type"].ToString());
                dic.Add("plate", dr["Plate"].ToString());
                dic.Add("gdate", dr["GDate"]);
                resultList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void GetMeetingroominfo(HttpContext context)
    {
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable meetingroomInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "SELECT ObjectID, Meetingroom,Num,Administrator,SDate,Address,Equipment,Enable  FROM I_MeetingroomInfo ORDER BY Meetingroom ASC ");
        if (meetingroomInfoDt.Rows.Count > 0)
        {
            foreach (DataRow dr in meetingroomInfoDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                System.Data.DataTable imageDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT TOP 1 ObjectID FROM OT_Attachment WHERE BizObjectSchemaCode='MeetingroomInfo' AND DataField='Image'AND BizObjectId = '" + dr["ObjectID"].ToString() + "' ORDER BY CreatedTime ASC");

                if (imageDt.Rows.Count > 0)
                {
                    string imageUrl = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=MeetingroomInfo&BizObjectID=" + dr["ObjectID"].ToString() + "&AttachmentID=" + imageDt.Rows[0]["ObjectID"].ToString() + "&OpenMethod=0";
                    dic.Add("photo", imageUrl);
                }
                else
                {
                    dic.Add("photo", null);
                }
                dic.Add("objectId", dr["ObjectID"].ToString());
                dic.Add("meetingroom", dr["Meetingroom"].ToString());
                dic.Add("equipment", dr["Equipment"].ToString());
                dic.Add("administrator", dr["Administrator"].ToString());
                dic.Add("num", dr["Num"].ToString());
                dic.Add("address", dr["Address"]);
                dic.Add("sdate", dr["SDate"].ToString());
                dic.Add("enable", dr["Enable"].ToString());
                resultList.Add(dic);
            }
        }

        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void QueryMeetingInfo(HttpContext context)
    {
        string year = context.Request["Year"];
        string month = context.Request["Month"];
        string meetingRoomId = context.Request["MeetingRoomId"];

        DateTime date = new DateTime(int.Parse(year), int.Parse(month), 1);
        string startDate = year + "-" + month + "-1";
        string nextDate = date.AddMonths(1).ToShortDateString().ToString();

        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        string sql = "SELECT ic.ObjectID AS InstanceId,mt.ObjectID AS BizObjectId," +
            " mt.Title,mt.Applyer,mt.Moderator,mt.MeetingRoom,mt.StartTime,mt.EndTime,mt.Status" +
            " FROM I_meeting mt INNER JOIN OT_InstanceContext ic ON mt.ObjectID = ic.BizObjectId WHERE" +
            " ic.State != '5'AND mt.StartTime >= '" + startDate + "'AND mt.EndTime < '" + nextDate + "'";
        if (meetingRoomId != "" && meetingRoomId != null)
        {
            sql += "AND  mt.MeetingRoomId='" + meetingRoomId + "'";
        }
        System.Data.DataTable meetingInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (meetingInfoDt.Rows.Count > 0)
        {
            foreach (DataRow dr in meetingInfoDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("InstanceId", dr["InstanceId"].ToString());
                dic.Add("BizObjectId", dr["BizObjectId"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                dic.Add("Applyer", dr["Applyer"].ToString());
                dic.Add("Moderator", dr["Moderator"].ToString());
                dic.Add("MeetingRoom", dr["MeetingRoom"].ToString());
                string StartTime = string.Format("{0:u}", (DateTime)dr["StartTime"]);
                string EndTime = string.Format("{0:u}", (DateTime)dr["EndTime"]);
                dic.Add("StartTime", StartTime.Substring(0, StartTime.Length - 1));
                dic.Add("EndTime", EndTime.Substring(0, EndTime.Length - 1));
                dic.Add("Status", dr["Status"].ToString());
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void QueryCarInfo(HttpContext context)
    {
        string year = context.Request["Year"];
        string month = context.Request["Month"];
        string vehicleId = context.Request["VehicleId"];

        DateTime date = new DateTime(int.Parse(year), int.Parse(month), 1);
        string startDate = year + "-" + month + "-1";
        string nextDate = date.AddMonths(1).ToShortDateString().ToString();

        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        string sql = "SELECT ic.ObjectID AS InstanceId,ca.ObjectID AS BizObjectId,ca.Num, " +
            " ca.Applyer,ca.UseTime1 AS StartTime,ca.UseTime2 AS EndTime,ca.Address1, " +
            " ca.Address2,ca.Models,ca.Plate,ca.DriverName,ca.Status FROM I_Car ca INNER JOIN " +
            " OT_InstanceContext ic ON ca.ObjectID = ic.BizObjectId " +
            " WHERE ic.State != '5' AND ca.UseTime1 >= '" + startDate + "'AND ca.UseTime2 < '" + nextDate + "'";
        if (vehicleId != "" && vehicleId != null)
        {
            sql += "AND  ca.VehicleId='" + vehicleId + "'";
        }
        System.Data.DataTable meetingInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (meetingInfoDt.Rows.Count > 0)
        {
            foreach (DataRow dr in meetingInfoDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("InstanceId", dr["InstanceId"].ToString());
                dic.Add("BizObjectId", dr["BizObjectId"].ToString());
                dic.Add("Num", dr["Num"]);
                dic.Add("Applyer", dr["Applyer"].ToString());
                string StartTime = string.Format("{0:u}", (DateTime)dr["StartTime"]);
                string EndTime = string.Format("{0:u}", (DateTime)dr["EndTime"]);
                dic.Add("StartTime", StartTime.Substring(0, StartTime.Length - 1));
                dic.Add("EndTime", EndTime.Substring(0, EndTime.Length - 1));
                dic.Add("StartAddress", dr["Address1"].ToString());
                dic.Add("EndAddress", dr["Address2"].ToString());
                dic.Add("Model", dr["Models"].ToString());
                dic.Add("Plate", dr["Plate"].ToString());
                dic.Add("DriverName", dr["DriverName"].ToString());
                string status = dr["Status"].ToString();
                if ("1" == status)
                {
                    // 用车开始时间
                    DateTime startTime = (DateTime)dr["StartTime"];
                    // 用车结束时间
                    DateTime endTime = (DateTime)dr["EndTime"];
                    if (DateTime.Now >= startTime && DateTime.Now <= endTime)
                    {
                        // 当前时间正在进行中的车，变更状态
                        status = "3";
                    }
                }
                dic.Add("Status", status);
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void QuerySubwayJournals(HttpContext context)
    {
        String title = context.Request["Title"];
        String type = context.Request["Type"];
        String source = context.Request["Source"];
        var startDate = context.Request["StartDate"];
        var endDate = context.Request["EndDate"];

        string sql = "SELECT ObjectID,Type,Publisher, Source, Title,PublishTime FROM I_SubwayJournals WHERE Status='上线'";
        if (title != "" && title != null)
        {
            sql += "AND Title like '%" + title + "%'";
        }
        if (type != "" && type != null)
        {
            sql += "AND Type like '%" + type + "%'";
        }
        if (source != "" && source != null)
        {
            sql += "AND Source like '%" + source + "%'";
        }
        if (startDate != "" && endDate != "" && startDate != null && endDate != null)
        {
            sql += "AND PublishTime >'" + startDate + "' AND PublishTime < '" + endDate + "'";
        }
        sql += " ORDER BY PublishTime DESC";
        Dictionary<string, object> result = new Dictionary<string, object>();
        List<Dictionary<string, object>> pictorialtList = new List<Dictionary<string, object>>();
        List<Dictionary<string, object>> newsList = new List<Dictionary<string, object>>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (newsDt.Rows.Count > 0)
        {
            //今天
            string nowDateStr = DateTime.Now.ToShortDateString().Replace("/", "-");
            //昨天
            string ydDateStr = DateTime.Now.AddDays(-1).ToShortDateString().Replace("/", "-");
            //前天
            string tdbyDateStr = DateTime.Now.AddDays(-2).ToShortDateString().Replace("/", "-");

            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("Type", dr["Type"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                dic.Add("Publisher", dr["Publisher"].ToString());
                dic.Add("Source", dr["Source"].ToString());
                DateTime publishTime = (DateTime)dr["PublishTime"];
                string publishTimeStr = publishTime.ToShortDateString().ToString().Replace("/", "-");
                if (ydDateStr == publishTimeStr || nowDateStr == publishTimeStr)
                {
                    dic.Add("Flag", "1");
                }
                else
                {
                    dic.Add("Flag", "0");
                }
                dic.Add("PublishTime", publishTimeStr);
                if ("地铁画报" == dr["Type"].ToString())
                {
                    pictorialtList.Add(dic);
                }
                else
                {
                    newsList.Add(dic);
                }
            }
        }
        result.Add("pictorialtList", pictorialtList);
        result.Add("newsList", newsList);
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void QuerySubwayNews(HttpContext context)
    {
        String title = context.Request["Title"];
        String department = context.Request["Department"];
        var startDate = context.Request["StartDate"];
        var endDate = context.Request["EndDate"];

        string sql = "SELECT ObjectID, Publisher,Department, Title, PublishTime  FROM I_SubwayNews WHERE Status='上线'";
        if (title != "" && title != null)
        {
            sql += "AND Title like '%" + title + "%'";
        }
        if (department != "" && department != null)
        {
            sql += "AND Department like '%" + department + "%'";
        }
        if (startDate != "" && endDate != "" && startDate != null && endDate != null)
        {
            sql += "AND PublishTime >'" + startDate + "' AND PublishTime < '" + endDate + "'";
        }
        sql += " ORDER BY PublishTime DESC";
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        System.Data.DataTable newsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (newsDt.Rows.Count > 0)
        {
            string nowDateStr = DateTime.Now.ToShortDateString().Replace("/", "-");
            //昨天
            string ydDateStr = DateTime.Now.AddDays(-1).ToShortDateString().Replace("/", "-");
            //前天
            string tdbyDateStr = DateTime.Now.AddDays(-2).ToShortDateString().Replace("/", "-");
            foreach (DataRow dr in newsDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("ObjectID", dr["ObjectID"].ToString());
                dic.Add("Publisher", dr["Publisher"].ToString());
                dic.Add("Department", dr["Department"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                DateTime publishTime = (DateTime)dr["PublishTime"];
                string publishTimeStr = publishTime.ToShortDateString().ToString().Replace("/", "-");
                if (ydDateStr == publishTimeStr || nowDateStr == publishTimeStr)
                {
                    dic.Add("Flag", "1");
                }
                else
                {
                    dic.Add("Flag", "0");
                }

                dic.Add("PublishTime", publishTimeStr);
                resultList.Add(dic);
            }
        }
        object JSONObj = JsonConvert.SerializeObject(resultList);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    //查询浏览和点赞次数
    public void QueryHitAndVoteCount(HttpContext context)
    {

        string articleId = context.Request["ArticleId"];
        string userId = context.Request["UserId"];
        string type = context.Request["Type"];

        Dictionary<string, object> dic = new Dictionary<string, object>();

        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
           "SELECT  Id  FROM  BrowseTimes WHERE UserId=" + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'AND Type ='" + type + "'");
        if (dt.Rows.Count > 0)
        {
            //存在，则访问过，不操作
        }
        else
        {
            //不存在，第一次浏览，增加到数据库
            var browsetime = DateTime.Now.ToString();
            System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
           "INSERT INTO BrowseTimes(UserId, ArticleId, BrowseTime, Type)VALUES" +
           "( " + "'" + userId + "','" + articleId + "','" + browsetime + "','" + type + "'" + ")");
        }

        //查询浏览次数
        System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
        "SELECT COUNT(Id) as count FROM BrowseTimes WHERE ArticleId = " + "'" + articleId + "'");
        int hits = (int)dt2.Rows[0]["count"];  //当前浏览次数

        //查询点赞状态
        System.Data.DataTable dt3 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
        "SELECT Status  FROM [dbo].[Vote] WHERE UserId = " + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'AND Type ='" + type + "'");
        string voteStatus = null;
        if (dt3.Rows.Count > 0)
        {
            //存在，查询点击状态
            voteStatus = dt3.Rows[0]["Status"].ToString();
        }
        else
        {
            //不存在，设置状态为设置为未赞
            voteStatus = "0";
        }

        //查询点赞次数已赞为1
        System.Data.DataTable dt4 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
        "SELECT COUNT(Id) as count FROM Vote WHERE ArticleId = " + "'" + articleId + "'AND Status = '1'");

        int voteCount = (int)dt4.Rows[0]["count"];

        dic.Add("Hits", hits);
        dic.Add("VoteStatus", voteStatus);
        dic.Add("VoteCount", voteCount);
        object JSONObj = JsonConvert.SerializeObject(dic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }




    //点赞
    public void NewsVote(HttpContext context)
    {

        string articleId = context.Request["ArticleId"];
        string userId = context.Request["UserId"];
        string type = context.Request["Type"];

        Dictionary<string, object> dic = new Dictionary<string, object>();

        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
             "SELECT Status FROM Vote WHERE UserId=" + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'AND Type ='" + type + "'");
        var voteStatus = "";
        if (dt.Rows.Count > 0)
        {
            if ("0".Equals(dt.Rows[0]["Status"].ToString()))
            {
                //未赞时设置为已赞
                OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "UPDATE Vote SET Status='1' WHERE Userid = " + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'AND Type ='" + type + "'");
                voteStatus = "1";
            }
            else
            {
                //已赞时设置为未赞
                OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "UPDATE Vote SET Status='0' WHERE Userid = " + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'AND Type ='" + type + "'");
                voteStatus = "0";
            }
        }
        else
        {
            //不存在，增加到数据库
            var votetime = DateTime.Now.ToString();
            voteStatus = "1";
            OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "INSERT INTO Vote(UserId, ArticleId, VoteTime, Status,Type)VALUES" +
            "( " + "'" + userId + "','" + articleId + "','" + votetime + "','" + voteStatus + "','" + type + "'" + ")");

        }
        System.Data.DataTable dt4 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
             "SELECT COUNT(Id) as count FROM [dbo].[Vote] WHERE ArticleId = " + "'" + articleId + "'AND Type ='" + type + "' AND Status = '1'");

        int voteCount = (int)dt4.Rows[0]["count"];

        dic.Add("VoteStatus", voteStatus);
        dic.Add("VoteCount", voteCount);
        object JSONObj = JsonConvert.SerializeObject(dic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void ValidateUserById(HttpContext context)
    {
        string userId = context.Request["UserId"];
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "SELECT ObjectID FROM I_AddressBook WHERE UserId ='" + userId + "'";
        System.Data.DataTable userDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (userDt.Rows.Count > 0)
        {
            //已添加
            result.Add("status", "1");
        }
        else
        {
            //未添加
            result.Add("status", "0");

        }
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void GuestMealSummary(HttpContext context)
    {

        string beginTime = context.Request["BeginTime"];
        string endTime = context.Request["EndTime"];
        List<string> projectApproverList = new List<string>();
        List<string> departApproverList = new List<string>();
        List<Dictionary<string, object>> kfList = new List<Dictionary<string, object>>();
        List<Dictionary<string, object>> newkfList = new List<Dictionary<string, object>>();
        //List<Dictionary<string, object>> departList = new List<Dictionary<string, object>>();
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "  SELECT kf.Department, kf.ProjectName, kf.ProjectNum, kf.xmfzr,kf.Total, " +
            "  ou.ObjectID AS depart FROM I_kefan kf INNER JOIN OT_InstanceContext ic" +
            "  ON kf.ObjectID = ic.BizObjectId INNER JOIN OT_OrganizationUnit ou ON kf.Department = ou.Name" +
            "  WHERE ic.State = '4' AND kf.UseDate >='" + beginTime + "' AND kf.UseDate<= '" + endTime + "'";
        System.Data.DataTable kfDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (kfDt.Rows.Count > 0)
        {
            foreach (DataRow dr in kfDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                if (dr["ProjectNum"] == null || dr["ProjectNum"].ToString() == "")
                {
                    //部门客饭


                    if (!departApproverList.Contains(dr["depart"].ToString()))
                    {
                        departApproverList.Add(dr["depart"].ToString());
                    }
                    dic.Add("FullName", dr["Department"].ToString());
                    dic.Add("ProjectName", "");
                    dic.Add("Amount", Convert.ToDouble(dr["Total"]));

                }
                else
                {
                    //项目编号不为空,客饭单为项目所用


                    if (!projectApproverList.Contains(dr["xmfzr"].ToString()))
                    {
                        projectApproverList.Add(dr["xmfzr"].ToString());
                    }
                    dic.Add("FullName", dr["ProjectNum"].ToString());
                    dic.Add("ProjectName", dr["ProjectName"].ToString());
                    dic.Add("Amount", Convert.ToDouble(dr["Total"]));

                }
                kfList.Add(dic);
            }

            for (int i = 0; i < kfList.Count; i++)
            {
                Dictionary<string, object> d1 = kfList[i];
                string fullName1 = Convert.ToString(d1["FullName"]);
                int flag = 0;// 0为新增数据，1为增加count  
                for (int j = 0; j < newkfList.Count; j++)
                {
                    Dictionary<string, object> d2 = newkfList[j];
                    string fullName2 = Convert.ToString(d2["FullName"]);
                    if (fullName1 == fullName2)
                    {
                        double sumAmount = Convert.ToDouble(d1["Amount"]) + Convert.ToDouble(d2["Amount"]);
                        d2["Amount"] = sumAmount;
                        flag = 1;
                        continue;
                    }
                }
                if (flag == 0)
                {
                    newkfList.Add(d1);
                }
            }
        }
        result.Add("projectList", projectApproverList);
        result.Add("departList", departApproverList);
        result.Add("kfList", newkfList);

        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public bool areSameDay(DateTime dateA, DateTime dateB)
    {
        return false;
    }



    public void GetFAPurchase(HttpContext context)
    {
        string bizObjectId = context.Request["BizObjectId"];


        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        string sql = " SELECT pi.LargeType,pi.SmallType,pi.MaterialName,pi.Model, " +
            " pi.Unit,pi.StorageLocation, pi.Num,pi.Price,pi.TotalPrice FROM " +
            "  I_POFA pa INNER JOIN I_PurchaseItems pi ON pa.ObjectID = pi.ParentObjectID " +
            "  WHERE pa.ObjectID = '" + bizObjectId + "'";
        System.Data.DataTable fapoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (fapoDt.Rows.Count > 0)
        {
            foreach (DataRow dr in fapoDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("LargeType", dr["LargeType"].ToString());
                dic.Add("SmallType", dr["SmallType"].ToString());
                dic.Add("MaterialName", dr["MaterialName"]);
                dic.Add("Model", dr["Model"].ToString());
                dic.Add("Unit", dr["Unit"].ToString());
                dic.Add("StorageLocation", dr["StorageLocation"].ToString());
                dic.Add("Num", dr["Num"].ToString());
                dic.Add("Price", dr["Price"].ToString());
                dic.Add("TotalPrice", dr["TotalPrice"].ToString());
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

    //日期去秒
    public string ConverDate(DateTime dt)
    {
        return string.Format("{0:g}", dt);
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