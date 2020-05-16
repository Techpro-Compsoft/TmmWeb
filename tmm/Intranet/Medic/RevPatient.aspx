<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="NavigationMenu.ascx"  %>
<%@ Page language="c#" Inherits="PatientInfo" ValidateRequest="false" Codebehind="RevPatient.aspx.cs" Culture="auto:en-US" UICulture="auto" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	</HEAD>
	<BODY id="bodyMain" bgColor="#000000" leftMargin="0" topMargin="0" RUNAT="server">
		<FORM id="frmMain" method="post" RUNAT="server">
			<CENTER>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
						
               <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional"><ContentTemplate>
				<center><TABLE cellSpacing="3" cellPadding="6" width="760" border="0" style="text-align: left">
					<TR>
						<TD><IMG src="images/ttl_PatientEncounterBar.jpg"><BR>
							<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
					</TR>
					<TR>
						<TD>
							<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR class="tblHdr">
									<TD width="175" style="height: 19px">Patient Information</TD>
									<TD style="COLOR: #b7b5b5; height: 19px;" width="175">Medical Information</TD>
									<TD style="COLOR: #b7b5b5; height: 19px;" width="100">Notes</TD>
									<TD align="right" width="200" style="height: 19px"><a href="javascript:openWin();" class="WhiteMedLnk">Search</a></TD>
								</TR>
								<TR class="stdFont">
									<TD vAlign="top" colSpan="4" style="height: 30px">
										<HR width="100%" SIZE="1">
										<ASP:LABEL id="Label28" RUNAT="server" CSSCLASS="WhiteText">Step 1 of 3</ASP:LABEL>
                                    </TD>
								</TR>
							</TABLE>
                            
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ValidationGroup="PageSubmit" />
                            
                            
						</TD>
					</TR>
					<TR class="stdFont" id="spIncomplete" RUNAT="server">
						<TD><ASP:LABEL id="Label29" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, IncompleteEncounters %>"></ASP:LABEL>&nbsp;<ASP:DROPDOWNLIST id="cboIncomplete" RUNAT="server" onselectedindexchanged="cboIncomplete_SelectedIndexChanged" AutoPostBack="True"></ASP:DROPDOWNLIST>
                            &nbsp;
                            &nbsp;&nbsp;
                            
                            
                        </TD>
					</TR>
					<TR class="stdFont">
						<TD>
                            
                            
							<TABLE class="SmallBorder" cellSpacing="0" cellPadding="3" width="100%" border="0">
								<TR class="stdFont">
									<TD class="secHdr" colSpan="6"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resources, PatientData%>" />
                                    </TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="LABEL1" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EncounterDate %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><asp:TextBox ID="txtEncounterDate" runat="server" CssClass="txtboxSmall"></asp:TextBox><SPAN class="view" id="spantxtEncounterDate" style="WIDTH: 36%; HEIGHT: 22px" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" id="tip1" onmouseover="showTip(this, event, 'Encounter Date: 01/01/2004');"
											onmouseout="hideTip(this);">
                                        ?</SPAN><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEncounterDate"
                                            ErrorMessage="Please enter the encounter date." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
									<TD colSpan="2">&nbsp;</TD>
									<TD><ASP:LABEL id="Label2" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EncounterTime %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtEncounterTime" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4" WRAP="False"></ASP:TEXTBOX>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEncounterTime"
                                            ErrorMessage="The Time you entered is either incorrect or not formatted in military time. ex. 0930" ValidationExpression="\d{4}" ValidationGroup="PageSubmit">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEncounterTime"
                                            ErrorMessage="Please enter the encounter time." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator><SPAN class="view" id="spantxtEncounterTime" style="WIDTH: 36%; HEIGHT: 22px" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label3" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, HireDate %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtHireDate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX><SPAN class="view" id="spantxtHireDate" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" id="tip2" onmouseover="showTip(this, event, 'Hire Date: 01/01/2004');"
											onmouseout="hideTip(this);">?</SPAN></TD>
									<TD colSpan="2">&nbsp;</TD>
									<TD><ASP:LABEL id="Label4" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, JobTitle %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtJobTitle" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX><SPAN class="view" id="spantxtJobTitle" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 18%"><ASP:LABEL id="Label5" RUNAT="server" CSSCLASS="WhiteText">First Name</ASP:LABEL></TD>
									<TD style="WIDTH: 213px"><ASP:TEXTBOX id="txtFirstName" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="35"></ASP:TEXTBOX>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                                            ErrorMessage="Please enter the patient's first name." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator><SPAN class="view" id="spantxtFirstName" RUNAT="server"></SPAN></TD>
									<TD style="WIDTH: 5%"><ASP:LABEL id="Label6" RUNAT="server" CSSCLASS="WhiteText">MI</ASP:LABEL></TD>
									<TD style="WIDTH: 7%"><ASP:TEXTBOX id="txtMInitial" RUNAT="server" CSSCLASS="txtboxXSmall" MAXLENGTH="1"></ASP:TEXTBOX><SPAN class="view" id="spantxtMInitial" RUNAT="server"></SPAN></TD>
									<TD style="WIDTH: 14%"><ASP:LABEL id="Label7" RUNAT="server" CSSCLASS="WhiteText">Last Name</ASP:LABEL></TD>
									<TD style="WIDTH: 28%"><ASP:TEXTBOX id="txtLastName" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="35"></ASP:TEXTBOX>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
                                            ErrorMessage="Please enter the patient's last name." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator><SPAN class="view" id="spantxtLastName" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label8" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, HomePhone %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtHomePhone" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="12"></ASP:TEXTBOX><SPAN class="view" id="spantxtHomePhone" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" id="tip3" onmouseover="showTip(this, event, 'Home Phone: ###-###-####');"
											onmouseout="hideTip(this);">?</SPAN></TD>
									<TD colSpan="2">&nbsp;</TD>
									<TD><ASP:LABEL id="Label9" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Address %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtAddress" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX><SPAN class="view" id="spantxtAddress" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label10" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, City %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtCity" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX><SPAN class="view" id="spantxtCity" RUNAT="server"></SPAN></TD>
									<TD colSpan="2">&nbsp;
                                    </TD>
									<TD><ASP:LABEL id="Label11" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, State %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtState" RUNAT="server" CSSCLASS="txtboxXSmall" MAXLENGTH="2"></ASP:TEXTBOX><SPAN class="view" id="spantxtState" style="WIDTH: 46px" RUNAT="server"></SPAN>&nbsp;<SPAN style="FONT-SIZE: 10px; COLOR: red">(2 
											letter abbreviation)</SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label12" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Country %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtCountry" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="100"></ASP:TEXTBOX><SPAN class="view" id="spantxtCountry" RUNAT="server"></SPAN></TD>
									<TD colSpan="2">&nbsp;</TD>
									<TD><ASP:LABEL id="Label13" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Zip %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtZip" RUNAT="server" CSSCLASS="txtboxSmall"></ASP:TEXTBOX><SPAN class="view" id="spantxtZip" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label14" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, BirthDate %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtBirthdate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX><SPAN class="view" id="spantxtBirthdate" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" id="tip4" onmouseover="showTip(this, event, 'Birth Date: 01/01/2004');"
											onmouseout="hideTip(this);">?</SPAN></TD>
									<TD colSpan="2">&nbsp;</TD>
									<TD><ASP:LABEL id="Label15" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Age %>"></ASP:LABEL></TD>
									<TD>
                                        <radI:RadNumericTextBox ID="txtAge" runat="server" MaxValue="100" MinValue="18" Width="31px">
                                        </radI:RadNumericTextBox>&nbsp; <SPAN class="view" id="spantxtAge" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="lblSSN" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, SSN_Passport %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtSSN" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="11"></ASP:TEXTBOX><SPAN class="view" id="spantxtSSN" RUNAT="server"></SPAN><SPAN class="showTip" style="width:auto;" id="tip5" onmouseover="showTip(this,event, 'Social Security #: ###-##-####<br>Passport #: ########');"
											onmouseout="hideTip(this);">?</SPAN></TD>
									<TD colSpan="2">&nbsp;</TD>
									<TD><ASP:LABEL id="Label16" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Sex %>"></ASP:LABEL></TD>
									<TD><ASP:RADIOBUTTONLIST id="rdoSex" RUNAT="server" CSSCLASS="stdFont" REPEATDIRECTION="Horizontal" HEIGHT="16px"
											WIDTH="128px">
											<ASP:LISTITEM VALUE="M">Male</ASP:LISTITEM>
											<ASP:LISTITEM VALUE="F">Female</ASP:LISTITEM>
										</ASP:RADIOBUTTONLIST><SPAN class="view" id="spanrdoSex" RUNAT="server"></SPAN></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					
					<TR>
						<TD>
							<TABLE class="tblSection" cellSpacing="0" cellPadding="3" width="100%" border="0">
								<TR class="stdFont">
									<TD class="secHdr" colSpan="6"><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resources, EmployerData %>" /></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 18%"><ASP:LABEL id="Label17" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Rig %>"></ASP:LABEL></TD>
									<TD style="WIDTH: 28%"><ASP:DROPDOWNLIST id="cboRigID" RUNAT="server" CSSCLASS="cboLarge"></ASP:DROPDOWNLIST>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cboRigID"
                                            ErrorMessage="Please choose the patient's rig." InitialValue="-1" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator><SPAN class="view" id="spancboRigID" RUNAT="server"></SPAN></TD>
									<TD style="WIDTH: 5%">&nbsp;</TD>
									<TD style="WIDTH: 6.92%">&nbsp;</TD>
									<TD style="WIDTH: 14%"><ASP:LABEL id="Label18" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Employer %>"></ASP:LABEL></TD>
									<TD style="WIDTH: 28%"><ASP:DROPDOWNLIST id="cboEmployer" RUNAT="server" CSSCLASS="cboLarge" AUTOPOSTBACK="True" onselectedindexchanged="cboEmployer_SelectedIndexChanged"></ASP:DROPDOWNLIST>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cboEmployer"
                                            ErrorMessage="Please choose the patient's employer." InitialValue="-1" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator><SPAN class="view" id="spancboEmployer" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label19" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Location %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtLocation" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLocation"
                                            ErrorMessage="Please enter location of the rig." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator><SPAN class="view" id="spantxtLocation" RUNAT="server"></SPAN></TD>
									<TD>&nbsp;</TD>
									<TD style="WIDTH: 52px">&nbsp;</TD>
									<TD><ASP:LABEL id="Label20" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Drilling %>"></ASP:LABEL></TD>
									<TD><ASP:DROPDOWNLIST id="cboDrillFor" RUNAT="server" CSSCLASS="cboLarge" OnSelectedIndexChanged="cboDrillFor_SelectedIndexChanged"></ASP:DROPDOWNLIST><SPAN class="view" id="spancboDrillFor" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label21" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EmployerPhone %>"></ASP:LABEL></TD>
									<TD><SPAN class="view" id="txtEmployerPhone" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
									<TD><ASP:LABEL id="Label22" RUNAT="server" CSSCLASS="WhiteText">Ext</ASP:LABEL></TD>
									<TD style="WIDTH: 52px"><SPAN class="view" id="txtEmployerPhoneExt" style="DISPLAY: inline; WIDTH: 102.22%; HEIGHT: 22px"
											RUNAT="server"></SPAN></TD>
									<TD><ASP:LABEL id="Label23" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Address %>"></ASP:LABEL></TD>
									<TD><SPAN class="view" id="txtEmployerAddress" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label24" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, City %>"></ASP:LABEL></TD>
									<TD><SPAN class="view" id="txtEmployerCity" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
									<TD><ASP:LABEL id="Label25" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, State %>"></ASP:LABEL></TD>
									<TD><SPAN class="view" id="txtEmployerState" style="DISPLAY: inline; WIDTH: 46px" RUNAT="server"></SPAN></TD>
									<TD><ASP:LABEL id="Label26" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Zip %>"></ASP:LABEL></TD>
									<TD><SPAN class="view" id="txtEmployerZip" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label27" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EmailAddress %>"></ASP:LABEL></TD>
									<TD><SPAN class="view" id="txtEmployerEmail" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
									<TD>&nbsp;</TD>
									<TD style="WIDTH: 53px">&nbsp;</TD>
									<TD>&nbsp;</TD>
									<TD>&nbsp;</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD><INPUT class="btnSmall" id="btnReset" type="reset" value=" Reset " RUNAT="server">&nbsp;&nbsp;&nbsp;
							<ASP:BUTTON id="btnContinue" RUNAT="server" CSSCLASS="btnSmall" TEXT=" Continue " OnClick="btnContinue_Click" ValidationGroup="PageSubmit"></ASP:BUTTON><INPUT class="btnSmall" id="btnEdit" type="button" value=" View Medical Information " name="btnEdit"
								RUNAT="server" onserverclick="btnEdit_ServerClick"></TD>
					</TR>
					
					<TR>
                        
                        
						<TD><IMG src="/images/Grphc_BotBar.jpg"></TD>
					</TR>
				</TABLE></center></ContentTemplate>
                   <Triggers>
                       <asp:AsyncPostBackTrigger ControlID="cboIncomplete" EventName="SelectedIndexChanged" />
                   </Triggers>
                </asp:UpdatePanel>
			</CENTER>
		</FORM>
	</BODY>
</HTML>
