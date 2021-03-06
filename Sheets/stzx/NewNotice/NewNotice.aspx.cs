﻿using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OThinker.H3.Portal.Sheets.stzx
{
    public partial class NewNotice : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public override MvcViewContext LoadDataFields()
        {
            String newid = (String)ActionContext.BizObject.GetValue("ObjectID");
            String userid = (String)ActionContext.BizObject.GetValue("OwnerId");
            System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "SELECT * FROM BrowseTimes WHERE UserId=" + "'" + userid + "'AND ArticleId = " + "'" + newid + "'");
            if (dt.Rows.Count > 0)
            {
                //存在，则访问过，不操作
            }
            else
            {
                //不存在，第一次浏览，增加到数据库
                var browsetime = DateTime.Now.ToString();
                String type = "notice";
                System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
               "INSERT INTO BrowseTimes(UserId, ArticleId, BrowseTime, Type)VALUES" +
               "( " + "'" + userid + "','" + newid + "','" + browsetime + "','" + type + "'" + ")");
            }

            //查询浏览次数
            System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(
            "SELECT COUNT(id) as count FROM[dbo].[BrowseTimes] WHERE ArticleId = " + "'" + newid + "'");
            this.ActionContext.InstanceData["Hits"].Value = dt2.Rows[0]["count"].ToString();
            
            this.ActionContext.InstanceData.Submit();
            return base.LoadDataFields();
        }

    }
}
