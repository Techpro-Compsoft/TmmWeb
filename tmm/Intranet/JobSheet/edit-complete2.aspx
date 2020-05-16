<%@ Page Language="vb" AutoEventWireup="false" Codebehind="edit-complete2.aspx.vb" Inherits="JobSheet.edit_complete2"%>
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
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" RUNAT="server">
			<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<TBODY>
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
										<cc1:progressindicator id="ucProgress" runat="server" Height="48px" BoookEndGraphics="True" BoookEndStartActive="images/img_Start_o.gif"
											BoookEndFinishActive="images/img_End_o.gif" StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif,images/btn_Step5.gif,images/btn_Step6.gif,images/btn_Step7.gif,images/btn_Step8.gif,images/btn_Step9.gif,images/btn_Step10.gif, images/btn_Step11.gif,images/btn_Step12.gif,Images/btn_Step13.gif,images/btn_Step14.gif"
											SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif,images/btn_Step5_o.gif,images/btn_Step6_o.gif,images/btn_Step7_o.gif,images/btn_Step8_o.gif,images/btn_Step9_o.gif,images/btn_Step10_o.gif, images/btn_Step11_o.gif,images/btn_Step12_o.gif,images/btn_Step13_o.gif,images/btn_Step14_o.gif"
											UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif,images/btn_Step5_d.gif,images/btn_Step6_d.gif,images/btn_Step7_d.gif,images/btn_Step8_d.gif,images/btn_Step9_d.gif,images/btn_Step10_d.gif, images/btn_Step11_d.gif,images/btn_Step12_d.gif,images/btn_Step13_d.gif,images/btn_Step14_d.gif"
											LinkURLs="locationinfo.aspx,locationsup.aspx,contractingcompany.aspx,crewtransportation.aspx,medevac1.aspx,medevac-uscg.aspx,medevac-mc.aspx,medevac-mcAlt.aspx,ambulance.aspx,hospitals-trauma.aspx,hospital-burn.aspx,clinic.aspx,edit-complete.aspx,edit-complete2.aspx"
											CurrentStep="14" LastAvailableStep="14" BoookEndFinish="images/img_End.gif" BoookEndStart="images/img_Start.gif"></cc1:progressindicator></td>
								</tr>
								<TR vAlign="top" height="429">
									<TD align="center" vAlign="top">
									    <asp:Panel ID="plWarningNoServices" runat="server" Visible="false">
									        <br /><br />
									        <span style="color:White; font-family:Arial; font-size:10pt;">There are no services selected for this page.</span>
									        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
									    </asp:Panel>
									    <span id="spnMedEvac_Helicopter" runat="server">
										<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="98%" border="0" align="center"
											class="smallBorder">
											<TR CLASS="DataGridHdr">
												<TD class="SecHdr">&nbsp;Crew Helicopter</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colspan="3">
																<asp:Label id="lblNMCName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblNMCDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<td>
																<asp:Label id="lblNMCTime" runat="server"></asp:Label></td>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblNMCPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<td>
																<asp:Label id="lblNMCAltPhone" runat="server"></asp:Label></td>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblNMCFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<td></td>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px; HEIGHT: 17px">
																Latitude:</TD>
															<TD style="WIDTH: 220px; HEIGHT: 17px">
																<asp:Label id="lblNMCLat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px; HEIGHT: 17px">
																Longitude:</TD>
															<td style="HEIGHT: 17px">
																<asp:Label id="lblNMCLong" runat="server"></asp:Label></td>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">
																Location:</TD>
															<TD colspan="3">
																<asp:Label id="lblNMCLoc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<td align="right">
																<asp:Button id="btnEditNMC" runat="server" Text="Edit" CssClass="btnSmall" Width="60px"></asp:Button></td>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnMedEvac_USCG" runat="server">
										<TABLE class="smallBorder" id="Table3" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Med-Evac</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblCGName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblCGDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblCGTime" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblCGPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblCGAltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblCGFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblCGLat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblCGLong" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblCGLoc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditUSCG" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnMedEvac" runat="server">
										<TABLE class="smallBorder" id="Table5" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Med-Evac Alternate 1</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table6" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblMCName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMCDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblMCTime" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMCPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblMCAltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMCFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMCLat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblMCLong" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblMCLoc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditMC" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnMedEvacAlt" runat="server">
										<TABLE class="smallBorder" id="Table7" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Med-Evac Alternate 2</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblMC2Name" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMC2Distance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblMC2Time" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMC2Phone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblMC2AltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMC2Fax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblMC2Lat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblMC2Long" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblMC2Loc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditMC2" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnAmbulance" runat="server">
										<TABLE class="smallBorder" id="Table9" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Ambulance (closest to dock)</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table10" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblAmbName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblAmbDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblAmbTime" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblAmbPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblAmbAltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblAmbFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditAmb" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnHospital_Trauma" runat="server">
										<TABLE class="smallBorder" id="Table11" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Hospital (closest, trauma)</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table12" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblTrName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTrDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblTrTime" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTrPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblTrAltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTrFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTrLat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblTrLong" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblTrLoc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditTr" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										<TABLE class="smallBorder" id="Table13" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Hospital (closest alternative)</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table14" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblTr2Name" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTr2Distance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblTr2Time" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTr2Phone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblTr2AltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTr2Fax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblTr2Lat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblTr2Long" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblTr2Loc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditTr2" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnHospital_Burn" runat="server">
										<TABLE class="smallBorder" id="Table16" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Hospital (closest, burn)</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table17" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblBurnName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblBurnDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblBurnTime" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblBurnPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblBurnAltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblBurnFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblBurnLat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblBurnLong" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblBurnLoc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditBurn" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<span id="spnClinic" runat="server">
										<TABLE class="smallBorder" id="Table18" cellSpacing="1" cellPadding="1" width="98%" align="center"
											border="0">
											<TR class="DataGridHdr">
												<TD class="SecHdr">&nbsp;Clinic (closest, limited capability)</TD>
											</TR>
											<TR class="stdFont">
												<TD align="center">
													<TABLE id="Table19" cellSpacing="1" cellPadding="1" width="98%" border="0">
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Company&nbsp;Name:</TD>
															<TD colSpan="3">
																<asp:Label id="lblClinicName" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Approximate Distance:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblClinicDistance" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Approximate Time:</TD>
															<TD>
																<asp:Label id="lblClinicTime" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Phone Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblClinicPhone" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Alternative Phone Number:</TD>
															<TD>
																<asp:Label id="lblClinicAltPhone" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Fax Number:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblClinicFax" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Latitude:</TD>
															<TD style="WIDTH: 220px">
																<asp:Label id="lblClinicLat" runat="server"></asp:Label></TD>
															<TD style="WIDTH: 148px">Longitude:</TD>
															<TD>
																<asp:Label id="lblClinicLong" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px">Location:</TD>
															<TD colSpan="3">
																<asp:Label id="lblClinicLoc" runat="server"></asp:Label></TD>
														</TR>
														<TR class="stdFont">
															<TD style="WIDTH: 132px"></TD>
															<TD style="WIDTH: 220px"></TD>
															<TD style="WIDTH: 148px"></TD>
															<TD align="right">
																<asp:Button id="btnEditClinic" runat="server" Width="60px" CssClass="btnSmall" Text="Edit"></asp:Button></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
										<BR>
										</span>
										<TABLE id="Table15" cellSpacing="1" cellPadding="1" width="98%" border="0">
											<TR>
												<TD align="right">
													<asp:Button id="btnComplete" runat="server" Text="Complete" CssClass="btnSmall"></asp:Button></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							    <TR vAlign="top" height="31">
								    <TD align="center"><IMG src="../images/Grphc_BotBar.jpg"></TD>
							    </TR>
								
							</TABLE>
		</TD></TR></TBODY></TABLE>
		</FORM>
	</BODY>
</HTML>
