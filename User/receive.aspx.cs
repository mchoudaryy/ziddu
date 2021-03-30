using QRCoder;
using System;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using Ziddu.DBUtility;

public partial class User_receive : System.Web.UI.Page
{
    protected double fee = Convert.ToDouble(ConfigurationManager.AppSettings["fee"].ToString());
    protected double conversionValue = Convert.ToDouble(ConfigurationManager.AppSettings["conversionValue"].ToString());
    public string connectionString = ConfigurationManager.ConnectionStrings["MySqlZidduConnection"].ConnectionString;
    public string connectionStringMySqlConnection = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        if (dateCookie == null)
            Response.Redirect("../login.aspx");
        if (!Page.IsPostBack)
            GetAddress();
        ZidduOrderBook();
    }
    private void GetAddress()
    {
        //try
        //{
        ////    HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        ////    int zid = Convert.ToInt32(dateCookie["user"].ToString().Trim());
        //HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        //string[] cookieResult = Ziddu.Utility.GetDecryptValue(dateCookie["ziddu"].ToString()).Split(';');
        //int zid = Convert.ToInt32(cookieResult[1].Replace("user:", ""));
        //    if (zid > 0)
        //    {
        //        string stmt = string.Format("SELECT * FROM walletinfo WHERE wtype = 'mist' AND STATUS=1 AND zid = {0};SELECT * FROM ziddumembers WHERE zid = {0} AND status=1;", zid);
        //        DataSet ds = MySQLHelper.ExecuteDataset(connectionString, stmt);
        //        if (ds != null && ds.Tables[0].Rows.Count > 0)
        //        {
        //            lblRequestETHAddress.Text = ds.Tables[0].Rows[0]["waddress"].ToString();
        //            QRCodeGenerator qrGenerator = new QRCodeGenerator();
        //            QRCodeData qrCodeData = qrGenerator.CreateQrCode(ds.Tables[0].Rows[0]["waddress"].ToString(), QRCodeGenerator.ECCLevel.Q);
        //            QRCode qrCode = new QRCode(qrCodeData);

        //            using (Bitmap bitMap = qrCode.GetGraphic(20))
        //            {
        //                using (MemoryStream ms = new MemoryStream())
        //                {
        //                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
        //                    byte[] byteImage = ms.ToArray();
        //                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
        //                }
        //            }
        //        }
        //    }
        //}
        //catch (Exception ex)
        //{
        //    //lblMessage.Text = ex.ToString();
        //}
    }
    public void ZidduOrderBook()
    {
        try
        {
            DataSet ds = MySQLHelper.ExecuteDataset(connectionStringMySqlConnection, "SELECT * FROM coins_tickdata_depth WHERE symbol='ZETH' ORDER BY depth;");
            gvOrderBook.DataSource = ds.Tables[0];
            gvOrderBook.DataBind();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                hf2.Value = string.Format("{0};{1}", ds.Tables[0].Rows[0]["askprice"].ToString(),
                    ds.Tables[0].Rows[1]["askprice"].ToString());
                hf3.Value = string.Format("{0};{1}", ds.Tables[0].Rows[0]["askqty"].ToString(),
                   ds.Tables[0].Rows[1]["askqty"].ToString());
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
    protected void btnBuyZidduCoins_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    lblMessage.Text = "";
        //    if (txtBuyZCNoZCoinsToBuy.Text.Trim().Length == 0)
        //    {
        //        lblMessage.Text = "Invalid request...";
        //        return;
        //    }
        ////    HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        ////    int zid = Convert.ToInt32(dateCookie["user"]);
        //HttpCookie dateCookie = HttpContext.Current.Request.Cookies["ckziddu"];
        //string[] cookieResult = Ziddu.Utility.GetDecryptValue(dateCookie["ziddu"].ToString()).Split(';');
        //int zid = Convert.ToInt32(cookieResult[1].Replace("user:", ""));
        //    int wid = Master.GetWalletID();
        //    double convertedETH = Convert.ToDouble(txtBuyZCNoZCoinsToBuy.Text.Trim()) * conversionValue;
        //    double finalFee = convertedETH * fee;
        //    string address = this.Master.YourEthereumAddress;
        //    string ip = GetUserIP();
        //    if (finalFee <= 0.00002)
        //        finalFee = 0.00002;
        //    if ((convertedETH + finalFee) > Convert.ToDouble(this.Master.WalletBalanceETH.Trim()) || Convert.ToDouble(txtBuyZCNoZCoinsToBuy.Text.Trim()) <= 0)
        //    {
        //        lblMessage.Text = "Please enter valid amount...";
        //        return;
        //    }
        //    string[] livePrices = hf2.Value.Split(';');
        //    string[] liveQty = hf3.Value.Split(';');
        //    double tradePrice = 0;
        //    if (Convert.ToDouble(txtBuyZCNoZCoinsToBuy.Text.Trim()) < Convert.ToDouble(liveQty[0]))
        //        tradePrice = Convert.ToDouble(livePrices[0]);
        //    else
        //        tradePrice = (Convert.ToDouble(livePrices[0]) + Convert.ToDouble(livePrices[1])) / 2.0;

        //    string stmt = string.Format("INSERT INTO transactions (zid, transtype, tdate, tip, amount, fee, cointype, walletaddress, wid, toaddress, tocointype, towid, toamount, zcoinprice) VALUES ({0}, 'buyzc', NOW(), '{1}', {2}, {3}, 'ETH', '{4}', {5}, '{6}', 'ZWHC', '{7}',{8},{9});", zid, ip, convertedETH, finalFee, address, wid, address, wid, txtBuyZCNoZCoinsToBuy.Text.Trim(), tradePrice);
        //    int flag = MySQLHelper.ExecuteNonQuery(connectionString, stmt, null);
        //    if (flag == 1)
        //    {
        //        lblMessage.Text = "Your request has been successfully submitted<br />" + "Tx: Received ZWHC " + txtBuyZCNoZCoinsToBuy.Text.Trim() + " @ " + tradePrice.ToString();
        //        txtBuyZCNoZCoinsToBuy.Text = "";
        //    }
        //    else
        //        lblMessage.Text = "Error occured, Please contact administrator";
        //    Master.GetAddress();
        //}
        //catch (Exception ex)
        //{
        //    lblMessage.Text = ex.Message;
        //}
    }
    protected void timer_Tick(object sender, EventArgs e)
    {
        ZidduOrderBook();
    }
}