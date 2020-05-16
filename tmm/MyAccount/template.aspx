<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="template.aspx.vb" Inherits="MyAccount.Template" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>QuickReferenceList</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../trinity.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" RUNAT="server">
			<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<TR vAlign="top">
					<TD align="center" width="100%">
						<TABLE class="SmallBorder"
							height="560" width="758">
							<TR vAlign="top" height="100">
								<TD><IMG src="images/Grphc_OvertimeAvail.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<tr height="20">
								<td></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD align="left" vAlign="top">
									<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="98%" border="0" align="center">
										<TR CLASS="DataGridHdr">
											<TD class="SecHdr">&nbsp;My Account</TD>
										</TR>
										<TR>
											<TD align="center">
											</TD>
										</TR>
										<TR>
											<TD></TD>
										</TR>
									</TABLE>
								</TD>
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
