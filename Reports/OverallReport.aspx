<%@ Page Language="C#" MasterPageFile="~/Reports/CPanel.master" AutoEventWireup="true" CodeFile="OverallReport.aspx.cs" Inherits="Reports_OverallReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        table {
            border: 1px solid #ccc;
            border-collapse: collapse;
            margin: 0;
            padding: 0;
            width: 100%;
            table-layout: fixed;
            font-size: 12px;
        }

            table caption {
                font-size: 1.5em;
                margin: .5em 0 .75em;
                color: #333;
                font-weight: 700;
            }

            table tr, table td {
                border: 1px solid #ddd;
                padding: .35em;
                color: #333;
            }

            table th, table td {
                padding: .315em;
                word-wrap: break-word;
            }

            table th {
                font-size: 1em;
                letter-spacing: 0em;
                text-transform: uppercase;
                font-weight: 600;
                background-color: #F0F0F0;
                border-color: #ddd;
                text-align: center;
            }

        .content {
            background:;
            padding: 3px;
        }

        .neutral {
            background-color: #999;
            color: #000;
        }

        .positive {
            background-color: #468847;
        }

        .negative {
            background-color: #ce4844;
        }

        .green {
            color: #090;
        }

        .red {
            color: #F00;
        }

        .blue {
            color: #039;
        }

        .toUpper {
            text-transform: uppercase;
        }

        h1, h2, h3, h4, h5 {
            text-align: left;
            margin: 10px;
            padding: 10px;
        }

        .agribg {
            background-color: #090;
            color: #fff;
        }

        .metalbg {
            background-color: #039;
            color: #fff;
        }

        .energybg {
            background-color: #F00;
            color: #fff;
        }

        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="well col-sm-5 alert-danger">
            <h4 class="blue" style="margin-left: 0;">
                <img src="../assets/images/ZCoin-icon_red.png" style="max-height: 30px;">&nbsp;  <strong>ZWHC Details</strong></h4>
            <p style="font-size: 16px;">
                Company Name : <strong>Longfin Corp</strong><br />
                Website URL : <strong><a href="http://www.longfincorp.com/" target="_blank">longfincorp.com</a></strong><br />
                eMail address : <strong>info@longfincorp.com</strong><br />
                Wallet Address : <strong><a href="https://etherscan.io/address/0xe031dca342d9c43e0a9b2ff198f46284f1f7523d" target="_blank">0xe031dca342d9c43e0a9b2ff198f46284f1f7523d</a> </strong>
                <br />
                ETH Balance : <strong>
                    <asp:Label ID="lblCompanyETHBalance" runat="server"></asp:Label></strong><br />
                ETH USD Value : <strong>$
                    <asp:Label ID="lblCompanyETHBalanceInUSD" runat="server"></asp:Label></strong><br />
            </p>
        </div>
        <div class="well col-sm-4 alert-success">
            <h4 class="blue" style="margin-left: 0;">
                <img src="../assets/images/eth_icon.png" style="max-height: 30px;" />&nbsp;  <strong>ETH Consolidated</strong></h4>
            <p style="font-size: 18px;">
                Receive ETH : <strong>
                    <asp:Label ID="lblReceiveETH" runat="server"></asp:Label></strong><br />
                Redeem ETH : <strong>
                    <asp:Label ID="lblSendETH" runat="server"></asp:Label></strong><br />
                Redeem ETH Fees (Received) : <strong>
                    <asp:Label ID="lblSendETHFee" runat="server"></asp:Label></strong><br />
                Redeem ETH Fees (Paid) : <strong>0.03303</strong><br />
                Net Fees : <strong>
                    <asp:Label ID="lblNetETHFee" runat="server"></asp:Label></strong><br />
                Balance ETH : <strong>
                    <asp:Label ID="lblBalanceETH" runat="server"></asp:Label></strong><br />
                <hr />
                Total Holding : <strong>
                    <asp:Label ID="lblTotalHolding" runat="server"></asp:Label></strong>
                <br />
                Users Wallet : <strong>
                    <asp:Label ID="lblTotalExternalETH" runat="server"></asp:Label>
                </strong>
                <br />
                Company Wallet : <strong>
                    <asp:Label ID="lblMainAddressETH" runat="server"></asp:Label></strong><br />
                <br />
                <br />
            </p>
        </div>

        <div class="well col-sm-3 alert-info ">
            <h4 class="blue" style="margin-left: 0;">
                <img src="../assets/images/ZCoin-icon_red.png" style="max-height: 30px;" />&nbsp;  <strong>ZWHC Distributed Coins</strong></h4>
            <p style="font-size: 16px;">
                Total Ziddu coins created : <strong>100 Million</strong><br />
                <a href="#buyzc">Buy Ziddu Coins</a> : <strong>
                    <asp:Label ID="lblBuyZidduCoins" runat="server"></asp:Label></strong><br />
                Converted Coins in ETH : <strong>
                    <asp:Label ID="lblBuyZidduCoinsinETH" runat="server"></asp:Label></strong><br />
                <a href="#sellzc">Sell Ziddu Coins</a> : <strong>
                    <asp:Label ID="lblSellZidduCoins" runat="server"></asp:Label></strong><br />
                Converted Coins in ETH : <strong>
                    <asp:Label ID="lblSellZidduCoinsinETH" runat="server"></asp:Label></strong><br />
                Holding Coins : <strong>
                    <asp:Label ID="lblGlobalDistributedZidduCoins" runat="server"></asp:Label></strong><br />
                Holding Coins in ETH : <strong>
                    <asp:Label ID="lblGlobalDistributedZidduCoinsinETH" runat="server"></asp:Label></strong><br />
                <hr />
                Ziddu coins Buy Avg Price : <strong>
                    <asp:Label ID="lblBuyAvgZidduCoins" runat="server"></asp:Label></strong><br />
                Ziddu coins Sell Avg Price : <strong>
                    <asp:Label ID="lblSellAvgZidduCoins" runat="server"></asp:Label></strong><br />

                Fee Received / Paid for Buy : <strong>
                    <asp:Label ID="lblBuyFee" runat="server"></asp:Label>
                    / 0.061053</strong><br />
                Fee Received / Paid for Sell : <strong>
                    <asp:Label ID="lblSellFee" runat="server"></asp:Label>
                    / 0.0375</strong><br />

                Ziddu Coin Net PL : <strong><asp:Label ID="lblZidduCoinNetPL" runat="server"></asp:Label></strong><br />
                ETH Net PL : <strong><asp:Label ID="lblETHNetPL" runat="server"></asp:Label></strong><br />
                Company Net PL in ETH : <strong><asp:Label ID="lblCompanyNetPL" runat="server"></asp:Label></strong><br />
            </p>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-1"></div>
        <div class="col-sm-5">
            <a id="receiveeth"></a>
            <asp:GridView ID="gvGridReceiveETH" runat="server"></asp:GridView>
            <a id="buyzc"></a>
            <asp:GridView ID="gvGridBuyZC" runat="server"></asp:GridView>
        </div>
        <div class="col-sm-5">
            <a id="sendeth"></a>
            <asp:GridView ID="gvGridSendETH" runat="server"></asp:GridView>
            <a id="sellzc"></a>
            <asp:GridView ID="gvGridSellZC" runat="server"></asp:GridView>
        </div>
        <div class="col-sm-1"></div>
</asp:Content>

