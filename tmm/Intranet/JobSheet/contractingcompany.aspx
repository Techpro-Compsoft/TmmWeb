<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="contractingcompany.aspx.vb" Inherits="JobSheet.contractingcompany" ValidateRequest="false"%>
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
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<form id="Form1" method="post" RUNAT="server">
		<input id="hidRigName" type="hidden" runat="server" />
		<script type="text/javascript">
		    function ConfirmCancel() {
		        var rigName = document.getElementById("hidRigName").value;
		        var msg = confirm("Terminating this worksite's job sheet will mean that a new job sheet will need to be created for this worksite when necessary. Are you sure you want to permanently terminate this job sheet for " + rigName + " worksite?");
		        if (msg) {
		            return true;
		        }
		        else {
		            return false;
		        }
		    }
		</script>
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
										BoookEndFinishActive="images/img_End_o.gif" StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif"
										SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif"
										UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif"
										LinkURLs="locationinfo.aspx,contractingcompany.aspx,SelectService.aspx,edit-complete.aspx"
										Height="48px" CurrentStep="2" LastAvailableStep="2" BoookEndFinish="images/img_End.gif" BoookEndStart="images/img_Start.gif"
										runat="server"></cc1:progressindicator></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr">&nbsp;Contracting Company</TD>
										</TR>
										<TR class="stdFont">
											<TD align="center">
												<P><BR>
													<TABLE id="Table3" style="HEIGHT: 109px" cellSpacing="1" cellPadding="1" width="650" border="0">
														<tr class="stdFont">
															<td align="right">
																<asp:Label id="lblSelectContractingCompany" runat="server">Select a Contracting Company:</asp:Label></td>
															<td colSpan="3"><asp:dropdownlist id="cboCompany" runat="server" AutoPostBack="True" Width="235px"></asp:dropdownlist></td>
														</tr>
														<tr class="stdFont">
															<td align="right">Contracting Company:</td>
															<td colSpan="3">
																<asp:TextBox id="txtContractingCompany" runat="server" Width="235px"></asp:TextBox><asp:Label ID="lblContractCompany" runat="server" />
																<asp:RequiredFieldValidator id="rfvContractingCompany" runat="server" ErrorMessage="Please enter the name of the contracting company."
																	ControlToValidate="txtContractingCompany">*</asp:RequiredFieldValidator></td>
														</tr>
														<TR class="stdFont">
															<TD style="WIDTH: 187px" align="right">Phone Number:</TD>
															<TD style="WIDTH: 161px">
															    <asp:textbox id="txtCCPhone" runat="server" MaxLength="50" /></TD>
															<TD style="WIDTH: 77px" align="right">Fax Number:</TD>
															<TD><asp:textbox id="txtCCFax" runat="server" MaxLength="50"></asp:textbox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 187px; HEIGHT: 17px" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alternative 
																Phone Number:</TD>
															<TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtCCAltPhone" runat="server" MaxLength="50"></asp:textbox></TD>
															<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
															<TD style="HEIGHT: 17px"></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 187px" align="right">Address:</TD>
															<TD colSpan="3"><asp:textbox id="txtCCAddress" runat="server" Width="398px" MaxLength="50"></asp:textbox></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 187px" align="right">City / State / Zip Code:</TD>
															<TD colSpan="3"><asp:textbox id="txtCCCity" runat="server" Width="198px" MaxLength="50"></asp:textbox>&nbsp;
																<asp:textbox id="txtCCState" runat="server" Width="125px" MaxLength="15"></asp:textbox>&nbsp;
																<asp:textbox id="txtCCZip" runat="server" Width="62px" MaxLength="10"></asp:textbox></TD>
														</TR>
													</TABLE>
												</P>
											</TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE class="smallBorder" id="Table5" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										cellPadding="1" width="746" border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 19px">&nbsp;OIM #1</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table10" style="HEIGHT: 109px" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 26px" align="right">First Name:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 26px">
														    <asp:textbox id="Textbox1" runat="server" MaxLength="50" />
														    <asp:Label ID="label1" runat="server" />
														</TD>
														<TD style="WIDTH: 77px; HEIGHT: 26px" align="right">Last Name:</TD>
														<TD style="HEIGHT: 26px; width:185px">
														    <asp:textbox id="Textbox2" runat="server" MaxLength="50" />
														    <asp:Label ID="label2" runat="server" />
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 17px">
														    <asp:textbox id="Textbox3" runat="server" MaxLength="50" />
														    <asp:Label ID="label3" runat="server" />
														</TD>
														<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														<TD style="HEIGHT: 17px"></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">Address:</TD>
														<TD colSpan="3">
														    <asp:textbox id="Textbox4" runat="server" Width="398px" MaxLength="50" />
														    <asp:Label ID="label4" runat="server" />
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														<TD colSpan="3">
														    <asp:textbox id="Textbox5" runat="server" Width="198px" MaxLength="50" />
														    <asp:Label ID="label5" runat="server" Width="198px" />&nbsp;
															<asp:textbox id="Textbox6" runat="server" Width="125px" MaxLength="15" />
															<asp:Label ID="label6" runat="server" Width="125px" />&nbsp;
															<asp:textbox id="Textbox7" runat="server" Width="62px" MaxLength="10" />
															<asp:Label ID="label7" runat="server" Width="62px" />
											            </TD>
													</TR>
													<tr>
													    <td colspan="2" style="height:15px;"></td>
													</tr>
													<tr>
													    <td colspan="4" style="text-align:right">
													        <asp:Button ID="btnEditOIM1" runat="server" Text="Edit" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnCancelOIM1" runat="server" Text="Cancel" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnSaveOIM1" runat="server" Text="Save" CssClass="btnSmall" Width="60px" CausesValidation="false" />
													    </td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE class="smallBorder" id="Table11" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										cellPadding="1" width="746" border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 19px">&nbsp;OIM #2</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table12" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">First Name:</TD>
														<TD style="WIDTH: 161px">
														    <asp:textbox id="Textbox8" runat="server" MaxLength="50" />
														    <asp:Label ID="label8" runat="server" />
														</TD>
														<TD style="WIDTH: 77px" align="right">Last Name:</TD>
														<TD style="width:185px">
														    <asp:textbox id="Textbox9" runat="server" MaxLength="50" />
														    <asp:Label ID="label9" runat="server" />
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 17px">
														    <asp:textbox id="Textbox10" runat="server" MaxLength="50" />
														    <asp:Label ID="label10" runat="server" />    
														</TD>
														<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														<TD style="HEIGHT: 17px"></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">Address:</TD>
														<TD colSpan="3">
														    <asp:textbox id="Textbox11" runat="server" Width="398px" MaxLength="50" />
														    <asp:Label ID="label11" runat="server" />    
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														<TD colSpan="3">
														    <asp:textbox id="Textbox12" runat="server" Width="198px" MaxLength="50" />
														    <asp:Label ID="label12" runat="server" Width="198px" />&nbsp;
															<asp:textbox id="Textbox13" runat="server" Width="125px" MaxLength="15" />
															<asp:Label ID="label13" runat="server" Width="125px" />&nbsp;
															<asp:textbox id="Textbox14" runat="server" Width="62px" MaxLength="10" />
															<asp:Label ID="label14" runat="server" Width="62px" />
													    </TD>
													</TR>
													<tr>
													    <td colspan="2" style="height:15px;"></td>
													</tr>
													<tr>
													    <td colspan="4" style="text-align:right">
													        <asp:Button ID="btnEditOIM2" runat="server" Text="Edit" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnCancelOIM2" runat="server" Text="Cancel" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnSaveOIM2" runat="server" Text="Save" CssClass="btnSmall" Width="60px" CausesValidation="false" />
													    </td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<br />
									<TABLE class="smallBorder" id="Table6" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										cellPadding="1" width="746" border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Company Rep. #1
												</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table7" style="HEIGHT: 109px" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">First Name:</TD>
														<TD style="WIDTH: 161px">
														    <asp:textbox id="txtFName1" runat="server" MaxLength="50" />
														    <asp:Label ID="lblFName1" runat="server" />    
														</TD>
														<TD style="WIDTH: 77px" align="right">Last Name:</TD>
														<TD style="width:185px">
														    <asp:textbox id="txtLName1" runat="server" MaxLength="50" />
														    <asp:Label ID="lblLName1" runat="server" />    
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 17px">
														    <asp:textbox id="txtPhone1" runat="server" MaxLength="50" />
														    <asp:Label ID="lblPhone1" runat="server" />    
														</TD>
														<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														<TD style="HEIGHT: 17px"></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">Address:</TD>
														<TD colSpan="3">
														    <asp:textbox id="txtAddr1" runat="server" Width="398px" MaxLength="50" />
														    <asp:Label ID="lblAddr1" runat="server" />    
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														<TD colSpan="3" Width="410px">
														    <asp:textbox id="txtCity1" runat="server" Width="198px" MaxLength="50" />
														    <asp:Label ID="lblCity1" runat="server" Width="198px" />&nbsp;
															<asp:textbox id="txtState1" runat="server" Width="125px" MaxLength="15" />
															<asp:Label ID="lblState1" runat="server" Width="125px" />&nbsp;
															<asp:textbox id="txtZip1" runat="server" Width="62px" MaxLength="10" />
														    <asp:Label ID="lblZip1" runat="server" Width="62px" />	
														</TD>
													</TR>
													<tr>
													    <td colspan="2" style="height:15px;"></td>
													</tr>
													<tr>
													    <td colspan="4" style="text-align:right">
													        <asp:Button ID="btnEditComp1" runat="server" Text="Edit" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnCancelComp1" runat="server" Text="Cancel" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnSaveComp1" runat="server" Text="Save" CssClass="btnSmall" Width="60px" CausesValidation="false" />
													    </td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE class="smallBorder" id="Table8" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										cellPadding="1" width="746" border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Company Rep. #2</TD>
										</TR>
										<TR>
											<TD align="center">
												<TABLE id="Table9" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">First Name:</TD>
														<TD style="WIDTH: 161px">
														    <asp:textbox id="txtFName2" runat="server" MaxLength="50" />
														    <asp:Label ID="lblFName2" runat="server" />
														</TD>
														<TD style="WIDTH: 77px" align="right">Last Name:</TD>
														<TD style="width:185px">
														    <asp:textbox id="txtLName2" runat="server" MaxLength="50" />
														    <asp:Label ID="lblLName2" runat="server" />    
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														<TD style="WIDTH: 161px; HEIGHT: 17px">
														    <asp:textbox id="txtPhone2" runat="server" MaxLength="50" />
														    <asp:Label ID="lblPhone2" runat="server" />    
														</TD>
														<TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														<TD></TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">Address:</TD>
														<TD colSpan="3">
														    <asp:textbox id="txtAddr2" runat="server" Width="398px" MaxLength="50" />
														    <asp:Label ID="lblAddr2" runat="server" />    
														</TD>
													</TR>
													<TR class="stdFont">
														<TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														<TD colSpan="3" Width="410px">
														    <asp:textbox id="txtCity2" runat="server" Width="198px" MaxLength="50" />
														    <asp:Label ID="lblCity2" runat="server" Width="198px" />&nbsp;
															<asp:textbox id="txtState2" runat="server" Width="125px" MaxLength="15" />
															<asp:Label ID="lblState2" runat="server" Width="125px" />&nbsp;
															<asp:textbox id="txtZip2" runat="server" Width="62px" MaxLength="10" />
														    <asp:Label ID="lblZip2" runat="server" Width="62px" />	
												        </TD>
													</TR>
													<tr>
													    <td colspan="2" style="height:15px;"></td>
													</tr>
													<tr>
													    <td colspan="4" style="text-align:right">
													        <asp:Button ID="btnEditComp2" runat="server" Text="Edit" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnCancelComp2" runat="server" Text="Cancel" CssClass="btnSmall" Width="60px" CausesValidation="false" />&nbsp;
													        <asp:Button ID="btnSaveComp2" runat="server" Text="Save" CssClass="btnSmall" Width="60px" CausesValidation="false" />
													    </td>
													</tr>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
									<br />
									<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="98%" border="0">
										<TR>
											<TD align="right">
												<asp:Button id="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall" OnClientClick="return ConfirmCancel();" />&nbsp;
												<asp:Button id="btnContinue" runat="server" Text="Continue" CssClass="btnSmall" /></TD>
										</TR>
									</TABLE>
									<asp:validationsummary id="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" ShowMessageBox="True"
										ShowSummary="False"></asp:validationsummary></TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="../../Images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
