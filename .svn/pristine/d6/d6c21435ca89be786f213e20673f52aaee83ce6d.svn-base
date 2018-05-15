using System;
using System.Web;
using System.Net;
using System.IO;
public partial class saveAs_pdf : System.Web.UI.Page
{

    HttpResponse response = System.Web.HttpContext.Current.Response;
    HttpRequest request = System.Web.HttpContext.Current.Request;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           System.Web.HttpFileCollection uploadFiles = request.Files;//获取需要上传的文件
       System.Web.HttpPostedFile theFile;
       string savepath = Server.MapPath(".") + "\\templateFile\\";
        if (uploadFiles.Count == 0)
        {
            response.Write("没有文件上传！");
        }
        else
        {
            for (int i = 0; i < uploadFiles.Count; i++)
            {
                theFile = uploadFiles[i];
                if (uploadFiles.GetKey(i) == "upLoadFile")
                {
                    string myfileName = Request.Params["filename"];
                    myfileName = Server.UrlDecode(myfileName);
                    theFile.SaveAs(savepath + theFile.FileName);
                    response.Write("保存成功！");
                }
            }
        }
    }
        }
    }

    
}