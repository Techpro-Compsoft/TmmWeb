<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserVideoPermissionRow.ascx.cs" Inherits="UsersAdmin.Controls.UserVideoPermissionRow" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">

/*the HiddenPicker CSS class and the following two CSS rules are required only
if you want to minimize the space taken up by the invisible datetimepicker*/



.HiddenPicker
{
	display:inline;
}
.HiddenPicker td
{
	padding:0 !important;
}


.HideTextBox
{
	width:1px !important;
	border:0 !important;
	margin:0 !important;
	background:none transparent !important;
}

</style>
<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" width="300px" height="28px">
<table id="tblCtrl" runat="server" style="width:600px; color:Black;">
    <tr>
        <td style="width:200px;">
            <asp:Literal ID="litLname" runat="server"></asp:Literal>, <asp:Literal ID="litFname" runat="server"></asp:Literal>
        </td>
        <td style="width:200px;">
            <asp:DropDownList ID="ddlAccessType" runat="server" 
                AutoPostBack="true" CausesValidation="false" 
                onselectedindexchanged="ddlAccessType_SelectedIndexChanged">
                <asp:ListItem Text="Not Accessible" Value="1"></asp:ListItem>
                <asp:ListItem Text="Limited" Value="2"></asp:ListItem>
                <asp:ListItem Text="Unlimited" Value="3"></asp:ListItem>
            </asp:DropDownList>
            <telerik:RadDatePicker ID="rdpExpiration" runat="server"  Width="26px" 
                onselecteddatechanged="rdpExpiration_SelectedDateChanged" AutoPostBack="true">
                <DateInput runat="server" CssClass="HideTextBox"></DateInput>
            </telerik:RadDatePicker>
        </td>
        <td style="width:200px;">
            <asp:Literal ID="litExpirationDate" runat="server"></asp:Literal>
        </td>
    </tr>
</table>
</telerik:RadAjaxPanel>