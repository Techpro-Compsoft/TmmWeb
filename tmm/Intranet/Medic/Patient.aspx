<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx"  %>
<%@ Page language="c#" Inherits="TrinityMedicalManagement.PatientInfo" ValidateRequest="true" Codebehind="Patient.aspx.cs" Culture="auto:en-US" UICulture="auto" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
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
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> <META HTTP-EQUIV="Expires" CONTENT="-1">
		<LINK href="trinity.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="scripts/validate.js" type="text/javascript"></script>
		<script language="javascript" src="scripts/pageScripts.js" type="text/javascript"></script>		
		<script language="javascript" type="text/javascript">
		
	            function regMilTime(sender, args)
	            {
		            if(String(args.value).substring(0,String(args.value).length) != "0000")
		            {
			            var miltime = new RegExp(/^(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)/);
			            var fldVal = args.value;
			            var result = miltime.exec(fldVal);
            		
			            if(result == null) args.IsValid = false;
		            }
		            else
		            {
			            args.IsValid = false;
		            }            		
	        }			
		</script>		
	</HEAD>
	<BODY id="bodyMain" bgColor="#000000" leftMargin="0" topMargin="0" RUNAT="server">
		<FORM id="frmMain" method="post" RUNAT="server">
			<CENTER>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
						<radA:AjaxLoadingPanel ID="LoadingPanel1" runat="server" MinDisplayTime="1000" CssClass="loading-panel" Transparency="40">
                            &nbsp;</radA:AjaxLoadingPanel>                          
                <radA:RadAjaxPanel ID="RadAjaxPanel1" runat="server" EnableAJAX="false" EnableOutsideScripts="True" HorizontalAlign="NotSet" LoadingPanelID="LoadingPanel1" ScrollBars="None" Width="780px">
				<TABLE cellSpacing="3" cellPadding="6" width="760" border="0" style="text-align: left; ">
					<TR>
						<TD><IMG src="images/ttl_PatientEncounterBar.jpg"><BR>
                            <uc1:NavigationMenu id="menu1" runat="server"></uc1:NavigationMenu>
                        </TD>
					</TR>
					<TR>
						<TD>
                            <asp:Panel ID="pnlAddEditHeader" runat="server">
							<table border=0 width="100%">
							    <tr class="tblHdr">
							        <td>Patient Information: Step 1 of 3</td>
							        <td align="right"><asp:Literal ID="litSearchLink" runat="server"></asp:Literal></td>
							        <td width="25px">&#160;</td>
							    </tr>
							</table>
							</asp:Panel>
							<asp:Panel ID="pnlViewHeader" runat="server" Visible="false">
							    <table border="0" width="100%" cellpadding="0" cellspacing="0">
							        <tr>
							            <td width="1px"><img src="images/tab_active_lt.gif" /></td>
							            <td background="images/tab_active_mid.gif" class="ViewHeaderSelected" width="108px" align="center">Patient Information</td>
							            <td width="1px"><img src="images/tab_active_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="112px" align="center"><a href="Medical.aspx" class="ViewHeaderNotSelected">Medical Information</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
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
							            <td align="right"><asp:Literal ID="litSearchLink2" runat="server"></asp:Literal></td>
							            <td width="25px"></td>
							        </tr>
							        <tr>
							            <td colspan="18" bgcolor="white" height="3px"></td>
							        </tr>
							    </table>
							</asp:Panel>
                            
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ValidationGroup="PageSubmit" />
                                                       
						</TD>
					</TR>
					<TR class="stdFont" id="spIncomplete" RUNAT="server" style="font-size: 9pt; color: #ffffff;">
						<TD><ASP:LABEL id="Label29" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, IncompleteEncounters %>"></ASP:LABEL>&#160;<ASP:DROPDOWNLIST id="cboIncomplete" RUNAT="server" onselectedindexchanged="cboIncomplete_SelectedIndexChanged" AutoPostBack="True"></ASP:DROPDOWNLIST>
                            &#160;
                            &#160;&#160;
                            
                            
                        </TD>
					</TR>
					<TR class="stdFont">
						<TD>
							<TABLE class="SmallBorder" cellSpacing="0" cellPadding="3" width="100%" border="0">
								<TR class="stdFont">
									<TD class="secHdr" colSpan="6">
									    <div style="color:White; font-family:Arial; font-size:12px;"><asp:Literal ID="litPatientData" runat="server"></asp:Literal></div>
                                        </TD>
								</TR>
								<TR>
									<TD style="WIDTH: 125px"><ASP:LABEL id="LABEL1" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EncounterDate %>"></ASP:LABEL></TD>
									<TD style="width: 255px"><asp:TextBox ID="txtEncounterDate" runat="server" MaxLength="10" CssClass="txtboxSmall"></asp:TextBox>
                                        <SPAN class="view" id="spantxtEncounterDate" RUNAT="server"></SPAN><SPAN class="showTip" runat="server" style="width:auto;" id="tipEncounterDate" 
											onmouseout="hideTip(this);">?</SPAN><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEncounterDate"
                                            ErrorMessage="Please enter the encounter date." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvEncounterDate" runat="server" 
                        ControlToValidate="txtEncounterDate" 
                        ErrorMessage="Encounter date must be a valid date." Operator="DataTypeCheck" 
                        Type="Date" ValidationGroup="PageSubmit">*</asp:CompareValidator>
                                    </TD>
									<TD colSpan="2">&#160;</TD>
									<TD style="WIDTH: 125px"><ASP:LABEL id="Label2" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EncounterTime %>"></ASP:LABEL></TD>
									<TD style="width: 255px"><ASP:TEXTBOX id="txtEncounterTime" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="4" WRAP="False"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtEncounterTime"  RUNAT="server"></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEncounterTime"
                                            ErrorMessage="Please enter the encounter time." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="valMilTime" runat="server" ValidationGroup="PageSubmit" ErrorMessage="Please enter a correct military time value, ex.1130"
                                            ControlToValidate="txtEncounterTime" ValidationExpression="(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)"
                                            EnableClientScript="true" SetFocusOnError="true" Text="*" />         
                                   </TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label3" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, HireDate %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtHireDate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtHireDate" RUNAT="server" ></SPAN>
                                        <SPAN class="showTip" runat="server" style="width:auto;" id="tipHireDate" 
											onmouseout="hideTip(this);">?</SPAN><asp:CompareValidator 
                        ID="cvHireDate" runat="server" ControlToValidate="txtHireDate" 
                        ErrorMessage="Hire date must be a valid date." Operator="DataTypeCheck" 
                        Type="Date" ValidationGroup="PageSubmit">*</asp:CompareValidator>
                                    </TD>
									<TD colSpan="2">&#160;</TD>
									<TD><ASP:LABEL id="Label4" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, JobTitle %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtJobTitle" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtJobTitle" RUNAT="server" ></SPAN></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 18%"><ASP:LABEL id="Label5" RUNAT="server" CSSCLASS="WhiteText">First Name</ASP:LABEL></TD>
									<TD style="WIDTH: 213px"><ASP:TEXTBOX id="txtFirstName" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="35"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtFirstName" RUNAT="server" ></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                                            ErrorMessage="Please enter the patient's first name." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
									<TD style="WIDTH: 5%"><ASP:LABEL id="Label6" RUNAT="server" CSSCLASS="WhiteText">MI</ASP:LABEL></TD>
									<TD style="WIDTH: 7%"><ASP:TEXTBOX id="txtMInitial" RUNAT="server" CSSCLASS="txtboxXSmall" MAXLENGTH="1"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtMInitial" RUNAT="server" ></SPAN></TD>
									<TD style="WIDTH: 14%"><ASP:LABEL id="Label7" RUNAT="server" CSSCLASS="WhiteText">Last Name</ASP:LABEL></TD>
									<TD style="WIDTH: 28%"><ASP:TEXTBOX id="txtLastName" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="35"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtLastName" RUNAT="server" ></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
                                            ErrorMessage="Please enter the patient's last name." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label8" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, HomePhone %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtHomePhone" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="25"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtHomePhone" RUNAT="server"></SPAN>
                                        <SPAN class="showTip" runat="server" style="width:auto;" id="tipHomePhone" 
											onmouseout="hideTip(this);">?</SPAN></TD>
									<TD colSpan="2">&#160;</TD>
									<TD><ASP:LABEL id="Label9" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Address %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtAddress" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtAddress" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label10" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, City %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtCity" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtCity" RUNAT="server"></SPAN></TD>
									<TD colSpan="2">&#160;
                                    </TD>
									<TD><ASP:LABEL id="Label11" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, State %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtState" RUNAT="server" Width="181px" CSSCLASS="txtboxXSmall" MAXLENGTH="50"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtState" style="WIDTH: 100px" RUNAT="server"></SPAN>&#160;</TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label12" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Country %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtCountry" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="100"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtCountry" RUNAT="server"></SPAN></TD>
									<TD colSpan="2">&#160;</TD>
									<TD><ASP:LABEL id="Label13" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Zip %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtZip" Width="80px" RUNAT="server" CSSCLASS="txtboxSmall" MaxLength="10"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtZip" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label14" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, BirthDate %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtBirthdate" RUNAT="server" CSSCLASS="txtboxSmall" MAXLENGTH="10"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtBirthdate" RUNAT="server" ></SPAN>
                                        <SPAN class="showTip" runat="server" style="width:auto;" id="tipBirthDate" 
											onmouseout="hideTip(this);">?</SPAN><asp:CompareValidator 
                        ID="cvBirthDate" runat="server" ControlToValidate="txtBirthdate" 
                        ErrorMessage="Birth date must be a valid date." Operator="DataTypeCheck" 
                        Type="Date" ValidationGroup="PageSubmit">*</asp:CompareValidator>
                                    </TD>
									<TD colSpan="2">&#160;</TD>
									<TD><ASP:LABEL id="Label15" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Age %>"></ASP:LABEL></TD>
									<TD>
                                        <radI:RadNumericTextBox ID="txtAge" runat="server" MaxValue="100" MinValue="18" Width="31px">
                                        </radI:RadNumericTextBox><SPAN class="view" id="spantxtAge" RUNAT="server"></SPAN></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="lblSSN" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, SSN_Passport %>"></ASP:LABEL></TD>
									<TD style="width: 213px"><ASP:TEXTBOX id="txtSSN" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="11"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtSSN" RUNAT="server" ></SPAN>
                                        <SPAN class="showTip" runat="server" style="width:auto;" id="tipSsnPassport" 
											onmouseout="hideTip(this);">?</SPAN></TD>
									<TD colSpan="2">&#160;</TD>
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
                                        <SPAN class="view" id="spancboRigID" RUNAT="server"></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cboRigID"
                                            ErrorMessage="Please choose the patient's rig." InitialValue="-1" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
									<TD style="WIDTH: 5%">&#160;</TD>
									<TD style="WIDTH: 6.92%">&#160;</TD>
									<TD style="WIDTH: 14%"><ASP:LABEL id="Label18" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Employer %>"></ASP:LABEL></TD>
									<TD style="WIDTH: 28%"><ASP:DROPDOWNLIST id="cboEmployer" RUNAT="server" CSSCLASS="cboLarge" AUTOPOSTBACK="True" onselectedindexchanged="cboEmployer_SelectedIndexChanged"></ASP:DROPDOWNLIST>
                                        <SPAN class="view" id="spancboEmployer" RUNAT="server"></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cboEmployer"
                                            ErrorMessage="Please choose the patient's employer." InitialValue="-1" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD><ASP:LABEL id="Label19" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Location %>"></ASP:LABEL></TD>
									<TD><ASP:TEXTBOX id="txtLocation" RUNAT="server" CSSCLASS="txtboxLarge" MAXLENGTH="50"></ASP:TEXTBOX>
                                        <SPAN class="view" id="spantxtLocation" RUNAT="server" ></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLocation"
                                            ErrorMessage="Please enter location of the rig." ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator></TD>
									<TD>&#160;</TD>
									<TD style="WIDTH: 52px">&#160;</TD>
									<TD><ASP:LABEL id="Label20" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Drilling %>"></ASP:LABEL></TD>
									<TD><ASP:DROPDOWNLIST id="cboDrillFor" RUNAT="server" CSSCLASS="cboLarge"></ASP:DROPDOWNLIST>
                                        <SPAN class="view" id="spancboDrillFor" RUNAT="server"></SPAN></TD>
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
								    <td colspan="6">
								        <table cellpadding="0" cellspacing="0" width="100%">
								            <tr>
									            <TD style="WIDTH: 18%; padding:0px 3px 0px 0px;"><ASP:LABEL id="Label24" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, City %>"></ASP:LABEL></TD>
									            <TD style="WIDTH: 28%; padding:0px 3px 0px 3px;"><SPAN class="view" id="txtEmployerCity" style="DISPLAY: inline;" RUNAT="server"></SPAN></TD>
									            <TD style="padding:0px 3px 0px 3px;"><ASP:LABEL id="Label25" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, State %>"></ASP:LABEL></TD>
									            <TD style="padding:0px 3px 0px 3px;"><SPAN class="view" id="txtEmployerState" style="DISPLAY: inline; WIDTH: 181px;" RUNAT="server"></SPAN></TD>
									            <TD style="padding:0px 3px 0px 3px;"><ASP:LABEL id="Label26" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, Zip %>"></ASP:LABEL></TD>
									            <TD style="padding:0px 3px 0px 3px;"><SPAN class="view" id="txtEmployerZip" style="DISPLAY: inline; width:80px;" RUNAT="server"></SPAN></TD>
								            </tr>
								        </table>
								    </td>

								</TR>
								<TR>
									<TD><ASP:LABEL id="lblCountry" RUNAT="server" CSSCLASS="WhiteText" Text="Country"/></TD>
									<TD><SPAN class="view" id="txtEmployerCountry" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
									<TD>&#160;</TD>
									<TD>&#160;</TD>
									<TD><ASP:LABEL id="Label27" RUNAT="server" CSSCLASS="WhiteText" Text="<%$ Resources:Resources, EmailAddress %>"/></TD>
									<TD><SPAN class="view" id="txtEmployerEmail" style="DISPLAY: inline" RUNAT="server"></SPAN></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD><asp:Button ID="btnReset" runat="server" text="Reset" CssClass="btnSmall" OnClick="btnReset_Click"/>&#160;&#160;&#160;
							<ASP:BUTTON id="btnContinue" RUNAT="server" CSSCLASS="btnSmall" TEXT=" Continue " OnClick="btnContinue_Click" ValidationGroup="PageSubmit"></ASP:BUTTON></TD>
					</TR>
					
					<TR>
					
						<TD><IMG src="/images/Grphc_BotBar.jpg"></TD>
					</TR>
				</TABLE>
                </radA:RadAjaxPanel>
			</CENTER>
		</FORM>
	</BODY>
</HTML>
