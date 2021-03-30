using System;
using System.Configuration;
using System.Data;
using System.Web;
using Ziddu.DBUtility;


public partial class User_User : System.Web.UI.MasterPage
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    public string connectionStringMySqlConnection = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        if (dateCookie == null)
            Response.Redirect("../login.aspx");
        GetAddress();
    }
    public void GetAddress()
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
                string stmt = string.Format("SELECT * FROM walletinfo WHERE wtype = 'mist' AND STATUS=1 AND zid = {0};SELECT * FROM ziddumembers WHERE zid = {0} AND status=1;", zid);
                DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    lblYourEthereumAddress.Text = ds.Tables[0].Rows[0]["waddress"].ToString();
                    hf1.Value = ds.Tables[0].Rows[0]["wid"].ToString();
                    if (ds.Tables[1].Rows.Count >= 1)
                    {
                        lblWalletBalanceETH.Text = Convert.ToDouble(ds.Tables[1].Rows[0]["ethbalance"]).ToString("0.0#####");
                        lblWalletBalanceZidduCoins.Text = Convert.ToDouble(ds.Tables[1].Rows[0]["zcoin"]).ToString("0.0#####");
                    }
                }

                ds = MySQLHelper.ExecuteDataset(connectionStringMySqlConnection, "SELECT CLOSE AS bidprice, CLOSE + 1.02 AS askprice FROM coins_tickdata WHERE symbol = 'ZETH';SELECT * FROM coins_tickdata_depth WHERE symbol='ZETH' ORDER BY depth;");
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    lblTotalbalanceinUSD.Text = lblWalletBalanceETHInUSD.Text = (Convert.ToDouble(lblWalletBalanceETH.Text) * Convert.ToDouble(ds.Tables[0].Rows[0]["bidprice"])).ToString("0..####");
                }
                if (ds != null && ds.Tables[1].Rows.Count > 0)
                {
                    lblWalletBalanceZidduCoinsInUSD.Text = (Convert.ToDouble(lblWalletBalanceZidduCoins.Text) * Convert.ToDouble(ds.Tables[1].Rows[0]["bidprice"])).ToString("0..####");
                    lblTotalbalanceinUSD.Text = (Convert.ToDouble(lblTotalbalanceinUSD.Text) + Convert.ToDouble(lblWalletBalanceZidduCoinsInUSD.Text)).ToString("0..####");
                }

                upWallerInformation.Update();
            }
        }
        catch (Exception ex)
        {
        }
    }
    public int GetWalletID()
    {
        if (hf1.Value.Trim().Length > 0)
            return Convert.ToInt32(hf1.Value);
        else
            return -1;
    }
    public string YourEthereumAddress
    {
        get
        {
            return lblYourEthereumAddress.Text;
        }
        set
        {
            lblYourEthereumAddress.Text = value;
        }
    }
    public string WalletBalanceZidduCoins
    {
        get
        {
            return lblWalletBalanceZidduCoins.Text;
        }
        set
        {
            lblWalletBalanceZidduCoins.Text = value;
        }
    }
    public string WalletBalanceETH
    {
        get
        {
            return lblWalletBalanceETH.Text;
        }
        set
        {
            lblWalletBalanceETH.Text = value;
        }
    }
}
