<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>

<%@ Page Language="vb" AutoEventWireup="false" Codebehind="searchovertime.aspx.vb" Inherits="MyAccount.searchovertime" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Overtime Availability</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/trinity.css" type="text/css" rel="stylesheet">
		<script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" RUNAT="server">
			<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<TR vAlign="top">
					<TD align="center" width="100%">
						<TABLE style="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid"
							height="640" width="758">
							<TR vAlign="top" height="100">
								<TD><IMG src="images/Grphc_OvertimeAvail.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<tr height="20">
								<td></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="left">
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr">&nbsp;Search Overtime Availability</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="250" border="0">
													<TR>
														<TD class="stdFont" align="right">Start Date:</TD>
														<TD class="stdFont">&nbsp;
															<asp:CompareValidator id="cvStartDt" runat="server" EnableClientScript="False" Display="None" ControlToValidate="rdpStart"
																Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
														    <asp:RequiredFieldValidator ID="rfvStart" runat="server" EnableClientScript="false" Display="None" ControlToValidate="rdpStart"></asp:RequiredFieldValidator>
																<radCln:RadDatePicker ID="rdpStart" runat="server" SkinID="Trinity" MaxDate="3000-12-31" MinDate="1000-01-01" Width="120px">
									                                <DatePopupButton CssClass="RadDatePickerButton" />
									                                <DateInput MaxLength="10"></DateInput>
									                                <Calendar Skin="Trinity"></Calendar>
									                            </radCln:RadDatePicker>
													    </TD>
													</TR>
													<TR>
														<TD class="stdFont" align="right">End Date:</TD>
														<TD class="stdFont">&nbsp;
															<asp:CompareValidator id="cvEndDt" runat="server" EnableClientScript="False" Display="None" ControlToValidate="rdpEnd"
																Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
														    <asp:RequiredFieldValidator ID="rfvEnd" runat="server" EnableClientScript="false" Display="None" ControlToValidate="rdpEnd"></asp:RequiredFieldValidator>
																<radCln:RadDatePicker ID="rdpEnd" runat="server" SkinID="Trinity" MaxDate="3000-12-31" MinDate="1000-01-01" Width="120px">
									                                <DatePopupButton CssClass="RadDatePickerButton" />
									                                <DateInput MaxLength="10"></DateInput>
									                                <Calendar Skin="Trinity"></Calendar>
									                            </radCln:RadDatePicker>
													    </TD>
													</TR>
													<tr>
														<td class="stdFont" align="center" colSpan="2"><FONT face="Times New Roman" color="#000000" size="3"><asp:checkbox id="chkPartial" runat="server" Text="Show Medics Available for a Partial Amount of the Date Range"
																	CssClass="stdFont"></asp:checkbox></FONT></td>
													</tr>
													<tr>
														<td align="center" colSpan="2"><asp:button id="btnSearch" runat="server" Text="Search Overtime Availability" CssClass="btnSmall"></asp:button></td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="740" align="center" border="0">
										<TR>
											<TD class="stdFont" align="center" height="100%">
												<P><asp:label id="lblCount" runat="server"></asp:label></P>
                                                <p>
                                                    <radA:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ScrollBars="None"
                                                        Width="100%">
                                                   <ASP:DATAGRID id="grdResults" RUNAT="server" CSSCLASS="normal" ALLOWPAGING="True" WIDTH="740px"
														ALLOWSORTING="True" AUTOGENERATECOLUMNS="False"  GRIDLINES="None" CELLPADDING="2" HEIGHT="1px"
														BORDERSTYLE="Solid" BORDERWIDTH="1px" BORDERCOLOR="White" FONT-SIZE="X-Small">
														<AlternatingItemStyle CssClass="AlternatingItem"></AlternatingItemStyle>
														<ItemStyle  CssClass="Item"></ItemStyle>
														<HeaderStyle CssClass="DataGridHdr"></HeaderStyle>
														<Columns>
															<asp:BoundColumn Visible="False" DataField="OvertimeAvailID"></asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="MedicID"></asp:BoundColumn>
															<asp:BoundColumn DataField="AvailStartDate" HeaderText="Start Date">
																<HeaderStyle Width="75px"></HeaderStyle>
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="AvailEndDate" HeaderText="End Date">
																<HeaderStyle Width="75px"></HeaderStyle>
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="MedicNm" HeaderText="Medic">
																<HeaderStyle Width="100px"></HeaderStyle>
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="HomeAddress" HeaderText="Address">
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="HomeCity" HeaderText="City">
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="HomeState" HeaderText="State">
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="HomeZip" HeaderText="Zip">
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="HomeCountry" HeaderText="Country">
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn Visible="False" DataField="AvailNote" HeaderText="Note">
																<ItemStyle VerticalAlign="Top"></ItemStyle>
															</asp:BoundColumn>
															<asp:ButtonColumn Text="View" HeaderText="Comments" CommandName="Cancel">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
															</asp:ButtonColumn>
														</Columns>
														<PagerStyle Height="10px" Font-Size="X-Small" Font-Names="Arial" HorizontalAlign="Right" BackColor="#307FA3"
															Mode="NumericPages"></PagerStyle>
													</ASP:DATAGRID><br /><asp:literal id="litComments" runat="server"></asp:literal>
                                                    </radA:RadAjaxPanel>
                                                </p>
											</TD>
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
