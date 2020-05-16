<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser_Alert.aspx.cs" Inherits="UsersAdmin.AddUser_Alert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
	<link href="/trinity.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#d0d0d0; font-family:Arial;">
    <form id="form1" runat="server">
    <script type="text/javascript">

        function GetRadWindow() 
        {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz az well)
            return oWindow;
        }

        function RedirectParentPage(url) 
        {
            GetRadWindow().BrowserWindow.location.href = url;
            //GetRadWindow().Hide();
        }
    
    </script>
    <div>
    You are about to add a new <asp:Literal ID="litUserType" runat="server"></asp:Literal> user. If this 
    is not the type of user you wish to add, please selct the correct type from the list below. Once you 
    have selected the correct type, please click the <b>Ok</b> button.<br /><br />
    <div style="text-align:center;">
        <asp:DropDownList ID="ddlUserTypes" runat="server" Width="250"  AutoPostBack="true">
            <asp:ListItem Text="Trinity - Office" Value="1" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Trinity - Medic" Value="2"></asp:ListItem>
            <asp:ListItem Text="Customer" Value="3"></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <asp:Button ID="btnOK" runat="server" Text="  OK  " CssClass="btnSmall" 
            onclick="btnOK_Click" />
        </div>
    </div>
    </form>
</body>
</html>
