<%@ WebHandler Language="C#" Class="ProjectArchive" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;


public class ProjectArchive : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "GetProjectAttachment": GetProjectAttachment(context); break;

        }
    }
    //获取项目文件
    public void GetProjectAttachment(HttpContext context)
    {
        String projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        string sql = "SELECT ac.ObjectID, ac.BizObjectId, ac.BizObjectSchemaCode, ac.FileName FROM OT_Attachment ac WHERE BizObjectId IN ( " +
        "SELECT po.ObjectID FROM I_ProjectOutline po WHERE po.Status = '1' AND po.ProjectId = '" + projectId +
        "' UNION SELECT pc.ObjectID FROM I_ProjectOutlineChanges pc WHERE pc.Status = '1' AND pc.ProjectId =  '" + projectId +
        "' UNION SELECT ct.ObjectID FROM I_ConsultativeTRR ct WHERE ct.ProjectId = '" + projectId +
        "' UNION SELECT dt.ObjectID FROM I_DesignTRR dt WHERE dt.ProjectId =  '" + projectId +
        "' UNION SELECT el.ObjectID FROM I_EnterList el INNER JOIN I_ProjectReview pr ON el.ParentObjectID = pr.ObjectID WHERE pr.ProjectId =  '" + projectId +
        "' UNION SELECT wb.ObjectID FROM I_wbzldjb wb INNER JOIN I_ExternalDataregistrat eg ON wb.ParentObjectID = eg.ObjectID WHERE eg.ProjectId = '" + projectId +
        "' UNION SELECT pw.ObjectID FROM I_ProjectWeekly pw WHERE pw.ProjectId = '" + projectId +
        "' UNION SELECT pm.ObjectID FROM I_ProjectMonth pm WHERE pm.ProjectId = '" + projectId +
        "' UNION SELECT ps.ObjectID FROM I_ProjectSummary ps WHERE ps.ProjectId = '" + projectId +
        "' UNION SELECT pm.ObjectID FROM I_ProjectMonth pm WHERE pm.ProjectId =  '" + projectId + "')";

        System.Data.DataTable resultDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        List<Dictionary<string,object>> AttachmentList = new List<Dictionary<string,object>>();
        if (resultDt.Rows.Count > 0)
        {
            foreach (DataRow dr in resultDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("ObjectID" ,dr["ObjectID"].ToString());
                dic.Add("BizObjectId" ,dr["BizObjectId"].ToString());
                dic.Add("SchemaCode" ,dr["BizObjectSchemaCode"].ToString());
                dic.Add("FileName" ,dr["FileName"].ToString());
                AttachmentList.Add(dic);
            }
            resultDic.Add("AttachmentResult",AttachmentList);

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