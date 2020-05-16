<%@ Page Language="vb" AutoEventWireup="false" Inherits="ServiceLocator.DrInfo" CodeBehind="ServiceLocator.DrInfo.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Service Information</title>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center;">
    <div style="width:900px; font-family:Arial;">
        <table id="tblMain" runat="server" width="100%">
            <tr>
                <td colspan="5"><img src="Images/Trinity_Letterhead_900.jpg" alt="Trinity_Letterhead.jpg"/></td>
            </tr>
            <tr>
                <td style="height:10px;"></td>
            </tr>
            <tr align="left">
                <td style="width:14%">Service Name:</td>
                <td style="width:35%"><asp:Literal ID="litServiceName" runat="server"></asp:Literal></td>
                <td style="width:2%"></td>
                <td style="width:14%">Employer Name:</td>
                <td style="width:35%"><asp:Literal ID="litEmployerName" runat="server"></asp:Literal></td>
            </tr>
            <tr align="left">
                <td>Service Phone:</td>
                <td><asp:Literal ID="litServicePhone" runat="server"></asp:Literal></td>
                <td></td>
                <td>Employer Phone:</td>
                <td><asp:Literal ID="litEmployerPhone" runat="server"></asp:Literal></td>
            </tr>
            <tr align="left">
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr align="left">
                <td>Service Type:</td>
                <td><asp:Literal ID="litServiceType" runat="server"></asp:Literal></td>
                <td></td>
                <td>Tier:</td>
                <td><asp:Literal ID="litTierDescription" runat="server"></asp:Literal></td>
            </tr>
            <tr align="left">
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr align="left">
                <td>Longitude:</td>
                <td><asp:Literal ID="litLongitude" runat="server"></asp:Literal></td>
                <td></td>
                <td>Latitude:</td>
                <td><asp:Literal ID="litLatitude" runat="server"></asp:Literal></td>
            </tr>
            <tr align="left">
                <td>Address:</td>
                <td><asp:Literal ID="litAddress" runat="server"></asp:Literal></td>
                <td></td>
                <td>City:</td>
                <td><asp:Literal ID="litCity" runat="server"></asp:Literal></td>
            </tr>
            <tr align="left">
                <td>Zip Code:</td>
                <td colspan="4"><asp:Literal ID="litZip" runat="server"></asp:Literal></td>
            </tr>
            <tr align="left">
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr align="left">
                <td>Notes:</td>
                <td colspan="4">
                    <asp:Literal ID="litNotes" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr align="left">
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr align="left">
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr id="trImageLink" runat="server" align="left">
                <td colspan="5" style="font-weight:bold;">
                    <a href="DrInfo_Images.aspx" target="_blank">Click here</a> to view all images
                    ( <asp:Literal ID="litImagesCount" runat="server" /> )
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
