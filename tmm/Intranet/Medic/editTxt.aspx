<%@ Page language="c#" Inherits="TrinityMedicalManagement.editTxt" Codebehind="editTxt.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Editing Note</TITLE>
		<META NAME="GENERATOR" CONTENT="Microsoft Visual Studio .NET 7.1">
		<META NAME="CODE_LANGUAGE" CONTENT="C#">
		<META NAME="vs_defaultClientScript" CONTENT="JavaScript">
		<META NAME="vs_targetSchema" CONTENT="http://schemas.microsoft.com/intellisense/ie5">
		<LINK HREF="../trinity.css" TYPE="text/css" REL="stylesheet">
		<script language="javascript" type="text/javascript" src="scripts/pageScripts.js"></script>
		<script language="javascript" type="text/javascript" src="scripts/validate.js"></script>
		<SCRIPT LANGUAGE="javascript">
			
			function loadNote()
			{
				var fldName = document.forms[0].elements["txtName"].value;
				document.forms[0].elements["txtNote"].value = opener.document.forms[0].elements[fldName].value;
			}	
			
			function updateParent(frm, txtObj)
			{
				var winParent = window.opener;
				var fldName = document.forms[0].elements["txtName"].value;
				
				winParent.document.forms[0].elements[fldName].value = txtObj.value;
				window.close();
			}
			
		</SCRIPT>
	</HEAD>
	<BODY ONLOAD="loadNote();" BGCOLOR="#000000">
		<FORM ID="frmEdit" METHOD="post">
			<INPUT TYPE="hidden" NAME="txtName" RUNAT="server" ID="txtName">
			<TABLE ID="Table1" CELLSPACING="1" CELLPADDING="1" WIDTH="100%" BORDER="0">
				<TR>
					<TD ALIGN="center">
						<ASP:LABEL ID="lblHdr" RUNAT="server" CSSCLASS="secHdr" WIDTH="100%">Label</ASP:LABEL></TD>
				</TR>
				<TR>
					<TD><TEXTAREA CLASS="txtArea" COLS="65" ROWS="20" ID=""  onkeyup="return CheckTextBoxMaxLength(this,2000,true);" onpaste="return MaxPasteLength(this,2000);" onkeypress="return CheckTextBoxMaxLength(this,2000,true);"  NAME="txtNote"></TEXTAREA></TD>
				</TR>
				<TR>
					<TD ALIGN="center">
						<INPUT TYPE="button" CLASS="btnSmall" VALUE=" Cancel " ONCLICK="javascript:window.close();"> <INPUT TYPE="button" CLASS="btnSmall" VALUE=" Update " ONCLICK="updateParent(this.form, this.form.txtNote);" id="Button1">
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
