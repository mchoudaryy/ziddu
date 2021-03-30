using System;
using System.Configuration;
using System.Net;
using System.Web.Services;
using Ziddu.DBUtility;

public partial class verify : System.Web.UI.Page
{
    protected static string ReCaptcha_Key = ConfigurationManager.AppSettings["reCAPTCHASiteKey"].ToString();
    protected static string ReCaptcha_Secret = ConfigurationManager.AppSettings["reCAPTCHASecretKey"].ToString();
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckCode();
    }
    [WebMethod]
    public static string VerifyCaptcha(string response)
    {
        string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        return (new WebClient()).DownloadString(url);
    }
    private void CheckCode()
    {
        try
        {
            string email = Request.QueryString["email"].Trim();
            string gid = Request.QueryString["vlink"].Trim();
            //bool isEmail = Regex.IsMatch(email, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            //if (isEmail == false)
            //{
            //    lblMessage.Text = "Invalid input, Please try again..";
            //    return;
            //}
            if (gid.Trim().Length == 32 && email.Trim().Length > 0)
            {
                string ip = GetUserIP();
                string stmt = string.Format("UPDATE ziddumembers SET verified='Y', verifiedip ='{2}', verifieddatetime=now() WHERE email='{0}' and regcode='{1}' and verified ='n'", email, gid, ip);
                int flag = MySQLHelper.ExecuteNonQuery(connectionString, stmt, null);
                if (flag >= 1)
                    lblMessage.Text = "Email verified successfully! ";
                else
                    lblMessage.Text = "Email verification failed! ";
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.Message;
            lblMessage.Text = "An error occurred Please try again later";
        }
    }
    private string GetUserIP()
    {
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }

        return Request.ServerVariables["REMOTE_ADDR"];
    }
}