using OThinker.H3.Controllers;
using OThinker.H3.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;


namespace OThinker.H3.Portal.Sheets.stzx
{
    public partial class SProjectInfo : OThinker.H3.Controllers.MvcPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public override MvcViewContext LoadDataFields()
        {

            if (!this.ActionContext.IsOriginateMode)
            {
                String projectId = (String)ActionContext.BizObject.GetValue("ObjectID");

                System.Data.DataTable projectMemberDt = null;  //项目人员
                System.Data.DataTable projectExpertDt = null; //专家人员
                System.Data.DataTable paymentPlanDt = null;  //项目Payment plan
                System.Data.DataTable ProjectProgressDt = null; //项目形象进度计划

                //项目任务书变更信息
                System.Data.DataTable projectTaskChangeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" " +
                    "SELECT TOP 1 ProjectName,Outside,EntrustedUnit,TechnicalValidation,TaskBasis,Content,ServiceCycle,ServiceResults," +
                    "ContractAmount,xmfzrname,fzbmname,cjbmname,fgldname " +
                    "FROM I_TaskChange WHERE Status='1' AND ProjectId= " + "'" + projectId + "' ORDER BY CreatedTime DESC");
                if (projectTaskChangeDt.Rows.Count>0) {
                    //存在任务变更更新数据刷新缓存
                    this.ActionContext.InstanceData["ProjectName"].Value = projectTaskChangeDt.Rows[0]["ProjectName"].ToString();
                    this.ActionContext.InstanceData["Outside"].Value = projectTaskChangeDt.Rows[0]["Outside"].ToString();
                    this.ActionContext.InstanceData["EntrustedUnit"].Value = projectTaskChangeDt.Rows[0]["EntrustedUnit"].ToString();
                    this.ActionContext.InstanceData["TaskBasis"].Value = projectTaskChangeDt.Rows[0]["TaskBasis"].ToString();
                    this.ActionContext.InstanceData["Content"].Value = projectTaskChangeDt.Rows[0]["Content"].ToString();
                    this.ActionContext.InstanceData["ServiceCycle"].Value = projectTaskChangeDt.Rows[0]["ServiceCycle"].ToString();
                    this.ActionContext.InstanceData["ServiceResults"].Value = projectTaskChangeDt.Rows[0]["ServiceResults"].ToString();
                    this.ActionContext.InstanceData["ContractAmount"].Value = projectTaskChangeDt.Rows[0]["ContractAmount"];
                    this.ActionContext.InstanceData["xmfzr"].Value = projectTaskChangeDt.Rows[0]["xmfzrname"].ToString();
                    this.ActionContext.InstanceData["fzbm"].Value = projectTaskChangeDt.Rows[0]["fzbmname"].ToString();
                    this.ActionContext.InstanceData["cybm"].Value = projectTaskChangeDt.Rows[0]["cjbmname"].ToString();
                    this.ActionContext.InstanceData["fgld"].Value = projectTaskChangeDt.Rows[0]["fgldname"].ToString();
                    this.ActionContext.InstanceData["TechnicalValidation"].Value = projectTaskChangeDt.Rows[0]["TechnicalValidation"].ToString();
                }

                //初始化预算信息
        
