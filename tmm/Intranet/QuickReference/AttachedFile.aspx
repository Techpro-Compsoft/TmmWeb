<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="AttachedFile.aspx.vb" Inherits="QuickReference.AttachedFile"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Quick Reference List</TITLE>
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
								<TD><IMG src="images/Grphc_QuickRefAdmin.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<TR vAlign="top" height="429">
								<TD align="center"><BR>
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" border="0">
										<TR class="DataGridHdr">
											<TD>&nbsp;Attached File Edit</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="400" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 140px" align="right">File Name:</TD>
														<TD><asp:label id="lblFileName" runat="server"></asp:label></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 140px; HEIGHT: 10px" align="right">Category:</TD>
														<TD style="HEIGHT: 10px"><asp:dropdownlist id="cboCategory" runat="server" Width="262px"></asp:dropdownlist></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 140px" align="right">Upload Date and Time:</TD>
														<TD><asp:label id="lblDate" runat="server"></asp:label></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 140px" align="right"></TD>
														<TD>
															<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" border="0">
																<TR>
																	<TD style="WIDTH: 36px">
																		<asp:button id="btnSave" runat="server" CssClass="btnSmall" Text="Save"></asp:button></TD>
																	<TD>
																		<asp:button id="btnCancel" runat="server" CssClass="btnSmall" Text="Cancel"></asp:button></TD>
																	<TD></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD></TD>
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
