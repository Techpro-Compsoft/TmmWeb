<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ambulance.aspx.vb" Inherits="JobSheet.ambulance" ValidateRequest="false" smartNavigation="True"%>
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
								<td align="center"><cc1:progressindicator id="ucProgress" Height="48px" BoookEndStart="images/img_Start.gif" BoookEndFinish="images/img_End.gif"
										LastAvailableStep="9" CurrentStep="9" LinkURLs="locationinfo.aspx,locationsup.aspx,contractingcompany.aspx,crewtransportation.aspx,medevac1.aspx,medevac-uscg.aspx,medevac-mc.aspx,medevac-mcAlt.aspx,ambulance.aspx,hospitals-trauma.aspx,hospital-burn.aspx,clinic.aspx,edit-complete.aspx,edit-complete2.aspx"
										UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif,images/btn_Step5_d.gif,images/btn_Step6_d.gif,images/btn_Step7_d.gif,images/btn_Step8_d.gif,images/btn_Step9_d.gif,images/btn_Step10_d.gif, images/btn_Step11_d.gif,images/btn_Step12_d.gif,images/btn_Step13_d.gif,images/btn_Step14_d.gif"
										SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif,images/btn_Step5_o.gif,images/btn_Step6_o.gif,images/btn_Step7_o.gif,images/btn_Step8_o.gif,images/btn_Step9_o.gif,images/btn_Step10_o.gif, images/btn_Step11_o.gif,images/btn_Step12_o.gif,images/btn_Step13_o.gif,images/btn_Step14_o.gif"
										StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif,images/btn_Step5.gif,images/btn_Step6.gif,images/btn_Step7.gif,images/btn_Step8.gif,images/btn_Step9.gif,images/btn_Step10.gif, images/btn_Step11.gif,images/btn_Step12.gif,Images/btn_Step13.gif,images/btn_Step14.gif"
										BoookEndFinishActive="images/img_End_o.gif" BoookEndStartActive="images/img_Start_o.gif" BoookEndGraphics="True" runat="server"></cc1:progressindicator></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr">&nbsp;Ambulance (<asp:literal ID="litHeader" runat="server"></asp:literal>)</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table2" style="HEIGHT: 163px" cellSpacing="1" cellPadding="1" width="500" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 178px" align="right"><asp:label id="lblSelectAmbulance" runat="server">Select an Ambulance:</asp:label></TD>
														<TD><rad:RadComboBox id="cboAmbulances" runat="server" NoWrap="true"  AutoPostBack="True" skin="Gray" Width="155px" DropDownWidth="550px" MaxHeight="300px" HighlightTemplatedItems="true" CausesValidation="false">
														    <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width:300px; font-family:Arial; font-size:12px">
                                                                                <%#DataBinder.Eval(Container, "Attributes['ServiceName']")%>
                                                                            </td>
                                                                            <td style="width:130px; font-family:Arial; font-size:12px">
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
														<TD style="WIDTH: 178px" align="right">Ambulance&nbsp;Name:</TD>
														<TD><asp:textbox id="txtCompName" runat="server" MaxLength="50"></asp:textbox><asp:requiredfieldvalidator id="rfvAmbName" runat="server" ControlToValidate="txtCompName" Display="Dynamic"
																ErrorMessage="Please enter an Ambulance Name">*</asp:requiredfieldvalidator></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 178px" align="right">Phone Number:</TD>
														<TD><asp:textbox id="txtPhone" runat="server" MaxLength="50"></asp:textbox></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 178px" align="right">Alternative Phone Number:</TD>
														<TD><asp:textbox id="txtAltPhone" runat="server" MaxLength="50"></asp:textbox></TD>
													</TR>
													<tr class="stdFont">
														<td style="WIDTH: 178px" align="right">Fax Number:</td>
														<td><asp:textbox id="txtFax" runat="server" MaxLength="50"></asp:textbox></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 178px" align="right">Distance (<asp:Literal ID="litDistance1" runat="server"></asp:Literal>):</td>
														<td><asp:label id="lblAmbulanceDistance" runat="server"></asp:label>&nbsp;
															<asp:label id="lblMiles" runat="server" Visible="False">miles</asp:label></td>
													</tr>
													<tr class="stdFont">
														<td style="WIDTH: 178px" align="right">Time (<asp:Literal ID="litDistance2" runat="server"></asp:Literal>):</td>
														<td><asp:label id="lblAmbulanceTime" runat="server"></asp:label>&nbsp;
															<asp:label id="lblMinutes" runat="server">minutes</asp:label></td>
													</tr>
												</TABLE>
												<P>
													<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="100%" border="0">
														<TR class="stdFont" align="center">
															<TD style="WIDTH: 377px" align="right">&nbsp;Choose style of Longitude/Latitude 
																entry:&nbsp;</TD>
															<TD align="left"><asp:radiobutton id="rbAmbMinutes" runat="server" AutoPostBack="True" GroupName="Heliport" Checked="True"
																	Text="Minutes and Seconds"></asp:radiobutton><asp:radiobutton id="rbAmbDecimal" runat="server" AutoPostBack="True" GroupName="Heliport" Text="Decimals"></asp:radiobutton></TD>
														</TR>
														<TR align="center">
															<TD class="stdFont" colSpan="2">
																<P class="stdFont"><asp:panel id="pnlAmbMinutes" Height="48px" runat="server">
																		<TABLE id="Table9" cellSpacing="1" cellPadding="1" width="600" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 5px" align="right">Latitude:</TD>
																				<TD style="HEIGHT: 5px">
																				    Degrees</td>
																				<td>
																					<asp:TextBox id="txtAmbLatitudeDegreesMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLatitudeDegreesMinutes" runat="server" ErrorMessage="Latitude degrees must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeDegreesMinutes" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLatitudeDegreesMinutes" runat="server" ErrorMessage="Latitude degrees must be between 0 and 90"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeDegreesMinutes" Type="Double" MaximumValue="90"
																						MinimumValue="0">*</asp:RangeValidator>
																				</td>
																				<td>
																					Minutes</td>
																				<td>
																					<asp:TextBox id="txtAmbLatitudeMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLatitudeMinutes" runat="server" ErrorMessage="Latitude minutes must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeMinutes" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLatitudeMinutes" runat="server" ErrorMessage="Latitude minutes must be between 0 and 60"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeMinutes" Type="Double" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																			    </td>
																			    <td>
																					Seconds</td>
																			    <td>
																					<asp:TextBox id="txtAmbLatitudeSeconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLatitudeSeconds" runat="server" ErrorMessage="Latitude seconds must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeSeconds" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLatitudeSeconds" runat="server" ErrorMessage="Latitude seconds must be between 0 and 60"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeSeconds" Type="Double" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																			    </td>
																			    <td>
																					N/S</td>
																				<td>
																					<asp:DropDownList id="cboAmbLatitudeMinutesDirection" runat="server" Width="50px">
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
																					<asp:TextBox id="txtAmbLongitudeDegreesMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLongitudeDegreesMinutes" runat="server" ErrorMessage="Longitude degrees must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeDegreesMinutes" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLongitudeDegreesMinutes" runat="server" ErrorMessage="Longitude must be between 0 and 180 degrees"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeDegreesMinutes" Type="Double" MaximumValue="180"
																						MinimumValue="0">*</asp:RangeValidator>
																				</td>
																				<td>
																					Minutes</td>
																				<td>
																					<asp:TextBox id="txtAmbLongitudeMinutes" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLongitudeMinutes" runat="server" ErrorMessage="Longitude minutes must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeMinutes" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLongitudeMinutes" runat="server" ErrorMessage="Longitude minutes must be between 0 and 60"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeMinutes" Type="Double" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																			    </td>
																			    <td>
																					Seconds</td>
																				<td>
																					<asp:TextBox id="txtAmbLongitudeSeconds" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLongitudeSeconds" runat="server" ErrorMessage="Longitude seconds must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeSeconds" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLongitudeSeconds" runat="server" ErrorMessage="Longitude seconds must be between 0 and 60"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeSeconds" Type="Double" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
																				</td>
																				<td>
																					E/W</td>
																				<td>
																					<asp:DropDownList id="cboAmbLongitudeMinutesDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="E">E</asp:ListItem>
																						<asp:ListItem Value="W">W</asp:ListItem>
																					</asp:DropDownList></TD>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<P class="stdFont"><asp:panel id="pnlAmbDecimal" Height="32px" runat="server">
																		<TABLE id="Table10" cellSpacing="1" cellPadding="1" width="300" border="0">
																			<TR class="stdFont">
																				<TD style="HEIGHT: 16px" align="right">Latitude:</TD>
																				<td style="HEIGHT: 16px">
																				    Degrees&nbsp;
																				</td>
																				<td>
																					<asp:TextBox id="txtAmbLatitudeDecimal" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLatitudeDecimal" runat="server" ErrorMessage="Latitude must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeDecimal" Operator="DataTypeCheck" Type="Double"
																						Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLatitudeDecimal" runat="server" ErrorMessage="Latitude must be between 0 and 90 degrees"
																						Display="Dynamic" ControlToValidate="txtAmbLatitudeDecimal" Type="Double" MaximumValue="90" MinimumValue="0"
																						Enabled="False">*</asp:RangeValidator>&nbsp;
																				</td>
																				<td>
																					N/S&nbsp;
																				</td>
																				<td>
																					<asp:DropDownList id="cboAmbLatitudeDecimalDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="N">N</asp:ListItem>
																						<asp:ListItem Value="S">S</asp:ListItem>
																					</asp:DropDownList>
																				</TD>
																			</TR>
																			<TR class="stdFont">
																				<TD align="right">Longitude:</TD>
																				<TD>
																				    Degrees&nbsp;
																				</td>
																				<td>
																					<asp:TextBox id="txtAmbLongitudeDecimal" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
																					<asp:CompareValidator id="cvAmbLongitudeDecimal" runat="server" ErrorMessage="Longitude degrees must be numeric"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeDecimal" Operator="DataTypeCheck" Type="Double"
																						Enabled="False">*</asp:CompareValidator>
																					<asp:RangeValidator id="rvAmbLongitudeDecimal" runat="server" ErrorMessage="Longitude must be between 0 and 180 degrees"
																						Display="Dynamic" ControlToValidate="txtAmbLongitudeDecimal" Type="Double" MaximumValue="180" MinimumValue="0"
																						Enabled="False">*</asp:RangeValidator>&nbsp;
																				</td>
																				<td>
																					E/W&nbsp;
																				</td>
																				<td>
																					<asp:DropDownList id="cboAmbLongitudeDecimalDirection" runat="server" Width="50px">
																						<asp:ListItem></asp:ListItem>
																						<asp:ListItem Value="E">E</asp:ListItem>
																						<asp:ListItem Value="W">W</asp:ListItem>
																					</asp:DropDownList>
																				</td>
																			</TR>
																		</TABLE>
																	</asp:panel></P>
																<TABLE id="Table11" cellSpacing="1" cellPadding="1" width="98%" border="0">
																	<TR>
																		<TD><asp:button id="btnClearAmbulance" runat="server" Text="Clear Ambulance" CausesValidation="False"
																				CssClass="btnSmall"></asp:button></TD>
																		<TD align="right"><asp:button id="btnAmbulanceCalculate" runat="server" Text="Calculate Distance and Time" CssClass="btnSmall"></asp:button></TD>
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
											<td align="right"><asp:button id="btnFinish" runat="server" Text="Save" CssClass="btnSmall"></asp:button>&nbsp;
												<asp:button id="btnComplete" runat="server" Text="Complete" CssClass="btnSmall"></asp:button>&nbsp;<asp:button id="btnContinue" runat="server" Text="Continue" CssClass="btnSmall"></asp:button></td>
										</TR>
									</TABLE>
									<asp:validationsummary id="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary></TD>
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
