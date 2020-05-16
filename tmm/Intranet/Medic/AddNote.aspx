<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNote.aspx.cs" Inherits="TrinityMedicalManagement.AddNote" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="trinity.css" type="text/css" rel="stylesheet" />
    <script language="javascript" type="text/javascript" src="scripts/pageScripts.js" ></script>
    <script language="javascript" type="text/javascript">
    
    function GetRadWindow(){
        var oWindow = null;
        if (window.radWindow)
            oWindow = window.radWindow;
        else if (window.frameElement.radWindow)
            oWindow = window.frameElement.radWindow;
            
        return oWindow;
    }

    function CloseOnReload() {
        GetRadWindow().BrowserWindow.GetRadWindowManager().CloseAll();
    }
        
    function GetLengthAdmin(text){
        var value = text.value;
        var length = value.length;
        var valid = CheckTextBoxMaxLength(text, 500, true);
        document.getElementById('lblAdminCharCount').innerHTML="Message Length: " + length;
        document.getElementById('lblAdminCharCount').style.color = 'Black';
        return valid;
        
    }
            
    function GetLengthPhysician(text){
        var value =  text.value;
        var length = value.length;
        var valid = CheckTextBoxMaxLength(text, 500, true);
        document.getElementById('lblPhysicianCharCount').innerHTML = "Message Length: " + length;
        document.getElementById('lblPhysicianCharCount').style.color = 'Black';
        return valid;
    }
            
    function GetLengthMedic(text){
        var value = text.value;
        var length = value.length;
        var valid = CheckTextBoxMaxLength(text, 500, true);
        document.getElementById('lblMedicCharCount').innerHTML="Message Length: " + length;
        document.getElementById('lblMedicCharCount').style.color = 'Black';
        return valid;
    }

    function GetLengthEdit(text){
        var value = text.value;
        var length = value.length;
        var valid = CheckTextBoxMaxLength(text, 500, true);
        document.getElementById('lblEditCharCount').innerHTML = "Message Length: " + length;
        document.getElementById('lblEditCharCount').style.color = 'Black';
        return valid;
    }

    function OnClientClose() 
    {
        __doPostBack('btnSave', '');
    }

    function SetSaveAttribute(chkNotify) {

        var btnSave = document.getElementById('btnSave');
    
        var oManager = GetRadWindow().GetWindowManager();

        if (btnSave) {
            if (chkNotify.checked == true) {
                btnSave.removeAttribute("onclick");
                btnSave.onclick = function() { oManager.Open('SelectUser.aspx', 'winSelectUsers'); return false; };
            }
            else {
                btnSave.removeAttribute("onclick");
            }
        }
    }

    function SetCheckAttribute(chkPhysician) {
        var chkCustomer = document.getElementById('chkCustomerNotification');

        if (chkPhysician.checked) {
            
            if (chkCustomer != null) {
                chkCustomer.disabled = false;
            }
        } else {

            if (chkCustomer != null) {
                chkCustomer.checked = false;
                chkCustomer.disabled = true;
            }
        }
    }

    function PreviewNote() {
        var oManager = GetRadWindow().GetWindowManager();
        oManager.Open('PreviewNote.aspx', 'previewNote');
    }
    </script>
    <title>Notes</title>
