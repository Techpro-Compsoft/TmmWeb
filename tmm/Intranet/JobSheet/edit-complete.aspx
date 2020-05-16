<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit-complete.aspx.vb"
    Inherits="JobSheet.edit_complete" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Job Information Sheet</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="/trinity.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="#000000" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <input type="hidden" runat="server" id="projectName" />

    <script type="text/javascript">
        function ToggleTables(tblName) {
            if (tblName == "LocationInformation") {
                if (document.getElementById("locationSub").style.display == "") {
                    document.getElementById("locationSub").style.display = "none";
                    document.getElementById("spnLocation").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("locationSub").style.display = "";
                    document.getElementById("spnLocation").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else if (tblName == "LocationManager") {
                if (document.getElementById("managerSub").style.display == "") {
                    document.getElementById("managerSub").style.display = "none";
                    document.getElementById("spnManager").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("managerSub").style.display = "";
                    document.getElementById("spnManager").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else if (tblName == "LocationSuper1") {
                if (document.getElementById("locSup1").style.display == "") {
                    document.getElementById("locSup1").style.display = "none";
                    document.getElementById("spnLocSup1").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("locSup1").style.display = "";
                    document.getElementById("spnLocSup1").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else if (tblName == "LocationSuper2") {
                if (document.getElementById("locSup2").style.display == "") {
                    document.getElementById("locSup2").style.display = "none";
                    document.getElementById("spnLocSup2").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("locSup2").style.display = "";
                    document.getElementById("spnLocSup2").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else if (tblName == "ContractingCompany") {
                if (document.getElementById("Table9").style.display == "") {
                    document.getElementById("Table9").style.display = "none";
                    document.getElementById("spnContract").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("Table9").style.display = "";
                    document.getElementById("spnContract").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else if (tblName == "CompRep1") {
                if (document.getElementById("rep1").style.display == "") {
                    document.getElementById("rep1").style.display = "none";
                    document.getElementById("spnRep1").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("rep1").style.display = "";
                    document.getElementById("spnRep1").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else if (tblName == "CompRep2") {
                if (document.getElementById("rep2").style.display == "") {
                    document.getElementById("rep2").style.display = "none";
                    document.getElementById("spnRep2").innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("rep2").style.display = "";
                    document.getElementById("spnRep2").innerHTML = "<img src='images/minimize.gif'>";
                }
            }
            else {
                if (document.getElementById("tr" + tblName + "Sub").style.display == "") {
                    document.getElementById("tr" + tblName + "Sub").style.display = "none";
                    document.getElementById("spn" + tblName).innerHTML = "<img src='images/maximize.gif'>";
                }
                else {
                    document.getElementById("tr" + tblName + "Sub").style.display = "";
                    document.getElementById("spn" + tblName).innerHTML = "<img src='images/minimize.gif'>";
                }
            }
        }
        function ConfirmCancel() {
            var rigName = document.getElementById("projectName").value;
            var msg = confirm("Terminating this worksite's job sheet will mean that a new job sheet will need to be created for this worksite when necessary. Are you sure you want to permanently terminate this job sheet for " + rigName + " worksite?");
            if (msg) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>

    <table height="100%" cellspacing="0" cellpadding="0" width="100%">
        <tbody>
            <tr valign="top">
                <td align="center" width="100%">
                    <table style="border-right: #307fa3 1px solid; border-top: #307fa3 1px solid; border-left: #307fa3 1px solid;
                        border-bottom: #307fa3 1px solid" height="560" width="758">
                        <tr valign="top" height="100">
                            <td>
                                <img src="images/img_JobInfoSheet.jpg"><br />
                                <uc1:NavigationMenu ID="NavigationMenu1" runat="server"></uc1:NavigationMenu>
                            </td>
                        </tr>
                        <tr height="20">
                            <td align="center">
                                <cc1:ProgressIndicator ID="ucProgress" runat="server" BoookEndStartActive="images/img_Start_o.gif"
                                    BoookEndFinishActive="images/img_End_o.gif" StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif"
                                    SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif"
                                    UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif"
                                    LinkURLs="locationinfo.aspx,contractingcompany.aspx,SelectService.aspx,edit-complete.aspx"
                                    Height="48px" CurrentStep="4" LastAvailableStep="4" BoookEndFinish="images/img_End.gif"
                                    BoookEndStart="images/img_Start.gif" BoookEndGraphics="True"></cc1:ProgressIndicator>
                            </td>
                        </tr>
                        <tr valign="top" height="429">
                            <td valign="top" align="center">
                                <table class="smallBorder" id="tblLocationInformation" cellspacing="1" cellpadding="1"
                                    width="98%" align="center" border="0">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('LocationInformation')">
                                            <span id="spnLocation" style="text-decoration: underline; cursor: pointer;">
                                                <img src='images/maximize.gif'></span> &nbsp;Location Information
                                        </td>
                                    </tr>
                                    <tr class="stdFont" id="locationSub" style="display: none">
                                        <td align="center">
                                            <table id="Table2" cellspacing="1" cellpadding="1" width="98%" border="0">
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Project Name:
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblProjectName" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Project Number:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblProjectNumber" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Block:
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblBlock" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Facility Type:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblFacilityType" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Start Date:
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Approximate End Date:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblEndDate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Latitude:
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblRigLat" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Longitude:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblRigLong" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Phone Number:
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblRigPhone" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Alternative Phone Number:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblRigAltPhone" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Fax Number:
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblRigFax" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Work Schedule:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSchedule" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                        Trinity Personnel (#1):
                                                    </td>
                                                    <td style="width: 220px">
                                                        <asp:Label ID="lblTMMPersonnel1" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 148px">
                                                        Trinity Personnel (#2):
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblTMMPersonnel2" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 123px">
                                                    </td>
                                                    <td style="width: 220px">
                                                    </td>
                                                    <td style="width: 148px">
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btnEditLocInfo" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <table id="Table3" cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('LocationManager')">
                                            <span id="spnManager" style="text-decoration: underline; cursor: pointer;">
                                                <img src="images/maximize.gif" alt="" /></span> &nbsp;Location Manager
                                        </td>
                                    </tr>
                                    <tr class="stdFont" id="managerSub" style="display: none">
                                        <td align="center">
                                            <table id="Table11" cellspacing="1" cellpadding="1" width="98%" border="0">
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Name:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLocMgrName" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Phone:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLocMgrPhone" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Address:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLocMgrAddr" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        City / State / Zip:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLocMgrCSZ" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btnEditLocMgr" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <table id="Table8" cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('ContractingCompany')">
                                            <span id="spnContract" style="text-decoration: underline; cursor: pointer;">
                                                <img src="images/maximize.gif" alt="" /></span> &nbsp;Contracting Company
                                        </td>
                                    </tr>
                                    <tr class="stdFont">
                                        <td align="center">
                                            <table id="Table9" cellspacing="1" cellpadding="1" width="98%" border="0" style="display: none">
                                                <tr class="stdFont">
                                                    <td style="width: 232px" valign="top">
                                                        Company Name:
                                                    </td>
                                                    <td style="width: 169px" valign="top">
                                                        <asp:Label ID="lblCCCompName" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 152px" valign="top">
                                                    </td>
                                                    <td valign="top">
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 232px">
                                                        Address:
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblCCAddr" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 232px">
                                                        City / State / Zip:
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblCCCSZ" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 232px; height: 17px">
                                                        Phone Number:
                                                    </td>
                                                    <td style="width: 169px; height: 17px">
                                                        <asp:Label ID="lblCCPhone" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 152px; height: 17px">
                                                        Alternative Phone Number:
                                                    </td>
                                                    <td style="height: 17px">
                                                        <asp:Label ID="lblCCAltPhone" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 232px">
                                                        Fax Number:
                                                    </td>
                                                    <td style="width: 169px" align="left">
                                                        <asp:Label ID="lblCCFax" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 152px">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 232px">
                                                    </td>
                                                    <td style="width: 169px" align="right">
                                                    </td>
                                                    <td style="width: 152px">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td align="right" colspan="4">
                                                        <asp:Button ID="btnEditContract" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="Table4" cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('LocationSuper1')">
                                            <span id="spnLocSup1" style="text-decoration: underline; cursor: pointer;">
                                                <img src="images/maximize.gif" alt="" /></span> &nbsp;OIM #1
                                        </td>
                                    </tr>
                                    <tr class="stdFont" id="locSup1" style="display: none">
                                        <td align="center">
                                            <table id="Table5" cellspacing="1" cellpadding="1" width="98%" border="0">
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Name:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM1Name" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Phone:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM1Phone" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Address:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM1Addr" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        City / State / Zip:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM1CSZ" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="lblEditOIM1" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="Table6" cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('LocationSuper2')">
                                            <span id="spnLocSup2" style="text-decoration: underline; cursor: pointer;">
                                                <img src="images/maximize.gif" alt="" /></span> &nbsp;OIM #2
                                        </td>
                                    </tr>
                                    <tr class="stdFont" id="locSup2" style="display: none">
                                        <td align="center">
                                            <table id="Table7" cellspacing="1" cellpadding="1" width="98%" border="0">
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Name:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM2Name" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Phone:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM2Phone" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Address:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM2Addr" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        City / State / Zip:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblOIM2CSZ" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="lblEditOIM2" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="CompRep1" cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('CompRep1')">
                                            <span id="spnRep1" style="text-decoration: underline; cursor: pointer;">
                                                <img src="images/maximize.gif" alt="" /></span> &nbsp;Company Rep #1
                                        </td>
                                    </tr>
                                    <tr class="stdFont" id="rep1" style="display: none">
                                        <td align="center">
                                            <table cellspacing="1" cellpadding="1" width="98%" border="0">
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Name:
                                                    </td>
                                                    <td align="left" colspan="3">
                                                        <asp:Label ID="lblCM1Name" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Phone:
                                                    </td>
                                                    <td style="width: 169px" align="left">
                                                        <asp:Label ID="lblCM1Phone" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 152px">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Address:
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblCM1Addr" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        City / State / Zip:
                                                    </td>
                                                    <td align="left" colspan="3">
                                                        <asp:Label ID="lblCM1CSZ" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                    </td>
                                                    <td style="width: 169px" align="right">
                                                    </td>
                                                    <td style="width: 152px">
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btnEditComp1" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="CompRep2" cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                    <tr class="DataGridHdr">
                                        <td class="SecHdr" onclick="ToggleTables('CompRep2')">
                                            <span id="spnRep2" style="text-decoration: underline; cursor: pointer;">
                                                <img src="images/maximize.gif" alt="" /></span> &nbsp;Company Rep #2
                                        </td>
                                    </tr>
                                    <tr class="stdFont" id="rep2" style="display: none">
                                        <td align="center">
                                            <table cellspacing="1" cellpadding="1" width="98%" border="0">
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Name:
                                                    </td>
                                                    <td align="left" colspan="3">
                                                        <asp:Label ID="lblCM2Name" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Phone:
                                                    </td>
                                                    <td style="width: 169px" align="left">
                                                        <asp:Label ID="lblCM2Phone" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 152px">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        Address:
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblCM2Addr" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="stdFont">
                                                    <td style="width: 101px">
                                                        City / State / Zip:
                                                    </td>
                                                    <td align="left" colspan="3">
                                                        <asp:Label ID="lblCM2CSZ" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td style="width: 169px">
                                                    </td>
                                                    <td style="width: 152px">
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btnEditComp2" runat="server" Text="Edit" CssClass="btnSmall" Width="60px">
                                                        </asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Repeater ID="rptServices" runat="server">
                                    <ItemTemplate>
                                        <table cellspacing="1" cellpadding="1" width="98%" border="0" class="smallBorder">
                                            <tr class="DataGridHdr">
                                                <td style="vertical-align: top; font-weight: bold; background-color: #307FA3" class="SecHdr"
                                                    onclick="ToggleTables('<%#Eval("ServiceID").ToString() %>')">
                                                    <span id='spn<%#Eval("ServiceID").ToString() %>' style="text-decoration: underline;
                                                        cursor: pointer;">
                                                        <img src="images/maximize.gif" alt="" /></span>
                                                    <%#Eval("Specialty") %>
                                                </td>
                                            </tr>
                                            <tr id='tr<%#Eval("ServiceID").ToString() %>Sub' style="display: none">
                                                <td>
                                                    <table style="width: 100%; color: white">
                                                        <tr class="stdFont">
                                                            <td style="width: 25%">
                                                                Company Name:
                                                            </td>
                                                            <td style="width: 75%;" colspan="3">
                                                                <%#Eval("Name") %>
                                                            </td>
                                                        </tr>
                                                        <tr class="stdFont">
                                                            <td style="width: 25%">
                                                                Approximate Distance:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("Distance").ToString() %>
                                                                miles
                                                            </td>
                                                            <td style="width: 25%">
                                                                Approximate Time:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("Time").ToString() %>
                                                                minutes
                                                            </td>
                                                        </tr>
                                                        <tr class="stdFont">
                                                            <td style="width: 25%">
                                                                Phone Number:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("PhoneNumber") %>
                                                            </td>
                                                            <td style="width: 25%">
                                                                Alternative Phone Number:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("AltPhoneNumber") %>
                                                            </td>
                                                        </tr>
                                                        <tr class="stdFont">
                                                            <td style="width: 25%">
                                                                Fax Number:
                                                            </td>
                                                            <td style="width: 75%" colspan="3">
                                                                <%#Eval("FaxNumber") %>
                                                            </td>
                                                        </tr>
                                                        <tr class="stdFont">
                                                            <td style="width: 25%">
                                                                Latitude:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("Latitude").ToString() %>
                                                            </td>
                                                            <td style="width: 25%">
                                                                Longitude:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("Longitude").ToString() %>
                                                            </td>
                                                        </tr>
                                                        <tr class="stdFont">
                                                            <td style="width: 25%">
                                                                Location:
                                                            </td>
                                                            <td style="width: 25%">
                                                                <%#Eval("City") %>,
                                                                <%#Eval("State") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100%; text-align: right" colspan="4">
                                                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btnSmall" Width="60px"
                                                                    CommandArgument='<%#Eval("SpecialtyID") %>' CommandName="editService" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <br>
                                <table id="Table15" cellspacing="1" cellpadding="1" width="98%" border="0">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall" OnClientClick=" return ConfirmCancel();" />
                                            &nbsp;
                                            <asp:Button ID="btnComplete" runat="server" Text="Complete" CssClass="btnSmall" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr valign="top" height="31">
                            <td align="center">
                                <img src="../../Images/Grphc_BotBar.jpg">
                            </td>
                        </tr>
                    </table>
    </td> </tr> </tbody> </table>
    </form>
</body>
</html>
