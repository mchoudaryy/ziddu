<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="marketplace.aspx.cs" Inherits="marketplace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Subheader Area
        ===================================== -->
    <header class="bg-grad-blood-mary mt50">
        <div class="container">
            <div class="row mt20 mb10 ml10">
                <div class="col-md-6 text-left">
                    <h3 class="font-montserrat color-light text-uppercase">Marketplace<small class="color-light alpha7">For Decentralized Smart Contracts</small></h3>
                </div>
                <div class="col-md-6 text-right pt35"></div>
            </div>
        </div>
    </header>
    <section>
        <div class="pt25 pb25">
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-4 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                        <div class="col-sm-12 mb-0 mt-0 pb-0 text-center">
                            <h5 class="mt-0 mb-0 text-center">
                                <img src="assets/images/ZCoin-icon_red.png" style="max-height: 20px;">&nbsp; <strong>ZWHC-USD</strong></h5>
                            <div class="col-sm-6 alert alert-warning text-center">
                                <strong>BID Price</strong><br>
                                $<asp:Label ID="lblZCoinBid" runat="server"></asp:Label>
                            </div>
                            <div class="col-sm-6 alert alert-warning text-center">
                                <strong>ASK Price</strong><br>
                                $<asp:Label ID="lblZCoinAsk" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-0 mt-0 text-center">
                            <h5 class="mt-0 mb-0 text-center"><i class="fa fa-btc"></i>&nbsp; <strong>BTC-USD</strong></h5>
                            <div class="col-sm-6 alert alert-info text-center">
                                <strong>BID Price</strong><br>
                                $<asp:Label ID="lblBTCBid" runat="server"></asp:Label>
                            </div>
                            <div class="col-sm-6 alert alert-info text-center">
                                <strong>ASK Price</strong><br>
                                $<asp:Label ID="lblBTCAsk" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-0 mt-0 text-center">
                            <h5 class="mt-0 mb-0 text-center">
                                <img src="assets/images/eth_icon.png" style="max-height: 20px;">&nbsp; <strong>ETH-USD</strong></h5>
                            <div class="col-sm-6 alert alert-danger text-center">
                                <strong>BID Price</strong><br>
                                $<asp:Label ID="lblETHBid" runat="server"></asp:Label>
                            </div>
                            <div class="col-sm-6 alert alert-danger text-center">
                                <strong>ASK Price</strong><br>
                                $<asp:Label ID="lblETHAsk" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-0 mt-0 text-center">
                            <h5 class="mt-0 mb-0 text-center"><i class="fa fa-btc"><strong>C</strong></i>&nbsp; <strong>BCH-USD</strong></h5>
                            <div class="col-sm-6 alert alert-success text-center">
                                <strong>BID Price</strong><br>
                                $<asp:Label ID="lblBCHBid" runat="server"></asp:Label>
                            </div>
                            <div class="col-sm-6 alert alert-success text-center">
                                <strong>ASK Price</strong><br>
                                $<asp:Label ID="lblBCHAsk" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 animated pulse visible bg-light" data-animation="pulse" data-animation-delay="500">
                        <h4>Ziddu Warehouse Coin Market Capitalization</h4>
                        <br>
                        <br>
                        <div id="container" style="height: 350px;"></div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center pb35">
                            <br>
                            <h4>Click here to create / login to your wallet</h4>
                            <a href="login.aspx" class="button button-md button-blue hover-ripple-out mr10">Ziddu ETH Wallet</a> <a href="https://etherscan.io/token/0xf634a7b188b57caa5734b21dfeb735ea2c74b0f5" target="_blank" class="button button-md button-pasific hover-ripple-out">ZWHC Blockchain Token Tracker</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-base.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-stock.min.js"></script>
    <script type="text/javascript">
        anychart.onDocumentReady(function () {
            var dataTable = anychart.data.table();
            dataTable.addData(<%=data%>);
            var mapping = dataTable.mapAs({ 'value': 4 });
            var mc = dataTable.mapAs({ 'value': 5 });
            var chart = anychart.stock();
            chart.padding(10, 50, 20, 50);
            var plot = chart.plot(0);
            plot.line().data(mc).name('Market Cap in USD ').stroke('2px #64b5f6');
            chart.scroller().line(mapping);
            chart.container('container');
            chart.draw();
        });
    </script>
</asp:Content>
