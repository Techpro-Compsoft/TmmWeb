<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FileList.aspx.vb" Inherits="QuickReference.FileList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Quick Reference Link List</TITLE>
		<META CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<META CONTENT="Visual Basic .NET 7.1" NAME="CODE_LANGUAGE">
		<META CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<META CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		<LINK HREF="/trinity.css" TYPE="text/css" REL="stylesheet">
	</HEAD>
	<BODY TOPMARGIN="0" BGCOLOR="#000000">
		<FORM ID="Form1" METHOD="post" RUNAT="server">
			<TABLE WIDTH="100%">
				<TR>
					<TD>
						<ASP:HYPERLINK ID="hlUpload" CSSCLASS="WhiteLnk" RUNAT="server"></ASP:HYPERLINK>
					</TD>
					<TD ALIGN="right"><A HREF="javascript:window.close();" CLASS="WhiteLnk">Close Window</A></TD>
				</TR>
			</TABLE>
			<BR>
			<TABLE ID="tblSearch" CELLSPACING="0" CELLPADDING="3" WIDTH="100%" BORDER="0" CLASS="Normal"
				RUNAT="server">
				<TR CLASS="DataGridHdr">
					<TD COLSPAN="3">
						<ASP:LABEL ID="lblHeader" RUNAT="server"></ASP:LABEL></TD>
				</TR>
				<TR>
					<TD>Keywords</TD>
					<TD>
						<ASP:TEXTBOX ID="txtKeywords" RUNAT="server" WIDTH="200px" CSSCLASS="txtboxLarge"></ASP:TEXTBOX></TD>
					<TD>
						<ASP:BUTTON ID="btnSearch" RUNAT="server" TEXT=" Search" CSSCLASS="btnSmall"></ASP:BUTTON></TD>
				</TR>
				<TR>
					<TD>Category</TD>
					<TD COLSPAN="2">
						<ASP:DROPDOWNLIST ID="cboCategory" RUNAT="server" CSSCLASS="cboMedium"></ASP:DROPDOWNLIST>
					</TD>
				</TR>
				<TR>
					<TD>File Type</TD>
					<TD COLSPAN="2">
						<ASP:DROPDOWNLIST ID="cboFileType" RUNAT="server" CSSCLASS="cboMedium"></ASP:DROPDOWNLIST>
					</TD>
				</TR>
			</TABLE>
			<ASP:LABEL ID="lblInstructions" RUNAT="server" CSSCLASS="stdFont" VISIBLE="False"><BR>WARNING!<BR>Currently there are no files to attach/link to your document.  Please use the link above to add files to the server.  Then you may attach/link those files to your Quick Reference document.</ASP:LABEL>
			<BR>
			<DIV ID="divResults" RUNAT="server" STYLE="OVERFLOW:auto; WIDTH:100%; HEIGHT:215px">
				<TABLE ID="tblImageList" CELLSPACING="0" CELLPADDING="3" WIDTH="100%" BORDER="0" CLASS="Normal"
					RUNAT="server">
					<TR>
						<TD COLSPAN="5" STYLE="COLOR:#ffffff; BACKGROUND-COLOR:#000000">Search Results</TD>
					</TR>
					<TR CLASS="DataGridHdr">
						<TD>Name</TD>
						<TD>Category</TD>
						<TD>File Type</TD>
						<TD>Upload Date</TD>
						<TD>&nbsp;</TD>
					</TR>
				</TABLE>
			</DIV>
		</FORM>
	</BODY>
</HTML>
