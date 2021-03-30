using System;
using System.Web;

public partial class CP_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text.Trim().ToLower() == "admin" && txtPassword.Text.Trim() == "$12@312asE3")
        {
            HttpCookie aCookie = new HttpCookie("ckrddu");
            aCookie.Values.Add("userName", txtUserName.Text);
            aCookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(aCookie);
            Response.Redirect("~/Reports/OverallReport.aspx");
        }
        else
            lblMessage.Text = "Invalid login details...";
    }
}