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
    public partial class SProjectCarRental : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public override void SaveDataFields(MvcPostValue MvcPost, MvcResult result)
        {
          
            // 保存后，后台执行事件
            base.SaveDataFields(MvcPost, result);
        }
    }
}
