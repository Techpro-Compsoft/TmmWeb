<%@ Page Language="vb" AutoEventWireup="false" Codebehind="JobSheetServiceSelection.aspx.vb" Inherits="JobSheet.JobSheetServiceSelection" ValidateRequest="false" smartNavigation="True"%>
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
				<TR vAlign="top">
					<TD align="center" width="100%">
						<TABLE style="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid"
							height="560" width="758">
							<TR vAlign="top" height="100">
								<TD><IMG src="images/img_JobInfoSheet.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<TABLE class="smallBorder" id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center"
										border="0">
										<TR class="DataGridHdr">
											<TD class="SecHdr">&nbsp;Select Applicable Services</TD>
										</TR>
										<TR>
											<TD align="center">
                                                <asp:CheckBoxList ID="lstJobSheetSheetServices" runat="server" Width="100%" RepeatColumns="3" ForeColor="White" Font-Names="Arial" Font-Size="12px"></asp:CheckBoxList>
											</TD>
										</TR>
									</TABLE>
									<TABLE id="Table6" cellSpacing="1" cellPadding="1" width="98%" border="0">
										<TR>
											<td align="right">
												<asp:button id="btnContinue" runat="server" Text="Continue" CssClass="btnSmall"></asp:button></td>
										</TR>
									</TABLE>

							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="../images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
