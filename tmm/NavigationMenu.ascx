<%@ Control Language="vb" AutoEventWireup="false" Codebehind="NavigationMenu.ascx.vb" Inherits="NavigationMenu"  %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="RolloverButton" Assembly="RolloverButton" %>
<table id="Table1" class="MenuBar" cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr style="vertical-align:top;">
		<td>
            <cc2:tmmmenu id="TMMMenu1" runat="server"></cc2:tmmmenu>
        </td>
	</tr>
</table>

