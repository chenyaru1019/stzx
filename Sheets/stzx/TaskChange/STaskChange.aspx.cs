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
    public partial class STaskChange : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void SaveDataFields(MvcPostValue MvcPost, MvcResult result)
        {
            if (this.ActionContext.ActivityCode == "submit")
            {
                if (MvcPost.Command == "Submit")
                {
                    string projectNum = (string)ActionContext.BizObject.GetValue("ProjectNum");
                    string taskId = (string)ActionContext.BizObject.GetValue("ProjectTaskId");
                    //获取负责部门 id
                    string RDepartment = (string)ActionContext.BizObject.GetValue("RDepartment");
                    //参与部门 id
                    string[] JDepartment = (string[])ActionContext.BizObject.GetValue("JDepartment");
                    //获取部门主管
                    string RDManageId = OThinker.H3.Controllers.AppUtility.Engine.Organization.GetOUManager(RDepartment);
                    List<string> JDManage = OThinker.H3.Controllers.AppUtility.Engine.Organization.GetOUManagers(JDepartment);

                    System.Data.DataTable deleteDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("DELETE  FROM ProjectDepart WHERE ProjectId='" + projectNum + "'");

                    OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("INSERT INTO ProjectDepart(ProjectNum,ProjectTaskId" +
                            " ,DepartManager) VALUES( '" + projectNum + "','" + taskId + "','" + RDManageId + "')");

                    for (int i = 0; i < JDManage.Count; i++)
                    {
                        var manageId = JDManage[i];
                        OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("INSERT INTO ProjectDepart(ProjectNum,ProjectTaskId" +
                            ", DepartManager) VALUES( '" + projectNum + "','" + taskId + "','" + manageId + "')");

                    }
                }
            }
            //保存后执行操作，
            base.SaveDataFields(MvcPost, result);

        }

    }
}
