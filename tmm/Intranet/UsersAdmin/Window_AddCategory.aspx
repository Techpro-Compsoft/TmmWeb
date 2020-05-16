<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Window_AddCategory.aspx.cs" Inherits="UsersAdmin.Window_AddCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="/trinity.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow)
                oWindow = window.radWindow;
            else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow;

            return oWindow;
        }
    </script>
</head>
<body style="background-color:#d0d0d0;" >
    <form id="form1" runat="server">
    <div>
    <table cellpadding="0" cellspacing="0" width="100%" style="padding:10px 10px 0px 0px;" >
        <tr align="center">
            <td colspan="2">
                Name: <asp:textbox id="txtCatName" runat="server" maxlength="500" width="250" />
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <asp:label id="lblError" runat="server" cssclass="ErrorText" /><asp:requiredfieldvalidator id="rfvCat" runat="server" controltovalidate="txtCatName" display="Dynamic" errormessage="Required" />
            </td>
        </tr>
        <tr align="center">
            <td colspan="2" />
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall"  CausesValidation="false"
                    onclick="btnCancel_Click" onclientclick="GetRadWindow().Close();" />
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnSmall" 
                    onclick="btnSave_Click" />            
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
