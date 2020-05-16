<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="QuickReferenceList.aspx.vb" Inherits="QuickReference.QuickReferenceList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>QuickReferenceList</TITLE>
		<META CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<META CONTENT="Visual Basic .NET 7.1" NAME="CODE_LANGUAGE">
		<META CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<META CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		<LINK HREF="/trinity.css" TYPE="text/css" REL="stylesheet">
	</HEAD>
	<BODY BGCOLOR="#000000" TOPMARGIN="0">
		<FORM ID="Form1" METHOD="post" RUNAT="server">
			<TABLE HEIGHT="100%" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
				<TR VALIGN="top">
					<TD ALIGN="center" WIDTH="100%">
						<TABLE STYLE="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid"
							HEIGHT="560" WIDTH="758">
							<TR VALIGN="top" HEIGHT="100">
								<TD><IMG SRC="images/Grphc_QuickRefAdmin.jpg"><BR>
									<UC1:NAVIGATIONMENU ID="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<TR VALIGN="top" HEIGHT="429">
								<TD ALIGN="center">
									<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="98%" BORDER="0">
										<TR>
											<TD>&nbsp;</TD>
										</TR>
										<TR>
											<TD>
												<TABLE CELLSPACING="0" CELLPADDING="3" WIDTH="100%" BORDER="0">
													<TR>
														<TD WIDTH="50%">&nbsp;
															<ASP:BUTTON ID="btnNew" TEXT=" Create New Quick Reference" RUNAT="server" CSSCLASS="btnSmall"></ASP:BUTTON></TD>
														<TD ALIGN="right" WIDTH="50%">&nbsp;
															<ASP:BUTTON ID="btnView" TEXT="View Files on the Server" RUNAT="server" CSSCLASS="btnSmall"></ASP:BUTTON></TD>
													</TR>
													<TR>
														<TD COLSPAN="2">&nbsp;</TD>
													</TR>
													<TR CLASS="stdFont">
														<TD COLSPAN="2">
															<ASP:LABEL ID="lblInstructions" RUNAT="server"></ASP:LABEL>
														</TD>
													</TR>
													<TR CLASS="stdFont" ID="rowWarning" RUNAT="server">
														<TD STYLE="COLOR: red" COLSPAN="2"><BR>
															<ASP:LABEL ID="lblMessage" RUNAT="server"></ASP:LABEL></TD>
													</TR>
												</TABLE>
												<BR>
												<ASP:DATAGRID ID="grdResults" RUNAT="server" CSSCLASS="normal" FONT-SIZE="X-Small" BORDERCOLOR="White"
													BORDERWIDTH="1px" BORDERSTYLE="Solid" HEIGHT="1px" CELLPADDING="2" GRIDLINES="None" AUTOGENERATECOLUMNS="False"
													ALLOWSORTING="True" WIDTH="100%" ALLOWPAGING="True" HorizontalAlign="Right">
													<AlternatingItemStyle CssClass="AlternatingItem"></AlternatingItemStyle>
													<ItemStyle CssClass="Item"></ItemStyle>
													<HeaderStyle CssClass="DataGridHdr"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="ID"></asp:BoundColumn>
														<asp:ButtonColumn DataTextField="Name" HeaderText="Name" CommandName="Select"></asp:ButtonColumn>
														<asp:BoundColumn DataField="CategoryName" HeaderText="Category"></asp:BoundColumn>
														<asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
														<asp:ButtonColumn Text="Delete" HeaderText="Action" CommandName="Delete">
															<ItemStyle Width="19px"></ItemStyle>
														</asp:ButtonColumn>
													</Columns>
													<PagerStyle Height="10px" Font-Size="X-Small" Font-Names="Arial" HorizontalAlign="Right" BackColor="#307FA3"
														Mode="NumericPages"></PagerStyle>
												</ASP:DATAGRID></TD>
										</TR>
									</TABLE>
									<ASP:LABEL ID="lblHTML" RUNAT="server" FORECOLOR="Black">Label</ASP:LABEL>
								</TD>
							</TR>
							<TR VALIGN="top" HEIGHT="31">
								<TD ALIGN="center"><IMG SRC="/images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
