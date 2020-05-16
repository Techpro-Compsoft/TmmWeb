<%@ Page Language="c#" CodeBehind="PatientTest.aspx.cs" AutoEventWireup="True" Inherits="TrinityMedicTest.WebForm1"
    Debug="False" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="cc1" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Patient Test</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    

    <script language="javascript">

        function openWin() {
            window.open("PrinterFriendlyVersion.aspx", "print");
            return false;
        }
        function revealModal(divID) {
            window.onscroll = function() { document.getElementById(divID).style.top = document.body.scrollTop; };
            document.getElementById(divID).style.display = "block";
            document.getElementById(divID).style.top = document.body.scrollTop;
        }

        function hideModal(divID) {
            document.getElementById(divID).style.display = "none";
        }
    </script>
    		<LINK href="/trinity.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="#000000" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <p align="center">
        <table cellspacing="0" align="center" style="text-align: left" cellpadding="0" width="760"
            border="0">
            <tr>
                <td>
                    <img src="images/ttl_GenerateTestBar.jpg">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table id="Table1" class="MenuBar" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr style="vertical-align:top;">
                            <td>
                                <cc1:TMMMenu ID="TMMMenu1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 41px">
                    <br>
                    <asp:DropDownList ID="dlExams" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dlExams_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="True">[Please select an exam]</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                    <asp:Literal ID="litPrint" runat="server"></asp:Literal><input id="btnPrint" runat="server"
                        type="button" value="Print Test and Answer Key" visible="false" class="btnSmall"
                        onclick='return openWin();' />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 15px">
                    <asp:Label ID="lblInstructions" runat="server" CssClass="WhiteText" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Table ID="tblTest" runat="server" CssClass="Test">
                    </asp:Table>
                    <br />
                    &nbsp;<asp:Table ID="tblWarning" runat="server" CssClass="Warning" Visible="False">
                        <asp:TableRow ID="rowWarning" CssClass="WarningHdr">
                        </asp:TableRow>
                        <asp:TableRow ID="rowWarningText" CssClass="Warning" ForeColor="#000000" BackColor="#FFFFFF">
                        </asp:TableRow>
                    </asp:Table>
                </td>
            </tr>
        </table>
    </p>
    </form>
</body>
</html>
