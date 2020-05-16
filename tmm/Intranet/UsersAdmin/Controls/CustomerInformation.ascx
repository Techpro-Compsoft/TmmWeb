<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerInformation.ascx.cs" Inherits="UsersAdmin.Controls.CustomerInformation" %>
<asp:Panel ID="pnlGenInfo" runat="server" GroupingText="General Information"  ForeColor="White" Font-Names="Arial" Font-Size="12px">
<asp:HiddenField ID="hidUserID" runat="server" Value="0" />
<table style="color:White; width:100%; text-align:left; border:0px;" cellpadding="0">
    <tr>
        <td>
            <table cellpadding="8" style="vertical-align:top;">
                <tr id="trCompanyName" runat="server">
                    <td style="font-weight:bold;"><span id="spnRFV10" runat="server">* </span>Company Name:</td>
                    <td><asp:Literal ID="litCompanyName" runat="server"></asp:Literal><asp:TextBox ID="txtCompanyName" runat="server" Width="300px" MaxLength="75"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valCompanyName" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="font-weight:bold; padding-right:0px;"><span id="spnRFV3" runat="server">* </span>Street Address:</td>
                    <td><asp:Literal ID="litAddress1" runat="server"></asp:Literal><asp:TextBox ID="txtAddress1" runat="server" Width="300px" MaxLength="100"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valAddress1" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator></td>
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
                    <td><asp:Literal ID="litCountry" runat="server"></asp:Literal><asp:TextBox ID="txtCountry" runat="server" Width="300" MaxLength="50"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valCountry" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtCountry"></asp:RequiredFieldValidator></td>
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
                <tr id="trMainPhone" runat="server">
                    <td style="font-weight:bold; width:20%;">Main Phone:</td>
                    <td style="width:15%;"><asp:Literal ID="litMainPhone" runat="server"></asp:Literal><asp:TextBox ID="txtMainPhone" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr id="trMainFax" runat="server">
                    <td style="font-weight:bold;">Main Fax:</td>
                    <td><asp:Literal ID="litMainFax" runat="server"></asp:Literal><asp:TextBox ID="txtMainFax" runat="server" MaxLength="15" Width="100"></asp:TextBox></td>
                </tr>
                <tr id="trMedicStatus" runat="server">
                    <td style="font-weight:bold;">Company Status:</td>
                    <td><asp:Literal ID="litMedicStatus" runat="server"></asp:Literal><asp:RadioButton ID="radMedicStatus_Active" AutoPostBack="true" runat="server" oncheckedchanged="radMedicStatus_Active_CheckedChanged" Text="Active" GroupName="MedicStatus" /><asp:RadioButton ID="radMedicStatus_Inactive" AutoPostBack="true" runat="server" Text="Inactive" GroupName="MedicStatus" oncheckedchanged="radMedicStatus_Inactive_CheckedChanged" /></td>
                </tr>
                
            </table>
        </td>
    </tr>
    
</table>


</asp:Panel>