using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ziddu_marketplace : System.Web.UI.Page
{
    protected double conversionValue = Convert.ToDouble(ConfigurationManager.AppSettings["conversionValue"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}