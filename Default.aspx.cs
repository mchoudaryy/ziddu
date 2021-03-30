using System;
using System.Configuration;
using System.Data;
using Ziddu.DBUtility;

public partial class _Default : System.Web.UI.Page
{
    protected double zwcmc = 0;
    protected double bzwcmc = 0;
    protected double ezwcmc = 0;
    protected double bchzwcmc = 0;
    string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetMarketCap();
    }
    private void GetMarketCap()
    {
        try
        {
            string conversionValue = ConfigurationManager.AppSettings["conversionValue"].ToString();
            string stmt = "SELECT a.zwcmc,a.zwcmc / b.btcprice AS bzwcmc, a.zwcmc  / c.ethprice AS ezwcmc, a.zwcmc  / d.bchprice AS bchzwcmc FROM (SELECT CLOSE * " + conversionValue + " * 100000000 AS zwcmc FROM coins_tickdata WHERE symbol = 'ZETH') AS a ";
            stmt += "JOIN (SELECT CLOSE AS btcprice FROM coins_tickdata WHERE symbol = 'BTC') b ";
            stmt += "JOIN (SELECT CLOSE AS ethprice FROM coins_tickdata WHERE symbol = 'ZETH') c ";
            stmt += "JOIN (SELECT CLOSE AS bchprice FROM coins_tickdata WHERE symbol = 'BCH') d; ";
            //stmt += "SELECT bidprice, askprice FROM coins_tickdata_depth WHERE symbol = 'ZETH' AND depth=1;";
            //stmt += "SELECT bidprice1 AS bidprice,askprice1 AS askprice FROM exch_orderbooks WHERE exch='coinbase' AND symbol = 'BTC/USD';";
            //stmt += "SELECT CLOSE AS bidprice, CLOSE + 1.02 AS askprice FROM coins_tickdata WHERE symbol = 'ZETH';";
            //stmt += "SELECT CLOSE AS bidprice, CLOSE + 2.25 AS askprice FROM coins_tickdata WHERE symbol = 'BCH';";
            //stmt += "SELECT * FROM currency_commodity WHERE commoditytype IN ('Currencies','Metals','AGRI','Energy') ORDER BY commoditytype DESC;";

            DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    zwcmc = Convert.ToDouble(ds.Tables[0].Rows[0]["zwcmc"]);
                    bzwcmc = Convert.ToDouble(ds.Tables[0].Rows[0]["bzwcmc"]);
                    ezwcmc = Convert.ToDouble(ds.Tables[0].Rows[0]["ezwcmc"]);
                    bchzwcmc = Convert.ToDouble(ds.Tables[0].Rows[0]["bchzwcmc"]);
                }
                //if (ds.Tables[1].Rows.Count > 0)
                //{
                //    lblZCoinBid.Text = Convert.ToDouble(ds.Tables[1].Rows[0][0]).ToString("0..######");
                //    //lblZCoinAsk_Home.Text = lblZCoinAsk.Text = Convert.ToDouble(ds.Tables[1].Rows[0][1]).ToString("0..######");
                //    lblZCoinAsk.Text = Convert.ToDouble(ds.Tables[1].Rows[0][1]).ToString("0..######");

                //    ticker += string.Format("<li>{0}</br><span class='pricetxt'>{1}</span></li>", "ZWHC/USD", lblZCoinAsk.Text);
                //}
                //if (ds.Tables[2].Rows.Count > 0)
                //{
                //    lblBTCBid.Text = Convert.ToDouble(ds.Tables[2].Rows[0][0]).ToString("0..######");
                //    lblBTCAsk.Text = Convert.ToDouble(ds.Tables[2].Rows[0][1]).ToString("0..######");
                //}
                //if (ds.Tables[3].Rows.Count > 0)
                //{
                //    lblETHBid.Text = Convert.ToDouble(ds.Tables[3].Rows[0][0]).ToString("0..######");
                //    lblETHAsk.Text = Convert.ToDouble(ds.Tables[3].Rows[0][1]).ToString("0..######");
                //}
                //if (ds.Tables[4].Rows.Count > 0)
                //{
                //    lblBCHBid.Text = Convert.ToDouble(ds.Tables[4].Rows[0][0]).ToString("0..######");
                //    lblBCHAsk.Text = Convert.ToDouble(ds.Tables[4].Rows[0][1]).ToString("0..######");

                //}
                //if (ds.Tables[5].Rows.Count > 0)
                //{
                //    foreach (DataRow item in ds.Tables[5].Rows)
                //    {
                //        if (item["commoditytype"].ToString().ToLower() == "currencies")
                //        {
                //            ticker += string.Format("<li>{0}</br><span class='pricetxt'>{1}</span></li>", item["ethdisplaysymbol"].ToString().ToUpper(), Convert.ToDouble(item["eth_conask"]).ToString("0.######"));
                //            ticker += string.Format("<li>{0}</br><span class='pricetxt'>{1}</span></li>", item["displaysymbol"].ToString().ToUpper(), Convert.ToDouble(item["btc_conask"]).ToString("0.######"));
                //        }
                //        else
                //        {
                //            ticker += string.Format("<li>ZWHC/{0} ({2})</br><span class='pricetxt'>{1}</span></li>", item["symbol"].ToString().ToUpper(), Convert.ToDouble(item["zwhc_conask"]).ToString("0.######"), item["zwhcunits"]);
                //            ticker += string.Format("<li>ETH/{0} ({2})</br><span class='pricetxt'>{1}</span></li>", item["symbol"].ToString().ToUpper(), Convert.ToDouble(item["eth_conask"]).ToString("0.######"), item["ethunits"]);
                //            ticker += string.Format("<li>BTC/{0} ({2})</br><span class='pricetxt'>{1}</span></li>", item["symbol"].ToString().ToUpper(), Convert.ToDouble(item["btc_conask"]).ToString("0.######"), item["units"]);
                //        }
                //    }
                //}
            }
        }
        catch (Exception ex)
        {
        }
    }

}