<%@ Page Title="" Language="C#" MasterPageFile="~/CP/CPanel.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="CP_UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="col-sm-6">
            <h3>User Details</h3>
            Search :
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <div class="col-sm-6">
            <asp:GridView ID="gvCount" runat="server" AutoGenerateColumns="false" CssClass="table1">
                <Columns>
                    <asp:BoundField DataField="VERIFIED" HeaderText="Verified" />
                    <asp:BoundField DataField="Noofrecords" HeaderText="Count" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="clearfix"></div>
    <br />
    <br />
    <div class="col-sm-12">
        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" OnPageIndexChanging="gvData_PageIndexChanging"
            CssClass="table1">

            <EmptyDataTemplate>No Records Found</EmptyDataTemplate>
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
            <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
            <Columns>
                <asp:BoundField DataField="zid" HeaderText="ZId" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <%# Ziddu.Utility.GetCountryFullName(Eval("country").ToString()) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="email" HeaderText="eMail" />
                <asp:BoundField DataField="ethbalance" HeaderText="ETH Balance" />
                <asp:BoundField DataField="zcoin" HeaderText="ZHWC Balance" />
                <asp:BoundField DataField="status" HeaderText="Status" />
                <asp:BoundField DataField="verified" HeaderText="Verified" />
                <asp:BoundField DataField="ip" HeaderText="IP" />
                <asp:BoundField DataField="regdatetime" HeaderText="Reg Date" DataFormatString="{0: yyyy-MMM-dd hh:mm:ss}" HtmlEncode="false" />
                <asp:BoundField DataField="verifiedip" HeaderText="Verified IP" />
                <asp:BoundField DataField="verifieddatetime" HeaderText="Verified Date" DataFormatString="{0: yyyy-MMM-dd hh:mm:ss}" HtmlEncode="false" />
                 <asp:TemplateField HeaderText="KYC Files">
                    <ItemTemplate>
                        <a target="_blank" href="http://www.ziddu.com/KYCFiles/<%# Eval("filename").ToString() %>">Click Here</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="regcode" HeaderText="Reg Code" />
                <asp:BoundField DataField="refcode" HeaderText="Ref Code" />--%>
                <%--<asp:BoundField DataField="password" HeaderText="Pwd" />--%>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

