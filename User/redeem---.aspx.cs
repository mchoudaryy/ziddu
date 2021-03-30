using System;
using System.Configuration;
using System.Data;
using System.Web;
using Ziddu.DBUtility;

public partial class User_redeem : System.Web.UI.Page
{
    protected double fee = Convert.ToDouble(ConfigurationManager.AppSettings["ETHfee"].ToString());
    protected double conversionValue = Convert.ToDouble(ConfigurationManager.AppSettings["conversionValue"].ToString());
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    public string connectionStringMySqlConnection = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        if (dateCookie == null)
            Response.Redirect("../login.aspx");
        if (!Page.IsPostBack)
            ETHOrderBook();
    }
    public void ETHOrderBook()
    {
        try
        {
            DataSet ds = MySQLHelper.ExecuteDataset(connectionStringMySqlConnection, "SELECT CLOSE AS bidprice, CLOSE + 1.02 AS askprice FROM coins_tickdata WHERE symbol = 'ZETH';SELECT * FROM coins_tickdata_depth WHERE symbol='ZETH' ORDER BY depth;");
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                lblETHBid.Text = Convert.ToDouble(ds.Tables[0].Rows[0][0]).ToString("0..######");
                lblETHAsk.Text = Convert.ToDouble(ds.Tables[0].Rows[0][1]).ToString("0..######");
            }
            gvOrderBook.DataSource = ds.Tables[1];
            gvOrderBook.DataBind();
            if (ds != null && ds.Tables[1].Rows.Count > 0)
            {
                hf2.Value = string.Format("{0};{1}", ds.Tables[1].Rows[0]["bidprice"].ToString(),
                    ds.Tables[1].Rows[1]["bidprice"].ToString());
                hf3.Value = string.Format("{0};{1}", ds.Tables[1].Rows[0]["bidqty"].ToString(),
                   ds.Tables[1].Rows[1]["bidqty"].ToString());
            }
        }
        catch (Exception ex) { }
    }
    private string GetUserIP()
    {
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }

        return Request.ServerVariables["REMOTE_ADDR"];
    }
    protected void btnSendSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            if (txtSendETHValue.Text.Trim().Length == 0 || txtSendETHAddress.Text.Trim().Length == 0)
            {
                lblMessage.Text = "Invalid request...";
                return;
            }

            HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
            int zid = Convert.ToInt32(dateCookie["user"]);
            int wid = Master.GetWalletID();
            string address = this.Master.YourEthereumAddress.Trim();
            string ip = GetUserIP();
            double amount = Convert.ToDouble(txtSendETHValue.Text.Trim());
            double finalFee = amount * fee;
            string senderethaddress = txtSendETHAddress.Text.Trim();
            string message = txtSendMessage.Text.Trim();
            if (finalFee <= 0.0004)
                finalFee = 0.0004;
            //if (amount < finalFee)
            //{
            //    lblMessage.Text = "Check amount entered (Currently Gas is too high)";
            //    return;
            //}
            if ((amount + finalFee) > Convert.ToDouble(this.Master.WalletBalanceETH.Trim()) || amount <= 0)
            {
                lblMessage.Text = "Please enter valid amount...";
                return;
            }
            double tradePrice = Convert.ToDouble(lblETHAsk.Text.Trim());
            string stmt = string.Format("INSERT INTO transactions (zid, transtype, tdate, tip, amount, fee, cointype,  walletaddress, wid, toaddress, tocointype, usermessage, toamount, zcoinprice) VALUES ({0}, 'sendeth', NOW(), '{1}', {2}, {3}, 'ETH', '{4}', {5}, '{6}', 'ETH', '{7}',{8},{9});", zid, ip, amount, finalFee, address, wid, senderethaddress, message, (amount - finalFee), tradePrice);
            int flag = MySQLHelper.ExecuteNonQuery(connectionString, stmt, null);
            if (flag == 1)
            {
                lblMessage.Text = "Your request has been successfully submitted";
                txtSendETHValue.Text = txtSendETHAddress.Text = txtSendMessage.Text = "";
                //GetAddress();
            }
            else
                lblMessage.Text = "Error occured, Please contact administrator";
            Master.GetAddress();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }
    }
    protected void timer_Tick(object sender, EventArgs e)
    {
        ETHOrderBook();
    }
    protected void btnSellZidduCoins_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage1.Text = "";
            if (txtSellZCNoZCoinsToSell.Text.Trim().Length == 0)
            {
                lblMessage1.Text = "Invalid request...";
                return;
            }
            double zidduCoinsToSell = Convert.ToDouble(txtSellZCNoZCoinsToSell.Text.Trim());
            double convertedZCoinsInETH = zidduCoinsToSell * conversionValue;
            double finalFee = convertedZCoinsInETH * fee;
            HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
            int zid = Convert.ToInt32(dateCookie["user"]);
            int wid = Master.GetWalletID();
            string address = this.Master.YourEthereumAddress.Trim();
            string ip = GetUserIP();
            if (finalFee <= 0.000004)
                finalFee = 0.000004;
            if ((Convert.ToDouble(this.Master.WalletBalanceZidduCoins.Trim())) < zidduCoinsToSell || zidduCoinsToSell <= 0)
            {
                lblMessage1.Text = "Please enter valied amount...";
                return;
            }
            string[] livePrices = hf2.Value.Split(';');
            string[] liveQty = hf3.Value.Split(';');
            double tradePrice = 0;
            if (Convert.ToDouble(txtSellZCNoZCoinsToSell.Text.Trim()) < Convert.ToDouble(liveQty[0]))
                tradePrice = Convert.ToDouble(livePrices[0]);
            else
                tradePrice = (Convert.ToDouble(livePrices[0]) + Convert.ToDouble(livePrices[1])) / 2.0;
            string stmt = string.Format("INSERT INTO transactions (zid, transtype, tdate, tip, amount, fee, cointype, walletaddress, wid, toaddress, tocointype, towid, toamount, zcoinprice) VALUES ({0}, 'sellzc', NOW(), '{1}', {2}, {3}, 'ZWHC', '{4}', {5}, '{6}', 'ETH', '{7}', {8}, {9});", zid, ip, zidduCoinsToSell, finalFee, address, wid, address, wid, (convertedZCoinsInETH - finalFee), tradePrice);
            int flag = MySQLHelper.ExecuteNonQuery(connectionString, stmt, null);
            if (flag == 1)
            {
                lblMessage1.Text = "Your request has been successfully submitted<br />" + "Tx: Redeemed ZWHC " + zidduCoinsToSell + " @ " + tradePrice.ToString();
                txtSellZCNoZCoinsToSell.Text = "0";
            }
            else
                lblMessage1.Text = "Error occured, Please contact administrator";
            Master.GetAddress();
        }
        catch (Exception ex) { }
    }
}