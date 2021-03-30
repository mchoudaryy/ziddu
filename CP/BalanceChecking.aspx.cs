using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using Ziddu.DBUtility;

public partial class CP_BalanceChecking : System.Web.UI.Page
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
            DataSet ds = new DataSet();
            string stmt = "SELECT z.zid,w.wid,w.waddress, z.email,z.ethbalance,w.tbalance,w.finalbalance, (w.finalbalance - w.tbalance) AS diff FROM ziddumembers z JOIN walletinfo w ON z.zid = w.zid WHERE (w.finalbalance - w.tbalance) != 0 ORDER BY z.verifieddatetime DESC;";
            ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            lblCount.Text = "No of Transactions : " + ds.Tables[0].Rows.Count.ToString();
            gvData.DataSource = ds.Tables[0];
            gvData.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    protected void gvData_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        lblMessage.Text = string.Empty;
        try
        {
            if (e.CommandName == "Select")
            {

                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = gvData.Rows[rowIndex];
                int zid = Convert.ToInt32(row.Cells[1].Text.Trim());
                double amount = Math.Abs(Convert.ToDouble(row.Cells[6].Text.Trim()));
                double fee = 0.0;
                string walletaddress = ((HyperLink)row.Cells[3].Controls[0]).Text.Trim();// row.Cells[3].Text.Trim();
                int wid = Convert.ToInt32(row.Cells[0].Text.Trim());
                //lblMessage.Text = string.Format("CALL InsertReceivedETHToUser_server({0},{1},{2},'{3}',{4});<br/>", zid, amount, fee, walletaddress, wid);


                MySqlParameter[] parms = new MySqlParameter[] {
                new MySqlParameter("@tzid", MySqlDbType.Int32),
                new MySqlParameter("@amount", MySqlDbType.Double),
                new MySqlParameter("@fee", MySqlDbType.Double),
                new MySqlParameter("@walletaddress", MySqlDbType.VarChar,100),
                new MySqlParameter("@twid",MySqlDbType.Int32)};
                parms[0].Value = zid;
                parms[1].Value = amount;
                parms[2].Value = fee;
                parms[3].Value = walletaddress;
                parms[4].Value = wid;
                int result = MySQLHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "InsertReceivedETHToUser_server", parms);
                lblMessage.Text += "    " + result + " rows affected";
                BindData();
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }
    }
}
