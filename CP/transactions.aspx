<%@ Page Language="C#" MasterPageFile="~/CP/CPanel.master" AutoEventWireup="true" CodeFile="transactions.aspx.cs" Inherits="CP_transactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="col-sm-12 text-center">
            <h3>Transaction Details</h3>
            Search :
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <br />
            <br />
            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                <asp:ListItem Value="all">All</asp:ListItem>
                <asp:ListItem Value="warehouse">Warehouse</asp:ListItem>
                <asp:ListItem Selected="True" Value="receiveeth">Receive ETH</asp:ListItem>
                <asp:ListItem Value="buyzc">Buy Ziddu Coin</asp:ListItem>
                <asp:ListItem Value="sellzc">Sell Ziddu Coin</asp:ListItem>
                <asp:ListItem Value="sendeth">Send ETH</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblCount" runat="server"></asp:Label>
        </div>
    </div>
    <div class="clearfix"></div>
    <br />
    <br />
    <div class="col-sm-12">
        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" CssClass="table1" OnPageIndexChanging="gvData_PageIndexChanging">
            <EmptyDataTemplate>No Records Found</EmptyDataTemplate>
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
            <Columns>
                <asp:BoundField DataField="tid" HeaderText="T Id" />
                <asp:BoundField DataField="zid" HeaderText="Z Id" />
                <asp:BoundField DataField="wid" HeaderText="WId" />
                <asp:BoundField DataField="transtype" HeaderText="Trans Type" />
                <asp:BoundField DataField="tdate" HeaderText="T Date" DataFormatString="{0: yyyy-MMM-dd hh:mm:ss}" HtmlEncode="false" />
                <asp:BoundField DataField="tip" HeaderText="T IP" />
                <asp:BoundField DataField="wstatus" HeaderText="W Status" />
                <asp:BoundField DataField="amount" HeaderText="Amount" />
                <asp:BoundField DataField="fee" HeaderText="Fee" DataFormatString="{0:n10}" HtmlEncode="False" />
                <asp:BoundField DataField="cointype" HeaderText="Coin Type" />
                <asp:BoundField DataField="adminstatus" HeaderText="Admin Status" />
                <asp:BoundField DataField="walletaddress" HeaderText="Wallet Address" />
                <asp:BoundField DataField="toaddress" HeaderText="To Address" />
                <asp:BoundField DataField="tocointype" HeaderText="To Cointype" />
                <asp:BoundField DataField="towid" HeaderText="To Wid" />
                <asp:BoundField DataField="toamount" HeaderText="To Amount" />
                <asp:BoundField DataField="zcoinprice" HeaderText="Ref Price" />
                <asp:BoundField DataField="vcode" HeaderText="Verify Code" />
                <asp:BoundField DataField="vstatus" HeaderText="Verify Status" />
                <asp:BoundField DataField="vip" HeaderText="Verified IP" />
                <asp:BoundField DataField="usermessage" HeaderText="User Message" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