</head>
<body style="background-color:#d0d0d0;" onload="SetSaveAttribute('chkPhysicianEmail');">
    <form id="form1" runat="server">
    <radA:RadAjaxManager ID="ramAddNote" runat="server">
        <AjaxSettings>
            <radA:AjaxSetting AjaxControlID="txtAdminEditNote">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="lblEditCharCount" />
                </UpdatedControls>
            </radA:AjaxSetting>
            <radA:AjaxSetting AjaxControlID="txtMedicNote">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="lblMedicCharCount" />
                </UpdatedControls>
            </radA:AjaxSetting>
            <radA:AjaxSetting AjaxControlID="txtPhysicianNote">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="lblPhysicianCharCount" />
                </UpdatedControls>
            </radA:AjaxSetting>
            <radA:AjaxSetting AjaxControlID="txtAdminNote">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="lblAdminCharCount" />
                </UpdatedControls>
            </radA:AjaxSetting>
        </AjaxSettings>
    </radA:RadAjaxManager>
    <asp:Panel ID="pnlAddNote" runat="server" Visible="false">
        <asp:Panel ID="pnlAddNoteHeader" runat="server" Width="100%">
            <table width="100%">
                <tr>
                    <td>Add New Note</td>
                </tr>
                <tr>
                    <td style="height:20px;"></td>
                </tr>
                <tr>
                    <td><b><asp:Literal ID="litPatientInfo" runat="server"></asp:Literal></b></td>
                </tr>
                <tr>
                    <td style="height:10px;"></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlMedicView" runat="server" Width="100%" Visible="false">
            <table width="100%">
                <tr>
                    <td>Enter Note Below:</td>
                </tr>
                <tr>
                    <td style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4" align="right"><asp:Label ID="lblMedicCharCount" runat="server" Text="Message Length: 0"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <asp:TextBox ID="txtMedicNote" onkeypress="return GetLengthMedic(this);" onkeyup="return GetLengthMedic(this);" onkeydown="return GetLengthMedic(this);" onpaste='return MaxLengthPaste(this);' runat="server" TextMode="multiline" MaxLength="8000" Width="100%" Height="100"></asp:TextBox>
                        </div>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlPhysicianView" runat="server" Width="100%" Visible="false">
            <table width="100%">
                <tr>
                    <td>Enter Note Below:</td>
                </tr>
                <tr>
                    <td style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="5" align="right"><asp:Label ID="lblPhysicianCharCount" runat="server" Text="Message Length: 0"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <div >
                            <asp:TextBox ID="txtPhysicianNote" runat="server" TextMode="multiline" MaxLength="8000" Width="100%" Height="100" onkeyup="return GetLengthPhysician(this);" onkeydown="return GetLengthPhysician(this);" onkeypress="return GetLengthPhysician(this);" onpaste='return MaxLengthPaste(this);' ></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><asp:CheckBox ID="chkPhysicianEmail" runat="server" Text="On Call Note: Send Note via E-mail to On Call Physician(s)" Checked="true"/></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlAdminView" runat="server" Width="100%" Visible="false">
            <table width="100%">
                <tr>
                    <td style="width:20%;"><b>Note Security:</b></td>
                    <td style="width:21%;">
                        <asp:RadioButton ID="rdoAllUsers" runat="server" GroupName="Security"/>
                        &nbsp;<asp:Image ID="imgAllUsers" runat="server" ImageUrl="images/Icon_AllUsers_sm.gif" />
                        &nbsp;<b>All Users</b>
                    </td>
                    <td style="width:36%;">
                        <asp:RadioButton ID="rdoAdminPhysiciansOnly" runat="server" GroupName="Security" Checked="true"/>
                        &nbsp;<asp:Image ID="imgPhysicians" runat="server" ImageUrl="images/Icon_Physicians_sm.gif" />
                        &nbsp;<b>Admin / Physicians Only</b>
                    </td>
                    <td style="width:23%;">
                        <asp:RadioButton ID="rdoAdminOnly" runat="server" GroupName="Security"/>
                        &nbsp;<asp:Image ID="imgAdmin" runat="server" ImageUrl="images/Icon_Admin_sm.gif" />
                        &nbsp;<b>Admin Only</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4">Enter Note Below:</td>
                </tr>
                <tr>
                    <td colspan="4" style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4" align="right"><asp:Label ID="lblAdminCharCount" runat="server" Text="Message Length: 0"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div>
                            <asp:TextBox ID="txtAdminNote" runat="server" onkeyup="return GetLengthAdmin(this);" onkeydown="return GetLengthAdmin(this);" onkeypress="return GetLengthAdmin(this);" onpaste='return MaxLengthPaste(this);' TextMode="multiline" MaxLength="8000" Width="100%" Height="100"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:CheckBox ID="chkAdminEmail" runat="server" onclick="SetCheckAttribute(this);" Text="On Call Note: Send Note via E-mail to On Call Physician(s)" Checked="true"/></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:CheckBox ID="chkCustomerNotification" runat="server" Text="Customer Notification: Send Note via E-mail to Customer" Checked="false" Visible="true" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlButtons" runat="server" Width="100%" Visible="true">
            <table width="100%">
                <tr>
                    <td colspan="3" style="height:20px;"></td>
                </tr>
                <tr align="right">
                    <td style="width:60%"></td>
                    <td><asp:Button ID="btnPreview" runat="server" OnClientClick="PreviewNote();return false;" CssClass="btnSmall" Text="Preview" /> </td>
                    <td><button onclick="javascript:CloseOnReload();" class="btnSmall" style="width:60px;">Cancel</button></td>
                    <td><asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnSmall" Width="60" OnClick="btnSave_Click" /></td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="pnlEditNote" runat="server" Visible="false">
        <asp:Panel ID="pnlEditNoteHeader" runat="server" Width="100%">
            <table width="100%">
                <tr>
                    <td>Edit Note</td>
                </tr>
                <tr>
                    <td style="height:20px;"></td>
                </tr>
                <tr>
                    <td><b><asp:Literal ID="litEditPatientInfo" runat="server"></asp:Literal></b></td>
                </tr>
                <tr>
                    <td style="height:10px;"></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlAdminEditView" runat="server" Width="100%">
            <table width="100%">
                <tr>
                    <td style="width:20%;"><b>Note Security:</b></td>
                    <td style="width:21%;">
                        <asp:RadioButton ID="rdoEditAllUsers" runat="server" GroupName="Security"/>
                        &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="images/Icon_AllUsers_sm.gif" />
                        &nbsp;<b>All Users</b>
                    </td>
                    <td style="width:36%;">
                        <asp:RadioButton ID="rdoEditPhysicians" runat="server" GroupName="Security" />
                        &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="images/Icon_Physicians_sm.gif" />
                        &nbsp;<b>Admin / Physicians Only</b>
                    </td>
                    <td style="width:23%;">
                        <asp:RadioButton ID="rdoEditAdmin" runat="server" GroupName="Security"/>
                        &nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="images/Icon_Admin_sm.gif" />
                        &nbsp;<b>Admin Only</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4">Enter Note Below:</td>
                </tr>
                <tr>
                    <td colspan="4" style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4" align="right"><asp:Label ID="lblEditCharCount" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div>
                            <asp:TextBox ID="txtAdminEditNote" runat="server"  onkeyup="return GetLengthEdit(this);" onkeydown="return GetLengthEdit(this);" onkeypress="return GetLengthEdit(this);" onpaste='return MaxLengthPaste(this);' TextMode="multiline" MaxLength="8000" Width="100%" Height="100"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height:10px;"></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:CheckBox ID="chkAdminEditEmail" runat="server" Text="On Call Note: Send Note via E-mail to On Call Physician(s)" Checked="false"/></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlEditButtons" runat="server" Width="100%">
            <table width="100%">
                <tr>
                    <td colspan="4" style="height:20px;"></td>
                </tr>
                <tr align="right">
                    <td style="width:60%"></td>
                    <td><button onclick="javascript:CloseOnReload();" type="button" class="btnSmall" style="width:60px">Cancel</button></td>
                    <td><asp:Button ID="btnEditPreview" runat="server" OnClientClick="PreviewNote();return false;" CssClass="btnSmall" Text="Preview" Width="60px" /> </td>
                    <td><asp:Button ID="btnSaveEdit" runat="server" CssClass="btnSmall" Text="Save" OnClick="btnSaveEdit_Click" Width="60" /></td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Panel>
    </form>
</body>
</html>
