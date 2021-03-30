using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ziddu.DBUtility;

public partial class Reports_OverallReport : System.Web.UI.Page
{
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    public string connectionStringMySqlConnection = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
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
            stmt += "SELECT SUM(tbalance) total FROM walletinfo WHERE tbalance>0 AND zid > 1;";
            stmt += "SELECT SUM(tbalance) total FROM walletinfo WHERE tbalance>0 AND zid IN (3361, 3362, 3363, 3366, 3367, 3383, 3394, 3396, 3397, 3398, 3399, 3421, 3422, 3423, 3424, 3425, 3426, 3427,3,4,7,8);";
            stmt += "SELECT tbalance FROM walletinfo WHERE zid=1;";

            stmt += "SELECT SUM(amount) AS ethamount FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='receiveeth' AND z.refcode IS NULL;";
            stmt += "SELECT SUM(amount) amount,SUM(fee) fee,SUM(toamount) finalamount FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='sendeth' AND z.refcode IS NULL;";

            stmt += "SELECT t.zid,z.email,tdate,amount AS ethamount,walletaddress FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='receiveeth' AND z.refcode IS NULL ORDER BY tdate DESC;";
            stmt += "SELECT t.zid,z.email,tdate,amount AS ethamount,fee,toamount,walletaddress,toaddress FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='sendeth' AND z.refcode IS NULL ORDER BY tdate DESC;";
            stmt += "SELECT t.zid,z.email,tdate,amount AS ethamount,fee,toamount,walletaddress,zcoinprice AS refprice FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='buyzc' AND z.refcode IS NULL ORDER BY tdate DESC;";
            stmt += "SELECT t.zid,z.email,tdate,amount,fee,toamount AS ethamount,walletaddress,zcoinprice AS refprice FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='sellzc' AND z.zid AND z.refcode IS NULL ORDER BY tdate DESC;";
            stmt += "SELECT SUM(amount) ethamount, SUM(toamount) totalbuycoins, SUM(fee) feeineth, SUM(toamount * zcoinprice) / SUM(toamount) buyavgprice FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='buyzc' AND z.refcode IS NULL;";
            stmt += "SELECT SUM(toamount) ethamount, SUM(amount) totalsellcoins,SUM(fee) feeineth,SUM(amount * zcoinprice) / SUM(amount) sellavgprice FROM transactions t JOIN ziddumembers z ON t.zid = z.zid WHERE transtype='sellzc' AND z.zid AND z.refcode IS NULL;";
            stmt += "SELECT SUM(ethbalance) ethbalance,SUM(zcoin) zcoin FROM ziddumembers WHERE refcode IS NULL;";

            DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            double ethPrice = 0, netpleth = 0, netplzc = 0;
            //lblTotalETH.Text = ds.Tables[1].Rows[0]["total"].ToString();
            //lblTotalInternalETH.Text = ds.Tables[2].Rows[0]["total"].ToString();
            lblTotalExternalETH.Text = (Convert.ToDouble(ds.Tables[1].Rows[0]["total"].ToString()) - Convert.ToDouble(ds.Tables[2].Rows[0]["total"].ToString())).ToString("0.########");
            lblMainAddressETH.Text = lblCompanyETHBalance.Text = Convert.ToDouble(ds.Tables[3].Rows[0]["tbalance"]).ToString("0.########");

            lblReceiveETH.Text = Convert.ToDouble(ds.Tables[4].Rows[0]["ethamount"]).ToString("0.########");
            lblSendETH.Text = Convert.ToDouble(ds.Tables[5].Rows[0]["finalamount"]).ToString("0.########");
            lblSendETHFee.Text = Convert.ToDouble(ds.Tables[5].Rows[0]["fee"]).ToString("0.########");
            lblBalanceETH.Text = (Convert.ToDouble(ds.Tables[4].Rows[0]["ethamount"]) - Convert.ToDouble(ds.Tables[5].Rows[0]["amount"])).ToString("0.########");
            lblNetETHFee.Text = (Convert.ToDouble(lblSendETHFee.Text) - 0.03303).ToString("0.########");

            lblTotalHolding.Text = (Convert.ToDouble(lblTotalExternalETH.Text) + Convert.ToDouble(lblMainAddressETH.Text)).ToString("0.########");

