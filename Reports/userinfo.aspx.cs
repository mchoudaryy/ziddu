using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using Ziddu.DBUtility;

public partial class Reports_userinfo : System.Web.UI.Page
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
            string stmt = "SELECT COUNT(*) totalusers, SUM(CASE WHEN verified = 'y' THEN 1 ELSE 0 END) verified, SUM(CASE WHEN verified = 'n' THEN 1 ELSE 0 END) nonverified FROM ziddumembers;";
            stmt += "SELECT DATE(regdatetime) regdatetime,COUNT(*) totalusers, SUM(CASE WHEN verified = 'y' THEN 1 ELSE 0 END) verified, SUM(CASE WHEN verified = 'n' THEN 1 ELSE 0 END) nonverified FROM ziddumembers GROUP BY DATE(regdatetime) ORDER BY 1 DESC; ";
            DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            gvGrid.DataSource = ds.Tables[1].DefaultView;
            gvGrid.DataBind();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                lblTotalRegisteredUsers.Text = ds.Tables[0].Rows[0]["totalusers"].ToString();
                lblTotalVerifiedUsers.Text = ds.Tables[0].Rows[0]["verified"].ToString();
                lblTotalNonVerifiedUsers.Text = ds.Tables[0].Rows[0]["nonverified"].ToString();
            }
        }
        catch (Exception ex)
        { }
    }
}