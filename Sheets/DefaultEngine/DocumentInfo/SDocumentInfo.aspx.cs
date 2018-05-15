using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OThinker.H3.Portal.Sheets.DefaultEngine
{
    public partial class SDocumentInfo : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        public override MvcViewContext LoadDataFields()
        {

            if (!this.ActionContext.IsOriginateMode)
            {

                String id = (String)ActionContext.BizObject.GetValue("ObjectID");
                System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                "SELECT ObjectID  FROM  I_DocumentCirculation where DtObjectId =" + "'" + id + "'");
                if (dt1.Rows.Count > 0)
                {
                    var objectid = dt1.Rows[0]["ObjectID"].ToString();
                    System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                "SELECT ObjectID FROM OT_InstanceContext where BizObjectId =" + "'" + objectid + "'");
                    if (dt2.Rows.Count > 0)
                    {
                        var instanceid = dt2.Rows[0]["ObjectID"].ToString();
                        //已阅
                        System.Data.DataTable dt3 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                           "SELECT ou.Name as Department, wf.FinisherName as Receiver , wf.FinishTime as ReceiptDate  FROM OT_WorkItemFinished wf " +
                           "LEFT JOIN OT_OrganizationUnit ou ON wf.OrgUnit = ou.ObjectID " +
                           "WHERE  wf.ActivityCode = 'gwcy' AND  wf.InstanceId = " + "'" + instanceid + "'");
                        if (dt3.Rows.Count > 0)
                        {
                            BizObject[] bizObjects = new BizObject[dt3.Rows.Count];
                            BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("DistributionInfo").ChildSchema;
                            for (int i = 0; i < dt3.Rows.Count; i++)
                            {
                                bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                                bizObjects[i]["Department"] = dt3.Rows[i]["Department"].ToString();
                                bizObjects[i]["Receiver"] = dt3.Rows[i]["Receiver"].ToString();
                                bizObjects[i]["ReceiptDate"] = dt3.Rows[i]["ReceiptDate"].ToString();
                                bizObjects[i]["Status"] = "已签收";
                            }
                            this.ActionContext.InstanceData["DistributionInfo"].Value = bizObjects;

                        }
                        //未阅
                        System.Data.DataTable dt4 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                       "SELECT wi.ParticipantName as Receiver,ou.Name as Department FROM OT_WorkItem wi " +
                       "LEFT JOIN OT_OrganizationUnit ou ON wi.OrgUnit = ou.ObjectID " +
                       "where ActivityCode = 'gwcy' and InstanceId = " + "'" + instanceid + "'");
                        if (dt4.Rows.Count > 0)
                        {

                            BizObject[] bizObjects1 = new BizObject[dt4.Rows.Count];
                            BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("WQS").ChildSchema;
                            for (int i = 0; i < dt4.Rows.Count; i++)
                            {
                                bizObjects1[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                                bizObjects1[i]["Department"] = dt4.Rows[i]["Department"].ToString();
                                bizObjects1[i]["Receiver"] = dt4.Rows[i]["Receiver"].ToString();
                                bizObjects1[i]["Status"] = "未签收";

                            }
                            this.ActionContext.InstanceData["WQS"].Value = bizObjects1;


                        }



                    }
                }
                //公文回收情况
                //1已签收公文回收情况
                System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
              "SELECT ObjectID  FROM  I_DocumentVoid where GWId =" + "'" + id + "'");
                if (dt.Rows.Count > 0)
                {
                    var objectid = dt.Rows[0]["ObjectID"].ToString();
                    System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                "SELECT ObjectID FROM OT_InstanceContext where BizObjectId =" + "'" + objectid + "'");
                    if (dt2.Rows.Count > 0)
                    {
                        var instanceid = dt2.Rows[0]["ObjectID"].ToString();
                        //已确认作废
                        System.Data.DataTable dt3 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                           "SELECT ou.Name as Department, wf.FinisherName as Receiver , wf.FinishTime as ReceiptDate  FROM OT_WorkItemFinished wf " +
                           "LEFT JOIN OT_OrganizationUnit ou ON wf.OrgUnit = ou.ObjectID " +
                           "WHERE  wf.ActivityCode = 'qrzf' AND  wf.InstanceId = " + "'" + instanceid + "'");
                        if (dt3.Rows.Count > 0)
                        {
                            BizObject[] bizObjects = new BizObject[dt3.Rows.Count];
                            BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("RecyclingInfo").ChildSchema;
                            for (int i = 0; i < dt3.Rows.Count; i++)
                            {
                                bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                                bizObjects[i]["Department"] = dt3.Rows[i]["Department"].ToString();
                                bizObjects[i]["Receiver"] = dt3.Rows[i]["Receiver"].ToString();
                                bizObjects[i]["ReceiptDate"] = dt3.Rows[i]["ReceiptDate"].ToString();
                                bizObjects[i]["RecyclingStatus"] = "已确认";
                            }
                            this.ActionContext.InstanceData["RecyclingInfo"].Value = bizObjects;

                        }
                        //2公文未签收，回收情况
                        System.Data.DataTable dt4 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                                  "SELECT wi.ParticipantName as Receiver,ou.Name as Department FROM OT_WorkItem wi " +
                                  "LEFT JOIN OT_OrganizationUnit ou ON wi.OrgUnit = ou.ObjectID " +
                                  "where ActivityCode = 'qrzf' and InstanceId = " + "'" + instanceid + "'");
                        if (dt4.Rows.Count > 0)
                        {

                            BizObject[] bizObjects1 = new BizObject[dt4.Rows.Count];
                            BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("RecyclingNotSignInfo").ChildSchema;
                            for (int i = 0; i < dt4.Rows.Count; i++)
                            {
                                bizObjects1[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                                bizObjects1[i]["Department"] = dt4.Rows[i]["Department"].ToString();
                                bizObjects1[i]["Receiver"] = dt4.Rows[i]["Receiver"].ToString();
                                bizObjects1[i]["RecyclingStatus"] = "未确认";

                            }
                            this.ActionContext.InstanceData["RecyclingNotSignInfo"].Value = bizObjects1;


                        }

                    }
                }
                this.ActionContext.InstanceData.Submit();

               
            }
           return base.LoadDataFields();


        }
    }
}
