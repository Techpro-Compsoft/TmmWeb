<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="QuickRef_View.aspx.vb" Inherits="QuickReference.QuickRef_View" %>
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
								<TD><IMG src="images/Trinity_GraphicBar_QuickRef.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<TR vAlign="top" height="429">
								<TD style="HEIGHT: 413px" align="center">
									<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="98%" border="0">
										<TR style="HEIGHT: 20px">
											<TD></TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="98%" border="0">
													<tr>
														<td>
															<TABLE class="normal" id="Table4" cellSpacing="1" cellPadding="1" width="100%" border="0">
																<TR CLASS="DataGridHdr">
																	<TD class="SecHdr">&nbsp;Search for a Report</TD>
																</TR>
																<TR>
																	<TD>
																		<P align="center">
																			<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="300" align="center" border="0">
																				<TR class="stdFont">
																					<TD style="WIDTH: 79px">Name</TD>
																					<TD><asp:textbox id="txtName" Width="225px" MaxLength="100" runat="server"></asp:textbox></TD>
																				</TR>
																				<TR class="stdFont">
																					<TD style="WIDTH: 79px">Category</TD>
																					<TD><asp:dropdownlist id="cboCategory" Width="225px" runat="server"></asp:dropdownlist></TD>
																				</TR>
																				<TR>
																					<TD></TD>
																					<TD align="right"><asp:button id="btnSearch" runat="server" CssClass="btnSmall" Text=" Search "></asp:button></TD>
																				</TR>
																			</TABLE>
																			<asp:label id="lblResults" runat="server"></asp:label></P>
																	</TD>
																</TR>
															</TABLE>
														</td>
													</tr>
													<TR class="stdFont">
														<TD><asp:datagrid id="grdResults" Width="100%" runat="server" CssClass="normal" AutoGenerateColumns="False"
																BorderWidth="1px" BorderStyle="Solid" BorderColor="White" AllowPaging="True" Height="1px"
																CellPadding="2" AllowSorting="True" GridLines="None" Font-Size="X-Small">
																<AlternatingItemStyle CssClass="AlternatingItem"></AlternatingItemStyle>
																<ItemStyle CssClass="Item"></ItemStyle>
																<HeaderStyle CssClass="DataGridHdr"></HeaderStyle>
																<Columns>
																	<asp:BoundColumn Visible="False" DataField="ID"></asp:BoundColumn>
																	<asp:ButtonColumn Text="Select" DataTextField="Name" HeaderText="Name" CommandName="Select"></asp:ButtonColumn>
																	<asp:BoundColumn DataField="CategoryName" HeaderText="Category"></asp:BoundColumn>
																	<asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
																</Columns>
																<PagerStyle Height="10px" Font-Size="X-Small" Font-Names="Arial" HorizontalAlign="Right" BackColor="#307FA3"
																	Mode="NumericPages"></PagerStyle>
															</asp:datagrid></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
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
