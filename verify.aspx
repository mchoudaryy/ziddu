<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="verify.aspx.cs" Inherits="verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Subheader Area
        ===================================== -->
    <header class="bg-grad-blood-mary mt50">
        <div class="container">
            <div class="row mt20 mb10 ml10">
                <div class="col-md-6 text-left">
                    <h3 class="font-montserrat color-light text-uppercase">Verify</h3>
                </div>
                <div class="col-md-6 text-right pt35"></div>
            </div>
        </div>
    </header>
    <section>
        <div class="bg-gray pt25 pb25">
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center mb10">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <a href="login.aspx" class="button button-md button-blue hover-ripple-out mr10">Click Here to Ziddu ETH Wallet</a>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

