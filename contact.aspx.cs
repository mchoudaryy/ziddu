using System;
using System.Configuration;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using Ziddu.DBUtility;

public partial class contact : System.Web.UI.Page
{
    protected static string ReCaptcha_Key = ConfigurationManager.AppSettings["reCAPTCHASiteKey"].ToString();
    protected static string ReCaptcha_Secret = ConfigurationManager.AppSettings["reCAPTCHASecretKey"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string VerifyCaptcha(string response)
    {
        string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
        return (new WebClient()).DownloadString(url);
    }
    private string GetUserIP()
    {
        string ipList = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }
        return HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
    }
    private void SendMail(string emailId, string name)
    {
        try
        {
            string body = "Dear " + name + ",<br /><br />" + "Thank you for contacting us. Your message is very important to us, we will contact you shortly!<br /><br /><br /> Thanks!<br />Support<br />Ziddu Team";
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["emailAddress"].ToString(), emailId, "Thank you for contacting us...", body);
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("31.3.223.108");
            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["emailAddress"].ToString(), ConfigurationManager.AppSettings["emailPwd"].ToString());
            msg.IsBodyHtml = true;
            smtp.Send(msg);
        }
        catch (Exception ex)
        {

        }
    }
    private void SendMailToSupport(string body, string name)
    {
        try
        {
            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["emailAddress"].ToString(), "admin@ziddu.com", name + " has Contacted ziddu.com", body);
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bool isEmail = Regex.IsMatch(txtEmail.Text.Trim(), @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);

        if (txtName.Text.Trim().ToLower() != "name" && txtEmail.Text.Trim().ToLower() != "email" && txtMessage.Text.Trim().ToLower() != "your message" && isEmail == true
            && txtMessage.Text.Trim().Length > 0 && (txtEmail.Text.Trim().Length > 0 || txtPhone.Text.Trim().Length > 0))
        {
            lblMessage.Text = "";
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
                string stmt = string.Format("INSERT INTO contact (name, email, phone, message, ip) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}');",
                    txtName.Text.Trim(), txtEmail.Text.Trim(), txtPhone.Text.Trim(), txtMessage.Text.Trim(), GetUserIP());
                MySQLHelper.ExecuteNonQuery(connectionString, stmt);

                string body = string.Format("<table width='75%' border='0'><tr><td>Name</td><td>{0}</td></tr><tr><td>email</td><td>{1}</td></tr><tr><td>Phone</td><td>{2}</td></tr><tr><td>Message</td><td>{3}</td></tr></table>",
                    txtName.Text.Trim(), txtEmail.Text.Trim(), txtPhone.Text.Trim(), txtMessage.Text.Trim());
                SendMailToSupport(body, txtName.Text.Trim());
                SendMail(txtEmail.Text.Trim(), txtName.Text.Trim());
                lblMessage.Text = "Thank you for contacting us. we will contact you shortly!";
                txtName.Text = txtEmail.Text = txtPhone.Text = txtMessage.Text = "";
            }
            catch (Exception ex)
            {
            }
        }
    }
}