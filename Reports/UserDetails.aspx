<%@ Page Language="C#" MasterPageFile="~/Reports/CPanel.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="Reports_UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="col-sm-12 text-center">
            <p style="font-size: 18px;">
                <h3>
                    <asp:Label ID="lblHeading" runat="server" Text="User Details"></asp:Label>
                </h3>
                Total Registered Users : <strong>
                    <asp:Label ID="lblTotalRegisteredUsers" runat="server"></asp:Label>
                </strong>
                <br />
                Total Email Verified Users : <strong>
                    <asp:Label ID="lblTotalVerifiedUsers" runat="server"></asp:Label>
                </strong>
                <br />
                Total Email Non-Verified Users : <strong>
                    <asp:Label ID="lblTotalNonVerifiedUsers" runat="server"></asp:Label>
                </strong>
                <br />
                <br />
            </p>
        </div>
        <div class="clearfix"></div>
        <br />
        <br />
        <div class="col-sm-12">
            <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" CssClass="table1">

                <EmptyDataTemplate>No Records Found</EmptyDataTemplate>
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

