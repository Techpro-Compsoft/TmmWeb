<%@ Page Language="vb" AutoEventWireup="false" Codebehind="index.aspx.vb" Inherits="TMMInternet.index1" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Trinity Medical Management Intranet Console</title>
		<link href="/trinity.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="margin-top:0; margin-left:0; background-color:#000000;">
		<center>
			<table width="760" style="height:100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
				<tr style="height:151" valign="top">
					<td>
					    <img src="/images/Grphc_TopBar.jpg" alt="" width="760" height="151" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="100%" class="MenuBar">
                            <tr>
                                <td><TMM:TMMMenu ID="tmmMenu" runat="server" /></td>
                            </tr>
						</table>
						<div style="background-color:#000000; color:#FFFFFF; padding:10px; vertical-align:top;FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">
						
                            Welcome <asp:Literal ID="litUsername" runat="server"></asp:Literal>!
                            <br /><br />
                            As a customer of Trinity Medical, our secure access website provides access to proprietary state of the art Patient Encounter tracking and collaboration tools, industry specific Injury Prevention resources, online Training, and our Standard Emergency Management System (SEMS) tools.
                            <br /><br />
                            Please use the menus above to access the various areas of the Trinity Medical Management website.  We hope you find this web platform easy to use and that it exceeds any expectations. The difference truly is in the details.
                            <br /><br />
                            If you have any questions, please contact Trinity Medical's Main office at:
                            <br /><br />
                            Phone:  <asp:Literal ID="litPhoneNumber" runat="server"></asp:Literal><br />
                            Web: <asp:Literal ID="litEmail" runat="server"></asp:Literal>
						
						</div>
					</td>
				</tr>
				<tr>
					<td >
					    &nbsp;
					</td>
				</tr>
				<tr valign="bottom">
					<td>
					    <img src="/images/Grphc_BotBar.jpg" alt="" width="760" height="31" />
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
