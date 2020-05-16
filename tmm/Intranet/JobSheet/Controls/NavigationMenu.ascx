<%@ Control Language="vb" AutoEventWireup="false" Codebehind="NavigationMenu.ascx.vb" Inherits="JobSheet.NavigationMenu" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0" class="MenuBar">
	<TR style="vertical-align:top;">
		<TD>
            <cc2:tmmmenu id="TMMMenu1" runat="server"></cc2:tmmmenu>
        </TD>
		<TD class="MenuBar" style="width: 26px">
			</TD>
		<TD width="26" class="MenuBar">
			</TD>
	</TR>
</TABLE>
