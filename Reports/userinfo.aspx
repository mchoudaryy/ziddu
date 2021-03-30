<%@ Page Language="C#" MasterPageFile="~/Reports/CPanel.master" AutoEventWireup="true" CodeFile="userinfo.aspx.cs" Inherits="Reports_userinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="col-sm-12 text-center">
            <p style="font-size: 18px;">
                <h3>Registered User Info</h3>
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
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <asp:GridView ID="gvGrid" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="REGDATETIME" HeaderText="Reg Date" DataFormatString="{0:yyyy-MMM-dd}" />
                    <asp:TemplateField HeaderText="Total Users">
                        <ItemTemplate>
                            <a href="userdetails.aspx?d=<%# Convert.ToDateTime(Eval("REGDATETIME")).ToString("yyyy-MM-dd") %>"><%#(Eval("TOTALUSERS")) %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="VERIFIED" HeaderText="Verified Users" />
                    <asp:BoundField DataField="NONVERIFIED" HeaderText="Non-Verified Users" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-sm-2"></div>
</asp:Content>

