using System;
using System.Configuration;
using System.Data;
using System.Web;
using Ziddu.DBUtility;

public partial class CP_transactions : System.Web.UI.Page
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
            lblCount.Text = "";
            string str = txtSearch.Text.Trim();
            string transType = ddlStatus.SelectedValue;
            DataSet ds = new DataSet();
            string stmt = "SELECT * FROM transactions ";
            if (transType != "all")
                stmt += " WHERE transtype = '" + transType + "' ";
            if (transType == "all" && str.Length > 0)
                stmt += " WHERE zid = '" + str + "' ";
            if (transType != "all" && str.Length > 0)
                stmt += " AND zid = '" + str + "' ";
            stmt += " order by tdate desc;";
            ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            lblCount.Text = "No of Records : " + ds.Tables[0].Rows.Count.ToString();
            gvData.DataSource = ds.Tables[0];
            gvData.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
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