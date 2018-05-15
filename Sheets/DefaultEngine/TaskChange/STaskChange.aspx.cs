﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OThinker.H3.DataModel;
using OThinker.H3.Portal;

namespace OThinker.H3.Portal.Sheets.DefaultEngine
{
    public partial class STaskChange : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
      
        public String AddMembers(String TaskObjectId ) {

        if (string.IsNullOrEmpty(TaskObjectId))
            {
                return "请先选TaskObjectId";
            }
         
          var sql = "SELECT pm.FullName, pm.PersonRole, pm.Department, pm.Profession, " +
                "pm.JobTitle, pm.GNVQ, pm.AppointmentDate, pm.ResidentDate, pm.UserId FROM"+
                "I_ProjectTask pt LEFT JOIN I_ProjectMembers pm ON pt.ObjectID = pm.ParentObjectID" +
                " WHERE pt.Status = '1' AND pt.ObjectID ="+"'"+TaskObjectId+"'";
          
  System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
          
          
          
            return "调用成功"+TaskObjectId;
        }
    }
}