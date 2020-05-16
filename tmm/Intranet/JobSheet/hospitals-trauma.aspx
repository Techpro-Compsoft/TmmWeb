<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="hospitals-trauma.aspx.vb" Inherits="JobSheet.hospitals_trauma" SmartNavigation="true" ValidateRequest="false"%>
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
								<td align="center"><cc1:progressindicator id="ucProgress" BoookEndGraphics="True" BoookEndStartActive="images/img_Start_o.gif"
										BoookEndFinishActive="images/img_End_o.gif" StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif,images/btn_Step5.gif,images/btn_Step6.gif,images/btn_Step7.gif,images/btn_Step8.gif,images/btn_Step9.gif,images/btn_Step10.gif, images/btn_Step11.gif,images/btn_Step12.gif,Images/btn_Step13.gif,images/btn_Step14.gif"
										SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif,images/btn_Step5_o.gif,images/btn_Step6_o.gif,images/btn_Step7_o.gif,images/btn_Step8_o.gif,images/btn_Step9_o.gif,images/btn_Step10_o.gif, images/btn_Step11_o.gif,images/btn_Step12_o.gif,images/btn_Step13_o.gif,images/btn_Step14_o.gif"
										UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif,images/btn_Step5_d.gif,images/btn_Step6_d.gif,images/btn_Step7_d.gif,images/btn_Step8_d.gif,images/btn_Step9_d.gif,images/btn_Step10_d.gif, images/btn_Step11_d.gif,images/btn_Step12_d.gif,images/btn_Step13_d.gif,images/btn_Step14_d.gif"
										LinkURLs="locationinfo.aspx,locationsup.aspx,contractingcompany.aspx,crewtransportation.aspx,medevac1.aspx,medevac-uscg.aspx,medevac-mc.aspx,medevac-mcAlt.aspx,ambulance.aspx,hospitals-trauma.aspx,hospital-burn.aspx,clinic.aspx,edit-complete.aspx,edit-complete2.aspx"
										CurrentStep="10" LastAvailableStep="10" BoookEndFinish="images/img_End.gif" BoookEndStart="images/img_Start.gif" Height="48px"
										runat="server"></cc1:progressindicator></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 16px">&nbsp;Hospital (closest, trauma)
											</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 286px" align="right"><asp:label id="lblSelectHosp1" runat="server">Select a Hospital:</asp:label></TD>
														<TD style="WIDTH: 160px" colSpan="4"><rad:RadComboBox id="ddlSelectHosp1" runat="server" AutoPostBack="True" Width="155px" DropDownWidth="525px" MaxHeight="300px" HighlightTemplatedItems="true" CausesValidation="false" Skin="Gray">
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
														</rad:RadComboBox></TD>
													
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 286px" align="right">Company Name:</TD>
														<TD style="WIDTH: 171px"><asp:textbox id="txtCompName" runat="server" Width="156" MaxLength="50"></asp:textbox>
															<asp:RequiredFieldValidator id="rfvCompName" runat="server" ErrorMessage="Please enter a Company Name" Display="Dynamic"
																ControlToValidate="txtCompName">*</asp:RequiredFieldValidator></TD>
														<td style="WIDTH: 131px" align="right">Approximate Distance:</td>
														<td><asp:label id="lblDistance" runat="server"></asp:label>&nbsp;
															<asp:label id="lblStatuteMiles" runat="server" Visible="False">statute miles</asp:label></td>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 286px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 171px"><asp:textbox id="txtPhone" runat="server" MaxLength="50"></asp:textbox></TD>
														<td style="WIDTH: 131px" align="right">Approximate Time:</td>
														<td><asp:label id="lblTime" runat="server"></asp:label>&nbsp;
															<asp:label id="lblMinutes" runat="server" Visible="False">minutes</asp:label></td>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 286px; HEIGHT: 12px" align="right">Alternative Phone Number:</TD>
														<TD style="WIDTH: 171px; HEIGHT: 12px"><asp:textbox id="txtAltPhone" runat="server" MaxLength="50"></asp:textbox></TD>
														<td style="HEIGHT: 12px" align="center" colSpan="2"></td>
													</TR>
													<tr class="stdFont">
														<td style="WIDTH: 286px" align="right">Fax Number:</td>
														<td style="WIDTH: 171px"><asp:textbox id="txtFax" runat="server" MaxLength="50"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 286px" align="right">City:</td>
														<td style="WIDTH: 171px"><asp:textbox id="txtCity" runat="server" MaxLength="50"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 286px" align="right">State:</td>
														<td style="WIDTH: 171px"><asp:textbox id="txtState" runat="server" MaxLength="15"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 286px" align="right">Radio Frequency:</td>
														<td style="WIDTH: 171px"><asp:textbox id="txtFreq" runat="server" MaxLength="50"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
												</TABLE>
												<P class="stdFont"><BR>
													<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" border="0">
														<TR class="stdFont" align="center">
															<TD style="WIDTH: 368px" align="right">&nbsp;Choose style of Longitude/Latitude 
																entry:&nbsp;</TD>
															<TD align="left"><asp:radiobutton id="rbMinutes" runat="server" AutoPostBack="True" GroupName="Group1" Text="Minutes and Seconds"
																	Checked="True"></asp:radiobutton><asp:radiobutton id="rbDecimal" runat="server" AutoPostBack="True" GroupName="Group1" Text="Decimals"></asp:radiobutton></TD>
														</TR>
														<TR align="center">
															<TD class="stdFont" colSpan="2">
																<P class="stdFont"><asp:panel id="pnlMinutes" Height="48px" runat="server">
																					<TABLE id="Table9" cellSpacing="1" cellPadding="5" width="600" border="0">
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
																							    Minutes
																							</td>
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
																							<td>
																								<asp:TextBox id="txtLongMinutes" tabIndex="13" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
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
																						    <td>
																								E/W</td>
																							<td>
																								<asp:DropDownList id="ddlEWMinutes" tabIndex="15" runat="server" Width="50px"></asp:DropDownList>
																								<asp:RequiredFieldValidator id="rfvEWMinutes" runat="server" ControlToValidate="ddlEWMinutes" Display="Dynamic"
																									ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator></TD>
																						</TR>
																					</TABLE>
																	</asp:panel></P>
																<P class="stdFont"><asp:panel id="pnlDecimal" Height="32px" runat="server">
																		<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="300" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 16px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 16px">
																				    Degrees</td>
																				<td>
																					<asp:TextBox id="txtLat2" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic" ErrorMessage="Latitude degrees must be numeric"
																						Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic" ErrorMessage="Latitude must be between 0 and 90 degrees"
																						Type="Double" MinimumValue="0" MaximumValue="90">*</asp:RangeValidator>
																				</td>
																				<td>
																					N/S</td>
																			    <td>
																					<asp:DropDownList id="ddlNSDecimal" runat="server" Width="50px"></asp:DropDownList>
																					<asp:RequiredFieldValidator id="rfvNSDecimal" runat="server" ControlToValidate="ddlNSDecimal" Display="Dynamic"
																						ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator></TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																				    Degrees</td>
																				<td>
																					<asp:TextBox id="txtLong2" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic" ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic" ErrorMessage="Longitude degrees must be numeric"
																						Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic" ErrorMessage="Longitude degrees must be between 0 and 180"
																						Type="Double" MinimumValue="0" MaximumValue="180">*</asp:RangeValidator>
																				</td>
																				<td>
																					E/W</td>
																				<td>
																					<asp:DropDownList id="ddlEWDecimals" runat="server" Width="50px"></asp:DropDownList>
																					<asp:RequiredFieldValidator id="rfvEWDecimal" runat="server" ControlToValidate="ddlEWDecimals" Display="Dynamic"
																						ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator></TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<TABLE id="Table7" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR>
																		<TD><asp:button id="btnClearTop" runat="server" Text="Clear Hospital" CssClass="btnSmall" CausesValidation="False"></asp:button></TD>
																		<TD align="right"><asp:button id="btnCalculate" runat="server" Text="Calculate Distance and Time" CssClass="btnSmall"></asp:button></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</P>
											</TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr">&nbsp;Hospital (closest alternative)</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 281px" align="right"><asp:label id="lblSelectHosp2" runat="server">Select a Hospital:</asp:label></TD>
														<TD colSpan="3"><rad:RadComboBox id="ddlSelectHosp2" Skin="Gray" runat="server" AutoPostBack="True" Width="155px" DropDownWidth="525px" MaxHeight="300px" HighlightTemplatedItems="true" CausesValidation="false">
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
														</rad:RadComboBox></TD>
														
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 281px" align="right">Company Name:</TD>
														<TD style="WIDTH: 167px"><asp:textbox id="txtCompName2" runat="server" MaxLength="50"></asp:textbox>
															<asp:RequiredFieldValidator id="rfvCompName2" runat="server" ErrorMessage="Please enter a company name" Display="Dynamic"
																ControlToValidate="txtCompName2">*</asp:RequiredFieldValidator></TD>
														<td style="WIDTH: 131px" align="right">Approximate Distance:</td>
														<td><asp:label id="lblDistance2" runat="server"></asp:label>&nbsp;
															<asp:label id="lblStatuteMiles2" runat="server">statute miles</asp:label></td>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 281px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 167px"><asp:textbox id="txtPhone2" runat="server" MaxLength="50"></asp:textbox></TD>
														<td style="WIDTH: 131px" align="right">Approximate Time:</td>
														<td><asp:label id="lblTime2" runat="server"></asp:label>&nbsp;
															<asp:label id="lblMinutes2" runat="server">minutes</asp:label></td>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 281px; HEIGHT: 12px" align="right">Alternative Phone Number:</TD>
														<TD style="WIDTH: 167px; HEIGHT: 12px"><asp:textbox id="txtAltPhone2" runat="server" MaxLength="50"></asp:textbox></TD>
														<td style="WIDTH: 130px; HEIGHT: 12px" colSpan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													</TR>
													<tr class="stdFont">
														<td style="WIDTH: 281px" align="right">Fax Number:</td>
														<td style="WIDTH: 167px"><asp:textbox id="txtFax2" runat="server" MaxLength="50"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 281px" align="right">City:</td>
														<td style="WIDTH: 167px"><asp:textbox id="txtCity2" runat="server" MaxLength="50"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 281px" align="right">State:</td>
														<td style="WIDTH: 167px"><asp:textbox id="txtState2" runat="server" MaxLength="15"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 281px" align="right">Radio Frequency:</td>
														<td style="WIDTH: 167px"><asp:textbox id="txtFreq2" runat="server" MaxLength="50"></asp:textbox></td>
														<td style="WIDTH: 131px"></td>
														<td></td>
													</tr>
												</TABLE>
												<P class="stdFont"><BR>
													<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" border="0">
														<TR class="stdFont" align="center">
															<TD style="WIDTH: 368px" align="right">&nbsp;Choose style of Longitude/Latitude 
																entry:&nbsp;</TD>
															<TD align="left"><asp:radiobutton id="rbMinutes2" runat="server" AutoPostBack="True" GroupName="Group2" Text="Minutes and Seconds"
																	Checked="True"></asp:radiobutton><asp:radiobutton id="rbDecimal2" runat="server" AutoPostBack="True" GroupName="Group2" Text="Decimals"></asp:radiobutton></TD>
														</TR>
														<TR align="center">
															<TD class="stdFont" colSpan="2">
																<P class="stdFont"><asp:panel id="pnlMinutes2" Height="48px" runat="server">
																		<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="600" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 14px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 14px">Degrees</td>
																				<td>
																					<asp:TextBox id="txtLat3" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLat3" runat="server" ControlToValidate="txtLat3" Display="Dynamic" ErrorMessage="Please enter Latitude degrees">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLat3" runat="server" ControlToValidate="txtLat3" Display="Dynamic" ErrorMessage="Latitude degrees must be numeric"
																						Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLat3" runat="server" ControlToValidate="txtLat3" Display="Dynamic" ErrorMessage="Latitude must be between 0 and 90 degrees"
																						Type="Double" MinimumValue="0" MaximumValue="90">*</asp:RangeValidator>
																				</td>
																				<td>Minutes</td>
																				<td>
																					<asp:TextBox id="txtLat3Minutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLat3Minutes" runat="server" ControlToValidate="txtLat3" Display="Dynamic"
																						ErrorMessage="Please enter Latitude minutes">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLat3Minutes" runat="server" ControlToValidate="txtLat3Minutes" Display="Dynamic"
																						ErrorMessage="Latitude minutes must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLat3Minutes" runat="server" ControlToValidate="txtLat3Minutes" Display="Dynamic"
																						ErrorMessage="Latitude minutes must be between 0 and 60" Type="Double" MinimumValue="0" MaximumValue="60">*</asp:RangeValidator>
																				</td>
																				<td>Seconds</td>
																				<td>
																					<asp:TextBox id="txtLat3Seconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLat3Seconds" runat="server" ControlToValidate="txtLat3Seconds" Display="Dynamic"
																						ErrorMessage="Please enter Latitude seconds">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLat3Seconds" runat="server" ControlToValidate="txtLat3Seconds" Display="Dynamic"
																						ErrorMessage="Latitude seconds must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLat3Seconds" runat="server" ControlToValidate="txtLat3Seconds" Display="Dynamic"
																						ErrorMessage="Latitude seconds must be between 0 and 60" Type="Double" MinimumValue="0" MaximumValue="60">*</asp:RangeValidator>
																				</td>
																				<td>N/S</td>
																				<td>
																					<asp:DropDownList id="ddlNSMinutes2" runat="server" Width="40px"></asp:DropDownList>
																					<asp:RequiredFieldValidator id="rfvNSMinutes2" runat="server" ControlToValidate="ddlNSMinutes2" Display="Dynamic"
																						ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator></TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>Degrees</td>
																				<td>
																					<asp:TextBox id="txtLong3" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLong3" runat="server" ControlToValidate="txtLong3" Display="Dynamic" ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLong3" runat="server" ControlToValidate="txtLong3" Display="Dynamic" ErrorMessage="Longitude degrees must be numeric"
																						Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLong3" runat="server" ControlToValidate="txtLong3" Display="Dynamic" ErrorMessage="Longitude must be between 0 and 180 degrees"
																						Type="Double" MinimumValue="0" MaximumValue="180">*</asp:RangeValidator>
																				</td>
																				<td>Minutes</td>
																				<td>
																					<asp:TextBox id="txtLong3Minutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLong3Minutes" runat="server" ControlToValidate="txtLong3Minutes" Display="Dynamic"
																						ErrorMessage="Please enter Longitude minutes">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLong3Minutes" runat="server" ControlToValidate="txtLong3Minutes" Display="Dynamic"
																						ErrorMessage="Longitude minutes must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLong3Minutes" runat="server" ControlToValidate="txtLong3Minutes" Display="Dynamic"
																						ErrorMessage="Longitude minutes must be between 0 and 60" Type="Double" MinimumValue="0" MaximumValue="60">*</asp:RangeValidator>
																				</td>
																				<td>Seconds</td>
																				<td>
																					<asp:TextBox id="txtLong3Seconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLong3Seconds" runat="server" ControlToValidate="txtLong3Seconds" Display="Dynamic"
																						ErrorMessage="Please enter Longitude seconds">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLong3Seconds" runat="server" ControlToValidate="txtLong3Seconds" Display="Dynamic"
																						ErrorMessage="Longitude seconds must be numeric" Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLong3Seconds" runat="server" ControlToValidate="txtLong3Seconds" Display="Dynamic"
																						ErrorMessage="Longitude seconds must be between 0 and 60" Type="Double" MinimumValue="0" MaximumValue="60">*</asp:RangeValidator>
																				</td>
																				<td>E/W</td>
																				<td>
																					<asp:DropDownList id="ddlEWMinutes2" runat="server" Width="40px"></asp:DropDownList>
																					<asp:RequiredFieldValidator id="rfvEWMinutes2" runat="server" ControlToValidate="ddlEWMinutes2" Display="Dynamic"
																						ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator></TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<P class="stdFont"><asp:panel id="pnlDecimal2" Height="32px" runat="server">
																		<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="300" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 16px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 16px">Degrees</td>
																				<td>
																					<asp:TextBox id="txtLat4" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLat4" runat="server" ControlToValidate="txtLat4" Display="Dynamic" ErrorMessage="Please enter Latitude degrees">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLat4" runat="server" ControlToValidate="txtLat4" Display="Dynamic" ErrorMessage="Latitude degrees must be numeric"
																						Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLat4" runat="server" ControlToValidate="txtLat4" Display="Dynamic" ErrorMessage="Latitude must be between 0 and 90 degrees"
																						Type="Double" MinimumValue="0" MaximumValue="90">*</asp:RangeValidator>
																				</td>
																				<td>Decimal</td>
																				<td>
																					<asp:DropDownList id="ddlNSDecimal1" runat="server" Width="40px"></asp:DropDownList>
																					<asp:RequiredFieldValidator id="rfvNSDecimal1" runat="server" ControlToValidate="ddlNSDecimal1" Display="Dynamic"
																						ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator>N/S</TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																					<asp:TextBox id="txtLong4" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:RequiredFieldValidator id="rfvLong4" runat="server" ControlToValidate="txtLong4" Display="Dynamic" ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
																					<asp:CompareValidator id="cvLong4" runat="server" ControlToValidate="txtLong4" Display="Dynamic" ErrorMessage="Longitude degrees must be numeric"
																						Type="Double" Operator="DataTypeCheck">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvLong4" runat="server" ControlToValidate="txtLong4" Display="Dynamic" ErrorMessage="Longitude must be between 0 and 180 degrees"
																						Type="Double" MinimumValue="0" MaximumValue="180">*</asp:RangeValidator>degrees
																					<asp:DropDownList id="ddlEWDecimal1" runat="server" Width="40px"></asp:DropDownList>
																					<asp:RequiredFieldValidator id="rfvEWDecimal1" runat="server" ControlToValidate="ddlEWDecimal1" Display="Dynamic"
																						ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator>E/W</TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR>
																		<TD><asp:button id="btnClearBottom" runat="server" Text="Clear Hospital" CssClass="btnSmall"
																				CausesValidation="False"></asp:button></TD>
																		<TD align="right"><asp:button id="btnCalculate2" runat="server" Text="Calculate Distance and Time" CssClass="btnSmall"></asp:button></TD>
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
											<td><asp:button id="btnClear" runat="server" Text="Clear All Hospital Units" CssClass="btnSmall" CausesValidation="False"></asp:button></td>
											<TD align="right">
												<asp:button id="btnFinish" runat="server" Text="Save" CssClass="btnSmall"></asp:button>&nbsp;
												<asp:Button id="btnComplete" runat="server" Text="Complete" CssClass="btnSmall"></asp:Button>&nbsp;<asp:button id="btnContinue" runat="server" Text="Continue" CssClass="btnSmall"></asp:button></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="../images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
						<asp:ValidationSummary id="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
					</TD>
				</TR>
			</TABLE>
			<asp:ScriptManager ID="sManager" runat="server"></asp:ScriptManager>
		</FORM>
	</BODY>
</HTML>
