<%@ Page language="c#" Inherits="TrinityMedicalManagement.Search" ValidateRequest="true" Codebehind="Search.aspx.cs" %>

<%@ Register Assembly="RadTabStrip.Net2" Namespace="Telerik.WebControls" TagPrefix="radTS" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Complete Patient Encounter Search</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="C#" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/trinity.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="scripts/pageScripts.js" type="text/javascript"></script>		
		<SCRIPT language="javascript">
		
			//setTimeout("self.focus()",2);
			//window.blur(self.focus());

			function goSearch( fra, sql ){
//				var elementFra = document.getElementById(fra);					// iframe element
				var frm = document.forms[0];														// page's form object
				var objFra = window.frames[fra];												// page's frame object
				var strWhere = new String();
				
				alert(sql);
//				elementFra.style.display = "inline";
												
				// build the where clause
				if( String(frm.txtFName.value).length > 0 ){ 
					strWhere += " FirstName LIKE '" + frm.txtFName.value + "%'"; 
					// check if strWhere is empty, if not then add "OR"
					if( String(strWhere).length ){ strWhere += " OR"; }				
				}
				if( String(frm.txtLName.value).length > 0 ){ 
					strWhere += " LastName LIKE '" + frm.txtLName.value + "%'"; 
					// check if strWhere is empty, if not then add "OR"
					if( String(strWhere).length > 0 ){ strWhere += " OR"; }
				}
				if( String(frm.txtSSN.value).length ){ 
					strWhere += " SSN = '" + frm.txtSSN.value + "'";
				}
				
				// make sure strWhere doesn't have an extra OR at the end of it
				strWhere = trimString(strWhere);				
				
				// if there where values in the text boxes add the where statement to the querystring
				if( String(strWhere).length > 0 ){ sql += " WHERE" + strWhere;	}

				sql += " ORDER BY PatientIDInt;";
							
				// make the iframe repost itself
				objFra.document.forms[0].txtSQL.value = sql;
				objFra.document.forms[0].action = "";
				objFra.document.forms[0].submit();	
				return false;			
			}

            function clearText () {
                var txtFname = document.getElementById('<%= txtFName.ClientID  %>');
                var txtLname = document.getElementById('<%= txtLName.ClientID  %>');
                var txtSSN = document.getElementById('<%= txtSSN.ClientID  %>');
                txtFname.value = "";
                txtLname.value = "";
                txtSSN.value = "";
            }
			
			function trimString(strWhere){
				var intX = new Number();
				var tmpStr = new String();
				
				intX = String(strWhere).lastIndexOf("OR");
				if( intX != -1 ){
					tmpStr = String(strWhere).substring(0, String(strWhere).length - String("OR").length);
					return tmpStr;
				}else{
					return strWhere;
				}
			}
			
			function sessionTimedOut(pageURL)
			{
				// redirect the parent page to the timed out page
				window.opener.location.href = pageURL;
				
				// close the current window
				self.close();
			}
						
		</SCRIPT>
	</HEAD>
	<BODY id="bodySrch" bgColor="#000000" leftMargin="0" topMargin="0" RUNAT="server">
		<FORM id="Form1" onsubmit="//return goSearch( 'fraSrchResults' );" method="post" RUNAT="server">
			<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
				<TR>
					<TD align="center" colSpan="6"><STRONG><ASP:LABEL id="Label2" RUNAT="server" CSSCLASS="WhiteText">Patient Encounter Search</ASP:LABEL></STRONG></TD>
				</TR>
				<TR>
					<TD align="center" colSpan="6">&nbsp;</TD>
				</TR>
				<TR>
					<TD><ASP:LABEL id="Label1" RUNAT="server" CSSCLASS="WhiteText">First Name</ASP:LABEL></TD>
					<TD><ASP:TEXTBOX id="txtFName" RUNAT="server" MaxLength="30"></ASP:TEXTBOX></TD>
					<TD><ASP:LABEL id="Label3" RUNAT="server" CSSCLASS="WhiteText">Last Name</ASP:LABEL></TD>
					<TD><ASP:TEXTBOX id="txtLName" RUNAT="server" MaxLength="30"></ASP:TEXTBOX></TD>
					<TD><ASP:LABEL id="Label4" RUNAT="server" CSSCLASS="WhiteText">SSN</ASP:LABEL></TD>
					<TD><ASP:TEXTBOX id="txtSSN" RUNAT="server" MaxLength="11"></ASP:TEXTBOX></TD>
				</TR>
				<TR>
					<TD colSpan="6"></TD>
				</TR>
				<TR>
					<TD align="center" colSpan="6"><asp:Button ID="btnClear" runat="server" 
                            Text=" Clear " CssClass="btnSmall" onclick="btnClear_Click" UseSubmitBehavior="False" />&nbsp;&nbsp;
						<asp:button id="btnSearch2" CssClass="btnSmall" runat="server" Text="Search" onclick="btnSearch2_Click" CausesValidation="True"></asp:button><BR>
                        &nbsp;</TD>
				</TR> 
				<TR>
					<TD align="center" colSpan="6"><asp:label id="lblRecCnt" CssClass="WhiteText" 
                            runat="server" Visible="False"></asp:label>
                        <br />
                        <radG:RadGrid ID="rgEncounterResults" runat="server" AutoGenerateColumns="False" 
                            GridLines="Vertical" Width="775px" AllowPaging="True" AllowSorting="True" 
                            onneeddatasource="rgEncounterResults_NeedDataSource" 
                            onitemcommand="rgEncounterResults_ItemCommand" Skin="Outlook2007" 
                            Visible="False">
