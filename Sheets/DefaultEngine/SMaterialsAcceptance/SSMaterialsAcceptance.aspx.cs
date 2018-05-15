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
    public partial class SSMaterialsAcceptance : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
       public System.Data.DataRowCollection GetSpecialMaterials(String smid)
        {
            String sql = "SELECT sd.Type, sd.MaterialName, sd.Model, sd.Note, sd.Num, sd.Price, sd.Cost FROM I_SpecialMaterials sm " +
                "LEFT JOIN I_SpMaterialDetails sd ON sm.ObjectID = sd.ParentObjectID " +
                "WHERE sm.Status = '1' AND sm.ObjectID = " + "'" + smid + "'";

            System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows;
            }
            return null;
        }


           public override void Submit(MvcPostValue MvcPostValue, MvcResult MvcResult)
        {
            if (this.ActionContext.ActivityCode == "submit") {
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
                        System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT * FROM I_Consumables  WHERE" +
                            " Model=" + "'" + model + "'" + " AND SName=" + "'" + name + "'");
                        if (dt1.Rows.Count > 0)
                        {
                            //存在则数量相加
                            System.Data.DataTable dt2 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("UPDATE I_Consumables  " +
                                "SET Num =Num" + "+'" + num + "'" + " WHERE Model=" + "'" + model + "'" + "AND SName=" + "'" + name + "'");
                        }
                        else {
                            //不存在，添加到易耗品库
                           var id =  DateTime.Now.ToString("yyyyMMddHHmmssfff");

                            var price = dt.Rows[i]["Price"].ToString();
                            var cost = dt.Rows[i]["Cost"].ToString();
                            var type = dt.Rows[i]["Type"].ToString(); 
                            var note = dt.Rows[i]["Note"].ToString();

                            System.Data.DataTable dt3 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("INSERT INTO I_Consumables " +
                                "( ObjectID,Type,SName,Model,Note,Price,Num)" +
                                "VALUES" +
                                "( " + "'" + id + "','" + type + "','" + name + "','" + model + "','" + note + "','" + price + "','" + num + "'"+")");

                        }


                    }
                }
            }
                base.Submit(MvcPostValue, MvcResult);
        }
    }
}
