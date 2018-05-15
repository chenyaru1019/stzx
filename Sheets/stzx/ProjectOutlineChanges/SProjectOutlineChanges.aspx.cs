using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OThinker.H3.Portal.Sheets.stzx
{
    public partial class SProjectOutlineChanges : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public override void SaveDataFields(MvcPostValue MvcPost, MvcResult result)
        {
            if (this.ActionContext.ActivityCode == "Activity9")
            {
                if (MvcPost.Command == "Submit")
                {
                    var projectNum = ActionContext.BizObject.GetValue("ProjectNum");

                    var projectId = ActionContext.BizObject.GetValue("ProjectId");

                    var projectMember = (BizObject[])ActionContext.BizObject.GetValue("ProjectChangeMember");

                    if (projectMember != null)
                    {

                        System.Data.DataTable deleteDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("DELETE  FROM ProjectMember WHERE ProjectId='" + projectId + "'");

                        for (int i = 0; i < projectMember.Length; i++)
                        {
                            var fullName = projectMember[i]["FullName"].ToString();
                            var userRole = projectMember[i]["UserRole"].ToString();
                            var department = projectMember[i]["Department"].ToString();
                            var profession = projectMember[i]["Profession"].ToString();
                            var jobTitle = projectMember[i]["JobTitle"].ToString();
                            var qualification = projectMember[i]["Qualification"].ToString();
                            var userId = projectMember[i]["UserId"].ToString();
                            System.Data.DataTable resultDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("INSERT INTO ProjectMember(ProjectNum," +
                                " ProjectId, FullName, UserRole, Department, Profession, JobTitle, Qualification, UserId)" +
                                "VALUES( '" + projectNum + "','" + projectId + "','" + fullName + "','" + userRole + "','" +
                                department + "','" + profession + "','" + jobTitle + "','" + qualification + "','" + userId + "')");


                        }

                    }

                }

            }



            //保存后执行操作，
            base.SaveDataFields(MvcPost, result);


        }

    }

}

