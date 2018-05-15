using System;
using System.Web;
using System.IO;
using System.Net;
public partial class saveAs_pdf : System.Web.UI.Page
{

    HttpResponse response = System.Web.HttpContext.Current.Response;
    HttpRequest request = System.Web.HttpContext.Current.Request;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        Response.ClearHeaders();
        Response.Clear();
        Response.Expires = 0;
        Response.Buffer = true;
        string filepath = Server.MapPath(".") + "\\templateFile\\";
        string name = Request.Params["filename"].ToString();
        System.IO.FileStream files = new FileStream(filepath+name, FileMode.Open, FileAccess.Read, FileShare.Read);
        byte[] byteFile = null;
        if (files.Length == 0)
        {
            byteFile = new byte[1];
        }
        else
        {
            byteFile = new byte[files.Length];
        }
        files.Read(byteFile, 0, (int)byteFile.Length);
        files.Close();

        Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(name, System.Text.Encoding.UTF8));
        Response.ContentType = "application/octet-stream;charset=gbk";
        Response.BinaryWrite(byteFile);
        Response.End();
        }
    }
}