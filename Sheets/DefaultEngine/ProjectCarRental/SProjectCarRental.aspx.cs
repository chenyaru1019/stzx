﻿using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OThinker.H3.Portal.Sheets.DefaultEngine
{
    public partial class SProjectCarRental : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
         {
          
         }
      
      
        public System.Data.DataRowCollection GetCarRental(String projectId)
        {
            String sql = "SELECT * FROM I_ProjectCarRental pc LEFT JOIN I_ApplyerCarInfo ac ON pc.ObjectID = ac.ParentObjectID " +
                "WHERE pc.Status = '1' AND pc.ProjectId =" + "'" + projectId + "'";

            System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
            if (dt.Rows.Count > 0)
            {


                return dt.Rows;

            }
            return null;
        }
    }
}