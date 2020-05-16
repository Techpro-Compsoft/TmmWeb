<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ForgotPassword.aspx.vb" Inherits="TMMInternet.ForgotPassword" %>

<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Forgotten Password</title>
    <link href="/trinity.css" type="text/css" rel="stylesheet">
</head>
	<body style="MARGIN-TOP:0px; BACKGROUND-COLOR:#000000">
		<form id="Form1" method="post" runat="server">
		    <script>
            function HandleKeyPressEvent(e)
            {
                 // handle i.e. (window.event) and firefox (e)
                 var eventInstance = window.event ? event : e;
                 
                 // handle i.e. (charCode) and firefox (keyCode)
                 var unicode = eventInstance.charCode ? eventInstance.charCode : eventInstance.keyCode;
                 
                 if (unicode == 13)
                 {
                    WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("btnRetrieve", "", true, "", "", false, true));
                    return false;
                 }
                 //var key = String.fromCharCode(unicode); 
            }
            </script>
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="799" border="0" align="center"
				style="BORDER-RIGHT: #336699 1px solid; BORDER-TOP: #336699 1px solid; BORDER-LEFT: #336699 1px solid; WIDTH: 798px; BORDER-BOTTOM: #336699 1px solid; HEIGHT: 100%">
				<TR>
					<TD align="center" style="HEIGHT: 161px"><IMG alt="" src="/images/img_Welcome.jpg"></TD>
				</TR>
				<TR valign="top">
					<TD align="center" background="/images/img_LinkBar.jpg" style="HEIGHT: 40px" vAlign="top">
						<table width="798" border="0" style="WIDTH: 798px; HEIGHT: 48px">
							<tr>
								<td width="77">&nbsp;</td>
								<td valign="top">
									<TABLE align="left" id="Table3" cellSpacing="0" cellPadding="0" border="0">
										<TR>
											<TD valign="top">
												<cc1:RollOver id="btnHome" runat="server" ImageUrl="images/btn_home.gif" RollOverImageUrl="images/btn_home_o.gif" CausesValidation="False"></cc1:RollOver>
											</TD>
											<TD valign="top">
												<cc1:RollOver id="btnContact" runat="server" ImageUrl="images/btn_contact.gif" RollOverImageUrl="images/btn_contact_o.gif" CausesValidation="False"></cc1:RollOver>
											</TD>
											<TD vAlign="top">
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
					<TD align="center" vAlign="top"><asp:Panel ID="pnlForgotPW" runat="server">
						<span style="FONT-SIZE:10pt; COLOR:#ffffff; FONT-FAMILY:helvetica">
                            <br />
                            Please enter your username:</span>
						<asp:TextBox ID="txtUserName" Runat="server"  Width="175px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                            ErrorMessage="*">*</asp:RequiredFieldValidator><br></asp:Panel>
						<span style="FONT-SIZE:10pt; color:Red; FONT-FAMILY:helvetica">
                            <br />
                            <asp:Literal ID="litPWStatus" EnableViewState="false" Runat="server" /></span>
						<ASP:BUTTON id="btnRetrieve" RUNAT="server" CSSCLASS="btnSmall" TEXT="Retrieve my Password"></ASP:BUTTON><br /><br><br />
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
	</body></html>
