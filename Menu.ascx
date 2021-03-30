<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<ul class="nav navbar-nav">
    <li><a id="home" href="default.aspx" class="active">Home </a></li>
    <li><a id="marketplace" href="marketplace.aspx">Marketplace </a></li>
    <li><a id="industry" href="industry.aspx">Industry </a></li>
    <li class="dropdown"><a id="smartcontract" href="#" data-toggle="dropdown" class="dropdown-toggle color-light">Smart Contract </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="smartcontracts.aspx"><i class="fa  fa-file-text-o"></i>Ziddu Smart Contracts</a></li>
            <li><a href="https://etherscan.io/token/0xf634a7b188b57caa5734b21dfeb735ea2c74b0f5" target="_blank"><i class="fa  fa-connectdevelop"></i>ZWHC Token Tracker</a></li>
            <li><a href="Ziddu_Whitepaper_V1.4.pdf" target="_blank"><i class="fa fa-file-text-o"></i>ZWHC Token White Paper</a></li>
        </ul>
    </li>
    <li><a id="login" href="login.aspx">Login </a></li>
    <li><a id="registerr" href="registerr.aspx">Signup </a></li>
    <li><a id="contact" href="contact.aspx">Contact </a></li>
</ul>
