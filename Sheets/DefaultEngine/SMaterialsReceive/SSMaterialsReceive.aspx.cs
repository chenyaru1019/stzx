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
    public partial class SSMaterialsReceive : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
         public System.Data.DataRowCollection GetSpecialMaterials(String smid)
        {
            String sql = "SELECT sd.Type, sd.MaterialName, sd.Model, sd.Note, sd.Num, sd.Price, sd.Cost FROM I_SpecialMaterials sm " +
                "LEFT JOIN I_SpMaterialDetails sd ON sm.ObjectID = sd.ParentObjectID " +
                "WHERE sm.Status = '2' AND sm.ObjectID = " + "'" + smid + "'";

            System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows;
            }
            return null;
        }


        public override void Submit(MvcPostValue MvcPostValue, MvcResult MvcResult)
        {
            if (this.ActionContext.ActivityCode == "submit")
            {
                var smid = ActionContext.BizObject.GetValue("SMId");
                String sql = "SELECT sd.Type, sd.MaterialName, sd.Model, sd.Note, sd.Num, sd.Price, sd.Cost FROM I_SpecialMaterials sm " +
               "LEFT JOIN I_SpMaterialDetails sd ON sm.ObjectID = sd.ParentObjectID " +
               "WHERE  sm.ObjectID = " + "'" + smid + "'";
                System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        var name = dt.Rows[i]["MaterialName"].ToString();
                        var model = dt.Rows[i]["Model"].ToString();
                        var num = dt.Rows[i]["Num"].ToString();
                            //库存减去领用数量
                            System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("UPDATE I_Consumables  " +
                                "SET Num =Num" + "-'" + num + "'" + " WHERE Model=" + "'" + model + "'" + "AND SName=" + "'" + name + "'");
                                   
                    }
                }
            }
            base.Submit(MvcPostValue, MvcResult);
        }

    }
}
