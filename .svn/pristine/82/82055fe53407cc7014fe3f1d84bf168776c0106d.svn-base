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
    public partial class SProjectTask : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
      
           public override void SaveDataFields(MvcPostValue MvcPost, MvcResult result)
           {
                if (MvcPost.Command == "Submit") {       
                
                base.SaveDataFields(MvcPost, result);
                BizObject[] list = this.ActionContext.InstanceData["ProjectMembers"].Value as BizObject[];
                if (list!=null || !"".Equals(list)){

                      for (int i = 0; i < list.Length; i++)
                    {
                        String UserId = list[i].GetValue("UserId");
                        String Name = list[i].GetValue("FullName");
                        String PersonRole = list[i].GetValue("PersonRole");
                        String Department = list[i].GetValue("Department");
                        String Profession = list[i].GetValue("Profession");
                        String JobTitle = list[i].GetValue("JobTitle");
                        String GNVQ = list[i].GetValue("GNVQ");
                        String AppointmentDate = list[i].GetValue("AppointmentDate");
                        String ResidentDate = list[i].GetValue("ResidentDate");
                    }
                }
               // var i = list.Length();

            }
            }
    }
}
