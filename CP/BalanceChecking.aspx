<%@ Page Title="" Language="C#" MasterPageFile="~/CP/CPanel.master" AutoEventWireup="true" CodeFile="BalanceChecking.aspx.cs" Inherits="CP_BalanceChecking" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="col-sm-12 text-center">
            <h3>Recive ETH</h3>
            <asp:Label ID="lblMessage" runat="server" CssClass="red"></asp:Label>
            <asp:Label ID="lblCount" runat="server"></asp:Label>
        </div>
    </div>
    <div class="clearfix"></div>
    <br />
    <br />
    <div class="col-sm-12">
        <asp:GridView ID="gvData" CssClass="table1" runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="1300" OnRowCommand="gvData_RowCommand">
            <EmptyDataTemplate>No Records Found</EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField="wid" HeaderText="wid" />
                <asp:BoundField DataField="zid" HeaderText="zid" />
                <asp:BoundField DataField="email" HeaderText="email" />
                <asp:HyperLinkField DataNavigateUrlFields="waddress" Target="_blank" HeaderText="address" DataNavigateUrlFormatString="https://etherscan.io/address/{0}" DataTextField="waddress" />
                <asp:BoundField DataField="ethbalance" HeaderText="ETH Balance" DataFormatString="{0:n8}" HtmlEncode="false" />
                <asp:BoundField DataField="tbalance" HeaderText="Live Site Balance" DataFormatString="{0:n8}" HtmlEncode="false" />
                <asp:BoundField DataField="diff" HeaderText="Diff" DataFormatString="{0:n8}" HtmlEncode="false" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" Text="Confirm Receive ETH" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

