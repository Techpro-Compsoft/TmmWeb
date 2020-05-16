<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="User_GeneralInformation.ascx.cs" Inherits="UsersAdmin.Controls.User_GeneralInformation" %>
<asp:Panel ID="pnlGenInfo" runat="server" GroupingText="General Information"  ForeColor="White" Font-Names="Arial" Font-Size="12px">
<asp:HiddenField ID="hidUserID" runat="server" Value="0" />
<script language="javascript" type="text/javascript">
    function ToggleValidators(IsEnabled) {
        alert("The validators will be " + IsEnabled);
        Page_ValidationActive = IsEnabled;
    }
</script>
<table style="color:White; width:100%; text-align:left; border:0px;" cellpadding="0">
    <tr>
        <td>
            <table cellpadding="8" style="vertical-align:top;">
                <tr>
                    <td style="font-weight:bold; width:18%;"><span id="spnRFV1" runat="server">* </span>First Name:</td>
                    <td style="width:47%;"><asp:Literal ID="litFName" runat="server"></asp:Literal><asp:TextBox ID="txtFName" runat="server" Width="300px" MaxLength="25"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valFirstName" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtFName"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;"><span id="spnRFV2" runat="server">* </span>Last Name:</td>
                    <td><asp:Literal ID="litLName" runat="server"></asp:Literal><asp:TextBox ID="txtLName" runat="server" Width="300px" MaxLength="25"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valLastName" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtLName"></asp:RequiredFieldValidator></td>
                </tr>
                <tr id="trCurrentWorksite" runat="server">
                    <td style="font-weight:bold;">Current Worksite:</td>
                    <td><asp:Literal ID="litCurrentWorksite" runat="server"></asp:Literal><asp:DropDownList ID="ddlCurrentWorksite" runat="server" Width="280px"></asp:DropDownList>&nbsp;&nbsp;<img id="imgInfo" runat="server" src="../images/Icon_Info.png" style="height:20px;" alt="If you do not see a particular worksite, it is because it has not been added to the list yet. Please add the worksite to the customer's worklist and try again." /></td>
                </tr>
                <tr>
                    <td style="font-weight:bold; padding-right:0px;"><span id="spnRFV3" runat="server">* </span>Street Address:</td>
                    <td><asp:Literal ID="litAddress1" runat="server"></asp:Literal><asp:TextBox ID="txtAddress1" runat="server" Width="300px" MaxLength="80"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valAddress1" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold; padding-right:0px;"><span id="spnRFV5" runat="server">* </span>City:</td>
                    <td><asp:Literal ID="litCity" runat="server"></asp:Literal><asp:TextBox ID="txtCity" runat="server" MaxLength="30" Width="300"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valCity" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtCity"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold; padding-right:0px;"><span id="spnRFV6" runat="server">* </span>State:</td>
                    <td>
                        <table cellspacing="0" style="width:305px; padding:0px;">
                            <tr>
                                
                                <td><asp:Literal ID="litState" runat="server"></asp:Literal><asp:TextBox ID="txtState" runat="server" Width="150" MaxLength="30"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valState" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtState"></asp:RequiredFieldValidator></td>
                                <td style="font-weight:bold; text-align:right; width:75px;"><span id="spnRFV7" runat="server">* </span>Zip: </td>
                                <td><asp:Literal ID="litZip" runat="server"></asp:Literal><asp:TextBox ID="txtZip" runat="server" MaxLength="15" Width="78"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valZip" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtZip"></asp:RequiredFieldValidator></td>
                            </tr>
                        </table>
                    </td> 
                </tr>
                <tr>
                    <td style="font-weight:bold;"><span id="spnRFV8" runat="server">* </span>Country:</td>
                    <td><asp:Literal ID="litCountry" runat="server"></asp:Literal><asp:TextBox ID="txtCountry" runat="server" Width="300" MaxLength="30"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valCountry" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtCountry"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;"><span id="spnRFV9" runat="server">* </span>E-Mail Address:</td>
                    <td><asp:Literal ID="litEmail" runat="server"></asp:Literal><asp:TextBox ID="txtEmail" runat="server" Width="300"  MaxLength="50"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="valEmail" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valEmailReg" runat="server" ValidationExpression="^[A-Za-z0-9_\+-]+(\.[A-Za-z0-9_\+-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.([A-Za-z]{2,4})$" ErrorMessage="* Invalid Email Address" ControlToValidate="txtEmail" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="valEmailExists" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-Mail Address is already associated with an existing user account." Display="Dynamic" OnServerValidate="ValidateNotEmailExists"></asp:CustomValidator> </td>
                </tr>
            </table>
        </td>
        <td style="vertical-align:top;">
            <table cellpadding="8" style="vertical-align:top;">
                <tr>
                    <td style="font-weight:bold; width:15%;">Home Phone:</td>
                    <td style="width:20%;"><asp:Literal ID="litHomePhone" runat="server"></asp:Literal><asp:TextBox ID="txtHomePhone" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;">Cell Phone:</td>
                    <td><asp:Literal ID="litCellPhone" runat="server"></asp:Literal><asp:TextBox ID="txtCellPhone" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;">Other Phone:</td>
                    <td><asp:Literal ID="litOtherPhone" runat="server"></asp:Literal><asp:TextBox ID="txtOtherPhone" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr id="trMedicStatus" runat="server">
                    <td style="font-weight:bold;">Status:</td>
                    <td><asp:Literal ID="litMedicStatus" runat="server"></asp:Literal>
                        <asp:RadioButton ID="radMedicStatus_Active" runat="server" Text="Active" 
                            AutoPostBack="true" GroupName="MedicStatus" 
                            oncheckedchanged="radMedicStatus_Active_CheckedChanged" />
                        <asp:RadioButton ID="radMedicStatus_Inactive" AutoPostBack="true" 
                            runat="server" Text="Inactive" GroupName="MedicStatus" 
                            oncheckedchanged="radMedicStatus_Inactive_CheckedChanged"/></td>
                </tr>
                
            </table>
        </td>
    </tr>
    
</table>


</asp:Panel>
