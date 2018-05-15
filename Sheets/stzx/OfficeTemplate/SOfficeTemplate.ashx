<%@ WebHandler Language="C#" Class="SOfficeTemplate" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;


public class SOfficeTemplate : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "GetCarouselFigure": GetCarouselFigure(context); break;

        }
    }
    //获取轮播图片
    public void GetCarouselFigure(HttpContext context)
    {
        String objectId = context.Request["ObjectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();


        System.Data.DataTable FileDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT TOP 1 ObjectID AS fileId " +
            " FROM OT_Attachment WHERE DataField = 'FileAttachment' AND BizObjectId = '" + objectId + "' ORDER BY CreatedTime ASC");
        string fileId = FileDt.Rows[0]["fileId"].ToString();
        resultDic.Add("FileId", fileId);

        //查询轮播图
        string sql = "SELECT ObjectID as imageId" +
            "  FROM OT_Attachment WHERE DataField = 'ImageAttachment' AND  BizObjectId = '" + objectId + "' ORDER BY CreatedTime ASC";

        System.Data.DataTable imageDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        List<Dictionary<string, object>> imageList = new List<Dictionary<string, object>>();
        if (imageDt.Rows.Count > 0)
        {
            foreach (DataRow dr in imageDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();

                dic.Add("imageId", dr["imageId"].ToString());
                imageList.Add(dic);
            }
            resultDic.Add("imageList", imageList);

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