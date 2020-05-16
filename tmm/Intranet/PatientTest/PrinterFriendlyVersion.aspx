<%@ Page language="c#" Codebehind="PrinterFriendlyVersion.aspx.cs" AutoEventWireup="True" Inherits="TrinityMedicTest.PrinterFriendlyVersion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN" >
<html>
	<head>
		<title>PrinterFriendlyVersion</title>
		<meta CONTENT="Microsoft Visual Studio .NET 7.1" NAME="GENERATOR">
		<meta CONTENT="C#" NAME="CODE_LANGUAGE">
		<meta CONTENT="JavaScript" NAME="vs_defaultClientScript">
		<meta CONTENT="http://schemas.microsoft.com/intellisense/ie5" NAME="vs_targetSchema">
		
		<LINK HREF="../trinity.css" TYPE="text/css" REL="stylesheet">
		
		<STYLE> TABLE.Break {page-break-after: always; width:760px; font-family: Arial, Helvetica, sans-serif; font-size: 14px;}
		</STYLE>
		<SCRIPT LANGUAGE="javascript">
			function printTest()
			{
				window.print();
			}
		</SCRIPT>
	</head>
	<BODY ONLOAD="printTest();">
		<FORM ID="Form1" METHOD="post" RUNAT="server">
		<div id="QandA" runat="server"></div>
		<div id="aKey" runat="server" dir="ltr"></div>
        </FORM>
	</body>
</html>
