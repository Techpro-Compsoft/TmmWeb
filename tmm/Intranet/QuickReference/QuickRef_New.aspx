<%@ Page Language="vb" AutoEventWireup="false" Codebehind="QuickRef_New.aspx.vb" Inherits="QuickReference.QuickRef_New"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Create New Quick Reference</TITLE>
		<META CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<META CONTENT="Visual Basic .NET 7.1" NAME="CODE_LANGUAGE">
		<META CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<META CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		<LINK HREF="/trinity.css" TYPE="text/css" REL="stylesheet">
		<SCRIPT LANGUAGE="JavaScript" SRC="scripts/richtext.js" TYPE="text/javascript"></SCRIPT>
	</HEAD>
	<BODY TOPMARGIN="0" BGCOLOR="#000000">
		<FORM ID="Form1" METHOD="post" RUNAT="server">
			<TABLE HEIGHT="560" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
				<TR>
					<TD HEIGHT="560" VALIGN="top" ALIGN="center" WIDTH="100%">
						<TABLE HEIGHT="560" WIDTH="758" STYLE="BORDER-RIGHT:#307fa3 1px solid; BORDER-TOP:#307fa3 1px solid; BORDER-LEFT:#307fa3 1px solid; BORDER-BOTTOM:#307fa3 1px solid"
							BORDER="0">
							<TBODY>
								<TR VALIGN="top" HEIGHT="100">
									<TD>
										<IMG SRC="images/Grphc_QuickRefAdmin.jpg"><BR>
										<UC1:NAVIGATIONMENU ID="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
									</TD>
								</TR>
								<TR VALIGN="top" ALIGN="center" HEIGHT="429">
									<TD>
										<TABLE WIDTH="98%">
											<TR>
												<TD>&nbsp;</TD>
											</TR>
											<TR>
												<TD>
													<TABLE CLASS="SmallBorder" CELLSPACING="0" CELLPADDING="3" WIDTH="98%" BORDER="0">
														<TR CLASS="stdFont">
															<TD CLASS="secHdr" COLSPAN="4">Create a New Quick Reference</TD>
														</TR>
														<TR CLASS="stdFont">
															<TD WIDTH="12%">Name</TD>
															<TD WIDTH="38%">
																<ASP:TEXTBOX ID="txtName" RUNAT="server" MAXLENGTH="100" WIDTH="225px"></ASP:TEXTBOX>
																<ASP:REQUIREDFIELDVALIDATOR ID="rfvName" RUNAT="server" CONTROLTOVALIDATE="txtName" DISPLAY="None" ENABLECLIENTSCRIPT="False"
																	ERRORMESSAGE="Please enter a name for the Quick Reference."></ASP:REQUIREDFIELDVALIDATOR>
															</TD>
															<TD WIDTH="13%">Description</TD>
															<TD WIDTH="37%">
																<ASP:TEXTBOX ID="txtDescription" RUNAT="server" WIDTH="225px" MAXLENGTH="100"></ASP:TEXTBOX>
																<ASP:REQUIREDFIELDVALIDATOR ID="rfvDescription" RUNAT="server" ERRORMESSAGE="Please enter the Quick Reference subject."
																	ENABLECLIENTSCRIPT="False" DISPLAY="None" CONTROLTOVALIDATE="txtDescription"></ASP:REQUIREDFIELDVALIDATOR>
															</TD>
														</TR>
														<TR CLASS="stdFont">
															<TD>Category</TD>
															<TD>
																<ASP:DROPDOWNLIST ID="cboCategory" RUNAT="server" WIDTH="225px"></ASP:DROPDOWNLIST></TD>
															<TD>New Category</TD>
															<TD>
																<ASP:TEXTBOX ID="txtNewCategory" RUNAT="server" WIDTH="225px" MAXLENGTH="100"></ASP:TEXTBOX></TD>
														</TR>
														<TR>
															<TD COLSPAN="4">&nbsp;</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD>&nbsp;</TD>
											</TR>
											<TR>
												<TD>
													<ASP:BUTTON ID="btnSubmit" RUNAT="server" CSSCLASS="btnSmall" TEXT=" Save "></ASP:BUTTON>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR HEIGHT="31">
									<TD ALIGN="center"><IMG SRC="/images/Grphc_BotBar.jpg"></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
