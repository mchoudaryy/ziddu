using System;
using System.Configuration;
using System.Data;
using Ziddu.DBUtility;

public partial class marketplace : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
    protected string data = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGraph();
    }
    private void BindGraph()
    {
        try
        {
            string strSql = "SELECT * FROM zcoinmarketcapdata order by date;";
            strSql += "SELECT bidprice, askprice FROM coins_tickdata_depth WHERE symbol = 'ZETH' AND depth=1;";
            //strSql += "SELECT bidprice1 AS bidprice,askprice1 AS askprice FROM exch_orderbooks WHERE exch='coinbase' AND symbol = 'BTC/USD';";
            strSql += "SELECT CLOSE AS bidprice, CLOSE + 10.02 AS askprice FROM coins_tickdata WHERE symbol = 'BTC';";
            strSql += "SELECT CLOSE AS bidprice, CLOSE + 1.02 AS askprice FROM coins_tickdata WHERE symbol = 'ZETH';";
            strSql += "SELECT CLOSE AS bidprice, CLOSE + 2.25 AS askprice FROM coins_tickdata WHERE symbol = 'BCH';";
            //string strSql = "SELECT * FROM (SELECT * FROM zcoinmarketcapdata order by date DESC LIMIT 45) t order by date;";
            DataSet ds = MySQLHelper.ExecuteDataset(connectionString, strSql);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    //date += string.Format("\"{0}\",", Convert.ToDateTime(item["date"]).ToShortDateString());
                    //close += string.Format("\"{0}\",", Convert.ToDouble(item["close"]).ToString("0.0#####"));
                    //marketCap += string.Format("\"{0}\",", (Convert.ToInt64(item["marketcap"]) / 1000000).ToString("0.00"));
                    data += string.Format("{0},{1},{2},{3},{4},{5}\\n",
                        Convert.ToDateTime(item["date"]).ToString("yyyy-MM-dd"),
                        Convert.ToDouble(item["open"]).ToString("0.0#####"),
                        Convert.ToDouble(item["high"]).ToString("0.0#####"),
                        Convert.ToDouble(item["low"]).ToString("0.0#####"),
                        Convert.ToDouble(item["close"]).ToString("0.0#####"),
                        //(Convert.ToInt64(item["marketcap"]) / 1000000).ToString("0"));
                        Convert.ToInt64(item["marketcap"]).ToString("0"));
                }
                data = "'" + data + "'";
            }
            if (ds.Tables[1].Rows.Count > 0)
            {
                lblZCoinBid.Text = Convert.ToDouble(ds.Tables[1].Rows[0][0]).ToString("0..######");
                lblZCoinAsk.Text = Convert.ToDouble(ds.Tables[1].Rows[0][1]).ToString("0..######");
            }
            if (ds.Tables[2].Rows.Count > 0)
            {
                lblBTCBid.Text = Convert.ToDouble(ds.Tables[2].Rows[0][0]).ToString("0..######");
                lblBTCAsk.Text = Convert.ToDouble(ds.Tables[2].Rows[0][1]).ToString("0..######");
            }
            if (ds.Tables[3].Rows.Count > 0)
            {
                lblETHBid.Text = Convert.ToDouble(ds.Tables[3].Rows[0][0]).ToString("0..######");
                lblETHAsk.Text = Convert.ToDouble(ds.Tables[3].Rows[0][1]).ToString("0..######");
            }
            if (ds.Tables[4].Rows.Count > 0)
            {
                lblBCHBid.Text = Convert.ToDouble(ds.Tables[4].Rows[0][0]).ToString("0..######");
                lblBCHAsk.Text = Convert.ToDouble(ds.Tables[4].Rows[0][1]).ToString("0..######");
            }
        }
        catch (Exception ex)
        {
        }
    }
}