<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="User_SecurityInformation.ascx.cs" Inherits="UsersAdmin.Controls.User_SecurityInformation" %>
<asp:Panel ID="pnlSecInfo" runat="server" GroupingText="Security Information"  ForeColor="White" Font-Names="Arial" Font-Size="12px">
<asp:HiddenField ID="hidUserID" runat="server" Value="0" />
<asp:HiddenField ID="hidUserIsOfficeUser" runat="server" Value="false" />
<script type="text/javascript">
    function CheckPassword(arg)
    {
        //Count number of different types of characters used
        var diffTypeCnt = 0;
        var hasSpace = false;
        var strength = "NotAvail";
        try
        {
            
            //setup regex objects
            var rexUpper = new RegExp("[A-Z]", "g");
            var rexLower = new RegExp("[a-z]", "g");
            var rexNumber = new RegExp("[0-9]", "g");
            var rexSymbol = new RegExp("[`~!@\#$%^&*()_={}|\\:\";‘<>?,\.\+\-/]", "g");
            var rexSpace = new RegExp(" ", "g");
            //check matches
            if (arg.match(rexUpper))
                diffTypeCnt++;
            if (arg.match(rexLower))
                diffTypeCnt++;
            if (arg.match(rexNumber))
                diffTypeCnt++;
            if (arg.match(rexSymbol))
                diffTypeCnt++;
            //check diff count
            switch (diffTypeCnt)
            {
                case 1:
                    strength = "Weak";
                    break;
                case 2:
                    strength = "Medium";
                    break;
                case 3:
                case 4:
                    strength = "Strong";
                    break;
                default:
                    strength = "NotAvail";
            }  
            //Check length number
            switch (arg.length)
            {
                case 1:
                case 2:
                case 3:
                case 4:
                    strength = "Weak";
                    break;
                case 5:
                case 6:
                    if (strength != "Weak")
                        strength = "Medium";
                    break;
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                case 13:
                case 14:
                case 15:
                case 16:
                case 17:
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                    if (strength != "Weak" && strength != "Medium")
                        strength = "Strong";
                    break;
                default:
                    strength = "NotAvail";
            }
            if (arg.match(rexSpace))
                strength = "Weak";
            //get reg to image
            var StrengthImg = document.getElementById('<%=imgPasswordStrength.ClientID %>');
            if (StrengthImg)
                StrengthImg.src = "/images/img_Strength_" + strength + ".gif";
        }
        catch (err) { }
        document.getElementById('<%= hidPWStrength.ClientID%>').value = strength;
    }

    function valPWStrength(sender, args) 
    {
        args.IsValid = document.getElementById('<%= hidPWStrength.ClientID%>').value == "Strong";
    }


    // returns the ClientID of radPatientEncounterNotification_Yes
    function GetPatientEncounterNotification_Yes() 
    {
        return '<%= radPatientEncounterNotification_Yes.ClientID %>';
    }

    // returns the ClientID of radReceiveNewNoteNotification_Yes
    function GetReceiveNewNoteNotification_Yes() 
    { 
        return '<%= radReceiveNewNoteNotification_Yes.ClientID %>';
    }
