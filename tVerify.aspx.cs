using System;
using System.Configuration;
using System.Data;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using Ziddu.DBUtility;

public partial class tVerify : System.Web.UI.Page
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
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        try
        {
            bool isEmail = Regex.IsMatch(txtLEmail.Text.Trim(), @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            if (isEmail == false || txtLPassword.Text.Trim().Length == 0)
            {
                lblMessage.Text = "Invalid input, Please try again";
                return;
            }
            string ip = GetUserIP();
            string stmt = string.Format("SELECT * FROM ziddumembers WHERE email = '{0}' AND PASSWORD = '{1}';", txtLEmail.Text.Trim(), txtLPassword.Text.Trim());
            DataSet ds = MySQLHelper.ExecuteDataset(connectionZiddu, stmt);
            if (ds != null && ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["verified"].ToString().ToLower() == "y" && ds.Tables[0].Rows[0]["STATUS"].ToString() == "1"
                    && ds.Tables[0].Rows[0]["email"].ToString().ToLower() == txtLEmail.Text.Trim().ToLower() && ds.Tables[0].Rows[0]["password"].ToString() == txtLPassword.Text.Trim())
            {
                stmt = string.Format("UPDATE transactions SET vip='{0}',vstatus='confirmed' WHERE vstatus='sent' AND vcode='{1}' AND zid='{2}';", ip,
                txtVerCo.Text.Trim(), ds.Tables[0].Rows[0]["zid"].ToString());
                int status = MySQLHelper.ExecuteNonQuery(connectionZiddu, stmt);
                if (status > 0)
                {
                    //HttpCookie aCookie = new HttpCookie("ckziddu");
                    //aCookie.Values.Add("userName", txtLEmail.Text.Trim());
                    //aCookie.Values.Add("user", ds.Tables[0].Rows[0]["zid"].ToString());
                    //aCookie.Expires = DateTime.Now.AddMinutes(10);
                    //Response.Cookies.Add(aCookie);
                    string value = string.Format("userName:{0};user:{1}", txtLEmail.Text.Trim(), ds.Tables[0].Rows[0]["zid"].ToString());
                    HttpCookie aCookie = new HttpCookie("ckziddu");
                    aCookie.Values.Add("ziddu", Ziddu.Utility.GetEncryptValue(value));
                    aCookie.Expires = DateTime.Now.AddMinutes(10);
                    Response.Cookies.Add(aCookie);
                    Response.Redirect("~/user/transactions.aspx");
                }
                //lblMessage.Text = "Thank you for confirming the transaction, We will process the transaction at the earliest.";
                else
                    lblMessage.Text = "Authentication Failed/This transaction already verified";
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