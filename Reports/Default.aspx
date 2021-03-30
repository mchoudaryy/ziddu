<%@ Page Language="C#" MasterPageFile="~/Reports/CPanel.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Reports_Default" %>

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
                background:;
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

        body, td, th {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="col-sm-12 text-center">
            <p style="font-size: 18px;">
                Total Ziddu coins created : <strong>100 Million</strong><br />
                Total Distributed Ziddu Coins : <strong>923517.15609</strong><br />
                Internal Distributed Ziddu Coins: <strong>804943</strong><br />
                Global Distributed Ziddu Coins : <strong>118574.15609</strong><br />
                Ziddu coins Buy Avg Price : <strong>0.1829255</strong><br />
                Ziddu coins Sell Avg Price : <strong>0.1931121</strong><br />
            </p>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-6">
            <table align="center" cellpadding="0" cellspacing="0">
                <col />
                <col />
                <col />
                <col span="2" />
                <col />
                <col />
                <tr>
                    <td colspan="7" align="center" style="background-color: #BDBDFF;">
                        <h3>BOUGHT</h3>
                    </td>
                </tr>
                <tr>
                    <td><strong>DATE</strong></td>
                    <td><strong>ZID</strong></td>
                    <td><strong>EMAIL ID</strong></td>
                    <td><strong>ETH </strong></td>
                    <td><strong>FEES</strong></td>
                    <td><strong>ZIDDU PRICE</strong></td>
                    <td><strong>ZIDDU COINS</strong></td>
                </tr>
                <tr>
                    <td>Dec-15-2017</td>
                    <td>17</td>
                    <td>dholmen@thuntek.net</td>
                    <td align="right">0.0714</td>
                    <td align="right">0.000143</td>
                    <td align="right">0.144302</td>
                    <td align="right">340</td>
                </tr>
                <tr>
                    <td>Dec-15-2017</td>
                    <td>16</td>
                    <td>zoubcivil@hotmail.com</td>
                    <td align="right">0.2289</td>
                    <td align="right">0.000458</td>
                    <td align="right">0.144256</td>
                    <td align="right">1090</td>
                </tr>
                <tr>
                    <td>Dec-15-2017</td>
                    <td>15</td>
                    <td>jonathanjeck@gmx.net</td>
                    <td align="right">0.021</td>
                    <td align="right">0.000042</td>
                    <td align="right">0.143016676</td>
                    <td align="right">102</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>70</td>
                    <td>acuevas665@gmail.com</td>
                    <td align="right">0.132</td>
                    <td align="right">0.000264</td>
                    <td align="right">0.155828</td>
                    <td align="right">600</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>99</td>
                    <td>Jpnichols33728@yahoo.com</td>
                    <td align="right">0.55</td>
                    <td align="right">0.0011</td>
                    <td align="right">0.156498</td>
                    <td align="right">2500</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>192</td>
                    <td>laoyipay@msn.com</td>
                    <td align="right">0.96</td>
                    <td align="right">0.00192</td>
                    <td align="right">0.175794</td>
                    <td align="right">4150</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>192</td>
                    <td>laoyipay@msn.com</td>
                    <td align="right">7.2</td>
                    <td align="right">0.0144</td>
                    <td align="right">0.175232</td>
                    <td align="right">37390</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>66</td>
                    <td>nitingoyal28@gmail.com</td>
                    <td align="right">0.245</td>
                    <td align="right">0.00049</td>
                    <td align="right">0.179728</td>
                    <td align="right">1750</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>185</td>
                    <td>john100t9@gmail.com</td>
                    <td align="right">0.0245</td>
                    <td align="right">0.000049</td>
                    <td align="right">0.182256</td>
                    <td align="right">100</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>192</td>
                    <td>laoyipay@msn.com</td>
                    <td align="right">0.0098</td>
                    <td align="right">0.00002</td>
                    <td align="right">0.183676</td>
                    <td align="right">40</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>213</td>
                    <td>william_16212@hotmail.com</td>
                    <td align="right">0.11025</td>
                    <td align="right">0.00022</td>
                    <td align="right">0.180019</td>
                    <td align="right">450</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>220</td>
                    <td>saninnovator@gmail.com</td>
                    <td align="right">0.02989</td>
                    <td align="right">0.00006</td>
                    <td align="right">0.179806</td>
                    <td align="right">122</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>226</td>
                    <td>jay.maheshkar@gmail.com</td>
                    <td align="right">1.13631</td>
                    <td align="right">0.002273</td>
                    <td align="right">0.188188</td>
                    <td align="right">8714</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>240</td>
                    <td>seant2000@yahoo.com</td>
                    <td align="right">1.4945</td>
                    <td align="right">0.002989</td>
                    <td align="right">0.180429</td>
                    <td align="right">6100</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>246</td>
                    <td>kemvelgwo@gmail.com</td>
                    <td align="right">0.00637</td>
                    <td align="right">0.000013</td>
                    <td align="right">0.186541</td>
                    <td align="right">11410</td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>269</td>
                    <td>pacivys@gmail.com</td>
                    <td align="right">0.988</td>
                    <td align="right">0.001976</td>
                    <td align="right">0.186662</td>
                    <td align="right">4000</td>
                </tr>
                <tr>
                    <td>Dec-20-2017</td>
                    <td>569</td>
                    <td>soundsignal@comcast.net</td>
                    <td align="right">0.98</td>
                    <td align="right">0.00196</td>
                    <td align="right">0.200306</td>
                    <td align="right">4070</td>
                </tr>
                <tr>
                    <td>Dec-20-2017</td>
                    <td>425</td>
                    <td>bunty_goyal@yahoo.com</td>
                    <td align="right">0.2544</td>
                    <td align="right">0.000509</td>
                    <td align="right">0.199369</td>
                    <td align="right">1060</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>66</td>
                    <td>nitingoyal28@gmail.com</td>
                    <td align="right">0.245</td>
                    <td align="right">0.00049</td>
                    <td align="right">0.179728</td>
                    <td align="right">1750</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>260</td>
                    <td>790502216@qq.com</td>
                    <td align="right">0.49</td>
                    <td align="right">0.00098</td>
                    <td align="right">0.187703</td>
                    <td align="right">10000</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>285</td>
                    <td>khurram.dara@gmail.com</td>
                    <td align="right">1.21524</td>
                    <td align="right">0.00243</td>
                    <td align="right">0.187124</td>
                    <td align="right">4929</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>81</td>
                    <td>rubaeltigani@gmail.com</td>
                    <td align="right">0.092825</td>
                    <td align="right">0.000186</td>
                    <td align="right">0.195965</td>
                    <td align="right">395</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>212</td>
                    <td>remymel@yahoo.com</td>
                    <td align="right">0.0245</td>
                    <td align="right">0.000049</td>
                    <td align="right">0.187883</td>
                    <td align="right">100</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>339</td>
                    <td>sauravyashaswee@gmail.com</td>
                    <td align="right">1.990625</td>
                    <td align="right">0.003981</td>
                    <td align="right">0.189202</td>
                    <td align="right">8179</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>339</td>
                    <td>sauravyashaswee@gmail.com</td>
                    <td align="right">1.990625</td>
                    <td align="right">0.003981</td>
                    <td align="right">0.189202</td>
                    <td align="right">8179</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>443</td>
                    <td>Bobbunda@hotmail.com</td>
                    <td align="right">1.08</td>
                    <td align="right">0.00216</td>
                    <td align="right">0.196518</td>
                    <td align="right">4592</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>248</td>
                    <td>avinashm@hotmail.com</td>
                    <td align="right">1.297275</td>
                    <td align="right">0.002595</td>
                    <td align="right">0.189433</td>
                    <td align="right">1103</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>309</td>
                    <td>kimnate2013@gmail.com</td>
                    <td align="right">0.031605</td>
                    <td align="right">0.000063</td>
                    <td align="right">0.18913</td>
                    <td align="right">400</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>315</td>
                    <td>sethollila@yahoo.com</td>
                    <td align="right">0.235</td>
                    <td align="right">0.00047</td>
                    <td align="right">0.188025</td>
                    <td align="right">1000</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>209</td>
                    <td>sandeepjadala@gmail.com</td>
                    <td align="right">0.00098</td>
                    <td align="right">0.000002</td>
                    <td align="right">0.179926</td>
                    <td align="right">4</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>1051</td>
                    <td>414694629@qq.com</td>
                    <td align="right">0.07755</td>
                    <td align="right">0.000155</td>
                    <td align="right">0.191603</td>
                    <td align="right">330</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>677</td>
                    <td>bjacob238@yahoo.com</td>
                    <td align="right">0.27025</td>
                    <td align="right">0.00054</td>
                    <td align="right">0.204089</td>
                    <td align="right">2150</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>610</td>
                    <td>Kni9716@hotmail.com</td>
                    <td align="right">0.36472</td>
                    <td align="right">0.000729</td>
                    <td align="right">0.193726</td>
                    <td align="right">1552</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>776</td>
                    <td>edwardbham@aol.com</td>
                    <td align="right">0.090005</td>
                    <td align="right">0.00018</td>
                    <td align="right">0.196869</td>
                    <td align="right">461.97609</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>804</td>
                    <td>Mravan200@gmail.com</td>
                    <td align="right">0.011985</td>
                    <td align="right">0.000024</td>
                    <td align="right">0.196293</td>
                    <td align="right">51</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>673</td>
                    <td>sandeepjha84@gmail.com</td>
                    <td align="right">0.06288</td>
                    <td align="right">0.000126</td>
                    <td align="right">0.20352</td>
                    <td align="right">262</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>663</td>
                    <td>ziddu@seamonster.co.uk</td>
                    <td align="right">0.03149</td>
                    <td align="right">0.000063</td>
                    <td align="right">0.193283</td>
                    <td align="right">135</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>595</td>
                    <td>gpicken@hotmail.com</td>
                    <td align="right">0.0168</td>
                    <td align="right">0.000034</td>
                    <td align="right">0.199075</td>
                    <td align="right">75</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>595</td>
                    <td>gpicken@hotmail.com</td>
                    <td align="right">0.0168</td>
                    <td align="right">0.000034</td>
                    <td align="right">0.199075</td>
                    <td align="right">75</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>507</td>
                    <td>nkengcrypto@gmail.com</td>
                    <td align="right">0.11976</td>
                    <td align="right">0.00024</td>
                    <td align="right">0.196644</td>
                    <td align="right">499</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>497</td>
                    <td>pelepcm@gmail.com</td>
                    <td align="right">0.24941</td>
                    <td align="right">0.000499</td>
                    <td align="right">0.193987</td>
                    <td align="right">1018</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>459</td>
                    <td>miro708@yahoo.com</td>
                    <td align="right">0.01242</td>
                    <td align="right">0.000025</td>
                    <td align="right">0.194258</td>
                    <td align="right">2,309.01</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>382</td>
                    <td>chirag_p2829@yahoo.com</td>
                    <td align="right">0.5684</td>
                    <td align="right">0.001137</td>
                    <td align="right">0.194732</td>
                    <td align="right">2320</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>373</td>
                    <td>mel22gd@gmail.com</td>
                    <td align="right">0.056595</td>
                    <td align="right">0.000113</td>
                    <td align="right">0.195463</td>
                    <td align="right">231.18</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>458</td>
                    <td>joanieann@gmail.com</td>
                    <td align="right">0.049735</td>
                    <td align="right">0.000099</td>
                    <td align="right">0.198979</td>
                    <td align="right">203</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>399</td>
                    <td>sandrockroman@gmail.com</td>
                    <td align="right">0.1645</td>
                    <td align="right">0.000329</td>
                    <td align="right">0.19702</td>
                    <td align="right">818</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>360</td>
                    <td>logik1092@gmail.com</td>
                    <td align="right">0.1911</td>
                    <td align="right">0.000382</td>
                    <td align="right">0.195165</td>
                    <td align="right">780</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>333</td>
                    <td>stephenfburt@gmail.com</td>
                    <td align="right">1.49695</td>
                    <td align="right">0.002994</td>
                    <td align="right">0.189131</td>
                    <td align="right">6110</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>329</td>
                    <td>mismels@yahoo.com</td>
                    <td align="right">0.088125</td>
                    <td align="right">0.000176</td>
                    <td align="right">0.193853</td>
                    <td align="right">375</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>291</td>
                    <td>mlmravi1122@gmail.com</td>
                    <td align="right">0.8892</td>
                    <td align="right">0.001778</td>
                    <td align="right">0.187442</td>
                    <td align="right">3600</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>954</td>
                    <td>reneleon850@gmail.com</td>
                    <td align="right">0.128545</td>
                    <td align="right">0.000257</td>
                    <td align="right">0.188096</td>
                    <td align="right">547</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>2061</td>
                    <td>praveen.maths@gmail.com</td>
                    <td align="right">0.262965</td>
                    <td align="right">0.000526</td>
                    <td align="right">0.187381</td>
                    <td align="right">2119</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>453</td>
                    <td>Teamglobalsales07@gmail.com</td>
                    <td align="right">0.75435</td>
                    <td align="right">0.001509</td>
                    <td align="right">0.191294</td>
                    <td align="right">3212</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>592</td>
                    <td>ksh19241@naver.com</td>
                    <td align="right">0.94</td>
                    <td align="right">0.00188</td>
                    <td align="right">0.19523</td>
                    <td align="right">4000</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>1321</td>
                    <td>riyas4260@gmail.com</td>
                    <td align="right">0.09917</td>
                    <td align="right">0.000198</td>
                    <td align="right">0.196954</td>
                    <td align="right">422</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>1914</td>
                    <td>yogesh.bhanushali@ymail.com</td>
                    <td align="right">0.720745</td>
                    <td align="right">0.001441</td>
                    <td align="right">0.185928</td>
                    <td align="right">3407</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>1822</td>
                    <td>vinyjagu@gmail.com</td>
                    <td align="right">0.99499</td>
                    <td align="right">0.00199</td>
                    <td align="right">0.195766</td>
                    <td align="right">4234</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>1387</td>
                    <td>faridsabri.box@gmail.com</td>
                    <td align="right">0.997575</td>
                    <td align="right">0.001995</td>
                    <td align="right">0.194905</td>
                    <td align="right">4245</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>443</td>
                    <td>Bobbunda@hotmail.com</td>
                    <td align="right">0.658</td>
                    <td align="right">0.001316</td>
                    <td align="right">0.179116</td>
                    <td align="right">5225</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>2583</td>
                    <td>mvinay.5285@gmail.com</td>
                    <td align="right">0.1457</td>
                    <td align="right">0.000291</td>
                    <td align="right">0.172026</td>
                    <td align="right">1000</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>126</td>
                    <td>Srikanth9491tatipaka@gmail.com</td>
                    <td align="right">2.2795</td>
                    <td align="right">0.00228</td>
                    <td align="right">0.163648</td>
                    <td align="right">15525</td>
                </tr>
                <tr>
                    <td>Dec-24-2017</td>
                    <td>1889</td>
                    <td>dpksharma730@gmail.com</td>
                    <td align="right">0.0846</td>
                    <td align="right">0.000085</td>
                    <td align="right">0.156731</td>
                    <td align="right">364</td>
                </tr>
                <tr>
                    <td>Dec-24-2017</td>
                    <td>2921</td>
                    <td>shrivernicholas@gmail.com</td>
                    <td align="right">0.04982</td>
                    <td align="right">0.00005</td>
                    <td align="right">0.156558</td>
                    <td align="right">212</td>
                </tr>
                <tr>
                    <td>Dec-25-2017</td>
                    <td>301</td>
                    <td>pramakrishna@gmail.com</td>
                    <td align="right">0.02009</td>
                    <td align="right">0.00004</td>
                    <td align="right">0.18772</td>
                    <td align="right">941</td>
                </tr>
                <tr>
                    <td>Dec-25-2017</td>
                    <td>2921</td>
                    <td>shrivernicholas@gmail.com</td>
                    <td align="right">0.04982</td>
                    <td align="right">0.00005</td>
                    <td align="right">0.156558</td>
                    <td align="right">212</td>
                </tr>
                <tr>
                    <td>Dec-25-2017</td>
                    <td>1889</td>
                    <td>dpksharma730@gmail.com</td>
                    <td align="right">0.0846</td>
                    <td align="right">0.000085</td>
                    <td align="right">0.156731</td>
                    <td align="right">364</td>
                </tr>
                <tr>
                    <td>Dec-26-2017</td>
                    <td>1550</td>
                    <td>pavansgmpl@gmail.com</td>
                    <td align="right">0.0047</td>
                    <td align="right">0.000005</td>
                    <td align="right">0.176177</td>
                    <td align="right">80</td>
                </tr>
                <tr>
                    <td>Dec-27-2017</td>
                    <td>1550</td>
                    <td>pavansgmpl@gmail.com</td>
                    <td align="right">0.235</td>
                    <td align="right">0.000235</td>
                    <td align="right">0.173605</td>
                    <td align="right">4,229</td>
                </tr>
                <tr>
                    <td>Dec-27-2017</td>
                    <td>3218</td>
                    <td>paidimarrianusha25@gmail.com</td>
                    <td align="right">0.036425</td>
                    <td align="right">0.000036</td>
                    <td align="right">0.174224</td>
                    <td align="right">155</td>
                </tr>
                <tr>
                    <td>Dec-29-2017</td>
                    <td>3573</td>
                    <td>manishparekh2020@gmail.com</td>
                    <td align="right">0.18471</td>
                    <td align="right">0.000185</td>
                    <td align="right">0.164556</td>
                    <td align="right">786</td>
                </tr>
                <tr>
                    <td>Jan-02-2018</td>
                    <td>466</td>
                    <td>BRITT.PATE@GMAIL.COM</td>
                    <td align="right">0.07473</td>
                    <td align="right">0.000107</td>
                    <td align="right">0.199993</td>
                    <td align="right">318</td>
                </tr>
                <tr>
                    <td>Jan-02-2018</td>
                    <td>3521</td>
                    <td>velicheti.suresh@yahoo.co.in</td>
                    <td align="right">0.008225</td>
                    <td align="right">0.00002</td>
                    <td align="right">0.202396</td>
                    <td align="right">35</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td align="right"><strong>199606.1701</strong></td>
                </tr>
            </table>
        </div>
        <div class="col-sm-6">
            <table cellspacing="0" cellpadding="0">
                <col />
                <col />
                <col />
                <col span="2" />
                <col />
                <col />
                <tr>
                    <td colspan="7" align="center" style="background-color: #F9DDB5;">
                        <h3>SOLD</h3>
                    </td>
                </tr>
                <tr>
                    <td><strong>DATE</strong></td>
                    <td><strong>ZID</strong></td>
                    <td><strong>EMAIL ID</strong></td>
                    <td><strong>ETH </strong></td>
                    <td><strong>FEES</strong></td>
                    <td><strong>ZIDDU PRICE</strong></td>
                    <td><strong>ZIDDU COINS</strong></td>
                </tr>
                <tr>
                    <td>Dec-18-2017</td>
                    <td>99</td>
                    <td>Jpnichols33728@yahoo.com</td>
                    <td align="right">0.5988</td>
                    <td align="right">0.0012</td>
                    <td align="right">0.172336</td>
                    <td align="right">2500</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>192</td>
                    <td>laoyipay@msn.com</td>
                    <td align="right">4.6906</td>
                    <td align="right">0.0094</td>
                    <td align="right">0.196628</td>
                    <td align="right">31,580</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>339</td>
                    <td>sauravyashaswee@gmail.com</td>
                    <td align="right">1.918221</td>
                    <td align="right">0.003844</td>
                    <td align="right">0.194969</td>
                    <td align="right">8179</td>
                </tr>
                <tr>
                    <td>Dec-21-2017</td>
                    <td>66</td>
                    <td>nitingoyal28@gmail.com</td>
                    <td align="right">0.245</td>
                    <td align="right">0.00049</td>
                    <td align="right">0.179728</td>
                    <td align="right">1750</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>260</td>
                    <td>790502216@qq.com</td>
                    <td align="right">2.3453</td>
                    <td align="right">0.0047</td>
                    <td align="right">0.182617</td>
                    <td align="right">10000</td>
                </tr>
                <tr>
                    <td>Dec-22-2017</td>
                    <td>382</td>
                    <td>chirag_p2829@yahoo.com</td>
                    <td align="right">0.54411</td>
                    <td align="right">0.00109</td>
                    <td align="right">0.179579</td>
                    <td align="right">2320</td>
                </tr>
                <tr>
                    <td>Dec-25-2017</td>
                    <td>1822</td>
                    <td>vinyjagu@gmail.com</td>
                    <td align="right">0.993995</td>
                    <td align="right">0.000995</td>
                    <td align="right">0.165679</td>
                    <td align="right">4234</td>
                </tr>
                <tr>
                    <td>Dec-25-2017</td>
                    <td>1889</td>
                    <td>dpksharma730@gmail.com</td>
                    <td align="right">0.0846</td>
                    <td align="right">0.000085</td>
                    <td align="right">0.156731</td>
                    <td align="right">364</td>
                </tr>
                <tr>
                    <td>Dec-25-2017</td>
                    <td>2921</td>
                    <td>shrivernicholas@gmail.com</td>
                    <td align="right">0.04982</td>
                    <td align="right">0.00005</td>
                    <td align="right">0.156558</td>
                    <td align="right">212</td>
                </tr>
                <tr>
                    <td>Dec-29-2017</td>
                    <td>497</td>
                    <td>pelepcm@gmail.com</td>
                    <td align="right">0.238991</td>
                    <td align="right">0.000239</td>
                    <td align="right">0.164739</td>
                    <td align="right">1018</td>
                </tr>
                <tr>
                    <td>Dec-29-2017</td>
                    <td>301</td>
                    <td>pramakrishna@gmail.com</td>
                    <td align="right">0.220914</td>
                    <td align="right">0.000221</td>
                    <td align="right">0.166275</td>
                    <td align="right">941</td>
                </tr>
                <tr>
                    <td>Dec-30-2017</td>
                    <td>248</td>
                    <td>avinashm@hotmail.com</td>
                    <td align="right">0.258168</td>
                    <td align="right">0.001037</td>
                    <td align="right">0.173292</td>
                    <td align="right">1093</td>
                </tr>
                <tr>
                    <td>Jan-02-2018</td>
                    <td>443</td>
                    <td>Bobbunda@hotmail.com</td>
                    <td align="right">2.258679</td>
                    <td align="right">0.0043048</td>
                    <td align="right">0.2054002</td>
                    <td align="right">9650</td>
                </tr>
                <tr>
                    <td>Jan-03-2018</td>
                    <td>443</td>
                    <td>Bobbunda@hotmail.com</td>
                    <td align="right">0.040492</td>
                    <td align="right">0.000163</td>
                    <td align="right">0.218096</td>
                    <td align="right">153</td>
                </tr>
                <tr>
                    <td>Jan-03-2018</td>
                    <td>459</td>
                    <td>miro708@yahoo.com</td>
                    <td align="right">0.493636</td>
                    <td align="right">0.001982</td>
                    <td align="right">0.217973</td>
                    <td align="right">2109.014</td>
                </tr>
                <tr>
                    <td>Jan-03-2018</td>
                    <td>285</td>
                    <td>khurram.dara@gmail.com</td>
                    <td align="right">1.153682</td>
                    <td align="right">0.004633</td>
                    <td align="right">0.218189</td>
                    <td align="right">4929</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td align="right"></td>
                    <td align="right"></td>
                    <td align="right"></td>
                    <td align="right"><strong>81032.014</strong></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