<ExportSettings>
<Pdf PageWidth="8.5in" PageHeight="11in" PageTopMargin="" PageBottomMargin="" PageLeftMargin="" PageRightMargin="" PageHeaderMargin="" PageFooterMargin=""></Pdf>
</ExportSettings>

<PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;"
            PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />                                                                                                                                                                                   
<MasterTableView>
<NoRecordsTemplate>
There are currently no Patient Encounters matching the above criteria.
</NoRecordsTemplate>
<SortExpressions>
    <radG:GridSortExpression FieldName="PatientID" SortOrder="Descending" />
</SortExpressions>
<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <radG:GridBoundColumn DataField="patientID" HeaderText="Patient ID" SortExpression="patientID"
            UniqueName="column">
            <ItemStyle Width="30px" />
        </radG:GridBoundColumn>
        <radG:GridButtonColumn CommandArgument="PatientID" CommandName="Select" 
            DataTextField="PatientName" HeaderText="Patient Name" 
            SortExpression="PatientName" UniqueName="column1">
        </radG:GridButtonColumn>
        <radG:GridTemplateColumn HeaderText="Encounter Date" SortExpression="EncounterDate">
            <ItemTemplate>
                <%# Convert.ToDateTime(Eval("EncounterDate")).ToShortDateString() %>
            </ItemTemplate>
            <ItemStyle Width="50px" />
        </radG:GridTemplateColumn>
        <radG:GridBoundColumn DataField="Status" HeaderText="Status" SortExpression="Status" 
            UniqueName="column">
        </radG:GridBoundColumn>
        <radG:GridBoundColumn DataField="SSN" HeaderText="SSN" UniqueName="column3">
            <ItemStyle Width="65px" />
        </radG:GridBoundColumn>
        <radG:GridBoundColumn DataField="PatientAddress" HeaderText="Patient Address" SortExpression="PatientAddress" 
            UniqueName="column">
        </radG:GridBoundColumn>
        <radG:GridBoundColumn DataField="HomePhone" HeaderText="Home Phone" 
            UniqueName="column5">
            <ItemStyle Width="70px" />
        </radG:GridBoundColumn>
        <radG:GridBoundColumn DataField="Rig" HeaderText="Rig" SortExpression="Rig" 
            UniqueName="column">
        </radG:GridBoundColumn>
    </Columns>
