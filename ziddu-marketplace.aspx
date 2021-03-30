<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="ziddu-marketplace.aspx.cs" Inherits="ziddu_marketplace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="assets/js/lib/taffy-min.js"></script>
    <script charset="utf-8" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="https://d3dy5gmtp8yhk7.cloudfront.net/2.1/pusher.min.js?v={{ static_version }}"></script>
    <script>
        var bid = TAFFY();
        var ask = TAFFY();
        $(function () {
            var pusher = new Pusher('de504dc5763aeef9ff52'),
				ordersChannel = pusher.subscribe('live_orders_ethusd');

            $.each(['order_created', 'order_changed', 'order_deleted'], function (eventIndex, eventName) {
                ordersChannel.bind(eventName, function (data) {
                    if (eventName == 'order_created' && data.order_type == 0) {
                        bid.insert({ amount: data.amount, price: data.price });
                    }
                    if (eventName == 'order_deleted' && data.order_type == 0) {
                        bid({ price: data.price }).remove();
                    }
                    if (eventName == 'order_created' && data.order_type == 1) {
                        ask.insert({ amount: data.amount, price: data.price });
                    }
                    if (eventName == 'order_deleted' && data.order_type == 1) {
                        ask({ price: data.price }).remove();
                    }
                    myFunction();
                });
            });
        });
        function myFunction() {
            var placeholder = $('#orders_placeholder');
            placeholder.empty();

            for(var data of bid().order("price desc").get()) {
                placeholder.append('<li>' + data.price.toFixed(2) + ' &nbsp;  &nbsp;  &nbsp; ' + (data.price * <%= conversionValue %>).toFixed(6) + ' &nbsp;  &nbsp;  &nbsp; ' + (data.amount * 3000).toFixed(1) + '</li>');
            }
            var placeholderask = $('#orders_placeholder_ask');
            placeholderask.empty();

            for(var data of ask().order("price asec").get()) {
                placeholderask.append('<li>' + data.price.toFixed(2) + ' &nbsp;  &nbsp;  &nbsp; '  + (data.price * <%= conversionValue %>).toFixed(6) + ' &nbsp;  &nbsp;  &nbsp; ' + (data.amount * 3000).toFixed(1) + '</li>');
            }
        }


        //$(function () {
        //    var placeholder = $('#orders_placeholder'),
        //		pusher = new Pusher('de504dc5763aeef9ff52'),
        //		ordersChannel = pusher.subscribe('live_orders');

        //    $.each(['order_created', 'order_changed', 'order_deleted'], function (eventIndex, eventName) {
        //        ordersChannel.bind(eventName, function (data) {
        //            if ($('ol li').length > 30) {
        //                placeholder.find('li:first').remove();
        //            }
        //            placeholder.append('<li>[' + eventName + '] (' + data.datetime + ') ' + data.id + ': ' + data.amount + ' BTC @ ' + data.price + ' USD ' + ((data.order_type == 0) ? 'BUY' : 'SELL') + '</li>');
        //        });
        //    });
        //});
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="bg-black pt25 pb25">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-9 text-center">
                        <h4 class="color-gray2">Graph 1</h4>
                        <img src="assets/images/graph1.jpg" class="img-responsive" />
                    </div>
                    <div class="col-md-3">
                        <br />
                        <br />
                        <h4 class="color-gray2">ZWHC Market Data ASK</h4>
                        <ul style="list-style-type: none; height: 275px; overflow: hidden; color: yellow;" id="orders_placeholder_ask"></ul>
                        <hr />
                        <h4 class="color-gray2">ZWHC Market Data BID</h4>
                        <ul style="list-style-type: none; height: 275px; overflow: hidden; color: aquamarine;" id="orders_placeholder"></ul>
                    </div>
                    <%--                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8 text-center">
                                <h4 class="color-gray2">Co Relation Graph - ZWHC/ETH</h4>
                                <img src="assets/images/graph1.jpg" class="img-responsive">
                            </div>
                            <div class="col-md-4 text-center">
                                <h4 class="color-gray2">BID/ASK Prices of ZWHC, ETH, BTC etc.,</h4>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

