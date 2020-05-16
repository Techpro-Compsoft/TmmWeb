<%@ Page Language="vb" AutoEventWireup="false" Codebehind="crewtransportation.aspx.vb" Inherits="JobSheet.crewtransportation" ValidateRequest="false" smartNavigation="True"%>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
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
		<style type="text/css">
            div.RadComboBox_Gray .rcbInputCell INPUT.rcbInput
            {     
               height: 18px;
            }
        </style>
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
								<td align="center"><cc1:progressindicator id="ucProgress" BoookEndGraphics="True" BoookEndStart="images/img_Start.gif" BoookEndFinish="images/img_End.gif"
										LastAvailableStep="4" CurrentStep="4" LinkURLs="locationinfo.aspx,locationsup.aspx,contractingcompany.aspx,crewtransportation.aspx,medevac1.aspx,medevac-uscg.aspx,medevac-mc.aspx,medevac-mcAlt.aspx,ambulance.aspx,hospitals-trauma.aspx,hospital-burn.aspx,clinic.aspx,edit-complete.aspx,edit-complete2.aspx"
										UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif,images/btn_Step5_d.gif,images/btn_Step6_d.gif,images/btn_Step7_d.gif,images/btn_Step8_d.gif,images/btn_Step9_d.gif,images/btn_Step10_d.gif, images/btn_Step11_d.gif,images/btn_Step12_d.gif,images/btn_Step13_d.gif,images/btn_Step14_d.gif"
										SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif,images/btn_Step5_o.gif,images/btn_Step6_o.gif,images/btn_Step7_o.gif,images/btn_Step8_o.gif,images/btn_Step9_o.gif,images/btn_Step10_o.gif, images/btn_Step11_o.gif,images/btn_Step12_o.gif,images/btn_Step13_o.gif,images/btn_Step14_o.gif"
										StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif,images/btn_Step5.gif,images/btn_Step6.gif,images/btn_Step7.gif,images/btn_Step8.gif,images/btn_Step9.gif,images/btn_Step10.gif, images/btn_Step11.gif,images/btn_Step12.gif,Images/btn_Step13.gif,images/btn_Step14.gif"
										BoookEndFinishActive="images/img_End_o.gif" BoookEndStartActive="images/img_Start_o.gif" Height="48px" runat="server"></cc1:progressindicator></td>
							</tr>
							<TR vAlign="top" >
								<TD vAlign="top" align="center"><BR>
									<asp:panel id="pnlHeliport"  runat="server">
										<TABLE class="smallBorder" id="Table3" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Heliport</TD>
											</TR>
											<TR>
												<TD align="center">
													<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="550" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px; HEIGHT: 13px" align="right">
																<asp:Label id="lblSelectHeliport" runat="server">Select a Heliport:</asp:Label></TD>
															<TD style="HEIGHT: 13px">
                                                                <rad:RadComboBox ID="cboHeliports" runat="server" AutoPostBack="true" Width="225px" DropDownWidth="550px" MaxHeight="300px" HighlightTemplatedItems="true" Skin="Gray">
                                                                    <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width:350px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['ServiceName']")%>
                                                                            </td>
                                                                            <td style="width:75px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['Category']")%>
                                                                            </td>
                                                                            <td style="width:80px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['Distance']")%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    </ItemTemplate>
                                                                </rad:RadComboBox>
																</TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">Company Name:</TD>
															<TD>
																<asp:TextBox id="txtHCompName" runat="server" Width="225px" MaxLength="50"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">Contact First Name:</TD>
															<TD style="WIDTH: 211px">
																<asp:TextBox id="txtHFName" runat="server" Width="225px" MaxLength="50"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px; HEIGHT: 20px" align="right">Last Name:</TD>
															<TD style="HEIGHT: 20px">
																<asp:TextBox id="txtHLName" runat="server" Width="225px" MaxLength="50"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px; HEIGHT: 27px" align="right">Address:</TD>
															<TD style="HEIGHT: 26px">
																<asp:TextBox id="txtHAddr" runat="server" Width="391px" MaxLength="50"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">City / State / Zip:
															</TD>
															<TD>
																<asp:TextBox id="txtHCity" runat="server" Width="165px" MaxLength="50"></asp:TextBox>&nbsp;
																<asp:TextBox id="txtHState" runat="server" Width="125px" MaxLength="15"></asp:TextBox>&nbsp;
																<asp:TextBox id="txtHZip" runat="server" Width="89px" MaxLength="10"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">Phone Number:</TD>
															<TD style="WIDTH: 211px">
																<asp:TextBox id="txtHPhone" runat="server" MaxLength="50"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">Fax Number:</TD>
															<TD>
																<asp:TextBox id="txtHFax" runat="server" MaxLength="50"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">Approximate Distance:</TD>
															<TD>
																<asp:Label id="lblHeliportDistance" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px" align="right">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblHeliportTime" runat="server"></asp:Label></TD>
														</TR>
													</TABLE>
													<BR>
													<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="100%" border="0">
														<TR class="stdFont" align="center">
															<TD style="WIDTH: 377px" align="right">&nbsp;Choose style of Longitude/Latitude 
																entry:&nbsp;</TD>
															<TD align="left">
																<asp:radiobutton id="rbHeliMinutes" runat="server" AutoPostBack="True" Checked="True" Text="Minutes and Seconds"
																	GroupName="Heliport"></asp:radiobutton>
																<asp:radiobutton id="rbHeliDecimal" runat="server" AutoPostBack="True" Text="Decimals" GroupName="Heliport"></asp:radiobutton></TD>
														</TR>
														<TR align="center">
															<TD class="stdFont" colSpan="2">
																<P class="stdFont">
																	<asp:panel id="pnlHeliMinutes" runat="server" Height="48px">
																		<TABLE id="Table9" cellSpacing="1" cellPadding="1" width="600" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 17px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 17px">Degrees</td>
																				<td>
																					<asp:TextBox id="txtHeliLatitudeDegreesMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLatitudeDegreesMinutes" runat="server" ControlToValidate="txtHeliLatitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Latitude degrees must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLatitudeDegreesMinutes" runat="server" ControlToValidate="txtHeliLatitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Latitude degrees must be between 0 and 90" Type="Double" MinimumValue="0"
																						MaximumValue="90">*</asp:RangeValidator>
																				</td>
																				<td>Minutes</td>
																				<td>
																					<asp:TextBox id="txtHeliLatitudeMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLatitudeMinutes" runat="server" ControlToValidate="txtHeliLatitudeMinutes"
																						Display="Dynamic" ErrorMessage="Latitude minutes must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLatitudeMinutes" runat="server" ControlToValidate="txtHeliLatitudeMinutes"
																						Display="Dynamic" ErrorMessage="Latitude minutes must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>
																				</td>
																				<td>Seconds</td>
																			    <td>
																					<asp:TextBox id="txtHeliLatitudeSeconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLatitudeSeconds" runat="server" ControlToValidate="txtHeliLatitudeSeconds"
																						Display="Dynamic" ErrorMessage="Latitude seconds must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLatitudeSeconds" runat="server" ControlToValidate="txtHeliLatitudeSeconds"
																						Display="Dynamic" ErrorMessage="Latitude seconds must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>
																				</td>
																				<td>N/S</td>
																				<td><asp:DropDownList id="cboHeliLatitudeMinutesDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="N">N</asp:ListItem>
																						<asp:ListItem Value="S">S</asp:ListItem>
																					</asp:DropDownList></TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																				    Degrees</td>
																				<td>
																					<asp:TextBox id="txtHeliLongitudeDegreesMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLongitudeDegreesMinutes" runat="server" ControlToValidate="txtHeliLongitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Longitude degrees must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLongitudeDegreesMinutes" runat="server" ControlToValidate="txtHeliLongitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Longitude must be between 0 and 180 degrees" Type="Double" MinimumValue="0"
																						MaximumValue="180">*</asp:RangeValidator>
																				</td>
																				<td>
																					Minutes</td>
																				<td>
																					<asp:TextBox id="txtHeliLongitudeMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLongitudeMinutes" runat="server" ControlToValidate="txtHeliLongitudeMinutes"
																						Display="Dynamic" ErrorMessage="Longitude minutes must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLongitudeMinutes" runat="server" ControlToValidate="txtHeliLongitudeMinutes"
																						Display="Dynamic" ErrorMessage="Longitude minutes must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>
																			    </td>
																			    <td>
																					Seconds</td>
																				<td>
																					<asp:TextBox id="txtHeliLongitudeSeconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLongitudeSeconds" runat="server" ControlToValidate="txtHeliLongitudeSeconds"
																						Display="Dynamic" ErrorMessage="Longitude seconds must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLongitudeSeconds" runat="server" ControlToValidate="txtHeliLongitudeSeconds"
																						Display="Dynamic" ErrorMessage="Longitude seconds must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>
																			    </td>
																			    <td>
																					E/W</td>
																				<td>
																					<asp:DropDownList id="cboHeliLongitudeMinutesDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="E">E</asp:ListItem>
																						<asp:ListItem Value="W">W</asp:ListItem>
																					</asp:DropDownList></TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<P class="stdFont">
																	<asp:panel id="pnlHeliDecimal" runat="server" Height="32px">
																		<TABLE id="Table10" cellSpacing="1" cellPadding="1" width="300" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 16px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 16px">
																				    Degrees</td>
																				<td>
																					<asp:TextBox id="txtHeliLatitudeDecimal" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLatitudeDecimal" runat="server" ControlToValidate="txtHeliLatitudeDecimal"
																						Display="Dynamic" ErrorMessage="Latitude must be numeric" Type="Double" Operator="DataTypeCheck" Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLatitudeDecimal" runat="server" ControlToValidate="txtHeliLatitudeDecimal"
																						Display="Dynamic" ErrorMessage="Latitude must be between 0 and 90 degrees" Type="Double" MinimumValue="0"
																						MaximumValue="90" Enabled="False">*</asp:RangeValidator>&nbsp;
																				</td>
																				<td>
																					N/S</td>
																			    <td>
																					<asp:DropDownList id="cboHeliLatitudeDecimalDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="N">N</asp:ListItem>
																						<asp:ListItem Value="S">S</asp:ListItem>
																					</asp:DropDownList></TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																				    Degrees</td>
																				<td>
																					<asp:TextBox id="txtHeliLongitudeDecimal" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvHeliLongitudeDecimal" runat="server" ControlToValidate="txtHeliLongitudeDecimal"
																						Display="Dynamic" ErrorMessage="Longitude degrees must be numeric" Type="Double" Operator="DataTypeCheck"
																						Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvHeliLongitudeDecimal" runat="server" ControlToValidate="txtHeliLongitudeDecimal"
																						Display="Dynamic" ErrorMessage="Longitude must be between 0 and 180 degrees" Type="Double" MinimumValue="0"
																						MaximumValue="180" Enabled="False">*</asp:RangeValidator>&nbsp;
																				</td>
																				<td>
																					E/W</td>
																			    <td>
																					<asp:DropDownList id="cboHeliLongitudeDecimalDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="E">E</asp:ListItem>
																						<asp:ListItem Value="W">W</asp:ListItem>
																					</asp:DropDownList></TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<TABLE id="Table11" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR>
																		<TD>
																			<asp:button id="btnClearHeliport" runat="server" Text="Clear Heliport" CausesValidation="False"
																				CssClass="btnSmall"></asp:button></TD>
																		<TD align="right">
																			<asp:button id="btnHeliportCalculate" runat="server" Text="Calculate Distance and Time" CssClass="btnSmall"></asp:button></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
									</asp:panel>
										<TABLE class="smallBorder" id="Table5" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Boat Dock</TD>
											</TR>
											<TR>
												<TD align="center">
													<TABLE id="Table6" cellSpacing="1" cellPadding="1" width="550" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">
																<asp:Label id="lblSelectBoatDock" runat="server">Select a Boat Dock:</asp:Label></TD>
															<TD>
															<rad:RadComboBox ID="cboBoatDocks" runat="server" AutoPostBack="true" Width="225px" DropDownWidth="550px" HighlightTemplatedItems="true" MaxHeight="300px" Skin="Gray">
															<ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width:350px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['ServiceName']")%>
                                                                            </td>
                                                                            <td style="width:75px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['Category']")%>
                                                                            </td>
                                                                            <td style="width:80px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['Distance']")%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    </ItemTemplate>
															</rad:RadComboBox>
														    </TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Company Name:</TD>
															<TD>
																<asp:TextBox id="txtBCompName" runat="server" Width="225px"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Contact First Name:</TD>
															<TD style="WIDTH: 150px">
																<asp:TextBox id="txtBFName" runat="server" Width="225px"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Last Name:</TD>
															<TD>
																<asp:TextBox id="txtBLName" runat="server" Width="225px"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Address:</TD>
															<TD>
																<asp:TextBox id="txtBAddr" runat="server" Width="391px"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">City / State / Zip:
															</TD>
															<TD>
																<asp:TextBox id="txtBCity" runat="server" Width="165px" MaxLength="50"></asp:TextBox>&nbsp;
																<asp:TextBox id="txtBState" runat="server" Width="125px" MaxLength="15"></asp:TextBox>&nbsp;
																<asp:TextBox id="txtBZip" runat="server" Width="89px" MaxLength="10"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Phone Number:</TD>
															<TD style="WIDTH: 150px">
																<asp:TextBox id="txtBPhone" runat="server"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Fax Number:</TD>
															<TD>
																<asp:TextBox id="txtBFax" runat="server"></asp:TextBox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Approximate Distance:</TD>
															<TD>
																<asp:Label id="lblBoatDockDistance" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 128px" align="right">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblBoatDockTime" runat="server"></asp:Label></TD>
														</TR>
													</TABLE>
													<BR>
													<TABLE id="Table12" cellSpacing="1" cellPadding="1" width="100%" border="0">
														<TR class="stdFont" align="center">
															<TD style="WIDTH: 377px" align="right">&nbsp;Choose style of Longitude/Latitude 
																entry:&nbsp;</TD>
															<TD align="left">
																<asp:radiobutton id="rbBoatMinutes" runat="server" AutoPostBack="True" Checked="True" Text="Minutes and Seconds"
																	GroupName="BoatDock"></asp:radiobutton>
																<asp:radiobutton id="rbBoatDecimal" runat="server" AutoPostBack="True" Text="Decimals" GroupName="BoatDock"></asp:radiobutton></TD>
														</TR>
														<TR align="center">
															<TD class="stdFont" colSpan="2">
																<P class="stdFont">
																	<asp:panel id="pnlBoatMinutes" runat="server" Height="48px">
																		<TABLE id="Table13" cellSpacing="1" cellPadding="1" width="600" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 17px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 17px">
																					<asp:TextBox id="txtBoatLatitudeDegreesMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLatitudeDegreesMinutes" runat="server" ControlToValidate="txtBoatLatitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Latitude degrees must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLatitudeDegreesMinutes" runat="server" ControlToValidate="txtBoatLatitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Latitude degrees must be between 0 and 90" Type="Double" MinimumValue="0"
																						MaximumValue="90">*</asp:RangeValidator>degrees
																					<asp:TextBox id="txtBoatLatitudeMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLatitudeMinutes" runat="server" ControlToValidate="txtBoatLatitudeMinutes"
																						Display="Dynamic" ErrorMessage="Latitude minutes must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLatitudeMinutes" runat="server" ControlToValidate="txtBoatLatitudeMinutes"
																						Display="Dynamic" ErrorMessage="Latitude minutes must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>minutes
																					<asp:TextBox id="txtBoatLatitudeSeconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLatitudeSeconds" runat="server" ControlToValidate="txtBoatLatitudeSeconds"
																						Display="Dynamic" ErrorMessage="Latitude seconds must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLatitudeSeconds" runat="server" ControlToValidate="txtBoatLatitudeSeconds"
																						Display="Dynamic" ErrorMessage="Latitude seconds must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>seconds
																					<asp:DropDownList id="cboBoatLatitudeDirection" runat="server" Width="40px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="N">N</asp:ListItem>
																						<asp:ListItem Value="S">S</asp:ListItem>
																					</asp:DropDownList>N/S</TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																					<asp:TextBox id="txtBoatLongitudeDegreesMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLongitudeDegreesMinutes" runat="server" ControlToValidate="txtBoatLongitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Longitude degrees must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLongitudeDegreesMinutes" runat="server" ControlToValidate="txtBoatLongitudeDegreesMinutes"
																						Display="Dynamic" ErrorMessage="Longitude must be between 0 and 180 degrees" Type="Double" MinimumValue="0"
																						MaximumValue="180">*</asp:RangeValidator>degrees
																					<asp:TextBox id="txtBoatLongitudeMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLongitudeMinutes" runat="server" ControlToValidate="txtBoatLongitudeMinutes"
																						Display="Dynamic" ErrorMessage="Longitude minutes must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLongitudeMinutes" runat="server" ControlToValidate="txtBoatLongitudeMinutes"
																						Display="Dynamic" ErrorMessage="Longitude minutes must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>minutes
																					<asp:TextBox id="txtBoatLongitudeSeconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLongitudeSeconds" runat="server" ControlToValidate="txtBoatLongitudeSeconds"
																						Display="Dynamic" ErrorMessage="Longitude seconds must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLongitudeSeconds" runat="server" ControlToValidate="txtBoatLongitudeSeconds"
																						Display="Dynamic" ErrorMessage="Longitude seconds must be between 0 and 60" Type="Double" MinimumValue="0"
																						MaximumValue="60">*</asp:RangeValidator>seconds
																					<asp:DropDownList id="cboBoatLongitudeDirection" runat="server" Width="40px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="E">E</asp:ListItem>
																						<asp:ListItem Value="W">W</asp:ListItem>
																					</asp:DropDownList>E/W</TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<P class="stdFont">
																	<asp:panel id="pnlBoatDecimal" runat="server" Height="32px">
																		<TABLE id="Table14" cellSpacing="1" cellPadding="1" width="300" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 16px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 16px">
																					<asp:TextBox id="txtBoatLatitudeDegreesDecimal" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLatitudeDegreesDecimal" runat="server" ControlToValidate="txtBoatLatitudeDegreesDecimal"
																						Display="Dynamic" ErrorMessage="Latitude must be numeric" Type="Double" Operator="DataTypeCheck" Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLatitudeDegreesDecimal" runat="server" ControlToValidate="txtBoatLatitudeDegreesDecimal"
																						Display="Dynamic" ErrorMessage="Latitude must be between 0 and 90 degrees" Type="Double" MinimumValue="0"
																						MaximumValue="90" Enabled="False">*</asp:RangeValidator>&nbsp;degrees
																					<asp:DropDownList id="cboBoatLatitudeDecimalDirection" runat="server" Width="40px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="N">N</asp:ListItem>
																						<asp:ListItem Value="S">S</asp:ListItem>
																					</asp:DropDownList>N/S</TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																					<asp:TextBox id="txtBoatLongitudeDegreesDecimal" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvBoatLongitudeDegreesDecimal" runat="server" ControlToValidate="txtBoatLongitudeDegreesDecimal"
																						Display="Dynamic" ErrorMessage="Longitude degrees must be numeric" Type="Double" Operator="DataTypeCheck"
																						Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvBoatLongitudeDegreesDecimal" runat="server" ControlToValidate="txtBoatLongitudeDegreesDecimal"
																						Display="Dynamic" ErrorMessage="Longitude must be between 0 and 180 degrees" Type="Double" MinimumValue="0"
																						MaximumValue="180" Enabled="False">*</asp:RangeValidator>&nbsp;degrees
																					<asp:DropDownList id="cboBoatLongitudeDecimalDirection" runat="server" Width="40px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="E">E</asp:ListItem>
																						<asp:ListItem Value="W">W</asp:ListItem>
																					</asp:DropDownList>E/W</TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<TABLE id="Table15" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR>
																		<TD>
																			<asp:button id="btnClearBoatDock" runat="server" Text="Clear Boat Dock" CausesValidation="False"
																				CssClass="btnSmall"></asp:button></TD>
																		<TD align="right">
																			<asp:button id="btnBoatDockCalculate" runat="server" Text="Calculate Distance and Time" CssClass="btnSmall"></asp:button></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<P>&nbsp;</P>
									
									<TABLE id="Table7" cellSpacing="1" cellPadding="1" width="98%" border="0">
										<TR>
											<TD align="right"><asp:button id="btnFinish" runat="server" Text="Save" CssClass="btnSmall"></asp:button>&nbsp;
												<asp:button id="btnComplete" runat="server" Text="Complete" CssClass="btnSmall"></asp:button>&nbsp;<asp:button id="btnContinue" runat="server" Text="Continue" CssClass="btnSmall"></asp:button></TD>
										</TR>
									</TABLE>
									<BR>
								</TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="../images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<asp:ScriptManager ID="sManager" runat="server"></asp:ScriptManager>
		</FORM>
	</BODY>
</HTML>