</script>
<input type="hidden" id="hidPWStrength" runat="server" />
<asp:HiddenField ID="hidPassword" runat="server" />
<table style="width:100%;">
    <tr>
        <td style="width:100%; vertical-align:top;">
            <table style="color:White; width:100%; text-align:left; border:0px;" cellpadding="8">
                <tr>
                    <td style="width:15%; font-weight:bold;"><span id="spnRFV1" runat="server">* </span>Username:</td>
                    <td style="width:25%;"><asp:TextBox ID="txtUsername" runat="server" MaxLength="50"></asp:TextBox><asp:Literal ID="litUsername" runat="server"></asp:Literal><br /><asp:RequiredFieldValidator ID="valUsername" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtUsername"></asp:RequiredFieldValidator><asp:CustomValidator ID="valUsernameExists" runat="server" ControlToValidate="txtUsername" ErrorMessage="* Username is already associated with an existing user account." Display="Dynamic" OnServerValidate="ValidateNotUsernameExists"></asp:CustomValidator> </td>
                
                    <td style="width:15%; font-weight:bold;"><span id="spnRFV2" runat="server">* </span>Password:</td>
                    <td style="width:25%;"><asp:TextBox ID="txtPassword" runat="server" MaxLength="20"></asp:TextBox><asp:Literal ID="litPassword" runat="server"></asp:Literal><br /><asp:RequiredFieldValidator ID="valPassword" runat="server" Display="Dynamic" ErrorMessage="* Required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></td>

                    <td style="width:20%;"><asp:Image ID="imgPasswordStrength" runat="server" ImageUrl="/images/img_Strength_NotAvail.gif" ToolTip="Password Strength" /><br /><asp:CustomValidator ID="valPasswordStrength" runat="server" ClientValidationFunction="valPWStrength" OnServerValidate="ValidateStrongPassword" Display="Dynamic" ErrorMessage='* Your password must be "Strong" in order to continue. Please try again.'></asp:CustomValidator></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width:10%; vertical-align:top; text-align:left;">
            <table style="color:White; text-align:left; border:0px;" cellpadding="8">
                <tr>
                    <td colspan="3" style="font-weight:bold;">Patient Encounter:</td>
                </tr>
                <tr>
                    <td style="width:40px;">&nbsp;</td>
                    <td style="font-weight:bold; ">Patient Encounter Access</td>
                    <td><asp:Literal ID="litPatientEncounterAccess" runat="server"></asp:Literal><asp:RadioButton ID="radPatientEncounterAccess_Yes" runat="server" Text="Yes" GroupName="radPatientEncounterAccess_Yes" />&nbsp; <asp:RadioButton ID="radPatientEncounterAccess_No" runat="server" Text="No" GroupName="radPatientEncounterAccess_Yes" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Patient Encounter Document Notification</td>
                    <td><asp:Literal ID="litPatientEncounterNotification" runat="server"></asp:Literal><asp:RadioButton ID="radPatientEncounterNotification_Yes" runat="server" Text="Yes" GroupName="grpJobSheet" />&nbsp; <asp:RadioButton ID="radPatientEncounterNotification_No" runat="server" Text="No" GroupName="grpJobSheet" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Receive New Note Notification</td>
                    <td><asp:Literal ID="litReceiveNewNoteNotification" runat="server"></asp:Literal><asp:RadioButton ID="radReceiveNewNoteNotification_Yes" runat="server" Text="Yes" GroupName="grpNewNote" />&nbsp; <asp:RadioButton ID="radReceiveNewNoteNotification_No" runat="server" Text="No" GroupName="grpNewNote" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Patient Encounter Admin</td>
                    <td><asp:Literal ID="litPatientEncounterAdmin" runat="server"></asp:Literal><asp:RadioButton ID="radPatientEncounterAdmin_Yes" runat="server" Text="Yes" GroupName="grpPatientEncounterAdmin" />&nbsp; <asp:RadioButton ID="radPatientEncounterAdmin_No" runat="server" Text="No" GroupName="grpPatientEncounterAdmin" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-weight:bold;">Job Sheet:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Job Sheet User</td>
                    <td><asp:Label ID="litJobSheetUser" runat="server"></asp:Label><asp:RadioButton ID="radJobSheetUser_Yes" runat="server" Text="Yes" GroupName="JobSheetUser" />&nbsp; <asp:RadioButton ID="radJobSheetUser_No" runat="server" Text="No" GroupName="JobSheetUser" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Job Sheet Admin</td>
                    <td><asp:Literal ID="litJobSheetAdmin" runat="server"></asp:Literal><asp:RadioButton ID="radJobSheetAdmin_Yes" runat="server" Text="Yes" GroupName="JobSheetAdmin" />&nbsp; <asp:RadioButton ID="radJobSheetAdmin_No" runat="server" Text="No" GroupName="JobSheetAdmin" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-weight:bold;">Services Viewer:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Services Viewer</td>
                    <td><asp:Literal ID="litServicesViewer" runat="server"></asp:Literal><asp:RadioButton ID="radServicesViewer_Yes" runat="server" Text="Yes" GroupName="ServicesViewer" />&nbsp; <asp:RadioButton ID="radServicesViewer_No" runat="server" Text="No" GroupName="ServicesViewer" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Services Administrator</td>
                    <td><asp:Literal ID="litServicesAdmin" runat="server"></asp:Literal><asp:RadioButton ID="radServicesAdmin_Yes" runat="server" Text="Yes" GroupName="ServicesAdmin" />&nbsp; <asp:RadioButton ID="radServicesAdmin_No" runat="server" Text="No" GroupName="ServicesAdmin" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-weight:bold;">Quick Reference / Testing:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Quick Reference User</td>
                    <td><asp:Label ID="litQuickReferenceUser" runat="server"></asp:Label><asp:RadioButton ID="radQuickReferenceUser_Yes" runat="server" Text="Yes" GroupName="QuickReferenceUser" />&nbsp; <asp:RadioButton ID="radQuickReferenceUser_No" runat="server" Text="No" GroupName="QuickReferenceUser" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Quick Reference Admin</td>
                    <td><asp:Literal ID="litQuickReferenceAdmin" runat="server"></asp:Literal><asp:RadioButton ID="radQuickReferenceAdmin_Yes" runat="server" Text="Yes" GroupName="tQuickReferenceAdmin" />&nbsp; <asp:RadioButton ID="radQuickReferenceAdmin_No" runat="server" Text="No" GroupName="tQuickReferenceAdmin" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Generate Test User</td>
                    <td><asp:Literal ID="litGenerateTestUser" runat="server"></asp:Literal><asp:RadioButton ID="radGenerateTestUser_Yes" runat="server" Text="Yes" GroupName="litGenerateTestUser" />&nbsp; <asp:RadioButton ID="radGenerateTestUser_No" runat="server" Text="No" GroupName="litGenerateTestUser" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-weight:bold;">Video Library:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Video Library Admin</td>
                    <td><asp:Literal ID="litVideoAdmin" runat="server"></asp:Literal><asp:RadioButton ID="radVideoAdmin_Yes" runat="server" Text="Yes" GroupName="litVideoAdmin" />&nbsp; <asp:RadioButton ID="radVideoAdmin_No" runat="server" Text="No" GroupName="litVideoAdmin" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-weight:bold;">Other / Internal:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Overtime Report Access</td>
                    <td><asp:Literal ID="litOvertime" runat="server"></asp:Literal><asp:RadioButton ID="radOvertime_Yes" runat="server" Text="Yes" GroupName="litOvertime" />&nbsp; <asp:RadioButton ID="radOvertime_No" runat="server" Text="No" GroupName="litOvertime" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight:bold;">Allow User Setup</td>
                    <td><asp:Literal ID="litUserSetup" runat="server"></asp:Literal><asp:RadioButton ID="radUserSetup_Yes" runat="server" Text="Yes" GroupName="litUserSetup" />&nbsp; <asp:RadioButton ID="radUserSetup_no" runat="server" Text="No" GroupName="litUserSetup" /></td>
                </tr>
                
                
                
                
            </table>
                
        </td>
        
    </tr>
