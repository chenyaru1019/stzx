<%@ WebHandler Language="C#" Class="STaskChange" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.Xml;


public class STaskChange : IHttpHandler {
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest (HttpContext context) {

        string command = context.Request["Command"];
        switch (command)
        {
            case "getCarRentalInfo": getCarRentalInfo(context); break;
        }
    }
    //获取项目租车信息
    public void getCarRentalInfo(HttpContext context) {
        String projectId = context.Request["ProjectId"];
          List<Dictionary<string,object>> resultDic = new List<Dictionary<string,object>>();
           String sql = "SELECT ac.Type,ac.Plate,ac.Seat  FROM I_ProjectCarRental pc LEFT JOIN I_ApplyerCarInfo ac ON pc.ObjectID = ac.ParentObjectID " +
                "WHERE pc.Status = '1' AND pc.ProjectId =" + "'" + projectId + "'";

            System.Data.DataTable projectCarRentalDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
            if (projectCarRentalDt.Rows.Count > 0)
            {
            foreach (DataRow dr in projectCarRentalDt.Rows){
                    Dictionary<string, object> dic = new Dictionary<string, object>();
                    dic.Add("Type", dr["Type"].ToString());
                    dic.Add("Plate", dr["Plate"].ToString());
                    dic.Add("Seat", dr["Seat"]);     
                    resultDic.Add(dic);
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