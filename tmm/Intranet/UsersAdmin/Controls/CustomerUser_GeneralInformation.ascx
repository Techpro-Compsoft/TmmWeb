<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerUser_GeneralInformation.ascx.cs" Inherits="UsersAdmin.Controls.CustomerUser_GeneralInformation" %>
<asp:Panel ID="pnlGenInfo" runat="server" GroupingText="General Information"  ForeColor="White" Font-Names="Arial" Font-Size="12px">
<asp:HiddenField ID="hidUserID" runat="server" Value="0" />
<script language="javascript" type="text/javascript">
    function ToggleValidators(IsEnabled) {
        Page_ValidationActive = IsEnabled;
    }
</script>
<table style="color:White; width:100%; text-align:left; border:0px;" cellpadding="0">
    <tr>
        <td style="vertical-align:top;">
            <table cellpadding="8" style="vertical-align:top;">
                <tr>
                    <td style="font-weight:bold; width:18%;"><span id="spnRFV1" runat="server">* </span>First Name:</td>
                    <td style="width:47%;"><asp:TextBox ID="txtFName" runat="server" Width="300px" MaxLength="25"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valFirstName" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtFName"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;"><span id="spnRFV2" runat="server">* </span>Last Name:</td>
                    <td><asp:TextBox ID="txtLName" runat="server" Width="300px" MaxLength="25"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valLastName" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtLName"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;"><span id="spnRFV9" runat="server">* </span>E-Mail Address:</td>
                    <td><asp:TextBox ID="txtEmail" runat="server" Width="300"  MaxLength="50"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="valEmail" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valEmailReg" runat="server" ValidationExpression="^[A-Za-z0-9_\+-]+(\.[A-Za-z0-9_\+-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.([A-Za-z]{2,4})$" ErrorMessage="* Invalid Email Address" ControlToValidate="txtEmail" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="valEmailExists" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-Mail Address is already associated with an existing user account." Display="Dynamic" OnServerValidate="ValidateNotEmailExists"></asp:CustomValidator> </td>
                </tr>
            </table>
        </td>
        <td style="vertical-align:top;">
            <table cellpadding="8" style="vertical-align:top;">
                <tr>
                    <td style="font-weight:bold; width:15%;">Work Phone:</td>
                    <td style="width:20%;"><asp:TextBox ID="txtWorkPhone" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="font-weight:bold; width:15%;">Fax Number:</td>
                    <td style="width:20%;"><asp:TextBox ID="txtFax" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;">Cell Phone:</td>
                    <td><asp:TextBox ID="txtCellPhone" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr id="trMedicStatus" runat="server">
                    <td style="font-weight:bold;">Status:</td>
                    <td><asp:RadioButton ID="radMedicStatus_Active" runat="server" AutoPostBack="true" 
                            Text="Active" GroupName="MedicStatus" 
                            oncheckedchanged="radMedicStatus_Active_CheckedChanged" />
                        <asp:RadioButton ID="radMedicStatus_Inactive" runat="server" 
                            AutoPostBack="true" Text="Inactive" GroupName="MedicStatus" 
                            oncheckedchanged="radMedicStatus_Inactive_CheckedChanged"/></td>
                </tr>
                
            </table>
        </td>
    </tr>
    
</table>


</asp:Panel>