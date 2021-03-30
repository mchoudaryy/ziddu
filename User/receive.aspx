<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="receive.aspx.cs" Inherits="User_receive" %>

<%@ MasterType VirtualPath="~/User/User.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        <%--function convertZCoinToETH(txt) {
            //Buy ZCoins
            var val = ((txt.value * <%= conversionValue %>) + ((txt.value * <%= conversionValue %>) * <%= fee %>));
            document.getElementById('<%= lblBuyZCConvertedETH.ClientID %>').innerText = val.toPrecision(6);
        }--%>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Timer ID="timer" runat="server" Interval="5000" OnTick="timer_Tick"></asp:Timer>
    <div class="col-sm-6">
        <%--<h4 class="mb10">Receive ETH</h4>--%>
        <div class="form-group align-center text-center" style="word-wrap: break-word;">
            <h3>Currently we are in the process of listing Ziddu tokens in global major crypto exchanges. 
                Once it is listed you can buy Ziddu tokens from the major global crypto exchanges.</h3>
            <%-- <asp:Image ID="imgBarCode" runat="server" Height="160" Width="160" /><br>
            This Is Your Address!<br>
            <strong>
                <asp:Label ID="lblRequestETHAddress" runat="server"></asp:Label></strong><br>
            <em>To receive Ethereum Coins, you just need to share the above address with friends / family.</em>--%>
        </div>

        <%--        <asp:UpdatePanel ID="upBuy" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h4 class="mb10">Receive ZWHC</h4>

                <div class="col-sm-6" style="margin: 0; padding: 0;">
                    <div class="form-group">
                        <asp:TextBox ID="txtBuyZCNoZCoinsToBuy" runat="server" CssClass="form-control input-lg" placeholder="Enter Number of ZWHC" onkeyup="convertZCoinToETH(this);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="well well-sm small">
                        <asp:Label ID="lblBuyZCConvertedETH" runat="server" Text="0"></asp:Label>
                        ETH
                    </div>
                </div>
                <div class="col-sm-5">
                    <asp:Button ID="btnBuyZidduCoins" runat="server" Text="Receive ZWHC" Enabled="false" CssClass="btn btn-primary btn-round" OnClick="btnBuyZidduCoins_Click" />
                </div>
                <div class="col-sm-7">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upBuy">
                        <ProgressTemplate>
                            <h4 style="margin: 3px; padding: 3px;"><i class="fa fa-spinner fa-spin"></i></h4>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div class="col-sm-12">
                    <asp:Label ID="lblMessage" runat="server" CssClass="small red"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <div class="col-sm-4">
        <h4 class="mb10">ZWHC/USD Order Book</h4>
        <asp:UpdatePanel ID="upOrderBook" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="gvOrderBook" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="bidqty" HeaderText="Bid Qty" />
                        <asp:BoundField DataField="bidprice" ItemStyle-CssClass="green" HeaderText="Bid Price" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:n7}" />
                        <asp:BoundField DataField="askprice" ItemStyle-CssClass="red" HeaderText="Ask Price" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:n7}" />
                        <asp:BoundField DataField="askqty" HeaderText="Ask Qty" />
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hf2" runat="server" />
                <asp:HiddenField ID="hf3" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="timer" EventName="tick" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>

