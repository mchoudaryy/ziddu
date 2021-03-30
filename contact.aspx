<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer></script>
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "contact.aspx/VerifyCaptcha",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var captchaResponse = jQuery.parseJSON(r.d);
                            if (captchaResponse.success) {
                                $("[id*=txtCaptcha]").val(captchaResponse.success);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                var error = captchaResponse["error-codes"][0];
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                            }
                        }
                    });
                }
            });
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Subheader Area
        ===================================== -->
    <header class="bg-grad-blood-mary mt50">
        <div class="container">
            <div class="row mt20 mb10 ml10">
                <div class="col-md-6 text-left">
                    <h3 class="font-montserrat color-light text-uppercase">Contact us</h3>
                </div>
                <div class="col-md-6 text-right"></div>
            </div>
        </div>
    </header>
    <section>
        <div class="pt25 pb25">
            <!-- title and short description start -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 text-center bg-gray pt25 pb25 mb30">
                        <div class="contact">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="input-md input-rounded form-control" placeholder="Name*" MaxLength="300" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-md input-rounded form-control" placeholder="Email*" MaxLength="300" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input-md input-rounded form-control" placeholder="Phone*" MaxLength="30" required />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="4" data-gramm="true"
                                        placeholder="Message*" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div id="dvCaptcha"></div>
                                    <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                                    <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                                        runat="server" ForeColor="Red" Display="Dynamic" />
                                </div>
                            </div>
                            <div class="col-sm-12 mt10 text-center mb20">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="button-3d button-md button-block button-grad-blood-mary hover-ripple-out" OnClick="btnSubmit_Click" />
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

