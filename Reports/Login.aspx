<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="CP_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Ziddu</title>
    <link rel="shortcut icon" href="../assets/images/favicons/favicon.ico" />
    <!-- Default stylesheets-->
    <link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" />
    <link href="../assets/lib/animate.css/animate.css" rel="stylesheet" />
    <link href="../assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../assets/lib/et-line-font/et-line-font.css" rel="stylesheet" />
    <link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet" />
    <link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet" />
    <link href="../assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet" />
    <link href="../assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet" />
    <!-- Main stylesheet and color file-->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <%--<link id="color-scheme" href="../assets/css/colors/default.css" rel="stylesheet" />--%>
</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="10">
    <form id="form1" runat="server">
        <main>
  <div class="page-loader">
    <div class="loader">Loading...</div>
  </div>
  <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
        <a class="navbar-brand" href="../Default.aspx"><img src="../assets/images/ZCoin-logo.png"></a><span class="small" style="color: #efefef;" >Beta</span> </div>
      <div class="collapse navbar-collapse" id="custom-collapse">
        <%--<ul class="nav navbar-nav navbar-right">
            <li><a href="../Default.aspx">Home</a> </li>
            <li><a href="UserDetails.aspx">User Details</a></li>
            <li><a href="WallerInfo.aspx">Wallet Details</a></li>
            <li><a href="transactions.aspx">Transaction Details</a></li>
            <li><a href="BalanceChecking.aspx">Recive ETH</a></li>
            <li><a href="Logout.aspx">Logout</a></li>
        </ul>--%>
      </div>
    </div>
  </nav>
              <div class="main">
<section class="module bg-dark-60 contact-page-header bg-dark" data-background="../assets/images/about_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <h2 class="module-title font-alt">Login with Ziddu</h2>
                    <div class="module-subtitle font-serif">Ziddu Warehouse Coin is powered by Ethereum ERC20 token standard.</div>
                </div>
            </div>
        </div>
    </section>
    <section class="module">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
 </div>
            </div>
            <div class="row">
                <div class="col-sm-5 col-sm-offset-1 mb-sm-40">
                    <h4 class="font-alt">Login</h4>
                    <hr class="divider-w mb-10">
                    <div class="form-group">
                        <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name" ></asp:TextBox>
</div>
                    <div class="form-group"><asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
            </div>
                    <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>

        </div>
        <div class="col-sm-5">
          &nbsp;
        </div>
      </div>
    </div>
        <br />
        <br /><br /><br />
  </section>
        <hr class="divider-d">
    <footer class="footer bg-dark">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
          </div>
          <div class="col-sm-6"> 
          </div>
        </div>
      </div>
    </footer>
  </div>
  <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
</main>
        <!--  
    JavaScripts
    =============================================
    -->
        <script src="../assets/lib/jquery/dist/jquery.js"></script>
        <script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="../assets/lib/wow/dist/wow.js"></script>
        <%--<script src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>--%>
        <script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
        <script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
        <%--<script src="../assets/lib/flexslider/jquery.flexslider.js"></script>--%>
        <%--<script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>--%>
        <script src="../assets/lib/smoothscroll.js"></script>
        <%--<script src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
        <script src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>--%>
        <script src="../assets/js/plugins.js"></script>
        <script src="../assets/js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
        <script src="../assets/js/morris.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.js"></script>
        <script src="../assets/js/example.js"></script>
    </form>
</body>
</html>
<script type="text/javascript">
    if (document.URL.toLowerCase().indexOf("contact") > 0)
        document.getElementById("contact").className = 'activemenu';
    else if (document.URL.toLowerCase().indexOf("price") > 0)
        document.getElementById("price").className = 'activemenu';
    else if (document.URL.toLowerCase().indexOf("industry") > 0)
        document.getElementById("industry").className = 'activemenu';
    else if (document.URL.toLowerCase().indexOf("warehouse") > 0)
        document.getElementById("warehouse").className = 'activemenu';
    else if (document.URL.toLowerCase().indexOf("marketplace") > 0 || document.URL.toLowerCase().indexOf("signin") > 0)
        document.getElementById("marketplace").className = 'activemenu';
</script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-3186158-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-3186158-1');
</script>