                //人工成本
                var LaborCost = (BizObject[])ActionContext.BizObject.GetValue("LaborCost");
                if (LaborCost == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable LaborCostDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='LaborCost'");
                    if (LaborCostDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[LaborCostDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("LaborCost").ChildSchema;
                        for (int i = 0; i < LaborCostDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = LaborCostDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = LaborCostDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["LaborCost"].Value = bizObjects;

                    }
                }


                //差旅费
                var TravelExpenses = (BizObject[])ActionContext.BizObject.GetValue("TravelExpenses");
                if (TravelExpenses == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable TravelExpensesDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='TravelExpenses'");
                    if (TravelExpensesDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[TravelExpensesDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("TravelExpenses").ChildSchema;
                        for (int i = 0; i < TravelExpensesDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = TravelExpensesDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = TravelExpensesDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["TravelExpenses"].Value = bizObjects;

                    }
                }


                //办公费
                var OfficeExpenses = (BizObject[])ActionContext.BizObject.GetValue("OfficeExpenses");
                if (OfficeExpenses == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable OfficeExpensesDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='OfficeExpenses'");
                    if (OfficeExpensesDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[OfficeExpensesDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("OfficeExpenses").ChildSchema;
                        for (int i = 0; i < OfficeExpensesDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = OfficeExpensesDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = OfficeExpensesDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["OfficeExpenses"].Value = bizObjects;

                    }
                }

                //房屋租赁和物业费
                var RentPropertyFee = (BizObject[])ActionContext.BizObject.GetValue("RentPropertyFee");
                if (RentPropertyFee == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable RentPropertyFeeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='RentPropertyFee'");
                    if (RentPropertyFeeDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[RentPropertyFeeDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("RentPropertyFee").ChildSchema;
                        for (int i = 0; i < RentPropertyFeeDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = RentPropertyFeeDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = RentPropertyFeeDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["RentPropertyFee"].Value = bizObjects;

                    }
                }

                //车辆费用
                var VehicleCosts = (BizObject[])ActionContext.BizObject.GetValue("VehicleCosts");
                if (VehicleCosts == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable VehicleCostsDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='VehicleCosts'");
                    if (VehicleCostsDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[VehicleCostsDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("VehicleCosts").ChildSchema;
                        for (int i = 0; i < VehicleCostsDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = VehicleCostsDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = VehicleCostsDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["VehicleCosts"].Value = bizObjects;

                    }
                }


                //邮电通讯费
                var CommunicationFee = (BizObject[])ActionContext.BizObject.GetValue("CommunicationFee");
                if (CommunicationFee == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable CommunicationFeeDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='CommunicationFee'");
                    if (CommunicationFeeDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[CommunicationFeeDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("CommunicationFee").ChildSchema;
                        for (int i = 0; i < CommunicationFeeDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = CommunicationFeeDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = CommunicationFeeDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["CommunicationFee"].Value = bizObjects;

                    }
                }

                //其他成本
                var OtherCost = (BizObject[])ActionContext.BizObject.GetValue("OtherCost");
                if (OtherCost == null)
                {
                    //不存在，初始化子表                 
                    System.Data.DataTable OtherCostDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT Content,Description FROM BudgetInfo where BudgetType='OtherCost'");
                    if (OtherCostDt.Rows.Count > 0)
                    {
                        BizObject[] bizObjects = new BizObject[OtherCostDt.Rows.Count];
                        BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("OtherCost").ChildSchema;
                        for (int i = 0; i < OtherCostDt.Rows.Count; i++)
                        {
                            bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                            bizObjects[i]["Content"] = OtherCostDt.Rows[i]["Content"].ToString();
                            bizObjects[i]["Description"] = OtherCostDt.Rows[i]["Description"].ToString();
                        }
                        this.ActionContext.InstanceData["OtherCost"].Value = bizObjects;

                    }
                }


                System.Data.DataTable dt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT TOP 1 ObjectID FROM I_ProjectOutlineChanges WHERE Status = '1' " +
          "AND ProjectId =" + "'" + projectId + "'ORDER BY CreatedTime DESC");
                
                if (dt.Rows.Count > 0)
                {
                    //项目大纲变更存在，获取最新的修改记录
                    String objectId = dt.Rows[0]["ObjectID"].ToString();
                    //项目人员  
                     projectMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                        " UserRole,Department,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                        "I_ProjectChangeMember WHERE ParentObjectID = '" + objectId + "' ORDER BY AppointmentDate");

                    //专家人员
                     projectExpertDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                            " UserRole,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                            "I_ProjectChangeExpert WHERE ParentObjectID = '" + objectId + "' ORDER BY AppointmentDate");

                    //项目Payment plan
                    paymentPlanDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                         "PlanTitle,PlanDate,PaymentDescription,PaymentPercentage" +
                           " FROM I_sfkjhbg WHERE ParentObjectID ='" + objectId + "' ORDER BY PlanTitle");

                    //项目形象进度计划
                     ProjectProgressDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                         "ScheduleBegin,ScheduleEnd,ItemDescription,ProjectSchedule" +
                           " FROM I_xmjtjh WHERE ParentObjectID ='" + objectId + "' ORDER BY ScheduleBegin");

                }
                else
                {
                    //不存在，查询项目大纲
                    System.Data.DataTable dt1 = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT ObjectID  FROM I_ProjectOutline WHERE Status = '1' " +
                     "AND ProjectId =" + "'" + projectId + "' ORDER BY CreatedTime DESC");
                    if (dt1.Rows.Count > 0){
                        String objectId = dt1.Rows[0]["ObjectID"].ToString();
                         projectMemberDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                            " UserRole,Department,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                            "I_ProjectMember WHERE ParentObjectID = '" + objectId + "' ORDER BY AppointmentDate");
                        //专家人员
                         projectExpertDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(" SELECT FullName ," +
                                " UserRole,Profession, JobTitle,Qualification,AppointmentDate,ResidentBegin,ResidentEnd FROM " +
                                "I_ProjectExpert WHERE ParentObjectID = '" + objectId + "' ORDER BY AppointmentDate");
                        //项目Payment plan
                         paymentPlanDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                             "PlanTitle,PlanDate,PaymentDescription,PaymentPercentage" +
                               " FROM I_sfkjhb WHERE ParentObjectID ='" + objectId + "' ORDER BY PlanTitle");
                        //项目形象进度计划
                         ProjectProgressDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("SELECT " +
                             "ScheduleBegin,ScheduleEnd,ItemDescription,ProjectSchedule" +
                               " FROM I_ProjectProgressTable WHERE ParentObjectID ='" + objectId + "' ORDER BY ScheduleBegin");
                    }
                }
                //项目人员  
                if (projectMemberDt != null) {
                    BizObject[] bizObjects = new BizObject[projectMemberDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("PersonnelInfo").ChildSchema;
                    for (int i = 0; i < projectMemberDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["UserName"] = projectMemberDt.Rows[i]["FullName"].ToString();
                        bizObjects[i]["UserRole"] = projectMemberDt.Rows[i]["UserRole"].ToString();
                        bizObjects[i]["Depart"] = projectMemberDt.Rows[i]["Department"].ToString();
                        bizObjects[i]["Profession"] = projectMemberDt.Rows[i]["Profession"].ToString();
                        bizObjects[i]["JobTitle"] = projectMemberDt.Rows[i]["JobTitle"].ToString();
                        bizObjects[i]["Qualification"] = projectMemberDt.Rows[i]["Qualification"].ToString();
                        bizObjects[i]["AppointmentDate"] = projectMemberDt.Rows[i]["AppointmentDate"];
                        bizObjects[i]["ResidentBegin"] = projectMemberDt.Rows[i]["ResidentBegin"];
                        bizObjects[i]["ResidentEnd"] = projectMemberDt.Rows[i]["ResidentEnd"];
                    }
                    this.ActionContext.InstanceData["PersonnelInfo"].Value = bizObjects;
                }
                //专家人员
                if (projectExpertDt!=null) {
                    BizObject[] bizObjects = new BizObject[projectExpertDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ProjectExpertInfo").ChildSchema;
                    for (int i = 0; i < projectExpertDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["FullName"] = projectExpertDt.Rows[i]["FullName"].ToString();
                        bizObjects[i]["UserRole"] = projectExpertDt.Rows[i]["UserRole"].ToString();
                        bizObjects[i]["Profession"] = projectExpertDt.Rows[i]["Profession"].ToString();
                        bizObjects[i]["JobTitle"] = projectExpertDt.Rows[i]["JobTitle"].ToString();
                        bizObjects[i]["Qualification"] = projectExpertDt.Rows[i]["Qualification"].ToString();
                        bizObjects[i]["AppointmentDate"] = projectExpertDt.Rows[i]["AppointmentDate"];
                        bizObjects[i]["ResidentBegin"] = projectExpertDt.Rows[i]["ResidentBegin"];
                        bizObjects[i]["ResidentEnd"] = projectExpertDt.Rows[i]["ResidentEnd"];
                    }
                    this.ActionContext.InstanceData["ProjectExpertInfo"].Value = bizObjects;
                }
                //项目Payment plan
                if (paymentPlanDt!=null) {
                    BizObject[] bizObjects = new BizObject[paymentPlanDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("SFKSchedule").ChildSchema;
                    for (int i = 0; i < paymentPlanDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["PlanTitle"] = paymentPlanDt.Rows[i]["PlanTitle"].ToString();
                        bizObjects[i]["PlanDate"] = paymentPlanDt.Rows[i]["PlanDate"];
                        bizObjects[i]["PaymentDescription"] = paymentPlanDt.Rows[i]["PaymentDescription"].ToString();
                        bizObjects[i]["PaymentPercentage"] = paymentPlanDt.Rows[i]["PaymentPercentage"].ToString();
                    }
                    this.ActionContext.InstanceData["SFKSchedule"].Value = bizObjects;
                }

                //项目形象进度计划
                if (ProjectProgressDt!=null){
                    BizObject[] bizObjects = new BizObject[ProjectProgressDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ProjectProgress").ChildSchema;
                    for (int i = 0; i < ProjectProgressDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["ScheduleBegin"] = ProjectProgressDt.Rows[i]["ScheduleBegin"];
                        bizObjects[i]["ScheduleEnd"] = ProjectProgressDt.Rows[i]["ScheduleEnd"];
                        bizObjects[i]["ItemDescription"] = ProjectProgressDt.Rows[i]["ItemDescription"].ToString();
                        bizObjects[i]["ProjectSchedule"] = ProjectProgressDt.Rows[i]["ProjectSchedule"].ToString();
                    }
                    this.ActionContext.InstanceData["ProjectProgress"].Value = bizObjects;
                }


                //项目租车，根据项目id查询租车申请表单
                String carSql = "SELECT ac.Type,ac.Plate,ac.Seat  FROM I_ProjectCarRental pc " +
                    "LEFT JOIN I_ApplyerCarInfo ac ON pc.ObjectID = ac.ParentObjectID " +
                    "WHERE pc.Status = '1' AND pc.ProjectId =" + "'" + projectId + "'";
                System.Data.DataTable projectCarRentalDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(carSql);
                if (projectCarRentalDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[projectCarRentalDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("CarRentalInfo").ChildSchema;
                    for (int i = 0; i < projectCarRentalDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["Type"] = projectCarRentalDt.Rows[i]["Type"].ToString();
                        bizObjects[i]["Plate"] = projectCarRentalDt.Rows[i]["Plate"].ToString();
                        bizObjects[i]["Seat"] = projectCarRentalDt.Rows[i]["Seat"];
                    }
                    this.ActionContext.InstanceData["CarRentalInfo"].Value = bizObjects;

                }

                //项目租房，根据项目id查询租房申请表单
                String houseSql = "SELECT hi.Place,hi.Type,hi.Accommodation  FROM I_ProjectHouseRental ph" +
                 " LEFT JOIN I_ApplyerHouseInfo hi ON ph.ObjectID = hi.ParentObjectID" +
                 " WHERE ph.Status = '1' AND ph.ProjectId = " + "'" + projectId + "'";
                System.Data.DataTable projectHouseRentalDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable(houseSql);
                if (projectHouseRentalDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[projectHouseRentalDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("RentalInfo").ChildSchema;
                    for (int i = 0; i < projectHouseRentalDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["Place"] = projectHouseRentalDt.Rows[i]["Place"].ToString();
                        bizObjects[i]["Personnel"] = projectHouseRentalDt.Rows[i]["Accommodation"].ToString();
                        bizObjects[i]["Type"] = projectHouseRentalDt.Rows[i]["Type"].ToString();
                    }
                    this.ActionContext.InstanceData["RentalInfo"].Value = bizObjects;
                }

                //委外单位
                System.Data.DataTable projectOutsideDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                    "SELECT ObjectID, Unit, Amount, ContractNum FROM I_ProjectOutside  where " +
                    " Status = '1' AND ProjectId ='"+projectId + "' ORDER BY CreatedTime ASC");
                if (projectOutsideDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[projectOutsideDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("OutsourcingInfo").ChildSchema;
                    for (int i = 0; i < projectOutsideDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["Unit"] = projectOutsideDt.Rows[i]["Unit"].ToString();
                        bizObjects[i]["Amount"] = projectOutsideDt.Rows[i]["Amount"];
                        bizObjects[i]["ContractNumber"] = projectOutsideDt.Rows[i]["ContractNum"].ToString();
                        bizObjects[i]["ProjectOutsideId"] = projectOutsideDt.Rows[i]["ObjectID"].ToString();
                    }
                    this.ActionContext.InstanceData["OutsourcingInfo"].Value = bizObjects;

                }

                //项目输入评审材料
                System.Data.DataTable projectReviewDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                    "SELECT pr.Applyer,pr.RegisterDate,el.DataName,el.PNote,el.FilePath FROM I_ProjectReview pr LEFT JOIN " +
                    "I_EnterList el ON pr.ObjectID = el.ParentObjectID " +
                    " WHERE pr.Status='1' AND pr.ProjectId='" + projectId +"'");
                if (projectReviewDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[projectReviewDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ProjectReviewData").ChildSchema;
                    for (int i = 0; i < projectReviewDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["DataName"] = projectReviewDt.Rows[i]["DataName"].ToString();
                        bizObjects[i]["PNote"] = projectReviewDt.Rows[i]["PNote"].ToString();
                        bizObjects[i]["ImportDate"] = projectReviewDt.Rows[i]["RegisterDate"];
                        bizObjects[i]["UploadPeople"] = projectReviewDt.Rows[i]["Applyer"];
                        bizObjects[i]["FilePath"] = projectReviewDt.Rows[i]["FilePath"].ToString();
                    }
                    this.ActionContext.InstanceData["ProjectReviewData"].Value = bizObjects;

                }

                //外部登记资料
                System.Data.DataTable externalDataregistratDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                    "SELECT eg.Applyer,eg.RegisterDate,wd.DataName,wd.PNote,wd.FilePath FROM I_ExternalDataregistrat eg " +
                    "LEFT JOIN I_wbzldjb wd ON eg.ObjectID = wd.ParentObjectID" +
                    " WHERE eg.Status='1' AND eg.ProjectId='" + projectId + "'");
                if (externalDataregistratDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[externalDataregistratDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ExternalData").ChildSchema;
                    for (int i = 0; i < externalDataregistratDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["DataName"] = externalDataregistratDt.Rows[i]["DataName"].ToString();
                        bizObjects[i]["PNote"] = externalDataregistratDt.Rows[i]["PNote"].ToString();
                        bizObjects[i]["RegisterDate"] = externalDataregistratDt.Rows[i]["RegisterDate"];
                        bizObjects[i]["RegisterPerson"] = externalDataregistratDt.Rows[i]["Applyer"];
                        bizObjects[i]["FilePath"] = externalDataregistratDt.Rows[i]["FilePath"].ToString();
                    }
                    this.ActionContext.InstanceData["ExternalData"].Value = bizObjects;

                }


                  //项目总结
                    System.Data.DataTable projectSummaryDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
                    "SELECT Applyer, RegisterDate, Content, Title, " +
                    "FilePath FROM I_ProjectSummary WHERE ProjectId ='" + projectId + "'");
                if (projectSummaryDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[projectSummaryDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("ProjectSummaryInfo").ChildSchema;
                    for (int i = 0; i < projectSummaryDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["DataName"] = projectSummaryDt.Rows[i]["Title"].ToString();
                        bizObjects[i]["PNote"] = projectSummaryDt.Rows[i]["Content"].ToString();
                        bizObjects[i]["ImportDate"] = projectSummaryDt.Rows[i]["RegisterDate"];
                        bizObjects[i]["UploadPeople"] = projectSummaryDt.Rows[i]["Applyer"];
                        bizObjects[i]["FilePath"] = projectSummaryDt.Rows[i]["FilePath"].ToString();
                    }
                    this.ActionContext.InstanceData["ProjectSummaryInfo"].Value = bizObjects;

                }


                //月度/周资料

                System.Data.DataTable projectMonthWeeklyDt = OThinker.H3.Controllers.AppUtility.Engine.EngineConfig.CommandFactory.CreateCommand().ExecuteDataTable("" +
           "SELECT pm.Applyer ,pm.Content ,pm.RegisterDate ,pm.FilePath ,pm.Title FROM  I_ProjectMonth pm  WHERE pm.ProjectId = '" + projectId + "'" +
           "UNION  SELECT pw.Applyer, pw.Content, pw.RegisterDate, pw.FilePath, pw.Title FROM I_ProjectWeekly pw  where pw.ProjectId = '" + projectId + "'");
                if (projectMonthWeeklyDt.Rows.Count > 0)
                {
                    BizObject[] bizObjects = new BizObject[projectMonthWeeklyDt.Rows.Count];
                    BizObjectSchema childSchema = this.ActionContext.Schema.GetProperty("MWeeklyData").ChildSchema;
                    for (int i = 0; i < projectMonthWeeklyDt.Rows.Count; i++)
                    {
                        bizObjects[i] = new BizObject(this.ActionContext.Engine, childSchema, this.ActionContext.User.UserID);
                        bizObjects[i]["DataName"] = projectMonthWeeklyDt.Rows[i]["Title"].ToString();
                        bizObjects[i]["PNote"] = projectMonthWeeklyDt.Rows[i]["Content"].ToString();
                        bizObjects[i]["ImportDate"] = projectMonthWeeklyDt.Rows[i]["RegisterDate"];
                        bizObjects[i]["UploadPeople"] = projectMonthWeeklyDt.Rows[i]["Applyer"];
                        bizObjects[i]["FilePath"] = projectMonthWeeklyDt.Rows[i]["FilePath"].ToString();
                    }
                    this.ActionContext.InstanceData["MWeeklyData"].Value = bizObjects;

                }
            }

            return base.LoadDataFields();



        }



    }
}
