using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OThinker.H3.Portal.Sheets.DefaultEngine
{
    public partial class SLoanApply : OThinker.H3.WorkSheet.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
       public override void SaveDataFields(WorkSheet.MvcPostValue MvcPostValue, WorkSheet.MvcResult MvcResult)
        {
            base.SaveDataFields(MvcPostValue, MvcResult);
            if (this.ActionContext.ActivityCode == "Activity2")
            {
                //设置主题为InstanceName
                string zhuti = this.ActionContext.InstanceData["zhuti"].Value.ToString();
                this.ActionContext.Engine.InstanceManager.SetInstanceName(this.ActionContext.InstanceId, zhuti);
            }

        }
    }
}
