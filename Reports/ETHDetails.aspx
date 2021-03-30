<%@ Page Language="C#" MasterPageFile="~/Reports/CPanel.master" AutoEventWireup="true" CodeFile="ETHDetails.aspx.cs" Inherits="Reports_ETHDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="col-sm-12 text-center">
            <p style="font-size: 18px;">
                Total ETHs : <strong><asp:Label ID="lblTotalETH" runat="server"></asp:Label> </strong><br />
                Total Internal ETHs : <strong><asp:Label ID="lblTotalInternalETH" runat="server"></asp:Label> </strong><br />
                Total Global ETHs : <strong><asp:Label ID="lblTotalExternalETH" runat="server"></asp:Label> </strong><br />
                <br />
            </p>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <asp:GridView ID="gvGrid" runat="server"></asp:GridView>
        </div>
        <div class="col-sm-2"></div>
</asp:Content>

