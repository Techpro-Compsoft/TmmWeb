<%@ Page Language="vb" AutoEventWireup="false" Codebehind="locationsup.aspx.vb" Inherits="JobSheet.locationsup" ValidateRequest="false"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Job Information Sheet</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/trinity.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" RUNAT="server">
			<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<TR vAlign="top">
					<TD align="center" width="100%">
						<TABLE style="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid"
							height="560" width="758">
							<TR vAlign="top" height="100">
								<TD><IMG src="images/img_JobInfoSheet.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<tr height="20">
								<td align="center">
									<cc1:ProgressIndicator id="ucProgress" runat="server" BoookEndStartActive="images/img_Start_o.gif" BoookEndFinishActive="images/img_End_o.gif"
										StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif"
										SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif"
										UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif"
										LinkURLs="locationinfo.aspx,contractingcompany.aspx,contractingcompany.aspx,edit-complete.aspx"
										Height="48px" CurrentStep="2" LastAvailableStep="2" BoookEndFinish="images/img_End.gif" BoookEndStart="images/img_Start.gif"
										BoookEndGraphics="True"></cc1:ProgressIndicator></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<TABLE class="smallBorder" id="Table6" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										cellPadding="1" width="746" border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Location Supervisor / OIM #1</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table7" style="HEIGHT: 109px" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 26px" align="right">First Name:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 26px"><asp:textbox id="txtFName1" runat="server" MaxLength="50"></asp:textbox></TD>
														<TD style="WIDTH: 77px; HEIGHT: 26px" align="right">Last Name:</TD>
														<TD style="HEIGHT: 26px"><asp:textbox id="txtLName1" runat="server" MaxLength="50"></asp:textbox></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtPhone1" runat="server" MaxLength="50"></asp:textbox></TD>
														<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														<TD style="HEIGHT: 17px"></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">Address:</TD>
														<TD colSpan="3"><asp:textbox id="txtAddr1" runat="server" Width="398px" MaxLength="50"></asp:textbox></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														<TD colSpan="3"><asp:textbox id="txtCity1" runat="server" Width="198px" MaxLength="50"></asp:textbox>&nbsp;
															<asp:textbox id="txtState1" runat="server" Width="125px" MaxLength="15"></asp:textbox>&nbsp;
															<asp:textbox id="txtZip1" runat="server" Width="62px" MaxLength="10"></asp:textbox></TD>
													</TR>
													<tr>
													    <td colspan="2" style="height:15px;"></td>
													</tr>
													<tr>
													    <td align="left" colspan="2">
													        <asp:button id="btnSuper1" runat="server" CssClass="btnSmall"></asp:button>
													    </td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE class="smallBorder" id="Table8" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										cellPadding="1" width="746" border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Location Supervisor / OIM #2</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table9" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">First Name:</TD>
														<TD style="WIDTH: 161px"><asp:textbox id="txtFName2" runat="server" MaxLength="50"></asp:textbox></TD>
														<TD style="WIDTH: 77px" align="right">Last Name:</TD>
														<TD><asp:textbox id="txtLName2" runat="server" MaxLength="50"></asp:textbox></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtPhone2" runat="server" MaxLength="50"></asp:textbox></TD>
														<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														<TD style="HEIGHT: 17px"></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">Address:</TD>
														<TD colSpan="3"><asp:textbox id="txtAddr2" runat="server" Width="398px" MaxLength="50"></asp:textbox></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														<TD colSpan="3"><asp:textbox id="txtCity2" runat="server" Width="198px" MaxLength="50"></asp:textbox>&nbsp;
															<asp:textbox id="txtState2" runat="server" Width="125px" MaxLength="15"></asp:textbox>&nbsp;
															<asp:textbox id="txtZip2" runat="server" Width="62px" MaxLength="10"></asp:textbox></TD>
													</TR>
													<tr>
													    <td colspan="2" style="height:15px;"></td>
													</tr>
													<tr>
													    <td align="left" colspan="2">
													        <asp:button id="btnSuper2" runat="server" CssClass="btnSmall"></asp:button>
													    </td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="98%" border="0">
										<TR>
											<TD align="right">
												<asp:button id="btnFinish" runat="server" Text="Save" CssClass="btnSmall"></asp:button>
												<asp:Button id="btnComplete" runat="server" Text="Complete" CssClass="btnSmall"></asp:Button>&nbsp;<asp:button id="btnContinue" runat="server" CssClass="btnSmall" Text="Continue"></asp:button></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="/images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
