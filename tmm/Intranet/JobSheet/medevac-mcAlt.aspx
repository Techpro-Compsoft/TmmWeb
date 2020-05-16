<%@ Page Language="vb" AutoEventWireup="false" Codebehind="medevac-mcAlt.aspx.vb" Inherits="JobSheet.medevac_mcAlt" ValidateRequest="false"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
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
								<td align="center">
									<cc1:ProgressIndicator id="ucProgress" runat="server" Height="48px" BoookEndStart="images/img_Start.gif"
										BoookEndFinish="images/img_End.gif" LastAvailableStep="8" CurrentStep="8" LinkURLs="locationinfo.aspx,locationsup.aspx,contractingcompany.aspx,crewtransportation.aspx,medevac1.aspx,medevac-uscg.aspx,medevac-mc.aspx,medevac-mcAlt.aspx,ambulance.aspx,hospitals-trauma.aspx,hospital-burn.aspx,clinic.aspx,edit-complete.aspx,edit-complete2.aspx"
										UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif,images/btn_Step5_d.gif,images/btn_Step6_d.gif,images/btn_Step7_d.gif,images/btn_Step8_d.gif,images/btn_Step9_d.gif,images/btn_Step10_d.gif, images/btn_Step11_d.gif,images/btn_Step12_d.gif,images/btn_Step13_d.gif,images/btn_Step14_d.gif"
										SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif,images/btn_Step5_o.gif,images/btn_Step6_o.gif,images/btn_Step7_o.gif,images/btn_Step8_o.gif,images/btn_Step9_o.gif,images/btn_Step10_o.gif, images/btn_Step11_o.gif,images/btn_Step12_o.gif,images/btn_Step13_o.gif,images/btn_Step14_o.gif"
										StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif,images/btn_Step5.gif,images/btn_Step6.gif,images/btn_Step7.gif,images/btn_Step8.gif,images/btn_Step9.gif,images/btn_Step10.gif, images/btn_Step11.gif,images/btn_Step12.gif,Images/btn_Step13.gif,images/btn_Step14.gif"
										BoookEndFinishActive="images/img_End_o.gif" BoookEndStartActive="images/img_Start_o.gif" BoookEndGraphics="True"></cc1:ProgressIndicator></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD align="center" vAlign="top">
									<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="98%" border="0" align="center"
										class="smallBorder">
										<TR CLASS="DataGridHdr">
											<TD class="SecHdr">&nbsp;Med-Evac Alternate 2</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<tr class="stdFont">
														<td align="right" style="WIDTH: 252px">
															<asp:label id="lblSelectEvac" runat="server">Select a Med-Evac:</asp:label></td>
														<td colspan="3">
															<rad:RadComboBox CausesValidation="false" id="ddlMedEvac" runat="server" AutoPostBack="True" Width="155px" DropDownWidth="525px" MaxHeight="300px" HighlightTemplatedItems="true" Skin="Gray">
															    <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width:250px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['ServiceName']")%>
                                                                            </td>
                                                                            <td style="width:125px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['Category']")%>
                                                                            </td>
                                                                            <td style="width:80px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['Distance']")%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    </ItemTemplate>
															</rad:RadComboBox></td>
													</tr>
													<TR class="stdFont">
														<TD align="right" style="WIDTH: 252px">Company Name:</TD>
														<TD style="WIDTH: 190px">
															<asp:TextBox id="txtCompName" runat="server" MaxLength="50"></asp:TextBox></TD>
														<td align="right" style="WIDTH: 130px">Approximate Distance:</td>
														<td>
															<asp:Label id="lblDistance" runat="server"></asp:Label>&nbsp;
															<asp:Label id="lblStatuteMiles" runat="server" Visible="False">statute miles</asp:Label></td>
													</TR>
													<TR class="stdFont">
														<TD align="right" style="WIDTH: 252px">Phone Number:</TD>
														<TD style="WIDTH: 190px">
															<asp:TextBox id="txtPhone" runat="server" MaxLength="50"></asp:TextBox></TD>
														<td align="right" style="WIDTH: 130px">Approximate Time:</td>
														<td>
															<asp:Label id="lblTime" runat="server"></asp:Label>&nbsp;
															<asp:Label id="lblMinutes" runat="server" Visible="False">minutes</asp:Label></td>
													</TR>
													<TR class="stdFont">
														<TD align="right" style="WIDTH: 252px">Alternative Phone Number:</TD>
														<TD style="WIDTH: 190px">
															<asp:TextBox id="txtAltPhone" runat="server" MaxLength="50"></asp:TextBox></TD>
														<td style="WIDTH: 130px"></td>
														<td></td>
													</TR>
													<tr class="stdFont">
														<td align="right" style="WIDTH: 252px">Fax Number:</td>
														<td style="WIDTH: 190px">
															<asp:TextBox id="txtFax" runat="server" MaxLength="50"></asp:TextBox></td>
														<td style="WIDTH: 130px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td align="right" style="WIDTH: 252px">City:</td>
														<td style="WIDTH: 190px">
															<asp:TextBox id="txtCity" runat="server" MaxLength="50"></asp:TextBox></td>
														<td style="WIDTH: 130px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td align="right" style="WIDTH: 252px">State:</td>
														<td style="WIDTH: 190px">
															<asp:TextBox id="txtState" runat="server" MaxLength="15"></asp:TextBox></td>
														<td style="WIDTH: 130px"></td>
														<td></td>
													</tr>
												</TABLE>
												<P class="stdFont"><BR>
													<TABLE id="Table7" cellSpacing="1" cellPadding="1" width="100%" border="0">
														<TR class="stdFont" align="center">
															<TD style="WIDTH: 381px" align="right">&nbsp;Choose style of Longitude/Latitude 
																entry:&nbsp;</TD>
															<TD align="left">
																<asp:radiobutton id="rbMinutes" runat="server" Checked="True" Text="Minutes and Seconds" GroupName="Group1"
																	AutoPostBack="True"></asp:radiobutton>
																<asp:radiobutton id="rbDecimal" runat="server" Text="Decimals" GroupName="Group1" AutoPostBack="True"></asp:radiobutton></TD>
														</TR>
														<TR align="center">
															<TD class="stdFont" colSpan="2">
																<P class="stdFont">
																	<asp:panel id="pnlMinutes" Height="48px" runat="server">
																					<TABLE id="Table4" cellSpacing="1" cellPadding="5" width="600" border="0">
																						<TR class="stdFont">
																							<TD style="HEIGHT: 17px" align="right">Latitude:</TD>
																							<TD style="HEIGHT: 17px">
																							    Degrees</td>
																							<td>
																								<asp:TextBox id="txtLat1" tabIndex="8" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
																								<asp:RequiredFieldValidator id="rfvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic" ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
																								<asp:CompareValidator id="cvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic" Type="Double"
																									Operator="DataTypeCheck" ErrorMessage="Latitude degrees must be numeric">*</asp:CompareValidator>
																								<asp:RangeValidator id="rvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic" Type="Double"
																									ErrorMessage="Latitude degrees must be between 0 an 90." MaximumValue="90" MinimumValue="0">*</asp:RangeValidator>
																						    </td>
																						    <td>
																							    Minutes</td>
																							<td>
																								<asp:TextBox id="txtLatMinutes" tabIndex="9" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
																								<asp:RequiredFieldValidator id="rfvLatMinutes" runat="server" ControlToValidate="txtLatMinutes" Display="Dynamic"
																									ErrorMessage="Please enter Latitude minutes">*</asp:RequiredFieldValidator>
																								<asp:CompareValidator id="cvLatMinutes" runat="server" ControlToValidate="txtLatMinutes" Display="Dynamic"
																									Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude minutes must be numeric" DESIGNTIMEDRAGDROP="5457">*</asp:CompareValidator>
																								<asp:RangeValidator id="rvLatMinutes" runat="server" ControlToValidate="txtLatMinutes" Display="Dynamic"
																									Type="Double" ErrorMessage="Latitude minutes must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																							</td>
																							<td>
																							    Seconds</td>
																							<td>
																								<asp:TextBox id="txtLatSeconds" tabIndex="10" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
																								<asp:RequiredFieldValidator id="rfvLatSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic"
																									ErrorMessage="Please enter Latitude seconds">*</asp:RequiredFieldValidator>
																								<asp:CompareValidator id="cvLatSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic"
																									Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude seconds must be numeric">*</asp:CompareValidator>
																								<asp:RangeValidator id="rvLatSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic"
																									Type="Double" ErrorMessage="Latitude seconds must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																						    </td>
																						    <td>
																							    N/S</td>
																							<td>
																								<asp:DropDownList id="ddlNSMinutes" tabIndex="11" runat="server" Width="50px"></asp:DropDownList>
																								<asp:RequiredFieldValidator id="rfvNSMinutes" runat="server" ControlToValidate="ddlNSMinutes" Display="Dynamic"
																									ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator></TD>
																						</TR>
																						<TR class="stdFont">
																							<TD align="right">Longitude:</TD>
																							<TD>
																							    Degrees</td>
																							<td>
																								<asp:TextBox id="txtLong1" tabIndex="12" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
																								<asp:RequiredFieldValidator id="rfvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic" ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
																								<asp:CompareValidator id="cvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic" Type="Double"
																									Operator="DataTypeCheck" ErrorMessage="Longitude degrees must be numeric" DESIGNTIMEDRAGDROP="5459">*</asp:CompareValidator>
																								<asp:RangeValidator id="rvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic" Type="Double"
																									ErrorMessage="Longitude degrees must be between 0 and 180" MaximumValue="180" MinimumValue="0">*</asp:RangeValidator>
																						    </td>
																						    <td>
																								Minutes</td>
																							<td><asp:TextBox id="txtLongMinutes" tabIndex="13" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
																								<asp:RequiredFieldValidator id="rfvLongMinutes" runat="server" ControlToValidate="txtLongMinutes" Display="Dynamic"
																									ErrorMessage="Please enter Longitude minutes">*</asp:RequiredFieldValidator>
																								<asp:CompareValidator id="cvLongMinutes" runat="server" ControlToValidate="txtLongMinutes" Display="Dynamic"
																									Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude minutes must be numberic">*</asp:CompareValidator>
																								<asp:RangeValidator id="rvLongMinutes" runat="server" ControlToValidate="txtLongMinutes" Display="Dynamic"
																									Type="Double" ErrorMessage="Longitude minutes must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																							</td>
																							<td>
																								Seconds</td>
																						    <td>
																								<asp:TextBox id="txtLongSeconds" tabIndex="14" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
																								<asp:RequiredFieldValidator id="rfvLongSeconds" runat="server" ControlToValidate="txtLongSeconds" Display="Dynamic"
																									ErrorMessage="Please enter Longitude seconds" DESIGNTIMEDRAGDROP="4867">*</asp:RequiredFieldValidator>
																								<asp:CompareValidator id="cvLongSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic"
																									Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude seconds must be numeric">*</asp:CompareValidator>
																								<asp:RangeValidator id="rvLongSeconds" runat="server" ControlToValidate="txtLongSeconds" Display="Dynamic"
																									Type="Double" ErrorMessage="Longitude seconds must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																						    </td>
																						    <td>E/W</td>
																						    <td>
																								<asp:DropDownList id="ddlEWMinutes" tabIndex="15" runat="server" Width="50px"></asp:DropDownList>
																								<asp:RequiredFieldValidator id="rfvEWMinutes" runat="server" ControlToValidate="ddlEWMinutes" Display="Dynamic"
																									ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator></TD>
																						</TR>
																					</TABLE>
																	</asp:panel></P>
																<P class="stdFont">
																	<asp:panel id="pnlDecimal" Height="32px" runat="server">
																		<TABLE id="Table9" cellSpacing="1" cellPadding="1" width="300" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 16px" align="right">Latitude:</TD>
																				<td style="HEIGHT: 16px">
																				    Degrees&nbsp;
																				</td>
																				<td>
																					<asp:TextBox id="txtLat2" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvLat2" runat="server" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtLat2"
																						Display="Dynamic" ErrorMessage="Latitude must be numeric" Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLat2" runat="server" Type="Double" ControlToValidate="txtLat2" Display="Dynamic"
																						ErrorMessage="Latitude must be between 0 and 90 degrees" MaximumValue="90" MinimumValue="0" Enabled="False">*</asp:RangeValidator>&nbsp;
																				</td>
																				<td>
																					N/S&nbsp;
																				</td>
																				<td>
																					<asp:DropDownList id="ddlNSDecimal" runat="server" Width="50px"></asp:DropDownList>
																				</td>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<td>
																				    Degrees&nbsp;
																				</td>
																				<td>
																					<asp:TextBox id="txtLong2" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvLong2" runat="server" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtLong2"
																						Display="Dynamic" ErrorMessage="Longitude degrees must be numeric" Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLong2" runat="server" Type="Double" ControlToValidate="txtLong2" Display="Dynamic"
																						ErrorMessage="Longitude must be between 0 and 180 degrees" MaximumValue="180" MinimumValue="0" Enabled="False">*</asp:RangeValidator>&nbsp;
																				</td>
																				<td>
																					E/W&nbsp;
																				</td>
																				<td>
																					<asp:DropDownList id="ddlEWDecimals" runat="server" Width="50px"></asp:DropDownList>
																				</td>
																				
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR>
																		<TD>
																			<asp:button id="btnClear" runat="server" Text="Clear Med-Evac Alternate 2" CssClass="btnSmall" CausesValidation="False"></asp:button></TD>
																		<TD align="right">
																			<asp:button id="btnCalculate" runat="server" Text="Calculate Distance and Time" CssClass="btnSmall"></asp:button></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</P>
											</TD>
										</TR>
									</TABLE>
									<TABLE id="Table6" cellSpacing="1" cellPadding="1" width="98%" border="0">
										<TR>
											<TD align="right">
												<asp:Button id="btnFinish" runat="server" Text="Save" CssClass="btnSmall"></asp:Button>&nbsp;
												<asp:Button id="btnComplete" runat="server" Text="Complete" CssClass="btnSmall"></asp:Button>&nbsp;
												<asp:Button id="btnContinue" runat="server" Text="Continue" CssClass="btnSmall"></asp:Button></TD>
										</TR>
									</TABLE>
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
