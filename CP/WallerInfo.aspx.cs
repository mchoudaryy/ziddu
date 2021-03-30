using System;
using System.Configuration;
using System.Data;
using System.Web;
using Ziddu.DBUtility;

public partial class CP_WallerInfo : System.Web.UI.Page
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckddu"];
        if (dateCookie == null)
            Response.Redirect("login.aspx");
        if (!Page.IsPostBack)
            BindData();
    }
    private void BindData()
    {
        try
        {
            string str = txtSearch.Text.Trim();
            DataSet ds = new DataSet();
            string stmt = "SELECT wtype,STATUS,COUNT(*) FROM walletinfo GROUP BY wtype,STATUS WITH ROLLUP;SELECT * FROM walletinfo WHERE STATUS > 0 order by wid desc;";
            if (str.Length > 0)
                stmt = "SELECT wtype,STATUS,COUNT(*) FROM walletinfo GROUP BY wtype,STATUS WITH ROLLUP;SELECT * FROM walletinfo WHERE STATUS > 0 AND (zid = '" + str + "' OR waddress like '%" + str + "%') order by wid desc;";
            ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            gvCount.DataSource = ds.Tables[0];
            gvCount.DataBind();
            gvData.DataSource = ds.Tables[1];
            gvData.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    protected void gvData_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        gvData.PageIndex = e.NewPageIndex;
        BindData();
    }
}