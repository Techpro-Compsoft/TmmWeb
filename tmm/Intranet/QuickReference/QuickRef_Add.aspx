<%@ Page validateRequest="false" Language="vb" AutoEventWireup="false" Codebehind="QuickRef_Add.aspx.vb" Inherits="QuickReference.QuickRef_Add"%>
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
		<SCRIPT LANGUAGE="JavaScript" SRC="scripts/richtext.js" TYPE="text/javascript"></SCRIPT>
		<SCRIPT LANGUAGE="javascript">
		
			function openWin()
			{
				var details = new String();
				details = "height=160,width=400,menubar=no,resizable=no,scrollbars=yes,status=no,toolbar=no,";
				var thisPage = window.open("changecat.aspx", "changecategory", details);
			}
			
			function doShowHide(oShow, oHide, btnActive, btnDisable)
			{
				// submit form is a javascript function in the user control that adds the code to the hidden source control
				submitForm();
				
				oShow.style.display = 'inline';
				oHide.style.display = 'none';	
			}
			
			function confirmClose(frm, src, showConfirm)
			{
				if(frm.blnSave.value != 1)
				{					
					if(showConfirm)
					{
						var cClose = confirm("Do you wish to save your work?");
						
						if(cClose ==  true)
						{
							saveQuickRef(frm, src);
						}
					}
					else
					{
						saveQuickRef(frm, src);
					}
				}
			}
			
			function saveQuickRef(frm, src)
			{
				var strURL = "";
			
				frm.blnSave.value = 1;
				if(src != null) strURL = "?location=" + src;
				submitForm();
					
				frm.action = "QuickRef_Add.aspx" + strURL;
				frm.submit();
			}
			
			function fillSave(frm, objVal)
			{
				frm.blnSave.value = objVal;
			}
									
		</SCRIPT>
	</HEAD>
	<BODY BGCOLOR="#000000" TOPMARGIN="0" ONLOAD="loadHTML(document.forms[0]); fillSave(document.forms[0], 0);">
		<FORM ID="Form1" METHOD="post" RUNAT="server">
			<INPUT TYPE="hidden" VALUE="0" NAME="blnSave">
			<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BORDER="0">
				<TR VALIGN="top">
					<TD ALIGN="center" WIDTH="100%">
						<TABLE STYLE="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid"
							WIDTH="758">
							<TR VALIGN="top">
								<TD><IMG SRC="images/Grphc_QuickRefAdmin.jpg"></TD>
							</TR>
							<TR VALIGN="top">
								<TD STYLE="HEIGHT: 19px"><UC1:NAVIGATIONMENU ID="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							<TR VALIGN="top">
								<TD>&nbsp;</TD>
							</TR>
							<TR VALIGN="top">
								<TD ALIGN="center">
									<TABLE WIDTH="98%">
										<TR>
											<TD><INPUT TYPE="button" NAME="btnSave" VALUE=" Save Quick Reference " CLASS="btnSmall" STYLE="WIDTH:231px"
													ONCLICK="confirmClose(this.form, 'QuickRef_Add.aspx', 0);"></TD>
											<TD ALIGN="right"><ASP:BUTTON ID="btnCancel" RUNAT="server" TEXT=" Cancel Changes " CSSCLASS="btnSmall" WIDTH="231px"></ASP:BUTTON></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR VALIGN="top">
								<TD>&nbsp;</TD>
							</TR>
							<TR VALIGN="top">
								<TD VALIGN="top" ALIGN="center">
									<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="98%" BORDER="0">
										<TR VALIGN="top">
											<TD ID="cellPreview" STYLE="DISPLAY: none" VALIGN="top" WIDTH="98%" BGCOLOR="#ffffff"
												HEIGHT="400"></TD>
											<TD ID="cellDesign" VALIGN="top" WIDTH="98%">
												<TABLE CLASS="normal" CELLSPACING="0" CELLPADDING="3" WIDTH="100%">
													<TR>
														<TD CLASS="secHdr">Quick Reference Designer</TD>
													</TR>
													<TR>
														<TD><UC1:RICHTEXTBOX ID="rcRichText" RUNAT="server" HTMLSRCCONTROLNAME="txtSrc"></UC1:RICHTEXTBOX></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR VALIGN="top">
											<TD>
												<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BORDER="0">
													<TR>
														<TD COLSPAN="2">&nbsp;</TD>
													</TR>
													<TR VALIGN="top">
														<TD><INPUT ID="txtSrc" TYPE="hidden" NAME="txtSrc" RUNAT="server"> <INPUT CLASS="btnSmall" ONCLICK="doShowHide(document.getElementById('cellPreview'), document.getElementById('cellDesign'), document.forms[0].btnDesign, this);"
																TYPE="button" VALUE=" Preview "> <INPUT CLASS="btnSmall" ONCLICK="doShowHide(document.getElementById('cellDesign'), document.getElementById('cellPreview'), document.forms[0].btnPreview, this);"
																TYPE="button" VALUE=" Design ">
														</TD>
														<TD ALIGN="right">
															<asp:Button id="btnChangeCat" Text="Change Category" runat="server" CssClass="btnSmall"></asp:Button>&nbsp;<ASP:BUTTON ID="btnFileManagement" RUNAT="server" TEXT=" File Management " CSSCLASS="btnSmall"></ASP:BUTTON></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD>&nbsp;</TD>
							</TR>
							<TR>
								<TD ALIGN="center"><IMG SRC="/images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
