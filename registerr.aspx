<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="registerr.aspx.cs" Inherits="registerr" %>

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
                        url: "registerr.aspx/VerifyCaptcha",
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
                    <h3 class="font-montserrat color-light text-uppercase">Signup</h3>
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
                    <div class="col-md-6 bg-gray pt25 pb25">
                        <div class="contact">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="input-md input-rounded form-control" placeholder="name" MaxLength="125" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtRegisterEMail" runat="server" CssClass="input-md input-rounded form-control" placeholder="email ID" MaxLength="125" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtRegisterPassword" runat="server" TextMode="Password" CssClass="input-md input-rounded form-control" placeholder="password" MaxLength="35" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtRegisterConPassword" runat="server" TextMode="Password" CssClass="input-md input-rounded form-control" placeholder="confirm password" MaxLength="35" required></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtRegisterConPassword" ControlToCompare="txtRegisterPassword" ForeColor="Red" ErrorMessage="CompareValidator"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="col-md-6 small">
                                <div class="form-group">
                                    Please upload your Passport or any Identification Copy Certificate (KYC Document)
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:FileUpload ID="fuKYC" runat="server" />
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
                            <div class="col-sm-6 mt10 text-center mb20">
                                <asp:Button ID="btnRegister" CssClass="button-3d button-md button-block button-grad-blood-mary hover-ripple-out" runat="server" Text="Register" OnClick="btnRegister_Click" />
                            </div>
                            <div class="col-sm-12 text-center">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                <br />
                                <a href="login.aspx" class="color-dark">Already member? Login Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
