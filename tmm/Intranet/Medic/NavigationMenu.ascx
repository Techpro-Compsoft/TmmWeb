<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<%@ Control Language="c#" Inherits="TrinityMedicalManagement.NavigationMenu" Codebehind="NavigationMenu.ascx.cs" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="cc2" %>
<%@ Register Assembly="RadMenu.Net2" Namespace="Telerik.WebControls" TagPrefix="radM" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0" class="MenuBar">
	<TR>
		<TD style="height: 1px">
            <cc2:TMMMenu ID="TMMMenu1" runat="server" />
        </TD>
	</TR>
</TABLE>
