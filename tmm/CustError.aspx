<%@ Page language="VB" Inherits="TrinityMedicalManagement.CustError" Codebehind="CustError.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>CustError</TITLE>
		<META CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<META CONTENT="C#" NAME="CODE_LANGUAGE">
		<META CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<META CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		<LINK HREF="/global.css" TYPE="text/css" REL="stylesheet">
	</HEAD>
	<BODY>
		<FORM ID="Form1" METHOD="post" RUNAT="server">
			<TABLE ID="Table1" HEIGHT="100%" CELLSPACING="1" CELLPADDING="1" WIDTH="100%" BORDER="0">
				<TR>
					<TD WIDTH="20%">&nbsp;</TD>
					<TD WIDTH="60%" ALIGN="center">
						<TABLE CLASS="tblSection" CELLSPACING="0" CELLPADDING="3" WIDTH="60%" BORDER="0">
							<TR>
								<TD CLASS="secHdr">
									<P ALIGN="center"><FONT STYLE="BACKGROUND-COLOR: #783030"><STRONG>ERROR</STRONG></FONT>&nbsp;</P>
								</TD>
							</TR>
							<TR CLASS="stdFont">
								<TD>
									<ASP:LABEL ID="lblErr" RUNAT="server" WIDTH="100%" CSSCLASS="stdFont">Label</ASP:LABEL>
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD WIDTH="20%">&nbsp;</TD>
				</TR>
				<TR>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