            lblBuyZidduCoinsinETH.Text = Convert.ToDouble(ds.Tables[10].Rows[0]["ethamount"]).ToString("0.########");
            lblBuyZidduCoins.Text = Convert.ToDouble(ds.Tables[10].Rows[0]["totalbuycoins"]).ToString("0.########");
            lblBuyAvgZidduCoins.Text = Convert.ToDouble(ds.Tables[10].Rows[0]["buyavgprice"]).ToString("0.########");
            lblBuyFee.Text = Convert.ToDouble(ds.Tables[10].Rows[0]["feeineth"]).ToString("0.########");
            lblSellZidduCoinsinETH.Text = Convert.ToDouble(ds.Tables[11].Rows[0]["ethamount"]).ToString("0.########");
            lblSellZidduCoins.Text = Convert.ToDouble(ds.Tables[11].Rows[0]["totalsellcoins"]).ToString("0.########");
            lblSellAvgZidduCoins.Text = Convert.ToDouble(ds.Tables[11].Rows[0]["sellavgprice"]).ToString("0.########");
            lblSellFee.Text = Convert.ToDouble(ds.Tables[11].Rows[0]["feeineth"]).ToString("0.########");
            lblGlobalDistributedZidduCoins.Text = (Convert.ToDouble(ds.Tables[10].Rows[0]["totalbuycoins"]) - Convert.ToDouble(ds.Tables[11].Rows[0]["totalsellcoins"])).ToString("0.########");
            lblGlobalDistributedZidduCoinsinETH.Text = (Convert.ToDouble(lblGlobalDistributedZidduCoins.Text) * Convert.ToDouble(ConfigurationManager.AppSettings["conversionValue"].ToString())).ToString("0.########");

            netpleth = Convert.ToDouble(lblBuyZidduCoinsinETH.Text) - (Convert.ToDouble(lblSellZidduCoinsinETH.Text) + Convert.ToDouble(lblGlobalDistributedZidduCoinsinETH.Text));
            lblCompanyNetPL.Text = netpleth.ToString("0.########");

            gvGridReceiveETH.DataSource = ds.Tables[6];
            gvGridReceiveETH.DataBind();
            gvGridReceiveETH.Caption = "Receive ETH";
            gvGridSendETH.DataSource = ds.Tables[7];
            gvGridSendETH.DataBind();
            gvGridSendETH.Caption = "Send ETH";

            gvGridBuyZC.DataSource = ds.Tables[8];
            gvGridBuyZC.DataBind();
            gvGridBuyZC.Caption = "Buy ZWHC";
            gvGridSellZC.DataSource = ds.Tables[9];
            gvGridSellZC.DataBind();
            gvGridSellZC.Caption = "Sell ZWHC";


            ds = MySQLHelper.ExecuteDataset(connectionStringMySqlConnection, "SELECT CLOSE AS bidprice, CLOSE + 1.02 AS askprice FROM coins_tickdata WHERE symbol = 'ZETH';SELECT * FROM coins_tickdata_depth WHERE symbol='ZETH' ORDER BY depth;");
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                ethPrice = Convert.ToDouble(ds.Tables[0].Rows[0]["bidprice"]);
                lblCompanyETHBalanceInUSD.Text = (Convert.ToDouble(lblCompanyETHBalance.Text) * Convert.ToDouble(ds.Tables[0].Rows[0]["bidprice"])).ToString("0.####");
                lblCompanyNetPL.Text += " ($" + (Convert.ToDouble(lblCompanyNetPL.Text) * Convert.ToDouble(ds.Tables[0].Rows[0]["bidprice"])).ToString("0.####") + ")";
                lblNetETHFee.Text += " ($" + (Convert.ToDouble(lblNetETHFee.Text) * Convert.ToDouble(ds.Tables[0].Rows[0]["bidprice"])).ToString("0.####") + ")";
            }
            if (ds != null && ds.Tables[1].Rows.Count > 0)
            {
                lblSellAvgZidduCoins.Text = (((Convert.ToDouble(lblGlobalDistributedZidduCoins.Text) * Convert.ToDouble(ds.Tables[1].Rows[0]["bidprice"])) + (Convert.ToDouble(lblSellAvgZidduCoins.Text) * Convert.ToDouble(lblSellZidduCoins.Text))) / (Convert.ToDouble(lblGlobalDistributedZidduCoins.Text) + Convert.ToDouble(lblSellZidduCoins.Text))).ToString("0.########");
                lblZidduCoinNetPL.Text = ((Convert.ToDouble(lblBuyAvgZidduCoins.Text) - (((Convert.ToDouble(lblGlobalDistributedZidduCoins.Text) * Convert.ToDouble(ds.Tables[1].Rows[0]["bidprice"])) + (Convert.ToDouble(lblSellAvgZidduCoins.Text) * Convert.ToDouble(lblSellZidduCoins.Text))) / (Convert.ToDouble(lblGlobalDistributedZidduCoins.Text) + Convert.ToDouble(lblSellZidduCoins.Text)))) * Convert.ToDouble(lblBuyZidduCoins.Text)).ToString("0.####");
                netplzc = Convert.ToDouble(lblZidduCoinNetPL.Text) / ethPrice;
                lblZidduCoinNetPL.Text = netplzc.ToString("0.####") + " ($" + lblZidduCoinNetPL.Text + ")";
            }
            lblETHNetPL.Text = (netpleth - netplzc).ToString("0.####") + " ($" + ((netpleth - netplzc) * ethPrice).ToString("0.####") + ")";
        }
        catch (Exception ex) { }
    }
}