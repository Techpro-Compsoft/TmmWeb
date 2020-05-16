<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page language="c#" Inherits="TrinityMedicalManagement.Medical" ValidateRequest="false" Codebehind="Medical.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Trinity Medical Management - Patient Encounter</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="C#" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="trinity.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="scripts/validate.js" type="text/javascript"></script>
		<script language="javascript" src="scripts/pageScripts.js" type="text/javascript"></script>
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> <META HTTP-EQUIV="Expires" CONTENT="-1">
	</HEAD>
	<BODY id="bodyMain" bgColor="#000000" leftMargin="0" topMargin="0" runat="server">
		<FORM id="Form1" method="post" runat="server">
			<center>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
				<TABLE cellSpacing="3" cellPadding="6" width="760" border="0">
					<TR>
						<TD><IMG src="images/ttl_PatientEncounterBar.jpg"><BR>
							<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
					</TR>
					<TR>
						<TD>
						    <asp:Panel ID="pnlAddEditHeader" runat="server">
							    <table border=0 width="100%">
							        <tr class="tblHdr">
							            <td>Medical Information: Step 2 of 3</td>
							            <td align="right"><asp:Literal ID="litSearchLink" runat="server" /></td>
							            <td width="25px">&nbsp</td>
							        </tr>
							    </table>
							</asp:Panel>
							<asp:Panel ID="pnlViewHeader" runat="server" Visible="false">
							    <table border="0" width="100%" cellpadding="0" cellspacing="0">
							        <tr>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="108px" align="center"><a href="patient.aspx" class="ViewHeaderNotSelected">Patient Information</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_active_lt.gif" /></td>
							            <td background="images/tab_active_mid.gif" width="112px" align="center" class="ViewHeaderSelected">Medical Information</td>
							            <td width="1px"><img src="images/tab_active_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="1px">
                                            <a href="notes.aspx" class="ViewHeaderNotSelected">Notes</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="1px">
                                            <a href="documents.aspx" class="ViewHeaderNotSelected">Documents</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
							            <td></td>
							            <td align="right"><asp:Literal ID="litSearchLink2" runat="server" /></td>
							            <td width="25px"></td>
							        </tr>
							        <tr>
							            <td colspan="18" bgcolor="white" height="3px"></td>
							        </tr>
							    </table>
							</asp:Panel>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" EnableClientScript="false"/>
                        </TD>
					</TR>
					<TR>
						<TD>
						    <div style="color:White; font-family:Arial; font-size:12px;"><asp:Literal ID="litPatientData" runat="server" /></div>
							<TABLE class="tblSection" cellSpacing="0" cellPadding="2" width="100%" border="0">
								<TR class="stdFont">
									<TD class="secHdr" colSpan="4"><B>Rig Consultation</B></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 125px"><ASP:LABEL id="Label2" RUNAT="server" CSSCLASS="WhiteText">Consult Date</ASP:LABEL></TD>
									<TD style="WIDTH: 255px"><ASP:TEXTBOX id="txtConsultDate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtConsultDate" RUNAT="server"></SPAN><SPAN class="showTip" runat="server" style="width:auto;" id="tipConsultDate1"
											onmouseout="hideTip(this);">?</SPAN>
										<asp:CompareValidator ID="cvConsultDate" runat="server" EnableClientScript="False" ControlToValidate="txtConsultDate" Operator="DataTypeCheck" Type="date" ErrorMessage="Please enter a valid date. '##/##/####'" ValidationGroup="PageSubmit">*</asp:CompareValidator>
										<asp:RequiredFieldValidator ID="rfvConsultDate" runat="server" EnableClientScript="False" ControlToValidate="txtConsultDate" ErrorMessage="Please enter the Consult Date." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
                                            </TD>
									<TD style="WIDTH: 125px"><ASP:LABEL id="Label3" RUNAT="server" CSSCLASS="WhiteText">Consult Time</ASP:LABEL></TD>
									<TD style="WIDTH: 255px"><ASP:TEXTBOX id="txtConsultTime" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4"></ASP:TEXTBOX><SPAN class="view" id="spantxtConsultTime" RUNAT="server"></SPAN><SPAN class="showTip" runat="server" style="width:auto;" id="tipConsultTime1"
											onmouseout="hideTip(this);">?</SPAN><asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator1" runat="server" EnableClientScript="False" ControlToValidate="txtConsultTime"
                                            ErrorMessage="The Time you entered is either incorrect or not formatted in military time. ex. 0930"
                                            ValidationExpression="(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)" ValidationGroup="PageSubmit">*</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator5" runat="server" EnableClientScript="False" ControlToValidate="txtConsultTime"
                                                ErrorMessage="Please enter the consult time." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label4" RUNAT="server" CSSCLASS="WhiteText">Paramedic Name</ASP:LABEL></TD>
									<TD><ASP:DROPDOWNLIST id="cboMedic" RUNAT="server" CSSCLASS="cboLarge"></ASP:DROPDOWNLIST><SPAN class="view" id="spancboMedic" RUNAT="server"></SPAN></TD>
									<TD><ASP:LABEL id="Label5" RUNAT="server" CSSCLASS="WhiteText">Medical Consult</ASP:LABEL></TD>
									<TD><ASP:CHECKBOX id="chkMedicalConsult" RUNAT="server" CSSCLASS="smallChk"></ASP:CHECKBOX><SPAN class="view" id="spanchkMedicalConsult" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label6" RUNAT="server" CSSCLASS="WhiteText">Transport Method</ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtTransport" RUNAT="server" CSSCLASS="txtMedLarge" MAXLENGTH="50"></ASP:TEXTBOX><SPAN class="view" id="spantxtTransport" RUNAT="server"></SPAN></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label7" RUNAT="server" CSSCLASS="WhiteText">Chief Complaint</ASP:LABEL></TD>
									<TD colSpan="3"><ASP:TEXTBOX id="txtComplaint" RUNAT="server" CSSCLASS="txtboxXLarge" MAXLENGTH="150"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtComplaint" RUNAT="server"></SPAN><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="False" ErrorMessage="Please enter the patient's chief complaint." ControlToValidate="txtComplaint" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<TABLE class="tblSection" cellSpacing="0" cellPadding="2" width="100%" border="0">
								<TR class="stdFont">
									<TD class="secHdr" colSpan="4"><STRONG>Transport Information</STRONG></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label8" RUNAT="server" CSSCLASS="WhiteText">Departure Date</ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtDepartDate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX><SPAN class="view" id="spantxtDepartDate" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" runat="server" id="tipDepartureDate1" 
											onmouseout="hideTip(this);">?</SPAN>&nbsp;
									    <span class="WhiteText" style="font-size:10px;">Not Applicable</span>
										<asp:CompareValidator ID="cvDepartDate" Display="none" runat="server" ControlToValidate="txtDepartDate" Operator="DataTypeCheck" Type="date" ErrorMessage="Please enter a valid date. '##/##/####'" ValidationGroup="PageSubmit">*</asp:CompareValidator>
                                        <asp:RegularExpressionValidator Display="none" ID="revDepartTime" runat="server" ControlToValidate="txtDepartTime" EnableClientScript="false"
                                            ErrorMessage="The Time you entered is either incorrect or not formatted in military time. ex. 0930" ValidationExpression="(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)" ValidationGroup="PageSubmit">*</asp:RegularExpressionValidator>
									</TD>
									<TD><ASP:LABEL id="Label9" RUNAT="server" CSSCLASS="WhiteText">Departure Time</ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtDepartTime" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4"></ASP:TEXTBOX><SPAN class="view" id="spantxtDepartTime" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" runat="server" id="tipDepartureTime1" 
											onmouseout="hideTip(this);">?</SPAN>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label10" RUNAT="server" CSSCLASS="WhiteText">Hospital/Clinic</ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtHospital" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX><SPAN class="view" id="spantxtHospital" RUNAT="server"></SPAN></TD>
									<TD>&nbsp;</TD>
									<TD>&nbsp;</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 125px"><ASP:LABEL id="Label11" RUNAT="server" CSSCLASS="WhiteText">Date of Arrival</ASP:LABEL></TD>
									<TD style="WIDTH: 255px">
									    <ASP:TEXTBOX id="txtArrivalDate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX>
									    <SPAN class="view" id="spantxtArrivalDate" RUNAT="server"></SPAN>
									    <SPAN class="showTip" runat="server" style="width:auto;" id="tipArrivalDate1" onmouseout="hideTip(this);">?</SPAN>
									    <asp:CompareValidator ID="cvArrivalDate" Display="none" runat="server" ControlToValidate="txtArrivalDate" Operator="DataTypeCheck" Type="date" ErrorMessage="Please enter a valid date. '##/##/####'" ValidationGroup="PageSubmit">*</asp:CompareValidator>
                                        <asp:RegularExpressionValidator ID="revArrivalTime" runat="server" Display="none" ControlToValidate="txtArrivalTime" EnableClientScript="false"
                                            ErrorMessage="The Time you entered is either incorrect or not formatted in military time. ex. 0930" ValidationExpression="(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)" ValidationGroup="PageSubmit">*</asp:RegularExpressionValidator>
									</TD>
									<TD style="WIDTH: 125px"><ASP:LABEL id="Label12" RUNAT="server" CSSCLASS="WhiteText">Time of Arrival</ASP:LABEL></TD>
									<TD style="WIDTH: 255px"><ASP:TEXTBOX id="txtArrivalTime" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4"></ASP:TEXTBOX><SPAN class="view" id="spantxtArrivalTime" RUNAT="server"></SPAN><SPAN class="showTip" runat="server" style="width:auto;" id="tipArrivalTime1"
											onmouseout="hideTip(this);">?</SPAN>
							    </TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD>
							<TABLE class="tblSection" cellSpacing="0" cellPadding="2" width="100%">
								<TBODY>
									<TR class="stdFont">
										<TD class="secHdr" colSpan="4"><STRONG>Patient Information</STRONG></TD>
									</TR>
									<TR>
										<TD colSpan="4" style="height: 19px"><ASP:LABEL id="Label13" RUNAT="server" CSSCLASS="WhiteText">Patient Illness/Injury History</ASP:LABEL></TD>
									</TR>
									<TR>
										<TD colSpan="4"><ASP:TEXTBOX id="txtPatientHistory" onkeydown="return CheckTextBoxMaxLength(this,2000,true);" onpaste="return CheckTextBoxMaxLength(this,2000,true);" onkeypress="return CheckTextBoxMaxLength(this,2000,true);" RUNAT="server" CSSCLASS="txtArea" HEIGHT="61px" TEXTMODE="MultiLine"></ASP:TEXTBOX>
                                            
                                            <SPAN class="view" id="spantxtPatientHistory" RUNAT="server"></SPAN><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" EnableClientScript="false" ControlToValidate="txtPatientHistory"
                                                ErrorMessage="Please enter the patient's history." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
									</TR>
									<TR class="stdFont">
										<TD colSpan="4"><ASP:TABLE id="tblAll" RUNAT="server" CSSCLASS="stdFont" WIDTH="100%">
												<ASP:TABLEROW ID="rowHdr" RUNAT="server">
													<ASP:TABLECELL ID="cellHdr" RUNAT="server" COLUMNSPAN="4">Allergies</ASP:TABLECELL>
												</ASP:TABLEROW>
											</ASP:TABLE></TD>
									</TR>
									<TR>
										<TD class="stdFont" colSpan="4"><SPAN id="MedHdr" RUNAT="server">Current Medication
                                        </SPAN></TD>
									</TR>
									<TR>
										<TD colSpan="4">
										    <asp:Panel ID="pnlMeds" runat="server" Visible="true">
											<TABLE class="SmallSection" id="tblMeds" cellSpacing="0" cellPadding="3" width="100%" border="0">
												<TR>
													<TD><ASP:LABEL id="Label14" RUNAT="server" CSSCLASS="WhiteText">Medication</ASP:LABEL></TD>
													<TD><ASP:LABEL id="Label15" RUNAT="server" CSSCLASS="WhiteText">Dosage</ASP:LABEL></TD>
													<td></td>
												</TR>
												<TR>
													<td><ASP:TEXTBOX id="Medication" RUNAT="server" CSSCLASS="txtMedLarge" MAXLENGTH="100"></ASP:TEXTBOX>
													<asp:RequiredFieldValidator ID="rfvMedication" runat="server" ControlToValidate="Medication" ErrorMessage="Please enter a Medication." ValidationGroup="Medications">*</asp:RequiredFieldValidator>
                                                        </td>
													<td><ASP:TEXTBOX id="Dosage" RUNAT="server" CSSCLASS="txtboxSmall" MaxLength="10"></ASP:TEXTBOX>
													    <asp:CustomValidator ID="cvDosage" runat="server" ControlToValidate="Dosage"
													        ValidateEmptyText="true" ValidationGroup="Medications" OnServerValidate="cvDosage_ServerValidate">*</asp:CustomValidator>&nbsp;
														<ASP:DROPDOWNLIST id="DosageDrop" RUNAT="server" CSSCLASS="cboSmall">
															<ASP:LISTITEM></ASP:LISTITEM>
															<ASP:LISTITEM VALUE="oz">oz</ASP:LISTITEM>
															<ASP:LISTITEM VALUE="mg">mg</ASP:LISTITEM>
															<ASP:LISTITEM VALUE="g">g</ASP:LISTITEM>
															<ASP:LISTITEM VALUE="cc">cc</ASP:LISTITEM>
															<ASP:LISTITEM VALUE="mcg">mcg</ASP:LISTITEM>
															<ASP:LISTITEM VALUE="ml">ml</ASP:LISTITEM>
															<ASP:LISTITEM VALUE="l/m">l/m</ASP:LISTITEM>
														</ASP:DROPDOWNLIST><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                            ControlToValidate="DosageDrop" ErrorMessage="Please select a dosage measurement."
                                                            ValidationGroup="Medications">*</asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;
														</td>
														<td><ASP:BUTTON id="btnMedAdd" RUNAT="server" CSSCLASS="btnSmall" TEXT=" Add " onclick="btnMedAdd_Click"></ASP:BUTTON></td>
												</TR>
											</TABLE>
											</asp:Panel>
										</TD>
									</TR>
									<TR>
										<TD colSpan="4">
											<TABLE class="stdFont" cellSpacing="0" cellPadding="3" width="100%" border="0">
												<TR>
													<TD width="100%">
													    <ASP:DATAGRID id="dgMeds" RUNAT="server" CSSCLASS="SmallSection" WIDTH="100%" DATAKEYFIELD="MedicationID"
															BACKCOLOR="White" BORDERWIDTH="1px" BORDERSTYLE="None" BORDERCOLOR="Black" CELLPADDING="5" GRIDLINES="Horizontal"
															ONDELETECOMMAND="dgMeds_Delete" AUTOGENERATECOLUMNS="False">
															<SELECTEDITEMSTYLE CSSCLASS="SelectedItem"></SELECTEDITEMSTYLE>
															<ALTERNATINGITEMSTYLE CSSCLASS="AlternatingItem"></ALTERNATINGITEMSTYLE>
															<ITEMSTYLE CSSCLASS="Item"></ITEMSTYLE>
															<HEADERSTYLE CSSCLASS="DataGridHdr"></HEADERSTYLE>
															<COLUMNS>
																<ASP:BUTTONCOLUMN TEXT="Delete" HEADERTEXT="Action" COMMANDNAME="Delete"></ASP:BUTTONCOLUMN>
															</COLUMNS>
															<PAGERSTYLE HORIZONTALALIGN="Right" FORECOLOR="#4A3C8C" BACKCOLOR="#E7E7FF" MODE="NumericPages"></PAGERSTYLE>
														</ASP:DATAGRID>
													</TD>
												</TR>
												<TR>
													<TD>&nbsp;</TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD class="stdFont" colSpan="4"><SPAN id="VitalHdr" RUNAT="server">Vital Signs</SPAN></TD>
									</TR>
									<TR class="stdFont">
										<TD align="center" colSpan="4">
										    <asp:Panel ID="pnlVitals" runat="server" Visible="true">
											<TABLE class="SmallSection" id="tblVitals" width="100%" border="0">
												<TR>
													<TD><ASP:LABEL id="Label16" RUNAT="server" CSSCLASS="WhiteText">Time</ASP:LABEL></TD>
													<TD><ASP:LABEL id="Label17" RUNAT="server" CSSCLASS="WhiteText">B/P</ASP:LABEL></TD>
													<TD><ASP:LABEL id="Label18" RUNAT="server" CSSCLASS="WhiteText">Pulse</ASP:LABEL></TD>
													<TD><ASP:LABEL id="Label19" RUNAT="server" CSSCLASS="WhiteText">Resp.</ASP:LABEL></TD>
													<TD><ASP:LABEL id="Label20" RUNAT="server" CSSCLASS="WhiteText">Temperature</ASP:LABEL></TD>
													<TD><ASP:LABEL id="Label21" RUNAT="server" CSSCLASS="WhiteText">Trauma Score</ASP:LABEL></TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD><ASP:TEXTBOX id="Time" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4"></ASP:TEXTBOX>
													    <asp:RegularExpressionValidator
                                                            ID="revTime" runat="server" ControlToValidate="Time"
                                                            ErrorMessage="The Time you entered is either incorrect or not formatted in military time. ex. 0930"
                                                            ValidationExpression="(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)" ValidationGroup="Vitals">*</asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator
                                                                ID="RequiredFieldValidator6" runat="server" ControlToValidate="Time" ErrorMessage="Please enter the time."
                                                                ValidationGroup="Vitals">*</asp:RequiredFieldValidator></TD>
													<TD>
													    <ASP:TEXTBOX id="BloodPressure" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="25"></ASP:TEXTBOX>
													    <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator9" runat="server" ControlToValidate="BloodPressure"
                                                            ErrorMessage="Please enter the patient's blood pressure." ValidationGroup="Vitals">*</asp:RequiredFieldValidator>
                                                    </TD>
													<TD>
													    <ASP:TEXTBOX id="Pulse" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="25"></ASP:TEXTBOX><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator10" runat="server" ControlToValidate="Pulse" ErrorMessage="Please enter the patient's pulse."
                                                            ValidationGroup="Vitals">*</asp:RequiredFieldValidator>
                                                    </TD>
													<TD>
													    <ASP:TEXTBOX id="Resp" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="25"></ASP:TEXTBOX><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please enter the patient's resp."
                                                            ValidationGroup="Vitals" ControlToValidate="Resp">*</asp:RequiredFieldValidator>
                                                    </TD>
													<TD>
													    <ASP:TEXTBOX id="Temp" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="25"></ASP:TEXTBOX><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please enter the patient's temperature."
                                                            ValidationGroup="Vitals" ControlToValidate="Temp">*</asp:RequiredFieldValidator>
                                                    </TD>
													<TD>
													    <ASP:TEXTBOX id="TraumaScore" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="50"></ASP:TEXTBOX><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator13" runat="server" ErrorMessage="Please determine the patient's trauma score."
                                                            ValidationGroup="Vitals" ControlToValidate="TraumaScore">*</asp:RequiredFieldValidator>
                                                    </TD>
													<TD><ASP:BUTTON id="btnVitalAdd" RUNAT="server" CSSCLASS="btnSmall" TEXT=" Add " onclick="btnVitalAdd_Click"></ASP:BUTTON></TD>
												</TR>
											</TABLE>
											</asp:Panel>
										</TD>
									</TR>
									<TR>
										<TD align="center" colSpan="4">
											<TABLE cellSpacing="0" cellPadding="3" width="100%" border="0"">
												<TR>
													<TD width="100%">
													    <ASP:DATAGRID id="dgVitals" RUNAT="server" CSSCLASS="SmallSection" WIDTH="100%" DATAKEYFIELD="VitalSignID"
															BORDERWIDTH="1px" BORDERSTYLE="None" CELLPADDING="5" GRIDLINES="Horizontal" ONDELETECOMMAND="dgVitals_Delete"
															AUTOGENERATECOLUMNS="False">
															<SELECTEDITEMSTYLE CSSCLASS="SelectedItem"></SELECTEDITEMSTYLE>
															<ALTERNATINGITEMSTYLE CSSCLASS="AlternatingItem"></ALTERNATINGITEMSTYLE>
															<ITEMSTYLE CSSCLASS="Item"></ITEMSTYLE>
															<HEADERSTYLE CSSCLASS="DataGridHdr"></HEADERSTYLE>
															<COLUMNS>
																<ASP:BUTTONCOLUMN TEXT="Delete" HEADERTEXT="Action" COMMANDNAME="Delete"></ASP:BUTTONCOLUMN>
															</COLUMNS>
															<PAGERSTYLE HORIZONTALALIGN="Right" FORECOLOR="#4A3C8C" BACKCOLOR="#E7E7FF" MODE="NumericPages"></PAGERSTYLE>
														</ASP:DATAGRID>
												    </TD>
												</TR>
												<TR>
													<TD>&nbsp;</TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD style="WIDTH: 114px"><ASP:LABEL id="Label22" RUNAT="server" CSSCLASS="WhiteText">Witness</ASP:LABEL></TD>
										<TD colSpan="3"><ASP:TEXTBOX id="txtWitness" RUNAT="server" CSSCLASS="txtboxXLarge" MAXLENGTH="50"></ASP:TEXTBOX><SPAN class="view" id="spantxtWitness" RUNAT="server"></SPAN></TD>
									</TR>
									<TR>
										<TD><ASP:LABEL id="Label23" RUNAT="server" CSSCLASS="WhiteText">PABAT Time</ASP:LABEL></TD>
										<TD style="WIDTH: 255px"><ASP:TEXTBOX id="txtPABATTime" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4"></ASP:TEXTBOX>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" EnableClientScript="false" ControlToValidate="txtPABATTime" ErrorMessage="The PABAT time you entered is either incorrect or not formatted in military time. ex. 0930" ValidationExpression="(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)" ValidationGroup="PageSubmit">*</asp:RegularExpressionValidator>
                                            <SPAN class="view" id="spantxtPABATTime" RUNAT="server"></SPAN></TD>
										<TD style="WIDTH: 125px"><ASP:LABEL id="Label24" RUNAT="server" CSSCLASS="WhiteText">Results</ASP:LABEL></TD>
										<TD style="WIDTH: 255px"><ASP:TEXTBOX id="txtResults" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="100"></ASP:TEXTBOX><SPAN class="view" id="spantxtResults" RUNAT="server"></SPAN></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD><asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" 
                                CssClass="btnSmall" CausesValidation="False"/>&nbsp;&nbsp;&nbsp;
							<ASP:BUTTON id="btnContinue" RUNAT="server" CSSCLASS="btnSmall" 
                                TEXT=" Continue " OnClick="btnContinue_Click" ValidationGroup="PageSubmit" 
                                CausesValidation="False"></ASP:BUTTON>
						</TD>
					</TR>
					<TR>
						<TD><IMG src="/images/Grphc_BotBar.jpg"></TD>
					</TR>
				</TABLE>
			</CENTER>

		</FORM>
	</BODY>
</HTML>
