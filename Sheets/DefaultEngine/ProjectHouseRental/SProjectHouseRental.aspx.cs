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
    public partial class SProjectHouseRental : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
       public override MvcViewContext LoadDataFields()          
          {
        
             String sql = "SELECT * FROM I_ProjectHouseRental ph LEFT JOIN I_ApplyerHouseInfo hi ON ph.ObjectID = hi.ParentObjectID  WHERE ph.Status='1'";
         
               System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
           if(dt.Rows.Count>0){
            
             BizObject[] bizObjects = new BizObject[dt.Rows.Count];
             BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ProjectHouseInfo").ChildSchema;
                 for (int i = 0; i < dt.Rows.Count; i++)
                {
                   bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                   bizObjects[i]["Place"] = dt.Rows[i]["Place"].ToString();
                   bizObjects[i]["Personnel"] = dt.Rows[i]["Accommodation"].ToString();
                   bizObjects[i]["Type"] = dt.Rows[i]["Type"].ToString();
            
                 }
                    this.ActionContext.InstanceData["ProjectHouseInfo"].Value = bizObjects;

                   //this.ActionContext.InstanceData.Submit();
            
              }
         
         
          return base.LoadDataFields();
         
          }
    }
}