</MasterTableView>
                        </radG:RadGrid>
                    </TD>
				</TR>
			</TABLE>
			<br /><br />
                <radTS:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" Visible="false">
                    <Tabs>
                        <radTS:Tab runat="server" Text="Patient Info">
                        </radTS:Tab>
                        <radTS:Tab runat="server" Text="Notes">
                        </radTS:Tab>
                        <radTS:Tab runat="server" Text="Attachments">
                        </radTS:Tab>
                    </Tabs>
                </radTS:RadTabStrip>
                <radTS:RadMultiPage ID="RadMultiPage1"  SelectedIndex="0" runat="server" Visible="false">
                    &nbsp;
                    <radTS:PageView ID="PatientInfo" runat="server">
                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Panel ID="pnlPatient" runat="server">
                        <table border="0" cellpadding="3" cellspacing="0" class="SmallBorder" width="100%">
								<tr class="stdFont">
									<td class="secHdr" colspan="6"><asp:Literal ID="Literal1" runat="server" 
                                            Text="<%$ Resources:Resources, PatientData%>" />
                                    </td>
								</tr>
								<tr>
									<td><asp:Label ID="LABEL5" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, EncounterDate %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtEncounterDate" runat="server" 
                                            class="view" style="WIDTH: 36%; HEIGHT: 22px"></span></td>
									<td colspan="2">&#160;</td>
									<td><asp:Label ID="Label6" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, EncounterTime %>"></asp:Label></td>
									<td>
                                        &#160;<span id="spantxtEncounterTime" runat="server" class="view" 
                                            style="WIDTH: 36%; HEIGHT: 22px"></span>
                                        </td>
								</tr>
								<tr>
									<td><asp:Label ID="Label7" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, HireDate %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtHireDate" runat="server" class="view"></span></td>
									<td colspan="2">&#160;</td>
									<td><asp:Label ID="Label8" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, JobTitle %>"></asp:Label></td>
									<td><span id="spantxtJobTitle" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td style="WIDTH: 18%"><asp:Label ID="Label9" RUNAT="server" CSSCLASS="WhiteText">First Name</asp:Label></td>
									<td style="WIDTH: 213px">
                                        <span id="spantxtFirstName" runat="server" class="view"></span></td>
									<td style="WIDTH: 5%"><asp:Label ID="Label10" RUNAT="server" CSSCLASS="WhiteText">MI</asp:Label></td>
									<td style="WIDTH: 7%"><span id="spantxtMInitial" runat="server" class="view"></span></td>
									<td style="WIDTH: 14%"><asp:Label ID="Label11" RUNAT="server" CSSCLASS="WhiteText">Last Name</asp:Label></td>
									<td style="WIDTH: 28%">
                                        <span id="spantxtLastName" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label12" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, HomePhone %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtHomePhone" runat="server" class="view"></span></td>
									<td colspan="2">&#160;</td>
									<td><asp:Label ID="Label13" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Address %>"></asp:Label></td>
									<td><span id="spantxtAddress" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label14" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, City %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtCity" runat="server" class="view"></span></td>
									<td colspan="2">&#160;
                                    </td>
									<td><asp:Label ID="Label15" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, State %>"></asp:Label></td>
									<td><span id="spantxtState" runat="server" class="view" style="WIDTH: 46px"></span>&#160;<span 
                                            style="FONT-SIZE: 10px; COLOR: red">(2 
											letter abbreviation)</span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label16" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Country %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtCountry" runat="server" class="view"></span></td>
									<td colspan="2">&#160;</td>
									<td><asp:Label ID="Label17" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Zip %>"></asp:Label></td>
									<td><span id="spantxtZip" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label18" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, BirthDate %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtBirthdate" runat="server" class="view"></span></td>
									<td colspan="2">&#160;</td>
									<td><asp:Label ID="Label19" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Age %>"></asp:Label></td>
									<td>
                                        <span id="spantxtAge" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="lblSSN" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, SSN_Passport %>"></asp:Label></td>
									<td style="width: 213px"><span id="spantxtSSN" runat="server" class="view"></span></td>
									<td colspan="2">&#160;</td>
									<td><asp:Label ID="Label20" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Sex %>"></asp:Label></td>
									<td><span id="spanrdoSex" runat="server" class="view"></span></td>
								</tr>
							</table>
							<table border="0" cellpadding="3" cellspacing="0" class="tblSection" 
                                width="100%">
								<tr class="stdFont">
									<td class="secHdr" colspan="6"><asp:Literal ID="Literal2" runat="server" 
                                            Text="<%$ Resources:Resources, EmployerData %>" /></td>
								</tr>
								<tr>
									<td style="WIDTH: 18%"><asp:Label ID="Label21" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Rig %>"></asp:Label></td>
									<td style="WIDTH: 28%">
                                        <span id="spancboRigID" runat="server" class="view"></span></td>
									<td style="WIDTH: 5%">&#160;</td>
									<td style="WIDTH: 6.92%">&#160;</td>
									<td style="WIDTH: 14%"><asp:Label ID="Label22" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Employer %>"></asp:Label></td>
									<td style="WIDTH: 28%">
                                        <span id="spancboEmployer" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label23" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Location %>"></asp:Label></td>
									<td>
                                        <span id="spantxtLocation" runat="server" class="view"></span></td>
									<td>&#160;</td>
									<td style="WIDTH: 52px">&#160;</td>
									<td><asp:Label ID="Label24" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Drilling %>"></asp:Label></td>
									<td><span id="spancboDrillFor" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label25" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, EmployerPhone %>"></asp:Label></td>
									<td><span id="txtEmployerPhone" runat="server" class="view" style="DISPLAY: inline"></span></td>
									<td><asp:Label ID="Label26" RUNAT="server" CSSCLASS="WhiteText">Ext</asp:Label></td>
									<td style="WIDTH: 52px"><span id="txtEmployerPhoneExt" runat="server" class="view" 
                                            style="DISPLAY: inline; WIDTH: 102.22%; HEIGHT: 22px"></span></td>
									<td><asp:Label ID="Label27" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Address %>"></asp:Label></td>
									<td><span id="txtEmployerAddress" runat="server" class="view" 
                                            style="DISPLAY: inline"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label28" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, City %>"></asp:Label></td>
									<td><span id="txtEmployerCity" runat="server" class="view" style="DISPLAY: inline"></span></td>
									<td><asp:Label ID="Label29" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, State %>"></asp:Label></td>
									<td><span id="txtEmployerState" runat="server" class="view" 
                                            style="DISPLAY: inline; WIDTH: 46px"></span></td>
									<td><asp:Label ID="Label30" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, Zip %>"></asp:Label></td>
									<td><span id="txtEmployerZip" runat="server" class="view" style="DISPLAY: inline"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label31" RUNAT="server" CSSCLASS="WhiteText" 
                                            Text="<%$ Resources:Resources, EmailAddress %>"></asp:Label></td>
									<td><span id="txtEmployerEmail" runat="server" class="view" style="DISPLAY: inline"></span></td>
									<td>&#160;</td>
									<td style="WIDTH: 53px">&#160;</td>
									<td>&#160;</td>
									<td>&#160;</td>
								</tr>
							</table>
							</asp:Panel>
                        
							<asp:Panel ID="pnlMedical" runat="server">
							<table border="0" cellpadding="2" cellspacing="0" class="tblSection" width="100%">
								<tr class="stdFont">
									<td class="secHdr" colspan="4"><b>Rig Consultation</b></td>
								</tr>
								<tr>
									<td style="WIDTH: 125px"><asp:Label ID="Label32" RUNAT="server" 
                                            CSSCLASS="WhiteText">Consult Date</asp:Label></td>
									<td style="WIDTH: 255px">
                                        <span id="spantxtConsultDate" runat="server" class="view"></span></td>
									<td style="WIDTH: 125px"><asp:Label ID="Label33" RUNAT="server" 
                                            CSSCLASS="WhiteText">Consult Time</asp:Label></td>
									<td style="WIDTH: 255px"><span id="spantxtConsultTime" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label34" RUNAT="server" CSSCLASS="WhiteText">Paramedic Name</asp:Label></td>
									<td><span id="spancboMedic" runat="server" class="view"></span></td>
									<td><asp:Label ID="Label35" RUNAT="server" CSSCLASS="WhiteText">Medical Consult</asp:Label></td>
									<td><span id="spanchkMedicalConsult" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label36" RUNAT="server" CSSCLASS="WhiteText">Transport Method</asp:Label></td>
									<td><span id="spantxtTransport" runat="server" class="view"></span></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label37" RUNAT="server" CSSCLASS="WhiteText">Chief Complaint</asp:Label></td>
									<td colspan="3">
                                        <span id="spantxtComplaint" runat="server" class="view"></span></td>
								</tr>
							</table>
							<table border="0" cellpadding="2" cellspacing="0" class="tblSection" width="100%">
								<tr class="stdFont">
									<td class="secHdr" colspan="4"><strong>Transport Information</strong></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label38" RUNAT="server" CSSCLASS="WhiteText">Departure Date</asp:Label></td>
									<td><span id="spantxtDepartDate" runat="server" class="view"></span></td>
									<td><asp:Label ID="Label39" RUNAT="server" CSSCLASS="WhiteText">Departure Time</asp:Label></td>
									<td><span id="spantxtDepartTime" runat="server" class="view"></span></td>
								</tr>
								<tr>
									<td><asp:Label ID="Label40" RUNAT="server" CSSCLASS="WhiteText">Hospital/Clinic</asp:Label></td>
									<td><span id="spantxtHospital" runat="server" class="view"></span></td>
									<td>&#160;</td>
									<td>&#160;</td>
								</tr>
								<tr>
									<td style="WIDTH: 125px"><asp:Label ID="Label41" RUNAT="server" 
                                            CSSCLASS="WhiteText">Date of Arrival</asp:Label></td>
									<td style="WIDTH: 255px"><span id="spantxtArrivalDate" runat="server" class="view"></span></td>
									<td style="WIDTH: 125px"><asp:Label ID="Label42" RUNAT="server" 
                                            CSSCLASS="WhiteText">Time of Arrival</asp:Label></td>
									<td style="WIDTH: 255px"><span id="spantxtArrivalTime" runat="server" class="view"></span></td>
								</tr>
							</table>
							<table cellpadding="2" cellspacing="0" class="tblSection" width="100%">
								<tbody>
									<tr class="stdFont">
										<td class="secHdr" colspan="4"><strong>Patient Information</strong></td>
									</tr>
									<tr>
										<td colspan="4" style="height: 19px"><asp:Label ID="Label43" RUNAT="server" 
                                                CSSCLASS="WhiteText">Patient Illness/Injury History</asp:Label></td>
									</tr>
									<tr>
										<td colspan="4">
                                            <span id="spantxtPatientHistory" runat="server" class="view"></span></td>
									</tr>
									<tr class="stdFont">
										<td colspan="4"><asp:Table ID="tblAll" RUNAT="server" CSSCLASS="stdFont" 
                                                WIDTH="100%">
												<asp:TableRow ID="rowHdr" RUNAT="server">
													<asp:TableCell ID="cellHdr" RUNAT="server" COLUMNSPAN="4">Allergies</asp:TableCell>
												</asp:TableRow>
											</asp:Table></td>
									</tr>
									<tr>
										<td class="stdFont" colspan="4"><span id="MedHdr" runat="server">Current Medication
                                        </span></td>
									</tr>
									<tr>
										<td colspan="4">
											<table border="0" cellpadding="3" cellspacing="0" class="stdFont" width="100%">
												<tr>
													<td width="100%"><asp:DataGrid ID="dgMeds" RUNAT="server" 
                                                            AUTOGENERATECOLUMNS="False" BACKCOLOR="White" BORDERCOLOR="Black" 
                                                            BORDERSTYLE="None" BORDERWIDTH="1px" CELLPADDING="5" CSSCLASS="SmallSection" 
                                                            DATAKEYFIELD="MedicationID" GRIDLINES="Horizontal" WIDTH="100%">
															<SELECTEDITEMSTYLE CSSCLASS="SelectedItem">
                                                        </SELECTEDITEMSTYLE>
                                                        
                                    
															<ALTERNATINGITEMSTYLE CSSCLASS="AlternatingItem">
                                                        </ALTERNATINGITEMSTYLE>
                                                        
                                    
															<ITEMSTYLE CSSCLASS="Item"></ITEMSTYLE>
                                                        
                                    
															<HEADERSTYLE CSSCLASS="DataGridHdr"></HEADERSTYLE>
                                                        
                                    
															<PAGERSTYLE BACKCOLOR="#E7E7FF" FORECOLOR="#4A3C8C" HORIZONTALALIGN="Right" 
                                                            MODE="NumericPages"></PAGERSTYLE>
                                                        
                                    
														</asp:DataGrid></td>
												</tr>
												<tr>
													<td>&#160;</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="stdFont" colspan="4"><span id="VitalHdr" runat="server">Vital Signs</span></td>
									</tr>
									<tr>
										<td align="center" colspan="4">
											<table border="0" cellpadding="3" cellspacing="0" width="100%">
												<tr>
													<td width="100%"><asp:DataGrid ID="dgVitals" RUNAT="server" 
                                                            AUTOGENERATECOLUMNS="False" BORDERSTYLE="None" BORDERWIDTH="1px" 
                                                            CELLPADDING="5" CSSCLASS="SmallSection" DATAKEYFIELD="VitalSignID" 
                                                            GRIDLINES="Horizontal" WIDTH="100%">
															<SELECTEDITEMSTYLE CSSCLASS="SelectedItem">
                                                        </SELECTEDITEMSTYLE>
                                                        
                                    
															<ALTERNATINGITEMSTYLE CSSCLASS="AlternatingItem">
                                                        </ALTERNATINGITEMSTYLE>
                                                        
                                    
															<ITEMSTYLE CSSCLASS="Item"></ITEMSTYLE>
                                                        
                                    
															<HEADERSTYLE CSSCLASS="DataGridHdr"></HEADERSTYLE>
                                                        
                                    
															<PAGERSTYLE BACKCOLOR="#E7E7FF" FORECOLOR="#4A3C8C" HORIZONTALALIGN="Right" 
                                                            MODE="NumericPages"></PAGERSTYLE>
                                                        
                                    
														</asp:DataGrid></td>
												</tr>
												<tr>
													<td>&#160;</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td style="WIDTH: 114px"><asp:Label ID="Label52" RUNAT="server" 
                                                CSSCLASS="WhiteText">Witness</asp:Label></td>
										<td colspan="3"><span id="spantxtWitness" runat="server" class="view"></span></td>
									</tr>
									<tr>
										<td><asp:Label ID="Label53" RUNAT="server" CSSCLASS="WhiteText">PABAT Time</asp:Label></td>
										<td style="WIDTH: 255px">
                                            <span id="spantxtPABATTime" runat="server" class="view"></span></td>
										<td style="WIDTH: 125px"><asp:Label ID="Label54" RUNAT="server" 
                                                CSSCLASS="WhiteText">Results</asp:Label></td>
										<td style="WIDTH: 255px"><span id="spantxtResults" runat="server" class="view"></span></td>
									</tr>
								</tbody>
							</table>
							</asp:Panel>
                        
							</radTS:PageView>
                    
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <radTS:PageView ID="Notes" runat="server" Width="100%">
                        <table border="0" cellpadding="2" cellspacing="0" class="tblSection" 
                        width="100%">
								<tr class="DataGridHdr">
									<td><asp:Label ID="Label44" RUNAT="server" CSSCLASS="WhiteText">Physical Exam/Other Information</asp:Label></td>
									<td align="right"></td>
								</tr>
								<tr>
									<td colspan="2">
                                        <span id="spantxtPhysicalNotes" runat="server" class="view" 
                                            style="border: none;"></span>
										
									</td>
								</tr>
								<tr>
									<td>&#160;</td>
								</tr>
								<tr class="DataGridHdr">
									<td><asp:Label ID="Label45" RUNAT="server" CSSCLASS="WhiteText">Initial Impression</asp:Label></td>
									<td align="right"></td>
								</tr>
								<tr>
									<td colspan="2">
                                        <span id="spantxtImpressionNotes" runat="server" class="view" 
                                            style="border: none;"></span>
									</td>
								</tr>
								<tr>
									<td>&#160;</td>
								</tr>
								<tr class="DataGridHdr">
									<td><asp:Label ID="Label46" RUNAT="server" CSSCLASS="WhiteText">Recommendations</asp:Label></td>
									<td align="right"></td>
								</tr>
								<tr>
									<td colspan="2">
                                        <span id="spantxtRecommendationNotes" runat="server" class="view" 
                                            style="border: none;"></span>
									</td>
								</tr>
								<tr>
									<td>&#160;</td>
								</tr>
								<tr class="DataGridHdr">
									<td><asp:Label ID="Label47" RUNAT="server" CSSCLASS="WhiteText">Follow-up Instructions</asp:Label></td>
									<td align="right"></td>
								</tr>
								<tr>
									<td colspan="2">
                                        <span id="spantxtInstructionNotes" runat="server" class="view" 
                                            style="border: none;"></span>
									</td>
								</tr>
							</table>
					</radTS:PageView>
                    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <radTS:PageView ID="Attachments" runat="server" Width="100%">
					    <table border="0" cellpadding="3" cellspacing="0" class="stdFont" 
                        width="100%">
						    <tr>
							    <td width="100%"><asp:DataGrid ID="dgDocuments" RUNAT="server" 
                                        AUTOGENERATECOLUMNS="False" BACKCOLOR="White" BORDERCOLOR="Black" 
                                        BORDERSTYLE="None" BORDERWIDTH="1px" CELLPADDING="5" CSSCLASS="Normal" 
                                        DATAKEYFIELD="DocumentID" GRIDLINES="Vertical" 
                                        OnSelectedIndexChanged="dgDocuments_SelectedIndexChanged" WIDTH="100%">
									    <SELECTEDITEMSTYLE CSSCLASS="SelectedItem"></SELECTEDITEMSTYLE>
                                    
                        
									    <ALTERNATINGITEMSTYLE CSSCLASS="AlternatingItem">
                                    </ALTERNATINGITEMSTYLE>
                                    
                        
									    <ITEMSTYLE CSSCLASS="Item"></ITEMSTYLE>
                                    
                        
									    <HEADERSTYLE CSSCLASS="DataGridHdr"></HEADERSTYLE>
                                    
                        
							            <Columns>
								            <asp:BoundColumn DataField="DocumentID" HeaderText="Document ID">
									            <HeaderStyle Width="50px"></HeaderStyle>
                                            
                                            
								            </asp:BoundColumn>
								            <asp:ButtonColumn CommandName="Select" DataTextField="DocumentType" 
                                                HeaderText="Document Type" ItemStyle-Wrap="false">
									            <HeaderStyle Width="135px"></HeaderStyle>
                                            
                                            
								            </asp:ButtonColumn>
								            <asp:BoundColumn DataField="documentlink" HeaderText="DocumentLink" 
                                                Visible="false">
									            <HeaderStyle Width="80px"></HeaderStyle>
                                            
                                            
								            </asp:BoundColumn>
							            </Columns>
                                    
                        
									    <PAGERSTYLE BACKCOLOR="#E7E7FF" FORECOLOR="#4A3C8C" HORIZONTALALIGN="Right" 
                                        MODE="NumericPages"></PAGERSTYLE>
                                    
                        
								    </asp:DataGrid></td>
						    </tr>
						    <tr>
							    <td>&#160;</td>
						    </tr>
					    </table>
                    </radTS:PageView>
                    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </radTS:RadMultiPage>
            <asp:DropDownList ID="cboRigID" runat="server" CssClass="cboLarge" Visible="False">
            </asp:DropDownList><asp:DropDownList ID="cboEmployer" runat="server" AutoPostBack="True"
                CssClass="cboLarge"  Visible="False">
            </asp:DropDownList><asp:DropDownList ID="cboDrillFor" runat="server" CssClass="cboLarge"
                Visible="False">
            </asp:DropDownList>
            <ASP:RADIOBUTTONLIST id="rdoSex" RUNAT="server" CSSCLASS="stdFont" REPEATDIRECTION="Horizontal" HEIGHT="16px"
											WIDTH="128px" Visible="False">
											<ASP:LISTITEM VALUE="M">Male</ASP:LISTITEM>
											<ASP:LISTITEM VALUE="F">Female</ASP:LISTITEM>
										</ASP:RADIOBUTTONLIST><br />
            <asp:DropDownList ID="cboMedic" runat="server" CssClass="cboLarge" Visible="False">
            </asp:DropDownList><asp:CheckBox ID="chkMedicalConsult" runat="server" CssClass="smallChk"
                Visible="False" />
            
		</FORM>
	</BODY>
</HTML>
