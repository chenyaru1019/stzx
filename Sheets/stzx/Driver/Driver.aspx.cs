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
    public partial class Driver : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
      
        public override MvcViewContext LoadDataFields()
          {
                   if (!this.ActionContext.IsOriginateMode)
             {
           
                     String DriverName = (String)ActionContext.BizObject.GetValue("DriverName");
                     if(DriverName!=""){
                       
                        String sql ="SELECT AVG (Score) as score  FROM I_Evaluation WHERE Driver ="+ "'" + DriverName+"'";
                        System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql );  
                       
                       var i = dt.Rows[0]["score"].ToString();
                     }
                    
          
          
               }
           return base.LoadDataFields();
          }
      
      
    }
}
