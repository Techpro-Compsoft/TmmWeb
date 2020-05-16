<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Login.aspx.vb" Inherits="TMMInternet.Login" %>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>User Login</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="/trinity.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body style="MARGIN-TOP:0px; BACKGROUND-COLOR:#000000">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="799" border="0" align="center"
				style="BORDER-RIGHT: #336699 1px solid; BORDER-TOP: #336699 1px solid; BORDER-LEFT: #336699 1px solid; WIDTH: 798px; BORDER-BOTTOM: #336699 1px solid; HEIGHT: 100%">
				<TR>
					<TD align="center" style="HEIGHT: 161px"><IMG alt="" src="/images/img_userlogin.jpg"></TD>
				</TR>
				<TR valign="top">
					<TD align="center" background="/images/img_LinkBar.jpg" style="HEIGHT: 40px" vAlign="top">
						<table width="798" border="0" style="WIDTH: 798px; HEIGHT: 48px">
							<tr>
								<td width="77">&nbsp;</td>
								<td valign="top">
									<TABLE id="Table3" cellSpacing="0" cellPadding="0" border="0">
										<TR>
											<TD valign="top">
												<cc1:RollOver id="btnHome" runat="server" ImageUrl="images/btn_home.gif" RollOverImageUrl="images/btn_home_o.gif" CausesValidation="False"></cc1:RollOver>
											</TD>
											<TD valign="top">
												<cc1:RollOver id="btnContact" runat="server" ImageUrl="images/btn_contact.gif" RollOverImageUrl="images/btn_contact_o.gif" CausesValidation="False"></cc1:RollOver>
											</TD>
											<TD vAlign="top" style="padding-top:1px;">
												<a href="https://www.trinitymedicalmanagement.com/login.aspx" title="User Login">
													<img align="middle" src="images/btn_UserLogin.gif" alt="User Login" onmouseover="this.src='images/btn_UserLogin_o.gif';"
														onmouseout="this.src='images/btn_UserLogin.gif';" style="BORDER-RIGHT:0px; BORDER-TOP:0px; BORDER-LEFT:0px; BORDER-BOTTOM:0px"></a>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</TD>
				</TR>
				<tr>
					<td style="HEIGHT: 39px">
					</td>
				</tr>
				<TR>
					<TD align="center" vAlign="top">
						<span style="FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">Username:</span>
						<asp:TextBox ID="txtUserName" Runat="server" Width="175px" /><br />
						<span style="FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">Password:</span>
						<asp:TextBox ID="txtPassword" Runat="server" Width="175px" TextMode="Password" /><br />
						<asp:Literal ID="litLoginStatus" Runat="server" /><br />
                        <ASP:BUTTON id="btnLogin" RUNAT="server" CSSCLASS="btnSmall" TEXT="Login"></ASP:BUTTON><br /><br />
                        <asp:LinkButton ID="btnForgotPassword" runat="server" Font-Size="X-Small" ForeColor="White">Forgot My Password</asp:LinkButton>
					</TD>
				</TR>
				<tr>
					<td>
					</td>
				</tr>
				<TR>
					<TD align="center"><IMG alt="" src="/images/img_bottombar.jpg">
					</TD>
				</TR>
			</TABLE>

		</form>
	</body>
</HTML>
