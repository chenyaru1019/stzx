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
    public partial class SProjectConclusion : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
         public override MvcViewContext LoadDataFields()
        {
           
           if (this.ActionContext.IsOriginateMode)
            {
           
             //初始化预算信息
                var bos = (BizObject[])ActionContext.BizObject.GetValue("WorkPlan");
                if (bos!=null)
                {
                    //已存在不再初始化
                }
                else{
                    //不存在，初始化子表                 
                        System.Data.DataTable projectConclusionDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content FROM BudgetInfo where BudgetType='Conclusion'");
                     if (projectConclusionDt.Rows.Count > 0)
                         {
                            BizObject[] bizObjects = new BizObject[projectConclusionDt.Rows.Count];
                            BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("WorkPlan").ChildSchema;
                            for (int i = 0; i < projectConclusionDt.Rows.Count; i++)
                            {
                                bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                                bizObjects[i]["WorkName"] = projectConclusionDt.Rows[i]["Content"].ToString();
                 
                            }
                            this.ActionContext.InstanceData["WorkPlan"].Value = bizObjects;

                    }
                    }
             
             
            }
           
           return base.LoadDataFields();
         }

    }
}
