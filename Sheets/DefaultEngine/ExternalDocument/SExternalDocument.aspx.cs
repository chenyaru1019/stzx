using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace OThinker.H3.Portal.Sheets.DefaultEngine
{
    public partial class SExternalDocument : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public override MvcViewContext LoadDataFields()
        {

            if (!this.ActionContext.IsOriginateMode)
            {
               String objectId = (String)ActionContext.BizObject.GetValue("ObjectID");
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
                    BizObject[] bizObjects = new BizObject[ReplyAttachDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ReplyAttach").ChildSchema;
                    for (int i = 0; i < ReplyAttachDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["FullName"] = ReplyAttachDt.Rows[i]["Name"].ToString() + "(" + ReplyAttachDt.Rows[i]["OUName"].ToString() + ")";
                        bizObjects[i]["AttachName"] = ReplyAttachDt.Rows[i]["FileName"].ToString();
                        string filepath = "/Portal/ReadAttachment/Read?BizObjectSchemaCode=ExternalDocumentChild&BizObjectID=" + ReplyAttachDt.Rows[i]["BizObjectId"].ToString() + "&AttachmentID=" + ReplyAttachDt.Rows[i]["ObjectID"].ToString() + "&OpenMethod=0";
                        bizObjects[i]["FilePath"] = filepath;
                    }
                    this.ActionContext.InstanceData["ReplyAttach"].Value = bizObjects;

                }
                //查询子流程部门领导意见
                string departSuggessSql = "  SELECT OUName,UserName,Text,DataField FROM OT_Comment WHERE InstanceId IN " +
                    " (SELECT ObjectID AS InstanceId FROM OT_InstanceContext ic WHERE ParentInstanceID =" +
                    " (SELECT ObjectID FROM OT_InstanceContext WHERE BizObjectId = '" + objectId + "'))" +
                    "  AND DataField = 'DepartSuggess'ORDER BY DataField";
                System.Data.DataTable departSuggessDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(departSuggessSql);

                if (departSuggessDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[departSuggessDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("DepartmentSuggess").ChildSchema;
                    for (int i = 0; i < departSuggessDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["FullName"] = departSuggessDt.Rows[i]["UserName"].ToString() + "(" + departSuggessDt.Rows[i]["OUName"].ToString() + ")";
                        bizObjects[i]["Suggess"] = departSuggessDt.Rows[i]["Text"].ToString();
                    }
                    this.ActionContext.InstanceData["DepartmentSuggess"].Value = bizObjects;

                }

                //查询子流程部门员工意见
                string staffCommentsSql = "  SELECT OUName,UserName,Text,DataField FROM OT_Comment WHERE InstanceId IN " +
                    " (SELECT ObjectID AS InstanceId FROM OT_InstanceContext ic WHERE ParentInstanceID =" +
                    " (SELECT ObjectID FROM OT_InstanceContext WHERE BizObjectId = '" + objectId + "'))" +
                    "  AND DataField = 'ygyj'ORDER BY DataField";
                System.Data.DataTable staffCommentsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(staffCommentsSql);

                if (staffCommentsDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[staffCommentsDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("StaffComments").ChildSchema;
                    for (int i = 0; i < staffCommentsDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["FullName"] = staffCommentsDt.Rows[i]["UserName"].ToString() + "(" + staffCommentsDt.Rows[i]["OUName"].ToString() + ")";
                        bizObjects[i]["Suggess"] = staffCommentsDt.Rows[i]["Text"].ToString();
                    }
                    this.ActionContext.InstanceData["StaffComments"].Value = bizObjects;

                }
            }

            return base.LoadDataFields();

        }
    }
}
