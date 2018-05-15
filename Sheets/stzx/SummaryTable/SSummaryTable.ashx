<%@ WebHandler Language="C#" Class="Logistics_execute" %>

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

public class Logistics_execute : IHttpHandler {
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest (HttpContext context) {

        string command = context.Request["Command"];
        switch (command)
        {
            case "querySummary": querySummary(context); break;

        }
    }

    //获取项目的成员部门(x)
    public void querySummary(HttpContext context) {
        String year = context.Request["year"];
        String quarterly = context.Request["quarterly"];

        List<Dictionary<string,object>> resultList = new List<Dictionary<string,object>>();
        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT TOP 1 ObjectID  FROM I_ProjectAssessment  WHERE Status='1'" +
           "AND ParticularYear ='" + year + "'AND Quarterly='"+ quarterly+"'");
        if (dt.Rows.Count>0) {
            //项管部评价
            String objectid =dt.Rows[0]["ObjectID"].ToString();
            System.Data.DataTable projectDepartmentDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
              "SELECT ProjectName , TaskNum ,Quality ,Schedule ,Contract ,Security ,Material ,Cost ,Total " +
              "FROM I_ProjectDepartment where ParentObjectID='" + objectid + "'");

            //市场部评价
            System.Data.DataTable marketingDepartmentDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
           "SELECT ProjectName,TaskNum,Contract,Total FROM I_MarketingDepartment where ParentObjectID='" + objectid + "'");

            //综合办评价
            System.Data.DataTable integratedOfficeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
            "SELECT ProjectName,TaskNum,Material,Security,Cost,Total FROM I_IntegratedOffice where ParentObjectID='" + objectid + "'");

            for (int i = 0; i < projectDepartmentDt.Rows.Count; i++)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                String ProjectName = projectDepartmentDt.Rows[i]["ProjectName"].ToString();
                String TaskNum = projectDepartmentDt.Rows[i]["TaskNum"].ToString();
                dic.Add("ProjectName",ProjectName);
                dic.Add("TaskNum",TaskNum);   //任务编号
                dic.Add("Quality",((Double)projectDepartmentDt.Rows[i]["Quality"])*20); //质量
                dic.Add("Schedule",((Double)projectDepartmentDt.Rows[i]["Schedule"]*15));  //进度
                dic.Add("Datum",((Double)projectDepartmentDt.Rows[i]["Material"]*15));   //资料
                Double Contract =  ((Double)projectDepartmentDt.Rows[i]["Contract"])*7.5;  //合同
                Double Security =  ((Double)projectDepartmentDt.Rows[i]["Security"])*2.5;  //安全
                Double Cost =  ((Double)projectDepartmentDt.Rows[i]["Cost"])*7.5;  //成本
                for (int j = 0; j < marketingDepartmentDt.Rows.Count; j++)
                {
                    String pname =  marketingDepartmentDt.Rows[j]["ProjectName"].ToString();
                    String tnum =  marketingDepartmentDt.Rows[j]["TaskNum"].ToString();
                    //市场部评价
                    if (ProjectName==pname && TaskNum==tnum) {
                        //如果项目名称和任务编号相等，取出合同分数和项目评价合同分数相加
                        dic.Add("Contract",Contract+((Double)marketingDepartmentDt.Rows[j]["Contract"])*7.5);   //合同
                    }

                }

                for (int k = 0; k < marketingDepartmentDt.Rows.Count; k++)
                {
                    String mname =  marketingDepartmentDt.Rows[k]["ProjectName"].ToString();
                    String mnum =  marketingDepartmentDt.Rows[k]["TaskNum"].ToString();
                    //综合办评价
                    if (ProjectName==mname && TaskNum==mnum) {
                        //如果项目名称和任务编号相等，取出合同分数和项目评价合同分数相加
                        dic.Add("Material",((Double)integratedOfficeDt.Rows[k]["Material"])*5);   //物资
                        dic.Add("Security",Security+((Double)integratedOfficeDt.Rows[k]["Security"])*2.5);   //安全
                        dic.Add("Cost",Cost+((Double)integratedOfficeDt.Rows[k]["Cost"])*7.5);   //成本
                    }

                }
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