<%@ WebHandler Language="C#" Class="ProjectInfoService" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Xml;


public class ProjectInfoService : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "QueryProjectInfo": QueryProjectInfo(context); break;

        }
    }

    //查询所有项目
    public void QueryProjectInfo(HttpContext context)
    {
        String userId = context.Request["UserId"];

        string sql = "SELECT ProjectNum FROM ProjectDepart WHERE DepartManager = '" + userId + "'";
        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();
        List<string> list = new List<string>();
        //查询当前登录用户是否是项目负责部门或者参与部门的主管
        System.Data.DataTable ProjectDepartDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT ProjectNum FROM ProjectDepart WHERE DepartManager = '" + userId + "'");
        if (ProjectDepartDt.Rows.Count > 0)
        {
            foreach (DataRow dr in ProjectDepartDt.Rows)
            {
                list.Add(dr["ProjectNum"].ToString());
            }
        }
        System.Data.DataTable ProjectMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT ProjectNum FROM ProjectMember WHERE UserId =  '" + userId + "'");
        if (ProjectMemberDt.Rows.Count > 0)
        {
            foreach (DataRow dr in ProjectMemberDt.Rows)
            {
                list.Add(dr["ProjectNum"].ToString());
            }
        }
        string projectInfoSql = "";
        if (list.Count > 0)
        {
            projectInfoSql = "SELECT ObjectID , ProjectNum,TaskNum,ProjectName,ProjectType,xmfzr,fzbm FROM I_ProjectInfo WHERE ProjectNum IN(";
            for (int i = 0; i < list.Count; i++)
            {
                projectInfoSql += "'" + list[i] + "',";
            }
            projectInfoSql = projectInfoSql.Substring(0, projectInfoSql.LastIndexOf(",")) + ")";


            //搜索条件
            string projectNum = context.Request["ProjectNum"];
            string contractNum = context.Request["ContractNum"];
            string taskNum = context.Request["TaskNum"];
            string projectName = context.Request["ProjectName"];
            string projectType = context.Request["ProjectType"];
            string taskType = context.Request["TaskType"];
            if (projectNum != "")
            {
                projectInfoSql += "AND ProjectNum like '%" + projectNum + "%'";
            }
            if (contractNum != "")
            {
                projectInfoSql += "AND ContractNum like '%" + contractNum + "%'";
            }
            if (taskNum != "")
            {
                projectInfoSql += "AND TaskNum like '%" + taskNum + "%'";
            }
            if (projectName != "")
            {
                projectInfoSql += "AND ProjectName like '%" + projectName + "%'";
            }
            if (projectType != "")
            {
                projectInfoSql += "AND ProjectType = '" + projectType + "'";
            }
            if (taskType != "")
            {
                projectInfoSql += "AND TaskType = '" + taskType + "'";
            }

        }
        if (projectInfoSql != "")
        {
            System.Data.DataTable projectInfoDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(projectInfoSql);
            if (projectInfoDt.Rows.Count > 0)
            {

                foreach (DataRow dr in projectInfoDt.Rows)
                {
                    Dictionary<string, object> dic = new Dictionary<string, object>();

                    dic.Add("ObjectID", dr["ObjectID"].ToString());
                    dic.Add("ProjectNum", dr["ProjectNum"].ToString());
                    dic.Add("TaskNum", dr["TaskNum"]);
                    dic.Add("ProjectName", dr["ProjectName"]);
                    dic.Add("ProjectType", dr["ProjectType"]);
                    dic.Add("xmfzr", dr["xmfzr"]);
                    dic.Add("fzbm", dr["fzbm"]);
                    resultList.Add(dic);
                }
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