<%@ Page Language="C#" MasterPageFile="~/CP/CPanel.master" AutoEventWireup="true" CodeFile="WallerInfo.aspx.cs" Inherits="CP_WallerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="col-sm-6">
            <h3>Wallet Details</h3>
            Search :
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <div class="col-sm-6">
            <asp:GridView ID="gvCount" runat="server" CssClass="table1"></asp:GridView>
        </div>
    </div>
    <div class="clearfix"></div>
    <br />
    <br />
    <div class="col-sm-12">
        <asp:GridView ID="gvData" CssClass="table1" runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="10" OnPageIndexChanging="gvData_PageIndexChanging">
            <EmptyDataTemplate>No Records Found</EmptyDataTemplate>
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
            <Columns>
                <asp:BoundField DataField="wid" HeaderText="WId" />
                <asp:BoundField DataField="zid" HeaderText="ZId" />
                <asp:HyperLinkField DataNavigateUrlFields="waddress" Target="_blank" HeaderText="Wallet Address" DataNavigateUrlFormatString="https://etherscan.io/address/{0}" DataTextField="waddress" />
                <asp:BoundField DataField="status" HeaderText="Status" />
                <asp:BoundField DataField="wtype" HeaderText="Wallet Type" />
                <asp:BoundField DataField="accountname" HeaderText="Account Name" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

