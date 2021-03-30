using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie aCookie = new HttpCookie("ckddu");
        aCookie.Values.Add("userName", "");
        aCookie.Expires = DateTime.Now.AddDays(-10);
        Response.Cookies.Add(aCookie);
        Response.Redirect("login.aspx");
    }
}