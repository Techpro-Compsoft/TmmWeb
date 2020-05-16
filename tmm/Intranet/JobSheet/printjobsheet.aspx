<%@ Page Language="vb" AutoEventWireup="false" Codebehind="printjobsheet.aspx.vb" Inherits="JobSheet.printjobsheet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Job Information Sheet</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<P style="COLOR: black" align="center"><STRONG>Trinity Medical Management, L.L.C.<BR>
				</STRONG>
				<BR>
				<TABLE id="Table1" cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD><font size="2">&nbsp;<STRONG>LOCATION INFORMATION</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table2" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; BORDER-BOTTOM-STYLE: none"
					cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Project Name<BR>
								&nbsp;
								<asp:label id="lblRigName" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top">
							<P><font size="1">Block<BR>
									&nbsp;
									<asp:label id="lblBlock" runat="server"></asp:label></font></P>
						</TD>
						<TD style="WIDTH: 236px" vAlign="top"><font size="1">Facility Type<BR>
								&nbsp;
								<asp:label id="lblFacilityType" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Project Number<BR>
								&nbsp;
								<asp:label id="lblProjNum" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table3" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"
					cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Start Date<BR>
								&nbsp;
								<asp:label id="lblStartDate" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Approximate End Date<BR>
								&nbsp;
								<asp:label id="lblEndDate" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblLatitude" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblLongitude" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table4" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"
					cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblRigPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblRigAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblRigFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table5" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"
					cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Trinity Personnel (#1)<BR>
								&nbsp;
								<asp:label id="lblPersonnel1" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Trinity Personnel (#2)<BR>
								&nbsp;
								<asp:label id="lblPersonnel2" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Work Schedule<BR>
								&nbsp;
								<asp:label id="lblWorkSchedule" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table6" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"
					cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Location Supervisor / OIM #1<BR>
								&nbsp;
								<asp:label id="lblOIM1" runat="server"></asp:label></font></TD>
						<TD vAlign="top" style="WIDTH: 215px"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblOIM1Phone" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table7" style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"
					cellSpacing="0" cellPadding="1" width="650" border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblOIM1Addr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblOIM1City" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblOIM1State" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip Code<BR>
								&nbsp;
								<asp:label id="lblOIM1Zip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table8" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Location Supervisor / OIM #2<BR>
								&nbsp;
								<asp:label id="lblOIM2" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblOIM2Phone" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table9" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblOIM2Addr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblOIM2City" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblOIM2State" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip Code<BR>
								&nbsp;
								<asp:label id="lblOIM2Zip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table10" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Location Manager<BR>
								&nbsp;
								<asp:label id="lblLocMgr" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblLocMgrPhone" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table11" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblLocMgrAddr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblLocMgrCity" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lbllocMgrState" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip Code<BR>
								&nbsp;
								<asp:label id="lblLocMgrZip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table12" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblRigComp" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Corporate Contact Person<BR>
								&nbsp;
								<asp:label id="lblRigCompContact" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table13" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblRigCompAddr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblRigCompCity" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblRigCompState" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip Code<BR>
								&nbsp;
								<asp:label id="lblRigCompZip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table14" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblRigCompPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblRigCompFax" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1"></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table15" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><b>&nbsp;CONTRACTING COMPANY</b></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table16" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblCCName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Corporate Contact Person<BR>
								&nbsp;
								<asp:label id="lblCCContact" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table17" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblCCAddr" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table18" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblCCCity" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblCCState" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Zip<BR>
								&nbsp;
								<asp:label id="lblCCZip" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table19" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblCCPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblCCAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblCCFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table20" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Location Supervisor / Company Man 
								#1<BR>
								&nbsp;
								<asp:label id="lblCM1" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblCM1Phone" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table21" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblCM1Addr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblCM1City" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblCM1State" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip Code<BR>
								&nbsp;
								<asp:label id="lblCM1Zip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table22" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Location Supervisor / Company Man 
								#2<BR>
								&nbsp;
								<asp:label id="lblCM2" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblCM2Phone" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table23" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblCM2Addr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblCM2City" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblCM2State" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip<BR>
								&nbsp;
								<asp:label id="lblCM2Zip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table31" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;HELIPORT</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table24" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblHeliName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Contact Person<BR>
								&nbsp;
								<asp:label id="lblHeliContact" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table25" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblHeliAddr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblHeliCity" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblHeliState" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip<BR>
								&nbsp;
								<asp:label id="lblHeliZip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table26" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblHeliPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblHeliFax" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1"></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table32" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;BOAT DOCK</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table33" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblBoatName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Contact Person<BR>
								&nbsp;
								<asp:label id="lblBoatContact" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table34" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">Address<BR>
								&nbsp;
								<asp:label id="lblBoatAddr" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 150px" vAlign="top"><font size="1">City<BR>
								&nbsp;
								<asp:label id="lblBoatCity" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 175px" vAlign="top"><font size="1">State<BR>
								&nbsp;
								<asp:label id="lblBoatState" runat="server"></asp:label></font></TD>
						<td vAlign="top"><font size="1">Zip<BR>
								&nbsp;
								<asp:label id="lblBoatZip" runat="server"></asp:label></font></td>
					</TR>
				</TABLE>
				<TABLE id="Table35" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblBoatPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblBoatFax" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1"></font></TD>
					</TR>
				</TABLE>
				<BR>
				<BR>
				<BR>
				<BR>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;MED-EVAC (non-medically configured)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblNMCName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblNMCDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblNMCPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblNMCAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblNMCFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblNMCCitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblNMCLat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblNMCLong" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;MED-EVAC (medically configured)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblMCName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblMCDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblMCPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblMCAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblMCFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblMCCitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblMCLat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblMCLong" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;MED-EVAC (medically configured, alternative)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblMCAName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblMCADistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblMCAPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblMCAAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblMCAFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblMCACitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblMCALat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblMCALong" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;MED-EVAC (US Coast Guard)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblCGName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblCGDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblCGPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblCGAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblCGFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblCGCitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblCGLat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblCGLong" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;AMBULANCE (closest to dock)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblAmbName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblAmbDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblAmbPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblAmbAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblAmbFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;HOSPITAL (trauma, closest)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblTraumaName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblTraumaDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblTraumaPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblTraumaAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblTraumaFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblTraumaCitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblTraumaLat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblTraumaLong" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;HOSPITAL (trauma, closest alternative)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblTrauma2Name" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblTrauma2Distance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblTrauma2Phone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblTrauma2AltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblTrauma2Fax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblTrauma2CitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblTrauma2lat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblTrauma2Long" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;HOSPITAL (burn, closest)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblBurnName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblBurnDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblBurnPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblBurnAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblBurnFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblBurnCitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblBurnLat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:label id="lblBurnLong" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table27" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD vAlign="top"><font size="2"><STRONG>&nbsp;CLINIC&nbsp;(closest)</STRONG></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table28" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 430px" vAlign="top"><font size="1">Company Name<BR>
								&nbsp;
								<asp:label id="lblClinicName" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Approximate Distance / Time<BR>
								&nbsp;
								<asp:label id="lblClinicDistance" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table29" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Phone Number<BR>
								&nbsp;
								<asp:label id="lblClinicPhone" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Alternative Phone Number<BR>
								&nbsp;
								<asp:label id="lblClinicAltPhone" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Fax Number<BR>
								&nbsp;
								<asp:label id="lblClinicFax" runat="server"></asp:label></font></TD>
					</TR>
				</TABLE>
				<TABLE id="Table36" style="BORDER-TOP-STYLE: none" cellSpacing="0" cellPadding="1" width="650"
					border="1">
					<TR>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">City / State<BR>
								&nbsp;
								<asp:label id="lblClinicCitySt" runat="server"></asp:label></font></TD>
						<TD style="WIDTH: 213px" vAlign="top"><font size="1">Latitude<BR>
								&nbsp;
								<asp:label id="lblClinicLat" runat="server"></asp:label></font></TD>
						<TD vAlign="top"><font size="1">Longitude<BR>
								&nbsp;
								<asp:Label id="lblClinicLong" runat="server"></asp:Label></font></TD>
					</TR>
				</TABLE>                
			</P>             
		</form>
	</body>
</HTML>
