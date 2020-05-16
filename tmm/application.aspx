<%@ Page Language="vb" AutoEventWireup="false" Codebehind="application.aspx.vb" Inherits="TMMInternet.application" SmartNavigation="true" ValidateRequest="false"%>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>TMM Employment Opportunities</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="offshore paramedic, offshore medic, paramedicine, remote paramedic, remote &#13;&#10;medic, medic jobs, remote paramedicine, paramedic, medic, offshore paramedic &#13;&#10;job, offshore paramedic jobs,&nbsp; offshore medic job, offshore medic jobs "
			name="description">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../trinity.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY id="bodySrch" bgColor="#000000" leftMargin="0" topMargin="0" RUNAT="server">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="BORDER-RIGHT: #336699 1px solid; BORDER-TOP: #336699 1px solid; BORDER-LEFT: #336699 1px solid; WIDTH: 798px; BORDER-BOTTOM: #336699 1px solid; HEIGHT: 100%"
				cellSpacing="0" cellPadding="0" width="799" align="center" border="0">
				<TR>
					<TD style="HEIGHT: 161px" align="center"><IMG alt="" src="images/img_employmentopp.jpg"></TD>
				</TR>
				<TR vAlign="top">
					<TD style="HEIGHT: 40px" vAlign="top" align="center" background="images/img_LinkBar.jpg">
						<table width="798" border="0" style="WIDTH: 798px; HEIGHT: 48px">
							<tr>
								<td width="77">&nbsp;</td>
								<td valign="top">
									<TABLE id="Table3" cellSpacing="0" cellPadding="0" border="0">
										<tr>
											<TD valign="top">
												<a href="index.aspx" title="Home"><img align="middle" src="images/btn_home.gif" alt="Home" onmouseover="this.src='images/btn_home_o.gif';"
													onmouseout="this.src='images/btn_home.gif';" style="border:0px none;"></a>
											</TD>
											<TD valign="top">
												<a href="contact.aspx" title="Contact"><img align="middle" src="images/btn_contact.gif" alt="Contact" onmouseover="this.src='images/btn_contact_o.gif';"
													onmouseout="this.src='images/btn_contact.gif';" style="border:0px none;"></a>
											</TD>
											<TD vAlign="top">
												<a href="careers.aspx" title="Careers"><img align="middle" src="images/btn_employmentopp.gif" alt="Careers" onmouseover="this.src='images/btn_employmentopp_o.gif';"
													onmouseout="this.src='images/btn_employmentopp.gif';" style="border:0px none;"></a>
											</TD>
											<TD vAlign="top">
												<a href="https://www.trinitymedicalmanagement.com/login.aspx" title="User Login">
													<img align="middle" src="images/btn_UserLogin.gif" alt="User Login" onmouseover="this.src='images/btn_UserLogin_o.gif';"
														onmouseout="this.src='images/btn_UserLogin.gif';" style="BORDER-RIGHT:0px; BORDER-TOP:0px; BORDER-LEFT:0px; BORDER-BOTTOM:0px"></a>
											</TD>
										</tr>
									</TABLE>
								</td>
							</tr>
						</table>
					</TD>
				</TR>
				<tr>
					<td style="HEIGHT: 39px"></td>
				</tr>
				<TR>
					<TD vAlign="top" align="center">
						<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="645" border="0">
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right"></TD>
								<td class="stdFont">
									<asp:ValidationSummary id="ValidationSummary2" runat="server" Width="375px" EnableClientScript="False"></asp:ValidationSummary></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Name:
								</TD>
								<td>
									<asp:textbox id="txtName" runat="server" Width="375px" MaxLength="50"></asp:textbox>&nbsp;
									<asp:requiredfieldvalidator id="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name."
										Display="None" EnableClientScript="False"></asp:requiredfieldvalidator></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Address:
								</TD>
								<td>
									<asp:textbox id="txtAddr1" runat="server" Width="375px" MaxLength="50"></asp:textbox>&nbsp;
									<asp:requiredfieldvalidator id="rfvAddr" runat="server" ControlToValidate="txtAddr1" ErrorMessage="Please enter your address."
										Display="None" EnableClientScript="False"></asp:requiredfieldvalidator></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px"></TD>
								<td>
									<asp:textbox id="txtAddr2" runat="server" Width="375px" MaxLength="50"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">City / State / Zip Code: 
									&nbsp;
								</TD>
								<td>
									<asp:textbox id="txtCity" runat="server" Width="263px" MaxLength="50"></asp:textbox>&nbsp;
									<asp:textbox id="txtState" runat="server" Width="40px" MaxLength="2"></asp:textbox>&nbsp;
									<asp:textbox id="txtZip" runat="server" Width="56px" MaxLength="10"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Home Phone: &nbsp;
								</TD>
								<td>
									<asp:textbox id="txtHomePhone" runat="server" MaxLength="50"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Work Phone: &nbsp;
								</TD>
								<td>
									<asp:textbox id="txtWorkPhone" runat="server" MaxLength="50"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Cell Phone: &nbsp;
								</TD>
								<td>
									<asp:textbox id="txtCellPhone" runat="server" MaxLength="50"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Email: &nbsp;
								</TD>
								<td>
									<P>
										<asp:textbox id="txtEmail" runat="server" Width="375px" MaxLength="50"></asp:textbox><asp:requiredfieldvalidator id="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email address."
											Display="None" EnableClientScript="False"></asp:requiredfieldvalidator>
										<asp:RegularExpressionValidator id="revEmail" runat="server" Display="None" ErrorMessage="The email address you entered is not valid."
											ControlToValidate="txtEmail" EnableClientScript="False" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></P>
								</td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Paramedic National Registry 
									#: &nbsp;<BR>
									(if applicable) &nbsp;
								</TD>
								<td>
									<asp:textbox id="txtRegistryNum" runat="server" MaxLength="50"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" align="right">Years Experience: &nbsp;
								</TD>
								<td>
									<asp:textbox id="txtYears" runat="server" Width="40px" MaxLength="2"></asp:textbox></td>
							</TR>
							<TR>
								<TD class="stdFont" style="WIDTH: 182px" vAlign="top" align="right">Brief Work 
									History: &nbsp;
								</TD>
								<td>
									<asp:textbox id="txtHistory" runat="server" Width="375px" Height="124px" TextMode="MultiLine"></asp:textbox></td>
							</TR>
							<tr>
								<td style="WIDTH: 182px" vAlign="top" align="right"></td>
								<td vAlign="top" class="stdFont">
									<cc1:rollover id="btnSubmit" runat="server" ImageUrl="images/btn_Submit.gif" RollOverImageUrl="images/btn_Submit_o.gif"></cc1:rollover><BR>
									<asp:validationsummary id="ValidationSummary1" runat="server" Width="375px" EnableClientScript="False"></asp:validationsummary>
									<asp:Label id="lblException" runat="server"></asp:Label></td>
							</tr>
						</TABLE>
					</TD>
				</TR>
				<tr>
					<td></td>
				</tr>
				<TR>
					<TD align="center"><IMG alt="" src="images/img_bottombar.jpg">
					</TD>
				</TR>
			</TABLE>
		</form>
	</BODY>
</HTML>
