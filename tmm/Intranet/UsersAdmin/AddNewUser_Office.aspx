<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewUser_Office.aspx.cs" Inherits="UsersAdmin.AddNewUser_Office" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadTabStrip.Net2" namespace="Telerik.WebControls" tagprefix="radT" %>
<%@ Register src="Controls/User_GeneralInformation.ascx" tagname="User_GeneralInformation" tagprefix="uc1" %>
<%@ Register src="Controls/User_SecurityInformation.ascx" tagname="User_SecurityInformation" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<link href="/trinity.css" rel="stylesheet" type="text/css" />

    <style type="text/css"> 
    legend{  
     color:#ffffff;
    } 
    </style>

</head>



	<body style="margin-top:0; margin-left:0; background-color:#000000;">
	<form runat="server" id="frm1">
	    <center>
			<table width="760" style="height:100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
				<tr style="height:151" valign="top">
					<td>
					    <img src="images/Trinity_GraphicBar_Users.jpg" alt="" width="760" height="78" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="100%" class="MenuBar">
                            <tr>
                                <td><TMM:TMMMenu ID="tmmMenu" runat="server" /></td>
                            </tr>
						</table>
					</td>
				</tr>
				<tr>
				    <td style="text-align:left; padding:10px;">
				        <span class="WhiteText" ><b>Add New User - <asp:Literal ID="litUserTypeHeader" runat="server"></asp:Literal></b></span>
				    </td>
				</tr>
               <tr>
                    <td style="padding:10px;">
                        <uc1:User_GeneralInformation ID="User_GeneralInformation1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="padding:10px;">
                        <uc2:User_SecurityInformation ID="User_SecurityInformation1" runat="server" />
                    </td>
                </tr>

                <tr id="trSave" runat="server">
                    <td style="padding:0px 10px 10px 10px; text-align:right;">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall"  
                            CausesValidation="false" PostBackUrl="UserAdminHome.aspx"/>&nbsp;
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnSmall" 
                            onclick="btnSave_Click" />
                    </td>
                </tr>
                                
                                
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr valign="bottom">
					<td>
					    <img src="/images/Grphc_BotBar.jpg" alt="" width="760" height="31" />
					</td>
				</tr>
			</table>
		</center>
	</form>
	</body>
</html>