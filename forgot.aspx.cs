using System;
using System.Configuration;
using System.Data;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.Services;
using Ziddu.DBUtility;

public partial class forgot : System.Web.UI.Page
{
    protected static string ReCaptcha_Key = ConfigurationManager.AppSettings["reCAPTCHASiteKey"].ToString();
    protected static string ReCaptcha_Secret = ConfigurationManager.AppSettings["reCAPTCHASecretKey"].ToString();
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string VerifyCaptcha(string response)
    {
        string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        return (new WebClient()).DownloadString(url);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            bool isEmail = Regex.IsMatch(txtEmail.Text.Trim(), @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            if (txtEmail.Text.Trim().Length > 0 && isEmail != false)
            {
                DataRow dr = MySQLHelper.ExecuteDataRow(connectionString, "SELECT * FROM ziddumembers WHERE status = 1 AND verified = 'y' AND email = '" + txtEmail.Text.Trim() + "';");
                if (dr != null)
                {
                    SendMail(dr["email"].ToString(), dr["password"].ToString());
                    lblMessage.Text = "Your Password has been sent to your email id:<br /> " + dr["email"].ToString();
                }
                else
                    lblMessage.Text = "Your email is not yet verified or suspended, Please try again...";
            }
            else
                lblMessage.Text = "Invalid email...";
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }
    private void SendMail(string emailId, string password)
    {
        try
        {
            string url = ConfigurationManager.AppSettings["mailPath"].ToString();//"https://www.ziddu.com/";

            string body = string.Format("Dear User!<br><br>You have requested for your password.<br><br>Your password is: {0}<br>If you need any further help,<a href=\"{1}contact.aspx\"    target=\"_blank\">click here</a><br><br>Thank you,<br><br>Ziddu Team",
                password, url);

            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["emailAddress"].ToString(), emailId, "Password for Ziddu.com", body);
            //msg.Bcc.Add("kknbrao@stampedecap.com");
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("31.3.223.108");
            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["emailAddress"].ToString(), ConfigurationManager.AppSettings["emailPwd"].ToString());
            msg.IsBodyHtml = true;
            smtp.Send(msg);
        }
        catch (Exception ex)
        {

        }
    }
}