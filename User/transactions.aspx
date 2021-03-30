<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="transactions.aspx.cs" Inherits="User_transactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="col-sm-10">
        <h4 class="font-alt mb-0">Transactions</h4>
        <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="transtype" HeaderText="Trans Type" />
                <asp:BoundField DataField="tdate" HeaderText="Date" />
                <asp:BoundField DataField="wstatus" HeaderText="Status" />
                <asp:BoundField DataField="amount" HeaderText="Amount" />
                <asp:BoundField DataField="fee" HeaderText="Fee" DataFormatString="{0:0.0#####}" />
                <asp:BoundField DataField="cointype" HeaderText="Coin Type" />
                <asp:BoundField DataField="walletaddress" HeaderText="Wallet Address" />
                <asp:BoundField DataField="toaddress" HeaderText="To Address" />
                <asp:BoundField DataField="toamount" HeaderText="To Amount" />
                <asp:BoundField DataField="tocointype" HeaderText="To Coin Type" />
                <asp:BoundField DataField="usermessage" HeaderText="Message" />
                <asp:BoundField DataField="zcoinprice" HeaderText="Ref Price" />
            </Columns>
        </asp:GridView>
    </div></asp:Content>

