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
    public partial class SFixedAsset : OThinker.H3.Controllers.MvcPage
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
               "SELECT * FROM I_ChangeLogs  where FAObject = " + "'" + id+"'" );                                    
                   if(dt.Rows.Count>0){
                   
                     BizObject[] bizObjects = new BizObject[dt.Rows.Count];
                BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("AssetsChanges").ChildSchema;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                   bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                   bizObjects[i]["ChangeDate"] = dt.Rows[i]["ChangeDate"].ToString();
                   bizObjects[i]["BDepartment"] = dt.Rows[i]["BDepart"].ToString();
                   bizObjects[i]["BUserName"] = dt.Rows[i]["BUserName"].ToString();
                   bizObjects[i]["ADepartment"] = dt.Rows[i]["ADepart"].ToString();
                   bizObjects[i]["AUserName"] = dt.Rows[i]["AUserName"].ToString();
                   bizObjects[i]["Resson"] = dt.Rows[i]["Reason"].ToString();
                }
                this.ActionContext.InstanceData["AssetsChanges"].Value = bizObjects;

                this.ActionContext.InstanceData.Submit();
                   
                   
                   }
                  
              
                 }
                 return base.LoadDataFields();
            
             } 
       
    
    }
}
