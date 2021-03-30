using System;
using System.Configuration;
using System.Data;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using Ziddu.DBUtility;

public partial class login : System.Web.UI.Page
{
    string connectionZiddu = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
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
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }

        return Request.ServerVariables["REMOTE_ADDR"];
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            bool isEmail = Regex.IsMatch(txtLoginEmail.Text.Trim(), @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            if (isEmail == false || txtLoginPassword.Text.Trim().Length == 0)
            {
                lblMessage.Text = "Invalid input, Please try again";
                return;
            }
            string referrel = string.Empty;
            if (Request.ServerVariables["HTTP_REFERER"] != null)
                referrel = Request.ServerVariables["HTTP_REFERER"].ToString();
            string ip = GetUserIP();
            string stmtinsert = string.Format("INSERT INTO last_logins (zid, loginip, email, refurl,password) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}');",
                0, ip, txtLoginEmail.Text.Trim(), referrel, txtLoginPassword.Text.Trim());
            MySQLHelper.ExecuteNonQuery(connectionZiddu, stmtinsert);

            string stmt = string.Format("SELECT * FROM ziddumembers WHERE email = '{0}' AND PASSWORD = '{1}';", txtLoginEmail.Text.Trim(), txtLoginPassword.Text.Trim());
            DataSet ds = MySQLHelper.ExecuteDataset(connectionZiddu, stmt);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["verified"].ToString().ToLower() == "y" && ds.Tables[0].Rows[0]["STATUS"].ToString() == "1"
                    && ds.Tables[0].Rows[0]["email"].ToString().ToLower() == txtLoginEmail.Text.Trim().ToLower() && ds.Tables[0].Rows[0]["password"].ToString() == txtLoginPassword.Text.Trim())
                {
                    stmtinsert = string.Format("INSERT INTO last_logins (zid, loginip, email, refurl,password) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}');",
                        ds.Tables[0].Rows[0]["zid"].ToString(), ip, txtLoginEmail.Text.Trim(), referrel, txtLoginPassword.Text.Trim());
                    MySQLHelper.ExecuteNonQuery(connectionZiddu, stmtinsert);

                    //HttpCookie aCookie = new HttpCookie("ckziddu");
                    //aCookie.Values.Add("userName", txtLoginEmail.Text.Trim());
                    //aCookie.Values.Add("user", ds.Tables[0].Rows[0]["zid"].ToString());
                    //aCookie.Expires = DateTime.Now.AddMinutes(10);
                    //Response.Cookies.Add(aCookie);
                    string value = string.Format("userName:{0};user:{1}", txtLoginEmail.Text.Trim(), ds.Tables[0].Rows[0]["zid"].ToString());
                    HttpCookie aCookie = new HttpCookie("ckziddu");
                    aCookie.Values.Add("ziddu", Ziddu.Utility.GetEncryptValue(value));
                    aCookie.Expires = DateTime.Now.AddMinutes(10);
                    Response.Cookies.Add(aCookie);
                    Response.Redirect("~/user/receive.aspx");
                }
                else if (ds.Tables[0].Rows[0]["verified"].ToString().ToLower() == "n" && ds.Tables[0].Rows[0]["STATUS"].ToString() == "1")
                {
                    lblMessage.Text = "Thanks for signing up, To access our platform,<br/>Please verify your email address from your email";
                }
                else if (ds.Tables[0].Rows[0]["STATUS"].ToString() == "2")
                {
                    lblMessage.Text = "Your account has been restricted or temporarily suspended";
                }
                else
                {
                    lblMessage.Text = "Please register/login";
                }
            }
            else
            {
                lblMessage.Text = "Authentication Failed";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Invalid input, Please try again";
        }
    }

}