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
    public partial class SExpertInfo : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
          public override MvcViewContext LoadDataFields()
        {
            if (!this.ActionContext.IsOriginateMode)
            {
                String id = (String)ActionContext.BizObject.GetValue("ObjectID");
                System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "SELECT er.Zjgzlx,er.Xmmc,er.Gzmc,zp.kssj,zp.Jssj,zp.Gznr,zp.Pj FROM I_EvaluationResult er " +
               "LEFT JOIN I_ZYjpj zp ON er.ObjectID = zp.ParentObjectID WHERE zp.ExpertId = " + "'" + id + "'");
                if (dt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[dt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("WorkEvaluation").ChildSchema;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["Zjgzlx"] = dt.Rows[i]["Zjgzlx"].ToString();
                        bizObjects[i]["Xmmc"] = dt.Rows[i]["Xmmc"].ToString();
                        bizObjects[i]["Gzmc"] = dt.Rows[i]["Gzmc"].ToString();
                        bizObjects[i]["kssj"] = dt.Rows[i]["kssj"].ToString();
                        bizObjects[i]["Jssj"] = dt.Rows[i]["Jssj"].ToString();
                        bizObjects[i]["Gznr"] = dt.Rows[i]["Gznr"].ToString();
                        bizObjects[i]["Yjpj"] = dt.Rows[i]["Pj"].ToString();
                    }
                    this.ActionContext.InstanceData["WorkEvaluation"].Value = bizObjects;

                    this.ActionContext.InstanceData.Submit();


                }


            }
            return base.LoadDataFields();

        }
    }
}
