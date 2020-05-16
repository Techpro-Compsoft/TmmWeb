<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="default.aspx.vb" Inherits="JobSheet._default"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
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
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
								</TD>
							</TR>
							<tr height="20">
								<td></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr">&nbsp;Current Job Information Sheet</TD>
										</TR>
										<TR class="stdFont">
											<TD style="HEIGHT: 248px" align="center">
												<P>&nbsp;</P>
												<asp:panel id="pnlJobSheet" runat="server" Height="67px">
													<TABLE class="smallBorder" id="Table3" cellSpacing="1" cellPadding="1" width="98%" align="center"
														border="0">
														<TR class="DataGridHdr">
															<TD class="SecHdr">&nbsp;Job Information Sheet Summary</TD>
														</TR>
														<TR class="stdFont">
															<TD align="center">
																<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR class="stdFont">
																		<TD style="WIDTH: 123px">Project Name:</TD>
																		<TD style="WIDTH: 220px">
																			<asp:label id="lblProjectName" runat="server"></asp:label></TD>
																		<TD style="WIDTH: 148px">Project Number:</TD>
																		<TD>
																			<asp:label id="lblProjectNumber" runat="server"></asp:label></TD>
																	</TR>
																	<TR class="stdFont">
																		<TD style="WIDTH: 123px">Contracting Company:</TD>
																		<TD colSpan="3">
																			<asp:label id="lblCComp" runat="server"></asp:label></TD>
																	</TR>
																	<TR class="stdFont">
																		<TD style="WIDTH: 123px">Latitude:</TD>
																		<TD style="WIDTH: 220px">
																			<asp:label id="lblRigLat" runat="server"></asp:label></TD>
																		<TD style="WIDTH: 148px">Longitude:</TD>
																		<TD>
																			<asp:label id="lblRigLong" runat="server"></asp:label></TD>
																	</TR>
																	<TR class="stdFont">
																		<TD style="WIDTH: 123px">Phone Number:</TD>
																		<TD style="WIDTH: 220px">
																			<asp:label id="lblRigPhone" runat="server"></asp:label></TD>
																		<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
																		<TD>
																			<asp:label id="lblRigAltPhone" runat="server"></asp:label></TD>
																	</TR>
																	<TR class="stdFont">
																		<TD style="WIDTH: 123px">Current Medic:</TD>
																		<TD style="WIDTH: 220px">
																			<asp:Label id="lblCurrentMedic" runat="server"></asp:Label></TD>
																		<TD style="WIDTH: 148px" colSpan="2"></TD>
																	</TR>
																	<TR class="stdFont">
																		<TD style="WIDTH: 123px"></TD>
																		<TD style="WIDTH: 220px">
																			<asp:Button id="btnChange" Text="Change Current Medic" CssClass="btnSmall" runat="server"></asp:Button></TD>
																		<TD style="WIDTH: 148px" colSpan="2"></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</asp:panel></TD>
										</TR>
										<TR>
											<TD align="center"><BR>
												<TABLE id="Table4" style="HEIGHT: 22px" cellSpacing="1" cellPadding="1" width="98%" border="0">
													<TR>
														<TD><asp:button id="btnCreate" runat="server" CssClass="btnSmall" Text="Create New Job Sheet"></asp:button>&nbsp;
															<asp:button id="btnEdit" runat="server" CssClass="btnSmall" Text="Edit Current Job Sheet"></asp:button>&nbsp;
															<asp:button id="btnDelete" runat="server" CssClass="btnSmall" Text="Delete Incomplete Job Sheet"
																Visible="False"></asp:button></TD>
														<TD style="WIDTH: 1px"></TD>
														<TD align="right"><asp:panel id="pnlPrint" runat="server" Height="22px" HorizontalAlign="Right">
														<asp:Button ID="btnPrint" runat="server" CssClass="btnSmall" Text="Print Job Sheet" />
														</asp:panel></TD>
														
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<asp:label id="lblExists" runat="server" CssClass="stdFont"></asp:label></TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="/images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<iframe id="HiddenPrintFrame" src="Printjobsheet.aspx" width="0" height="0" runat="server">
			</iframe>
		</FORM>
	</BODY>
</HTML>
