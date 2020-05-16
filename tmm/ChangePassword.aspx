<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ChangePassword.aspx.vb" Inherits="TMMInternet.ChangePassword" %>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Change Password</title>
    <link href="/trinity.css" type="text/css" rel="stylesheet">
</head>
<body style="MARGIN-TOP:0px; BACKGROUND-COLOR:#000000">
<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="799" border="0" align="center"
				style="BORDER-RIGHT: #336699 1px solid; BORDER-TOP: #336699 1px solid; BORDER-LEFT: #336699 1px solid; WIDTH: 798px; BORDER-BOTTOM: #336699 1px solid; HEIGHT: 100%">
				<TR>
					<TD align="center" style="HEIGHT: 161px"><IMG alt="" src="/images/img_Welcome.jpg"></TD>
				</TR>
				<TR valign="top">
					<TD align="center" background="/images/img_LinkBar.jpg" style="HEIGHT: 40px" vAlign="top">
						<table align="left" width="798" border="0" style="WIDTH: 798px; HEIGHT: 48px">
							<tr>
								<td width="77">&nbsp;</td>
								<td valign="top">
									<TABLE align="left" id="Table3" cellSpacing="0" cellPadding="0" border="0">
										<TR>
											<TD valign="bottom">
												<cc1:RollOver id="btnHome" runat="server" ImageUrl="images/btn_home.gif" RollOverImageUrl="images/btn_home_o.gif" CausesValidation="False"></cc1:RollOver>
											</TD>
											<TD valign="bottom">
												<cc1:RollOver id="btnContact" runat="server" ImageUrl="images/btn_contact.gif" RollOverImageUrl="images/btn_contact_o.gif" CausesValidation="False"></cc1:RollOver>
											</TD>
											<TD vAlign="bottom">
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
                        <span style="FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">Your password is <%= Session("PWAge")%> days old. You must change it to login.</span><br />
                <table align="center">
                    <tr valign="bottom">
                        <td >
                            <span style="FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">New Password:  </span>
                        </td>
                        <td align="left">
                            <br />
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /></td>
                    </tr>
                    <tr>
                        <td nowrap="nowrap">
                            <span style="font-size: 10pt; color: #ffffff; font-family: Helvetica">Retype Password:</span></td>
                        <td align="left">
                            <asp:TextBox ID="txtVerifyPassword" runat="server" TextMode="Password" />
                            </td>
                    </tr>
                    <tr valign="bottom" >
                        <td nowrap="nowrap" colspan="2" >
                            <span style="FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">&nbsp;</span>
                            <asp:CompareValidator ID="valPWCompare" EnableViewState="false" runat="server" ControlToCompare="txtVerifyPassword"
                                ControlToValidate="txtPassword" EnableClientScript="false" Display="Dynamic" ErrorMessage="Passwords do not match.">
                            </asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td><br />
                        </td>
                        <td style="text-align: left">
                        </td>
                    </tr>
                    <tr>
                        <td >
                        </td>
                        <td style="text-align:left;">
                        <asp:Button ID="btnChange" runat="server" CSSCLASS="btnSmall" Text="Change Password" /></td>
                    </tr>
                </table>
					</TD>
				</TR>
				<tr>
					<td>
					<br />
					</td>
				</tr>
				<TR>
					<TD align="center"><IMG alt="" src="/images/img_bottombar.jpg">
					</TD>
				</TR>
			</TABLE>
			</form>
</body>
</html>
