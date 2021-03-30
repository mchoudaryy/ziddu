using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ziddu.DBUtility;

public partial class Reports_ETHDetails : System.Web.UI.Page
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckrddu"];
        if (dateCookie == null)
            Response.Redirect("login.aspx");
        if (!Page.IsPostBack)
            BindGrid();
    }
    protected void BindGrid()
    {
        try
        {
            string stmt = "SELECT z.zid,z.email,w.waddress,z.zcoin,w.tbalance ethbalance FROM ziddumembers z JOIN walletinfo w ON z.zid = w.zid WHERE z.zcoin>0 AND w.tbalance>0 ORDER BY z.regdatetime DESC;";
            stmt += "SELECT SUM(tbalance) total FROM walletinfo WHERE tbalance>0;";
            stmt += "SELECT SUM(tbalance) total FROM walletinfo WHERE tbalance>0 AND zid IN (3361, 3362, 3363, 3366, 3367, 3383, 3394, 3396, 3397, 3398, 3399, 3421, 3422, 3423, 3424, 3425, 3426, 3427,3,4,7,8);";
            int[] zids = { 3361, 3362, 3363, 3366, 3367, 3383, 3394, 3396, 3397, 3398, 3399, 3421, 3422, 3423, 3424, 3425, 3426, 3427, 3, 4, 7, 8 };
            DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            gvGrid.DataSource = ds;
            gvGrid.DataBind();
            lblTotalETH.Text = ds.Tables[1].Rows[0]["total"].ToString();
            lblTotalInternalETH.Text = ds.Tables[2].Rows[0]["total"].ToString();
            lblTotalExternalETH.Text = (Convert.ToDouble(ds.Tables[1].Rows[0]["total"].ToString()) - Convert.ToDouble(ds.Tables[2].Rows[0]["total"].ToString())).ToString("0.########");
        }
        catch (Exception ex)
        { }
    }
}