using System;
using System.Configuration;
using System.IO;
using System.Web;
using Ziddu.DBUtility;

public partial class User_warehouse : System.Web.UI.Page
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        if (dateCookie == null)
            Response.Redirect("../login.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
            //int zid = Convert.ToInt32(dateCookie["user"]);
            string[] cookieResult = Ziddu.Utility.GetDecryptValue(dateCookie["ziddu"].ToString()).Split(';');
            int zid = Convert.ToInt32(cookieResult[1].Replace("user:", ""));

            lblMessage.Text = "";
            FileInfo finfo = new FileInfo(fu.PostedFile.FileName);
            string filePath = fu.PostedFile.FileName;
            string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "pdf" };
            bool isValidFile = false;
            if (fu.PostedFile.ContentLength > 10485760)
            {
                lblMessage.Text = "File size must not exceed 10 MB";
                return;
            }
            for (int i = 0; i < validFileTypes.Length; i++)
            {

                if (finfo.Extension == validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                lblMessage.Text = "We accept only Images and pdf files only";
                return;
            }
            if (txtName.Text.Trim().Length > 0 && fu.HasFile && (finfo.Extension == ".jpg" || finfo.Extension == ".jpeg" || finfo.Extension == ".png" || finfo.Extension == ".gif" || finfo.Extension == ".pdf"))
            {
                string fileName = zid.ToString() + "_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + "_" + fu.FileName;
                fu.PostedFile.SaveAs(Server.MapPath("Uploads/" + fileName));

                string stmt = string.Format("INSERT INTO warehouse (NAME, filename, zid) VALUES ('{0}','{1}',{2});",
                    txtName.Text.Trim(), fileName, zid);
                MySQLHelper.ExecuteNonQuery(connectionString, stmt);
                lblMessage.Text = "Warehouse document successfully submitted, We will get back you soon";
            }
            else
            {
                lblMessage.Text = "All Fields are mandatory";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "An error occurred Please try again later";
        }
    }
}