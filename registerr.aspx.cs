using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using Ziddu.DBUtility;

public partial class registerr : System.Web.UI.Page
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
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            Guid id = Guid.NewGuid();
            string gid = id.ToString().Replace("-", "");
            string email = string.Empty;
            string name = string.Empty;
            string password = string.Empty;
            string ip = GetUserIP();
            string country = string.Empty;
            bool isEmail = Regex.IsMatch(txtRegisterEMail.Text.Trim(), @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            if (txtRegisterEMail.Text.Trim().Length > 0 && txtRegisterPassword.Text.Trim().Length > 0 && isEmail != false && txtName.Text.Trim().Length > 0)
            {
                FileInfo finfo = new FileInfo(fuKYC.PostedFile.FileName);
                string filePath = fuKYC.PostedFile.FileName;
                string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "pdf" };
                bool isValidFile = false;
                if (fuKYC.PostedFile.ContentLength > 10485760)
                {
                    lblMessage.Text = "File size must not exceed 10 MB";
                    return;
                }
                for (int i = 0; i < validFileTypes.Length; i++)
                {

                    if (finfo.Extension.Replace(".", "") == validFileTypes[i])
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
                string fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff") + "_" + fuKYC.FileName;
                fuKYC.PostedFile.SaveAs(Server.MapPath("KYCFiles/" + fileName));
                name = txtName.Text.Trim();
                email = txtRegisterEMail.Text.Trim();
                password = txtRegisterPassword.Text.Trim();
                country = GetCountryCode(ip);
                //string stmt = string.Format("INSERT INTO ziddumembers (email, password, country, ip, regdatetime, regcode, status, verified) VALUES ('{0}','{1}','{2}','{3}',now(),'{4}','1','N');",
                //    email, password, country, ip, gid);

                string stmt = string.Format("INSERT INTO ziddumembers (email, password, country, ip, regdatetime, regcode, status, verified,name,filename) VALUES ('{0}','{1}','{2}','{3}',now(),'{4}','1','N','{5}','{6}');",
                    email, password, country, ip, gid, name, fileName);

                MySQLHelper.ExecuteNonQuery(connectionString, stmt);
                SendMail(email, password, gid);
                lblMessage.Text = "Thank you for registering. Your account has been created and a verification email has been sent to your registered email address.Please verify";
            }
            else
            {
                lblMessage.Text = "All Fields are mandatory";
            }
        }
        catch (Exception ex)
        {
            if (ex.ToString().ToLower().Contains("duplicate entry"))
                lblMessage.Text = "eMail already exists";
            else
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
    private void SendMail(string emailId, string password, string gid)
    {
        try
        {
            //string url = string.Format("https://www.ziddu.com/verify.aspx?email={0}&vlink={1}", emailId, gid);
            string url = string.Format(ConfigurationManager.AppSettings["mailPath"].ToString() + "verify.aspx?email={0}&vlink={1}", emailId, gid);
            string body = string.Format("Dear User!<br><br>Welcome to Ziddu.com!!<br><br>Congratulations to be part of Ziddu.com and now you can avail Global Wallet.<br><br>Your Ziddu ID : {0}<br>Password        : {1}<br><br><a href=\"{2}\" target=\"_blank\">Verify your eMail</a><br><br>Thank you,<br><br>Ziddu Team",
                emailId, password, url);

            System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["emailAddress"].ToString(), emailId, "Welcome to Ziddu.com", body);
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
    private string GetCountryCode(string strIPAddress)
    {
        string result = "-";
        IP2Location.IPResult oIPResult = new IP2Location.IPResult();
        IP2Location.Component oIP2Location = new IP2Location.Component();
        try
        {

            if (strIPAddress != "")
            {
                oIP2Location.IPDatabasePath = Server.MapPath("bin") + "/IPV6-COUNTRY-REGION-CITY.BIN"; // for both IPv4 & IPv6
                //oIP2Location.IPDatabasePath = Server.MapPath("bin") + "/IP-COUNTRY-REGION-CITY.BIN"; // for just IPv4
                // oIP2Location.IPDatabasePath = @"C:\Program Files\IP2Location\IP2LOCATION-LITE-DB1.IPV6.BIN"; // for both IPv4 & IPv6

                //Set License Path
                oIP2Location.IPLicensePath = Server.MapPath("bin") + "/License.key";

                oIPResult = oIP2Location.IPQuery(strIPAddress);
                if (oIPResult.Status.ToString() == "OK")
                    result = oIPResult.CountryShort;
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            oIPResult = null;
            oIP2Location = null;
        }
        return result;
    }
}