</table>
<script type="text/javascript">

   function OfficeUsersSpecialChanges() 
   {
       var jsUser = document.getElementById('<%= litJobSheetUser.ClientID %>');
       //Set values for Office Users values.

       switch (document.getElementById('<%= hidUserIsOfficeUser.ClientID %>').value) {
           case "Office":
               if (jsUser != null) {
                   if (document.getElementById('<%= radJobSheetAdmin_Yes.ClientID %>').checked) {
                       jsUser.innerHTML = "No";
                   }
                   else {
                       jsUser.innerHTML = "Yes";
                   }
               }
               var qrUser = document.getElementById('<%= litQuickReferenceUser.ClientID %>');
               if (qrUser != null) {
                   if (document.getElementById('<%= radQuickReferenceAdmin_Yes.ClientID %>').checked) {
                       qrUser.innerHTML = "No";
                   }
                   else {
                       qrUser.innerHTML = "Yes";
                   }
               }
               break;
           case "Medic":
               if (jsUser != null) {
                   if (document.getElementById('<%= radJobSheetAdmin_Yes.ClientID %>').checked) {
                       jsUser.innerHTML = "No";
                   }
                   else {
                       jsUser.innerHTML = "Yes";
                   }
               }
               break;
       }       
       CheckPassword(document.getElementById('<%= txtPassword.ClientID %>').value);    
    }
</script>
</asp:Panel>