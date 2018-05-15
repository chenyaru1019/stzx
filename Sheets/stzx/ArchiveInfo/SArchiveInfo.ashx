<%@ WebHandler Language="C#" Class="SArchiveInfo" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Data;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;


public class SArchiveInfo : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            case "GetArchiveData": GetArchiveData(context); break;
            case "GetProcessInfo": GetProcessInfo(context); break;
        }
    }

    public void GetProcessInfo(HttpContext context)
    {

        String projectId = context.Request["projectId"];
        Dictionary<string, object> resultDic = new Dictionary<string, object>();
        List<Dictionary<string, object>> projectProcessInfoList = new List<Dictionary<string, object>>();
        System.Data.DataTable projectInfodt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT ProjectNum,ProjectTaskId FROM I_ProjectInfo WHERE ObjectID =  '" + projectId + "'");
        string projectTaskId = projectInfodt.Rows[0]["ProjectTaskId"].ToString();
        string projectNum = projectInfodt.Rows[0]["ProjectNum"].ToString();
        string sql = "SELECT ic.SequenceNo , ic.BizObjectSchemaCode, pp.ObjectID,pp.Title, pp.Name,pp.CreatedTime,pp.Department,pp.Applyer FROM " +
            "I_ProjectPropose pp INNER JOIN OT_InstanceContext ic ON pp.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND pp.ProjectNum ='" + projectNum +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pj.ObjectID,pj.Title,pj.Name,pj.CreatedTime,pj.Department,pj.Applyer " +
            "FROM I_PreProject pj INNER JOIN OT_InstanceContext ic ON pj.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND pj.ProjectNum ='" + projectNum +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,cs.ObjectID,cs.Title,cs.Name,cs.CreatedTime,cs.Department,cs.Applyer " +
            "FROM I_ContractWillSign cs INNER JOIN OT_InstanceContext ic ON cs.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND cs.ProjectId = '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pt.ObjectID,pt.Title,pt.Name,pt.CreatedTime,pt.Department,pt.Applyer " +
            "FROM I_ProjectTask pt INNER JOIN OT_InstanceContext ic ON pt.ObjectID = ic.BizObjectId " +
            "WHERE pt.Status = '1' AND pt.ObjectID ='" + projectTaskId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,tc.ObjectID,tc.Title,tc.Name,tc.CreatedTime,tc.Department,tc.Applyer " +
            "FROM I_TaskChange tc INNER JOIN OT_InstanceContext ic ON tc.ObjectID = ic.BizObjectId " +
            "WHERE tc.Status = '1' AND tc.ProjectId =  '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,po.ObjectID,po.Title,po.Name,po.CreatedTime,po.Department,po.Applyer " +
            "FROM I_ProjectOutline po INNER JOIN OT_InstanceContext ic ON po.ObjectID = ic.BizObjectId WHERE " +
            "ic.State = '4' AND po.ProjectId = '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pc.ObjectID,pc.Title,pc.Name,pc.CreatedTime,pc.Department,pc.Applyer " +
            "FROM I_ProjectOutlineChanges pc INNER JOIN OT_InstanceContext ic ON pc.ObjectID = ic.BizObjectId " +
            "WHERE ic.State = '4' AND pc.ProjectId = '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,ps.ObjectID,ps.Title,ps.Name,ps.CreatedTime,ps.Department,ps.Applyer " +
            "FROM I_ProjectOutside ps INNER JOIN OT_InstanceContext ic ON ps.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND ps.ProjectId =  '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,es.ObjectID,es.Title,es.Name,es.CreatedTime,es.Department,es.Applyer " +
            "FROM I_ExternalDataregistrat es INNER JOIN OT_InstanceContext ic ON es.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND es.ProjectId =  '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pr.ObjectID,pr.Title,pr.Name,pr.CreatedTime,pr.Department,pr.Applyer " +
            "FROM I_ProjectReview pr INNER JOIN OT_InstanceContext ic ON pr.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND pr.ProjectId = '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,dt.ObjectID,dt.Title,dt.Name,dt.CreatedTime,dt.Department,dt.Applyer " +
            "FROM I_DesignTRR dt INNER JOIN OT_InstanceContext ic ON dt.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND dt.ProjectId = '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,ct.ObjectID,ct.Title,ct.Name,ct.CreatedTime,ct.Department,ct.Applyer " +
            "FROM I_ConsultativeTRR ct INNER JOIN OT_InstanceContext ic ON ct.ObjectID = ic.BizObjectId  WHERE ic.State = '4' AND ct.ProjectId = '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pe.ObjectID,pe.Title,pe.Name,pe.CreatedTime,pe.Department,pe.Applyer " +
            "FROM I_ProjectArchive pe INNER JOIN OT_InstanceContext ic ON pe.ObjectID = ic.BizObjectId WHERE ic.State = '4'  AND pe.ProjectId =  '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pn.ObjectID,pn.Title,pn.Name,pn.CreatedTime,pn.Department,	pn.Applyer FROM " +
            "I_ProjectConclusion pn INNER JOIN OT_InstanceContext ic ON pn.ObjectID = ic.BizObjectId WHERE  ic.State = '4' AND pn.ProjectId =  '" + projectId +
            "' UNION SELECT ic.SequenceNo,ic.BizObjectSchemaCode,pd.ObjectID,pd.Title,pd.Name,pd.CreatedTime,pd.Department,	pd.Applyer " +
            "FROM I_ProjectRevoked pd INNER JOIN OT_InstanceContext ic ON pd.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND pd.ProjectId =  '" + projectId +
            "' UNION SELECT ic.SequenceNo, ic.BizObjectSchemaCode, hh.ObjectID,hh.Title,hh.Name,hh.CreatedTime,hh.Department,hh.Applyer " +
            "FROM I_HTXH hh INNER JOIN OT_InstanceContext ic ON hh.ObjectID = ic.BizObjectId WHERE ic.State = '4' AND hh.ProjectId ='" + projectId + "'";
        System.Data.DataTable projectProcessInfodt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);

        string sql1 = "SELECT ProjectName ,ProjectNum FROM [dbo].[I_ProjectInfo] WHERE ObjectID='" + projectId + "'";
        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql1);
        if (dt.Rows.Count > 0)
        {
            resultDic.Add("ProjectName", dt.Rows[0]["ProjectName"].ToString());
            resultDic.Add("ProjectNum", dt.Rows[0]["ProjectNum"].ToString());
        }

        if (projectProcessInfodt.Rows.Count > 0)
        {
            foreach (DataRow dr in projectProcessInfodt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("SequenceNo", dr["SequenceNo"].ToString());
                dic.Add("SchemaCode", dr["BizObjectSchemaCode"].ToString());
                dic.Add("BizObjectID", dr["ObjectID"].ToString());
                dic.Add("Title", dr["Title"].ToString());
                dic.Add("FormName", dr["Name"].ToString());
                dic.Add("StartDate", dr["CreatedTime"]);
                dic.Add("Department", dr["Department"].ToString());
                dic.Add("Applyer", dr["Applyer"].ToString());
                projectProcessInfoList.Add(dic);
            }
            resultDic.Add("projectProcessInfoList", projectProcessInfoList);
        }

        object JSONObj = JsonConvert.SerializeObject(resultDic);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    //获取项目文档信息
    public void GetArchiveData(HttpContext context)
    {

        String projectId = context.Request["projectId"];

        Dictionary<string, object> resultDic = new Dictionary<string, object>();

        List<Dictionary<string, object>> archiveDatatList = new List<Dictionary<string, object>>();

        //查询项目归档表单信息
        string sql = "SELECT ts.FileName, ts.FileObjectID, ts.BizObjectId, ts.SchemaCode, ts.Modus, ts.Num, ts.Note FROM I_TransferOrders ts " +
        "INNER JOIN I_ProjectArchive pa ON ts.ParentObjectID = pa.ObjectID WHERE pa.ProjectId = '" + projectId +
        "' UNION SELECT ac.FileName,ac.ObjectID AS FileObjectID,ac.BizObjectId,ac.BizObjectSchemaCode AS SchemaCode,ao.Modus,ao.Num,ao.Note " +
        "FROM OT_Attachment ac INNER JOIN I_AddTransferOrders ao ON ac.BizObjectId = ao.ObjectID WHERE ao.ParentObjectID IN ( " +
        "SELECT ObjectID FROM I_ProjectArchive WHERE ProjectId = '" + projectId + "')";
        System.Data.DataTable ProjectArchiveDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (ProjectArchiveDt.Rows.Count > 0)
        {
            foreach (DataRow dr in ProjectArchiveDt.Rows)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("FileName", dr["FileName"].ToString());
                dic.Add("FileObjectID", dr["FileObjectID"].ToString());
                dic.Add("BizObjectId", dr["BizObjectId"].ToString());
                dic.Add("SchemaCode", dr["SchemaCode"].ToString());
                dic.Add("Modus", dr["Modus"].ToString());
                dic.Add("Num", dr["Num"].ToString());
                dic.Add("Note", dr["Note"]);
                archiveDatatList.Add(dic);
            }
            resultDic.Add("ArchiveData", archiveDatatList);
        }

        int versionBack = OThinker.H3.Controllers.AppUtility.Engine.WorkflowManager.GetWorkflowDefaultVersion("FileBorrow");
        resultDic.Add("Version", versionBack);
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