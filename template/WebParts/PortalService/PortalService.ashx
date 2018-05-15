<%@ WebHandler Language="C#" Class="PortalService" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.Xml;


public class PortalService : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "ViewNews": ViewNews(context); break;


        }
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