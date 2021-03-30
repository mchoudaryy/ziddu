<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="smartcontracts.aspx.cs" Inherits="smartcontracts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Subheader Area
        ===================================== -->
    <header class="bg-grad-blood-mary mt50">
        <div class="container">
            <div class="row mt20 mb10 ml10">
                <div class="col-md-12 text-left">
                    <h3 class="font-montserrat color-light">Total Notional Value of Smart Contracts Executed as on <%=  DateTime.Now.ToString("MM-dd-yyyy") %></h3>
                </div>
            </div>
        </div>
    </header>
    <section>
        <div class="pt25 pb25" style="min-height: 550px;">
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-4 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                        <div class="price price-one bg-gray">
                            <div class="price-header">
                                <h3>Total Notional Value<br>
                                    <strong style="font-size: 20pt;">USD
                                        <asp:Label ID="lblTotalNotionalValue" runat="server"></asp:Label></strong></h3>
                            </div>
                        </div>
                        <div class="price price-one bg-gray">
                            <div class="price-header">
                                <h3>No. of Contracts<br>
                                    <strong style="font-size: 20pt;">
                                        <asp:Label ID="lblNoofContracts" runat="server"></asp:Label></strong></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/TPr9dchs_I8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        <br>
                        <br>
                        <asp:Repeater ID="RepterDetails" runat="server">
                            <HeaderTemplate>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 75%;"><i class="fa fa-files-o"></i>&nbsp;&nbsp;Contract Address</th>
                                            <th style="width: 25%;">Notional Value (USD)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align: left;"><a target="_blank" href="https://etherscan.io/tx/<%#Eval("hashaddress") %>"><i class="fa fa-file-text-o"></i>&nbsp;&nbsp;<%#Eval("hashaddress") %></a></td>
                                    <td style="text-align: right;"><%# Convert.ToDouble(Eval("NOTIONALVALUE")).ToString("###,###.##") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

