using System;
using System.Web;

public partial class User_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie aCookie = new HttpCookie("ckziddu");
        aCookie.Values.Add("userName", "");
        aCookie.Expires = DateTime.Now.AddDays(-10);
        Response.Cookies.Add(aCookie);
        Response.Redirect("../login.aspx");
    }
}