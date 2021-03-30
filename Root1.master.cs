using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Root1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected string ShowLogo()
    {
        if (Request.Browser.IsMobileDevice == false)
            return "ziddu-logo-w.svg";
        else
            return "ziddu-logo.svg";
    }
}
