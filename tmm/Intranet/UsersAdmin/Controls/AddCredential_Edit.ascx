<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCredential_Edit.ascx.cs" Inherits="UsersAdmin.Controls.AddCredential_Edit" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
<table style="width:100%; width:100%; padding:10px;" id="tblMain" runat="server">
    <tr>
        <td style="width:50%"><asp:Label ID="lblCredential" runat="server" Text='<%# Eval("MedCredTypeString") %>'></asp:Label></td>
        <td>
            <rad:RadDatePicker ID="radDate2" Width="200px" runat="server" Skin="Trinity" DatePopupButton-ImageUrl="../images/btn_SelectDate.jpg" DatePopupButton-HoverImageUrl="../images/btn_SelectDate.jpg" SelectedDate='<%# Convert.ToDateTime(Eval("ExpDate")) %>' >
                <DatePopupButton CssClass="RadDatePickerButton" />
                <DateInput MaxLength="10"></DateInput>
                <Calendar Skin="Trinity"></Calendar>
            </rad:RadDatePicker><br /></td>
    </tr>
    <tr>
        <td colspan="2">Note<br /><textarea id="txtNote" runat="server" style="width:100%; height:40px;"  onkeyup="FixTextarea(this)" onkeypress="return textMaxLength(this, '49', event);" onpaste='return maxLengthPaste(this)' ><%# Eval("Notes") %></textarea></td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:right;">
            <asp:button ID="btnDelete" runat="server" Text="Delete" CssClass="btnSmall" CausesValidation="false" CommandName="Delete" CommandArgument='<%# Eval("TempID") %>'  OnClientClick="return confirm('Are you sure you want to remove this credential from the users credential list?');"  />&nbsp;
            <asp:button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall" CausesValidation="false" CommandName="Cancel" />&nbsp;
            <asp:button ID="btnUpdate" runat="server" Text="Save" CssClass="btnSmall" CausesValidation="false" CommandName="Update"  CommandArgument='<%# Eval("TempID") %>' />
        </td>
    </tr>
</table>