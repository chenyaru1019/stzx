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
    public partial class SDocumentRecovery : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public System.Data.DataRowCollection GetDocumentSigned(String gwid)

        {
            System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "SELECT ObjectID  FROM  I_DocumentCirculation where DtObjectId =" + "'" + gwid + "'");
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
                       "WHERE  wf.DisplayName = '传阅' AND  wf.InstanceId = " + "'" + instanceid + "'");
               
                    if (dt3.Rows.Count > 0)
                    {

                        return dt3.Rows;

                    }
                }

                
            }
            return null;
        }
      
        public System.Data.DataRowCollection GetDocumentNotSigned(String gwid)

        {
            System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "SELECT ObjectID  FROM  I_DocumentCirculation where DtObjectId =" + "'" + gwid + "'");
            if (dt1.Rows.Count > 0)
            {
                var objectid = dt1.Rows[0]["ObjectID"].ToString();
                System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "SELECT ObjectID FROM OT_InstanceContext where BizObjectId =" + "'" + objectid + "'");
                if (dt2.Rows.Count > 0)
                {
                    var instanceid = dt2.Rows[0]["ObjectID"].ToString();
                         //未阅
                        System.Data.DataTable dt4 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
                       "SELECT wi.ParticipantName as Receiver,ou.Name as Department FROM OT_WorkItem wi " +
                       "LEFT JOIN OT_OrganizationUnit ou ON wi.OrgUnit = ou.ObjectID " +
                       "where DisplayName = '传阅' and InstanceId = " + "'" + instanceid + "'");
                        if (dt4.Rows.Count > 0)
                        {

                         return dt4.Rows;
                
                        }

                }

                
            }
            return null;
        }
    }
}
