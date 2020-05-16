<%@ Page Language="vb" AutoEventWireup="false" Codebehind="changecat.aspx.vb" Inherits="QuickReference.changecat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Change Category</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<LINK HREF="/trinity.css" TYPE="text/css" REL="stylesheet">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<SCRIPT language="javascript">
		
			function openWin()
			{
				var details = new String();
				details = "height=300,width=365,menubar=no,resizable=no,scrollbars=yes,status=no,toolbar=no,";
				var thisPage = window.open("catmanagement.aspx", "category", details);
			}
		</SCRIPT>
	</HEAD>
	<body TOPMARGIN="0" BGCOLOR="#000000">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="350" border="0">
				<TR>
					<TD></TD>
					<TD align="right"><A HREF="javascript:window.close();" CLASS="WhiteLnk">Close Window</A></TD>
				</TR>
			</TABLE>
			<TABLE CLASS="SmallBorder" CELLSPACING="0" CELLPADDING="3" WIDTH="350" BORDER="0">
				<TR CLASS="stdFont">
					<TD CLASS="secHdr" COLSPAN="2">Change Category</TD>
				</TR>
				<TR CLASS="stdFont">
					<TD style="WIDTH: 304px" align="right">Select Category:</TD>
					<TD>
						<asp:DropDownList id="cboCategory" runat="server" Width="240px"></asp:DropDownList></TD>
				</TR>
				<TR CLASS="stdFont">
					<TD colspan="2" align="center">
						<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
							<TR>
								<TD align="right">
									<asp:Button id="btnEdit" runat="server" CssClass="btnSmall" Text="Edit Categories"></asp:Button></TD>
								<TD align="right" style="WIDTH: 341px"><INPUT class="btnSmall" type="button" value="Cancel" onclick="javascript:window.close();"></TD>
								<TD align="right">
									<asp:Button id="btnSave" runat="server" Text="Save" CssClass="btnSmall"></asp:Button></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD colspan="2" align="center">&nbsp;</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
