using System;
using System.Configuration;
using System.Data;
using System.Web;
using Ziddu.DBUtility;

public partial class Reports_UserDetails : System.Web.UI.Page
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckrddu"];
        if (dateCookie == null)
            Response.Redirect("login.aspx");
        if (!Page.IsPostBack)
            BindData();
    }
    private void BindData()
    {
        try
        {
            DateTime date = DateTime.Now;
            if (Request.QueryString["d"] != null)
                date = Convert.ToDateTime(Request.QueryString["d"].ToString());
            lblHeading.Text = "User Details (Date : " + date.ToString("yyyy-MM-dd") + ")";
            DataSet ds = new DataSet();
            string stmt = "SELECT COUNT(*) totalusers, SUM(CASE WHEN verified = 'y' THEN 1 ELSE 0 END) verified, SUM(CASE WHEN verified = 'n' THEN 1 ELSE 0 END) nonverified FROM ziddumembers WHERE DATE(regdatetime) = '" + date.ToString("yyyy-MM-dd") + "';";
            stmt += "SELECT * FROM ziddumembers WHERE DATE(regdatetime) = '" + date.ToString("yyyy-MM-dd") + "' order by zid desc;";

            ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            gvData.DataSource = ds.Tables[1].DefaultView;
            gvData.DataBind();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                lblTotalRegisteredUsers.Text = ds.Tables[0].Rows[0]["totalusers"].ToString();
                lblTotalVerifiedUsers.Text = ds.Tables[0].Rows[0]["verified"].ToString();
                lblTotalNonVerifiedUsers.Text = ds.Tables[0].Rows[0]["nonverified"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }
}