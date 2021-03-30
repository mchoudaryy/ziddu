<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/Menu.ascx" TagPrefix="uc" TagName="menu" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Ziddu - Marketplace for Decentralized Smart Contracts</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- Favicons -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    <link rel="apple-touch-icon" href="assets/images/ziddu-warehouse-coin.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/72x72-Ziddu.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/114x114_Ziddu.png">

    <!-- Load Core CSS 
        =====================================-->
    <link rel="stylesheet" href="assets/css/core/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/core/animate.min.css">

    <!-- Load Main CSS 
        =====================================-->
    <link rel="stylesheet" href="assets/css/main/main.css">
    <link rel="stylesheet" href="assets/css/color/pasific.css">
    <link rel="stylesheet" href="assets/css/main/setting.css">
    <link rel="stylesheet" href="assets/css/main/hover.css">

    <!-- Load OWL Carousel CSS 
        =====================================-->
    <link rel="stylesheet" href="assets/css/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/icon/font-awesome.css">
    <link rel="stylesheet" href="assets/css/icon/et-line-font.css">

    <!-- Load JS
        HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
        WARNING: Respond.js doesn't work if you view the page via file://
        =====================================-->

    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar" data-offset="100">
    <form id="form1" runat="server">
        <!-- Page Loader
        ===================================== -->
        <div id="pageloader">
            <div class="loader-item">
                <img src="assets/images/puff.svg" alt="loading...">
            </div>
        </div>
        <a href="#page-top" class="go-to-top"><i class="fa fa-long-arrow-up"></i></a>

        <!-- Navigation Area
        ===================================== -->
        <nav class="navbar navbar-pasific navbar-mp megamenu navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"><i class="fa fa-bars"></i></button>
                    <a class="navbar-brand page-scroll" href="default.aspx">
                        <img src="assets/images/ziddu-logo.svg" alt="Ziddu"></a>
                </div>
                <div class="navbar-collapse collapse navbar-main-collapse">
                    <uc:menu runat="server" ID="menu" />
                </div>
            </div>
        </nav>

        <!-- Intro Area
        ===================================== -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <%--<div class="item carousel-img carousel-img1 active">--%>
                <div class="item carousel-img active" id="slide1">
                    <img src="assets/images/slide1.jpg" style="min-height: 500px;" />
                    <div class="container">
                        <div class="carousel-caption animated" data-animation="bounceInLeft" data-animation-delay="50">
                            <h1 class="font-montserrat text-capitalize color-light">The only Marketplace for Decentralized Smart Contracts </h1>
                        </div>
                    </div>
                </div>
                <div class="item carousel-img" id="slide4">
                    <img src="assets/images/slide4.jpg" style="min-height: 500px;" />
                    <div class="container">
                        <div class="carousel-caption animated" data-animation="bounceInLeft" data-animation-delay="50">
                            <h1 class="font-montserrat text-capitalize color-light">Own proprietary Consensus Settlement Algorithm for real-time settlements</h1>
                        </div>
                    </div>
                </div>
                <%--<div class="item carousel-img carousel-img2">--%>
                <div class="item carousel-img" id="slide2">
                    <img src="assets/images/slide2.jpg" style="min-height: 500px;" />
                    <div class="container">
                        <div class="carousel-caption animated" data-animation="bounceInLeft" data-animation-delay="50">
                            <h1 class="font-montserrat text-capitalize color-light">Enabling Blockchain Technology with Judicious and Sensible approach </h1>
                        </div>
                    </div>
                </div>
                <%--<div class="item carousel-img carousel-img3">--%>
                <div class="item carousel-img" id="slide3">
                    <img src="assets/images/slide3.jpg" style="min-height: 500px;" />
                    <div class="container">
                        <div class="carousel-caption animated" data-animation="bounceInLeft" data-animation-delay="50">
                            <h1 class="font-montserrat text-capitalize color-light">Creating a new wave of Innovation and Financial Contracts</h1>
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            <div class="svg-container-bottom">
                <svg id="svgLineTop" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2000 350"
                    preserveAspectRatio="xMinYMax">
                    <polygon points="-150,350 0,300 3000,0 5200,350" fill="#fff" stroke="none"></polygon>
                </svg>
            </div>
        </div>
        <section>
            <div class="container pb50">
                <div class="row">
                    <div class="col-md-4">
                        <h3 class="text-uppercase font-montserrat color-dark">Welcome to the Age of Smart Contracts <small class="heading heading-solid"></small></h3>
                        <h3 class="color-blue font-pacifico">"If it is not in Blockchain, then it is not a Smart Contract"</h3>
                    </div>
                    <div class="col-md-8">
                        <blockquote>
                            <p>
                                <img class="flaticon" src="assets/images/collaboration.svg" style="max-width: 40px; float: left; margin-right: 10px;">The first stage of Cryptocurrency Blockchain is the creation of decentralized money; people will be able to transact with one another without an intermediary Bank
                            </p>
                        </blockquote>
                        <blockquote>
                            <p>
                                <img class="flaticon" src="assets/images/money_transfer.svg" style="max-width: 40px; float: left; margin-right: 10px;">The second stage of concept for Cryptocurrency is beyond money
                            </p>
                        </blockquote>
                        <blockquote>
                            <p>
                                <img class="flaticon" src="assets/images/workflow.svg" style="max-width: 40px; float: left; margin-right: 10px;">The third stage of Cryptocurrency is that it converts itself into smart contracts to be executed
                            </p>
                        </blockquote>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="bg-grad-blue pt25 pb25">
                <div class="container">
                    <div class="row">

                        <!-- Left Content -->
                        <div class="col-md-4 pt25 text-right">
                            <h2 class="color-light font-montserrat">What is a Smart Contract?</h2>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content-box content-box-right-icon mb30">
                                        <span class="icon-shield color-light"></span>
                                        <h4 class="color-light mt-5">Able to trigger rolls according to set conditions</h4>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="content-box content-box-right-icon mb30">
                                        <span class=" icon-clock color-light"></span>
                                        <h4 class="color-light mt-5">Transfer and settle the value in real-time</h4>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="content-box content-box-right-icon mb30">
                                        <span class="icon-anchor color-light"></span>
                                        <h4 class="color-light mt-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Decentralized, yet legally binding </h4>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="content-box content-box-right-icon mb30">
                                        <span class="icon-layers color-light"></span>
                                        <h4 class="color-light mt-5">Transparent access by all parties</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <%--<a href="#" data-toggle="modal" data-target="#myModal">--%>
                            <img src="assets/images/Smart-Contract.png" alt="" class="img-responsive mt50"><%--</a>--%>
                        </div>
                        <!-- Modal -->
                        <div id="myModal" class="modal fade" role="dialog" style="z-index: 999999;">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2 class="modal-title">Ziddu Smart Contract</h2>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                            <img src="assets/images/ziddu-smart-contract.png" style="max-width: 100%;">
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Right Content -->
                        <div class="col-md-4 pt25">
                            <h2 class="color-light font-montserrat">Ziddu Smart Contract</h2>
                            <p class="color-light">Ziddu follows the core principles of Smart Contracts while also using its own algorithms</p>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content-box content-box-left-icon mb30">
                                        <span class="icon-documents color-light"></span>
                                        <h4 class="color-light">Consensus of Parties</h4>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="content-box content-box-left-icon mb30">
                                        <span class="icon-genius color-light"></span>
                                        <h4 class="color-light">Ease of Arbitration</h4>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="content-box content-box-left-icon">
                                        <span class="icon-gears color-light"></span>
                                        <h4 class="color-light">Real-time Execution</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div id="service" class="pt10 pb25">
                <div class="container">
                    <div class="row mt15">
                        <div class="col-md-6 animated fadeInLeft visible" data-animation="fadeInLeft" data-animation-delay="100">
                            <img src="assets/images/technology.png" alt="website service" class="img-responsive">
                        </div>
                        <div class="col-md-5 animated fadeIn visible" data-animation="fadeIn" data-animation-delay="100">
                            <h3 class="font-size-normal">Our Technology </h3>
                            <p class="mt20">Ziddu Ethereum ERC20 Blockchain Token uses a technology stack in which Smart Contracts run in distributed virtual machines, which in turn run on a Consensus Settlement Algorithm (CSA). </p>
                            <p>
                                <strong>It acts in two ways:</strong><br>
                                a) Everyone can see the copy of open ledger, decentralized verification and transparent execution<br>
                                b) Everyone can see the result of contract execution
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container-fluid bg-dark2 pt50 pb50" style="background: url(assets/images/counter-bg.jpg) 100% 50% no-repeat;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center">
                            <h1 class="fs-40 font-size-light text-center color-light">Ziddu Warehouse Coin Market Cap </h1>
                            <br>
                            <br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="fact">
                                <div class="fact-number timer color-light" data-perc="<%= zwcmc %>">$<span class="factor color-light"><%= zwcmc.ToString("###,###,##") %></span> </div>
                                <span class="fact-title color-light alpha7">Market cap in USD</span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="fact">
                                <div class="fact-number timer" data-perc="<%= bzwcmc %>"><i class="fa fa-btc color-light"></i><span class="factor color-light"><%= bzwcmc.ToString("###,###,##") %></span></div>
                                <span class="fact-title color-light alpha7">Market cap in Bitcoin</span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="fact">
                                <div class="fact-number timer" data-perc="<%= ezwcmc %>">
                                    <img src="assets/images/ethereum_icon_white.png" style="max-height: 35px;" />
                                    <span class="factor color-light"><%= ezwcmc.ToString("###,###,##") %></span>
                                </div>
                                <span class="fact-title color-light alpha7">Market cap in Ethereum</span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="fact">
                                <div class="fact-number timer" data-perc="<%= bchzwcmc %>"><i class="fa fa-btc color-light">CH</i> <span class="factor color-light"><%= bchzwcmc.ToString("###,###,##") %></span></div>
                                <span class="fact-title color-light alpha7">Market cap in BitCoinCash</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div id="price" class="bg-gray pt25 pb25">
                <div class="container text-center">

                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center mb10">
                            <h3 class="text-center">Flow of Ziddu Smart Contract <small class="heading heading-solid center-block"></small></h3>
                            <br />
                            <img src="assets/images/ziddu-smart-contract.png" class="img-responsive">
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center mb10">
                            <h3 class="text-center">Ziddu Smart Contract Solutions to FinTech Industry <small class="heading heading-solid center-block"></small></h3>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                            <div class="price price-one bg-light">
                                <div class="price-header">

                                    <h4><i class="fa fa-building-o color-orange" style="font-size: 28px;"></i>
                                        <br>
                                        <br>
                                        Warehouse Financing</h4>
                                </div>
                                <div class="price-footer"><a href="industry.aspx" class="button button-sm button-rounded button-pasific hover-ripple-out">Know more</a> </div>
                            </div>
                        </div>
                        <div class="col-md-2 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4><i class="fa  fa-database color-purple" style="font-size: 28px;"></i>
                                        <br>
                                        <br>
                                        Micro-lending</h4>
                                </div>
                                <div class="price-footer"><a href="industry.aspx#ml" class="button button-sm button-rounded button-purple hover-ripple-out">Know more</a> </div>
                            </div>
                        </div>
                        <div class="col-md-2 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4><i class="fa fa-pie-chart color-pink" style="font-size: 28px;"></i>
                                        <br>
                                        <br>
                                        FX OTC Derivatives</h4>
                                </div>
                                <div class="price-footer"><a href="industry.aspx#fx" class="button button-sm button-rounded button-grad-blood-mary hover-ripple-out">Know more</a> </div>
                            </div>
                        </div>
                        <div class="col-md-2 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4><i class="fa fa-cube color-cyan" style="font-size: 28px;"></i>
                                        <br>
                                        <br>
                                        Bullion Finance</h4>
                                </div>
                                <div class="price-footer"><a href="industry.aspx#blf" class="button button-sm button-rounded button-cyan hover-ripple-out">Know more</a> </div>
                            </div>
                        </div>
                        <div class="col-md-2 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4><i class="fa fa-line-chart color-blue" style="font-size: 28px;"></i>
                                        <br>
                                        <br>
                                        Structured Products</h4>
                                </div>
                                <div class="price-footer"><a href="industry.aspx#sp" class="button button-sm button-rounded button-blue hover-ripple-out">Know more</a> </div>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>

                    <%--  <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center mb10">
                            <h3 class="text-center">Ziddu Warehouse Coin Token Distribution <small class="heading heading-solid center-block"></small></h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 animated pulse visible" data-animation="pulse" data-animation-delay="500">
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4>Ziddu Warehouse Coin: <strong>100,000,000</strong> (One Hundred Million)</h4>
                                </div>
                            </div>
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4>ZWHC Token type: <strong>ERC20</strong></h4>
                                </div>
                            </div>
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4>Purchase methods accepted: <strong>ETH</strong></h4>
                                </div>
                            </div>
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4>Project Type: <strong>Token</strong></h4>
                                </div>
                            </div>
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4>Platform: <strong>Ethereum</strong></h4>
                                </div>
                            </div>
                            <div class="price price-one bg-light">
                                <div class="price-header">
                                    <h4>Category: Micro-lending using Blockchain <strong>Smart Contracts</strong></h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <img src="assets/images/ziddu-warehouse-coin-sm.png" class="img-responsive" />
                        </div>
                    </div>--%>
                </div>
            </div>
        </section>
        <!-- footer Area
        ===================================== -->
        <div class="footer-two bt-solid-1">
            <div class="container-fluid pt20">
                <div class="container">
                    <div class="row">

                        <!-- copyright start -->
                        <div class="col-md-6 col-sm-6 col-xs-6 pull-left">
                            <p class="small">© 2017 Longfin Corp (NASDAQ: LFIN), All Rights Reserved</p>
                        </div>
                        <!-- copyright end -->

                        <!-- footer bottom start -->
                        <div class="col-md-6 col-sm-6 col-xs-6 pull-right"></div>
                        <!-- footer bottom end -->

                    </div>
                    <!-- row end -->
                </div>
                <!-- container end -->
            </div>
            <!-- container-fluid end -->
        </div>
        <!-- footer end -->
        <!-- JQuery Core
        =====================================-->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- JQuery Main
        =====================================-->
        <script src="assets/js/main/jquery.appear.js"></script>
        <script src="assets/js/main/isotope.pkgd.min.js"></script>
        <script src="assets/js/main/parallax.min.js"></script>
        <script src="assets/js/main/jquery.countTo.js"></script>
        <script src="assets/js/main/owl.carousel.min.js"></script>
        <script src="assets/js/main/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/main/main.js"></script>
    </form>
</body>
</html>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-3186158-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-3186158-1');
</script>
