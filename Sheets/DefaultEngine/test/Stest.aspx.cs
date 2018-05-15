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
    public partial class Stest : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
             //this.ActionContext.ActivityCode;    // 当前活动节点
            //this.ActionContext.BizObject;       // 当前数据模型对象
            //this.ActionContext.Engine;          // 引擎接口
            //this.ActionContext.IsOriginateMode; // 是否发起模式
            //this.ActionContext.IsWorkMode;      // 是否工作模式
            //this.ActionContext.SchemaCode;      // 当前数据模型编码
            //this.ActionContext.User;            // 当前用户对象
        }
           
      
      
     
      
             public override MvcViewContext LoadDataFields()
          {
            // 注意：这只是赋值，会显示到前端，但是如果前端的值不做变化，是不会存储到后台的
            //this.ActionContext.InstanceData["mvcMobile"].Value = "系统赋值";
            /*
             * 子表设置初始化值，注：子表默认会有一行空数据，并且未填数据时，不会保存
             */
         
                 return base.LoadDataFields();
            
             } 
       
      
       

    }
}
