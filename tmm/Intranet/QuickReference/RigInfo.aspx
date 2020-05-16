<%@ Page Language="vb" AutoEventWireup="false" Inherits="ServiceLocator.RigInfo" CodeBehind="ServiceLocator.RigInfo.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Rig Information</title>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center;">
    <div style="font-family:Arial;">
        <img src="Images/Trinity_Letterhead_900.jpg" alt="Trinity_Letterhead.jpg"/>
        <br />
        <table id="tblMain" runat="server" width="900px" style="text-align:left;">
            <tr>
                <td width="14%">Rig Name:</td>
                <td width="35%"><asp:Literal ID="litRigName" runat="server"></asp:Literal></td>
                <td width="2%"></td>
                <td width="14%">Company Name</td>
                <td width="35%"><asp:Literal ID="litCompanyName" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Longitude:</td>
                <td><asp:Literal ID="litLongitude" runat="server"></asp:Literal></td>
                <td></td>
                <td>Latitude:</td>
                <td><asp:Literal ID="litLatitude" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr>
                <td>Medic Name:</td>
                <td><asp:Literal ID="litMedicName" runat="server"></asp:Literal></td>
                <td></td>
                <td>Medic ID:</td>
                <td><asp:Literal ID="litMedicID" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr>
                <td>Rig Phone:</td>
                <td><asp:Literal ID="litRigPhone" runat="server"></asp:Literal></td>
                <td></td>
                <td>Alternate Phone:</td>
                <td><asp:Literal ID="litAltPhone" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Employer Name:</td>
                <td colspan="4"><asp:Literal ID="litEmployerName" runat="server"></asp:Literal></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
