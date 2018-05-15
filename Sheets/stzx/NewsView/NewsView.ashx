<%@ WebHandler Language="C#" Class="NewsView" %>

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

public class NewsView : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "QueryHitAndVoteCount": QueryHitAndVoteCount(context); break;
            case "NewsVote": NewsVote(context); break;
        }
    }

    //获取项目的成员部门(x)
    public void QueryHitAndVoteCount(HttpContext context)
    {

        string articleId = context.Request["ArticleId"];
        string userId = context.Request["UserId"];

        Dictionary<string, object> dic = new Dictionary<string, object>();

        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
           "SELECT * FROM BrowseTimes WHERE UserId=" + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'");
        if (dt.Rows.Count > 0)
        {
            //存在，则访问过，不操作
        }
        else
        {
            //不存在，第一次浏览，增加到数据库
            var browsetime = DateTime.Now.ToString();
            String type = "news";
            System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
           "INSERT INTO BrowseTimes(UserId, ArticleId, BrowseTime, Type)VALUES" +
           "( " + "'" + userId + "','" + articleId + "','" + browsetime + "','" + type + "'" + ")");
        }

        //查询浏览次数
        System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
        "SELECT COUNT(*) as count FROM[dbo].[BrowseTimes] WHERE ArticleId = " + "'" + articleId + "'");
        int hits = (int)dt2.Rows[0]["count"];  //当前浏览次数

        //查询点赞状态
        System.Data.DataTable dt3 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
        "SELECT Status  FROM [dbo].[Vote] WHERE UserId = " + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'");
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
        "SELECT COUNT(id) as count FROM [dbo].[Vote] WHERE ArticleId = " + "'" + articleId + "'AND Status = '1'");
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

        Dictionary<string, object> dic = new Dictionary<string, object>();

        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
             "SELECT Status FROM Vote WHERE UserId=" + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'");
        var voteStatus = "";
        if (dt.Rows.Count > 0)
        {
            if ("0".Equals(dt.Rows[0]["Status"].ToString()))
            {
                //未赞时设置为已赞
                OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "UPDATE Vote SET Status='1' WHERE Userid = " + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'");
                voteStatus = "1";
            }
            else
            {
                //已赞时设置为未赞
                OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "UPDATE Vote SET Status='0' WHERE Userid = " + "'" + userId + "'AND ArticleId = " + "'" + articleId + "'");
                voteStatus = "0";
            }
        }
        else
        {
            //不存在，增加到数据库
            var votetime = DateTime.Now.ToString();
            voteStatus = "1";
            OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "INSERT INTO Vote(UserId, ArticleId, VoteTime, Status)VALUES" +
            "( " + "'" + userId + "','" + articleId + "','" + votetime + "','" + voteStatus + "'" + ")");

        }
        System.Data.DataTable dt4 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
             "SELECT COUNT(id) as count FROM [dbo].[Vote] WHERE ArticleId = " + "'" + articleId + "'AND Status = '1'");

        int voteCount = (int)dt4.Rows[0]["count"];

        dic.Add("VoteStatus", voteStatus);
        dic.Add("VoteCount", voteCount);
        object JSONObj = JsonConvert.SerializeObject(dic);
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