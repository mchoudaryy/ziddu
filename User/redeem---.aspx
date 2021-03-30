<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="redeem.aspx.cs" Inherits="User_redeem" %>

<%@ MasterType VirtualPath="~/User/User.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function convertETHToZCoin(txt) {
            //Sell ZCoins
            var val = (txt.value * <%= conversionValue %>) - ((txt.value * <%= conversionValue %>) * <%= fee %>);
            document.getElementById('<%= lblSellZCConvertedZCoin.ClientID %>').innerText = val.toPrecision(6);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Timer ID="timer" runat="server" Interval="5000" OnTick="timer_Tick"></asp:Timer>
    <div class="col-sm-6">
        <asp:UpdatePanel ID="upBuy" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h4 class="mb10">Redeem ETH</h4>
                <br>

                <div class="form-group">
                    <asp:TextBox ID="txtSendETHAddress" runat="server" CssClass="form-control input-lg" placeholder="Enter Receivers Address"></asp:TextBox>
                </div>
                <div class="col-sm-6" style="margin: 0; padding: 0;">
                    <div class="form-group">
                        <asp:TextBox ID="txtSendETHValue" runat="server" CssClass="form-control input-lg" placeholder="Enter ETH Value"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-6">
                </div>
                <div class="col-sm-12" style="margin: 0; padding: 0;">
                    <div class="form-group">
                        <asp:TextBox ID="txtSendMessage" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="2" placeholder="Your Message*"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="form-group">
                        <asp:Button ID="btnSendSubmit" runat="server" Text="Submit" CssClass="button button-md button-rounded button-primary" OnClick="btnSendSubmit_Click" />
                    </div>
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
        </asp:UpdatePanel>
        <div class="clearfix"></div>
        <asp:UpdatePanel ID="upSell" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h4 class="mb10">Redeem ZWHC</h4>
                <br>
                <div class="col-sm-6" style="margin: 0; padding: 0;">
                    <div class="form-group">
                        <asp:TextBox ID="txtSellZCNoZCoinsToSell" runat="server" CssClass="form-control input-lg" placeholder="Enter Number of ZWH" onkeyup="convertETHToZCoin(this);"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="well well-sm small">
                        <asp:Label ID="lblSellZCConvertedZCoin" runat="server" Text="0"></asp:Label>
                        ETH
                    </div>
                </div>
                <div class="col-sm-5" style="margin: 0; padding: 0;">
                    <div class="form-group">
                        <asp:Button ID="btnSellZidduCoins" runat="server" Text="Redeem ZWHC" CssClass="button button-md button-rounded button-danger" OnClick="btnSellZidduCoins_Click" />
                    </div>
                </div>
                <div class="col-sm-7">
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upSell">
                        <ProgressTemplate>
                            <h4 style="margin: 3px; padding: 3px;"><i class="fa fa-spinner fa-spin"></i></h4>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div class="col-sm-12">
                    <asp:Label ID="lblMessage1" runat="server" CssClass="small red"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="col-sm-4">
        <h4 class="mb10">ETH/USD Price</h4>
        <asp:UpdatePanel ID="upOrderBook" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-sm-6 alert alert-info text-center">
                    <strong>BID Price</strong><br>
                    $                   
                    <asp:Label ID="lblETHBid" runat="server"></asp:Label>
                </div>
                <div class="col-sm-6 alert alert-info text-center">
                    <strong>ASK Price</strong><br>
                    $
                    <asp:Label ID="lblETHAsk" runat="server"></asp:Label>
                </div>
                <h4 class="mb10">ZWHC/USD Order Book</h4>
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

