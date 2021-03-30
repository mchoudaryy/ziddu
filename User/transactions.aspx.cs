using System;
using System.Configuration;
using System.Data;
using System.Web;
using Ziddu.DBUtility;

public partial class User_transactions : System.Web.UI.Page
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        if (dateCookie == null)
            Response.Redirect("../login.aspx");
        BindData();
    }
    private void BindData()
    {
        try
        {
            //HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
            //int zid = Convert.ToInt32(dateCookie["user"].ToString().Trim());
            HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
            string[] cookieResult = Ziddu.Utility.GetDecryptValue(dateCookie["ziddu"].ToString()).Split(';');
            int zid = Convert.ToInt32(cookieResult[1].Replace("user:", ""));
            if (zid > 0)
            {
                string stmt = string.Format("SELECT CASE WHEN transtype = 'buyzc' THEN 'Received' WHEN transtype = 'sellzc' THEN 'Redeemed' WHEN transtype = 'sendeth' THEN 'Sent' WHEN transtype = 'receiveeth' THEN 'Received' WHEN transtype = 'warehouse' THEN 'ML'  END AS transtype, tdate, wstatus, amount, fee, cointype, walletaddress, toaddress, toamount, tocointype, towid, usermessage, zcoinprice FROM transactions WHERE zid = {0} ORDER BY tdate DESC;", zid);
                DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
                gvTransactions.DataSource = ds.Tables[0];
                gvTransactions.DataBind();
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.ToString();
        }
    }
}