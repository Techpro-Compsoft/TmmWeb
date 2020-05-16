<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FileUpload.aspx.vb" Inherits="QuickReference.FileUpload"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>FileUpload</TITLE>
		<META CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<META CONTENT="Visual Basic .NET 7.1" NAME="CODE_LANGUAGE">
		<META CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<META CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		<LINK HREF="/trinity.css" TYPE="text/css" REL="stylesheet">
		<SCRIPT LANGUAGE="javascript">
			
			function insertFileName(File, target)
			{
				var FileName = File.value;
				var x = String(FileName).lastIndexOf("\\") + 1;
				var z = String(FileName).lastIndexOf(".");
				var TargetInput = document.forms[0].elements[target];			
				
				FileName = String(FileName).substring(x, z);
				TargetInput.value = FileName;
			}
						
		</SCRIPT>
	</HEAD>
	<BODY TOPMARGIN="0" BGCOLOR="#000000">
		<FORM ID="Form1" METHOD="post" ENCTYPE="multipart/form-data" RUNAT="server">
			<TABLE CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
				<TR>
					<TD><A HREF="javascript:history.go(-1);" CLASS="WhiteLnk">&lt; Back</A></TD>
				</TR>
			</TABLE>
			<BR>
			<TABLE CLASS="normal" CELLSPACING="0" CELLPADDING="3" WIDTH="100%" BORDER="0">
				<TR>
					<TD CLASS="secHdr" COLSPAN="2">File Upload Utliity</TD>
				</TR>
				<TR>
					<TD><STRONG><ASP:LABEL ID="lblAttachFile" RUNAT="server">File</ASP:LABEL></STRONG></TD>
					<TD><INPUT ID="AttachFile" STYLE="WIDTH: 240px; HEIGHT: 22px" TYPE="file" ONCHANGE="insertFileName(this, 'txtFileName');"
							SIZE="40" NAME="AttachFile" RUNAT="server"></TD>
				</TR>
				<TR>
					<TD WIDTH="35%"><STRONG><ASP:LABEL ID="lblFileName" RUNAT="server">File Name</ASP:LABEL></STRONG></TD>
					<TD WIDTH="65%"><INPUT ID="txtFileName" STYLE="WIDTH: 240px" TYPE="text" MAXLENGTH="45" RUNAT="server"></TD>
				</TR>
				<TR>
					<TD><STRONG>Existing Category</STRONG></TD>
					<TD><SELECT ID="cboCategory" STYLE="WIDTH: 240px" RUNAT="server">
							<OPTION SELECTED></OPTION>
						</SELECT>
					</TD>
				</TR>
				<TR>
					<TD><STRONG>New Category</STRONG></TD>
					<TD><INPUT ID="txtNewCategory" STYLE="WIDTH: 240px" TYPE="text" MAXLENGTH="30" NAME="Text1"
							RUNAT="server"></TD>
				</TR>
				<TR>
					<TD COLSPAN="2">&nbsp;</TD>
				</TR>
			</TABLE>
			<TABLE>
				<TR>
					<TD COLSPAN="2">&nbsp;</TD>
				</TR>
				<TR>
					<TD><INPUT TYPE="button" NAME="btnClose" CLASS="btnSmall" VALUE=" Close " RUNAT="server" ID="btnClose">&nbsp;<ASP:BUTTON CSSCLASS="btnSmall" ID="btnUpload" RUNAT="server" TEXT=" Upload "></ASP:BUTTON></TD>
				</TR>
				<TR>
					<TD>&nbsp;</TD>
				</TR>
			</TABLE>
			<TABLE ID="tblSummary" CELLSPACING="0" CELLPADDING="3" WIDTH="100%" RUNAT="server">
				<TR>
					<TD><ASP:LABEL ID="lblMessage" RUNAT="server" FORECOLOR="#ff0033"></ASP:LABEL><BR>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
