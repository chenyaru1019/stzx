using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace OThinker.H3.Portal.Sheets.stzx
{
    public partial class SProjectAssessment : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        public override MvcViewContext LoadDataFields()
        {
            if (!this.ActionContext.IsOriginateMode) {
                String zb = null;
                if (this.ActionContext.ActivityCode == "xmb")
                {
                    //初始化预算信息
                    var bos = (BizObject[])ActionContext.BizObject.GetValue("ProjectDepartment");
                    if (bos == null)
                    {
                        //已存在不再初始化
                        zb = "ProjectDepartment";
                    }
                }

                if (this.ActionContext.ActivityCode == "scb")
                {
                    //初始化预算信息
                    var bos = (BizObject[])ActionContext.BizObject.GetValue("MarketingDepartment");
                    if (bos == null)
                    {
                        zb = "MarketingDepartment";
                    }
                }

                if (this.ActionContext.ActivityCode == "zhb")
                {
                    //初始化预算信息
                    var bos = (BizObject[])ActionContext.BizObject.GetValue("IntegratedOffice");
                    if (bos == null)
                    {
                        zb = "IntegratedOffice";
                    }
                }

                if (zb != null)
                {
                    System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" " +
                    "SELECT ProjectName,TaskNum FROM I_ProjectInfo where Status='1'");
                    BizObject[] bizObjects = new BizObject[dt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty(zb).ChildSchema;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["ProjectName"] = dt.Rows[i]["ProjectName"].ToString();
                        bizObjects[i]["TaskNum"] = dt.Rows[i]["TaskNum"].ToString();
                    }
                    this.ActionContext.InstanceData[zb].Value = bizObjects;
                }

            }          
            return base.LoadDataFields();
        }
}
}
