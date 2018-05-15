<%@ WebHandler Language="C#" Class="FileHandler" %>

using System.Web;
using System.Web.Script.Serialization;
using OThinker.H3;
using System.Collections.Generic;
using Newtonsoft.Json;


public class FileHandler : IHttpHandler
{
    JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
    public void ProcessRequest(HttpContext context)
    {

        string command = context.Request["Command"];
        switch (command)
        {
            //集团收文更根据instanceId 查询流程表单内容
            case "GetExternalDocumentById": GetExternalDocumentById(context); break;

            //查询集团收文根据 instanceId 查询子流程中部门和员工回复意见以及附件内容
            case "QueryEDCommontById": QueryEDCommontById(context); break;

            case "QueryDocumentPath": QueryDocumentPath(context); break;

            case "QueryReplyAttach": QueryReplyAttach(context); break;

            case "GetDocumentId": GetDocumentId(context); break;
        }
    }


    public void GetExternalDocumentById(HttpContext context)
    {
        string instanceId = context.Request["InstanceID"];
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "SELECT ed.LWNumbering ,ic.SequenceNo FROM I_ExternalDocument ed INNER JOIN OT_InstanceContext ic ON ed.ObjectID = ic.BizObjectId WHERE ic.ObjectID = '" + instanceId + "'";
        System.Data.DataTable externalDocumentDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (externalDocumentDt.Rows.Count > 0)
        {
            result.Add("RDNo", externalDocumentDt.Rows[0]["LWNumbering"].ToString());
            result.Add("SequenceNo", externalDocumentDt.Rows[0]["SequenceNo"].ToString());
        }
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void QueryEDCommontById(HttpContext context)
    {
        string instanceId = context.Request["InstanceID"];
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "SELECT ed.LWNumbering ,ic.SequenceNo FROM I_ExternalDocument ed INNER JOIN OT_InstanceContext ic ON ed.ObjectID = ic.BizObjectId WHERE ic.ObjectID = '" + instanceId + "'";
        System.Data.DataTable externalDocumentDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (externalDocumentDt.Rows.Count > 0)
        {
            result.Add("RDNo", externalDocumentDt.Rows[0]["LWNumbering"].ToString());
            result.Add("SequenceNo", externalDocumentDt.Rows[0]["SequenceNo"].ToString());
        }
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }

    public void QueryDocumentPath(HttpContext context)
    {
        string bizObjectId = context.Request["BizObjectId"];
        Dictionary<string, object> result = new Dictionary<string, object>();
        string sql = "SELECT TOP 1 ObjectID ,BizObjectId,BizObjectSchemaCode FROM OT_Attachment WHERE BizObjectId='" + bizObjectId + "'";
        System.Data.DataTable DocumentDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
        if (DocumentDt.Rows.Count > 0)
        {
            result.Add("ObjectID", DocumentDt.Rows[0]["ObjectID"].ToString());
            result.Add("BizObjectId", DocumentDt.Rows[0]["BizObjectId"].ToString());
            result.Add("BizObjectSchemaCode", DocumentDt.Rows[0]["BizObjectSchemaCode"].ToString());
        }
        object JSONObj = JsonConvert.SerializeObject(result);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);
    }


    public void GetDocumentId(HttpContext context)
    {
        string objectId = context.Request["ObjectId"];
        System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
        "SELECT ObjectID FROM [dbo].[I_DocumentInfo] WHERE DtObjectId = '" + objectId + "'");
        string documentId = null;
        if (dt2.Rows.Count > 0)
        {
            documentId = dt2.Rows[0]["ObjectID"].ToString();
        }

        object JSONObj = JsonConvert.SerializeObject(documentId);
        context.Response.ContentType = "application/json";
        context.Response.Write(JSONObj);

    }

    public void QueryReplyAttach(HttpContext context)
    {
        string objectId = context.Request["BizObjectId"];

        List<Dictionary<string, object>> resultList = new List<Dictionary<string, object>>();

        //查询子流程员工回复附件
        string commomSql = " SELECT am.ObjectID,am.BizObjectId,am.FileName,ou.Name as OUName,ur.Name FROM OT_Attachment am " +
            " INNER JOIN OT_User ur ON am.CreatedBy = ur.ObjectID " +
            "INNER JOIN OT_OrganizationUnit ou ON ur.ParentID = ou.ObjectID WHERE BizObjectId IN " +
            "(SELECT BizObjectId FROM OT_InstanceContext ic WHERE ParentInstanceID = " +
            "(SELECT ObjectID FROM OT_InstanceContext WHERE BizObjectId = '" + objectId + "')) " +
            "AND DataField = 'ReplyAttach' ORDER BY ou.Name";

        System.Data.DataTable ReplyAttachDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(commomSql);
        if (ReplyAttachDt.Rows.Count > 0)
        {
            for (int i = 0; i < ReplyAttachDt.Rows.Count; i++)
            {
                Dictionary<string, object> result = new Dictionary<string, object>();
                result.Add("FullName", ReplyAttachDt.Rows[i]["Name"].ToString());
                result.Add("AttachName", ReplyAttachDt.Rows[i]["FileName"].ToString());
                string filepath = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=ExternalDocumentChild&BizObjectID="
                        + ReplyAttachDt.Rows[i]["BizObjectId"].ToString() + "&AttachmentID="
                        + ReplyAttachDt.Rows[i]["ObjectID"].ToString() + "&OpenMethod=0";
                result.Add("FilePath", filepath);
                resultList.Add(result);
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