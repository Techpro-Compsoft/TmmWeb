<%@ Page validateRequest="false" Language="vb" AutoEventWireup="false" Codebehind="CustomError.aspx.vb" Inherits="QuickReference.CustomError"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RichTextBox" Src="RichTextBox.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Add a new Quick Reference</TITLE>
		<META CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<META CONTENT="Visual Basic .NET 7.1" NAME="CODE_LANGUAGE">
		<META CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<META CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		<LINK HREF="/trinity.css" TYPE="text/css" REL="stylesheet">
	</HEAD>
	<BODY TOPMARGIN="0" BGCOLOR="#000000">
		<FORM ID="Form1" METHOD="post" RUNAT="server">
			<TABLE HEIGHT="560" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BORDER="0">
				<TR VALIGN="top">
					<TD ALIGN="center" WIDTH="100%">
						<TABLE WIDTH="758" STYLE="BORDER-RIGHT:#307fa3 1px solid; BORDER-TOP:#307fa3 1px solid; BORDER-LEFT:#307fa3 1px solid; BORDER-BOTTOM:#307fa3 1px solid">
							<TR HEIGHT="100" VALIGN="top">
								<TD><IMG SRC="images/Grphc_QuickRefAdmin.jpg"></TD>
							</TR>
							<TR VALIGN="top">
								<TD STYLE="HEIGHT: 19px">
									<UC1:NAVIGATIONMENU ID="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<TR VALIGN="top">
								<TD>&nbsp;</TD>
							</TR>
							<TR>
								<TD>&nbsp;</TD>
							</TR>
							<TR>
								<TD ALIGN="center">
									<TABLE WIDTH="98%">
										<TR>
											<TD WIDTH="50%"><INPUT CLASS="btnSmall" ONCLICK="location.href='QuickRef_New.aspx';" TYPE="button" VALUE=" Create New Quick Reference "
													NAME="btnCreateNew"></TD>
											<TD ALIGN="right" WIDTH="50%"><INPUT CLASS="btnSmall" ONCLICK="location.href='QuickReferenceList.aspx';" TYPE="button"
													VALUE=" View Quick Reference List " NAME="btnViewFiles"></TD>
										</TR>
									</TABLE>									
								</TD>
							</TR>	
							<TR>
								<TD>&nbsp;</TD>
							</TR>						
							<TR HEIGHT="429" VALIGN="top">
								<TD ALIGN="center" VALIGN="top">
									<TABLE CLASS="tblSection" CELLSPACING="0" CELLPADDING="3" WIDTH="98%" BORDER="0" STYLE="border:1px solid #000000;">
										<TR>
											<TD STYLE="background-color:#FF0033; color:#FFFFFF; font-weight:bold;">
												<P ALIGN="center">ERROR&nbsp;</P>
											</TD>
										</TR>
										<TR STYLE="background-color:#FFFFFF; color:#000000;">
											<TD>
												An unexpected error has occurred.  The administrator has been notified of the previous error you encountered.  Please use one of the navigational buttons above.  If the problem persists try closing your browser.
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR HEIGHT="31">
								<TD ALIGN="center"><IMG SRC="/images/Grphc_BotBar.jpg"></TD>
							</TR>							
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
