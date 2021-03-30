using System;
using System.Configuration;
using System.Data;
using Ziddu.DBUtility;

public partial class smartcontracts : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGraph();
    }
    private void BindGraph()
    {
        try
        {
            string strSql = "SELECT * FROM smartcontracts order by sno desc;SELECT sum(notionalvalue) as totalnotionalvalue FROM smartcontracts order by sno desc;";
            DataSet ds = MySQLHelper.ExecuteDataset(connectionString, strSql);
            RepterDetails.DataSource = ds;
            RepterDetails.DataBind();
            lblNoofContracts.Text = ds.Tables[0].Rows.Count.ToString();
            lblTotalNotionalValue.Text = Convert.ToDouble(ds.Tables[1].Rows[0]["totalnotionalvalue"]).ToString("#,###.##");// + " (" + (Convert.ToDouble(ds.Tables[1].Rows[0]["totalnotionalvalue"]) / 1000000.00).ToString("#.##") + " m)";
        }
        catch (Exception ex)
        {
        }
    }
}