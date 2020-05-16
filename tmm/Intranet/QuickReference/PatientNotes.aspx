<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PatientNotes.aspx.vb" Inherits="ServiceLocator.PatientNotes" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Patient Notes</title>
    <link rel="stylesheet" href="style/Objects.css" type="text/css" />
    <link rel="stylesheet" href="style/Elements.css" type="text/css" />
    <link rel="stylesheet" href="/trinity.css" type="text/css" />
    <script language="javascript" type="text/javascript">
    function GetRadWindow()
    {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow;
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
    }
    function CloseOnReload()
    {
        GetRadWindow().Close();
    }
    
    function SelectMeOnly(objRadioButton, grdName)
    {
      var i, obj, pageElements;
      
      if(navigator.userAgent.indexOf("MSIE")!= -1)
      {
        //IE
        pageElements = document.all;
      }
      else if(navigator.userAgent.indexOf("Mozilla") != -1)
      {
        //FireFox
        pageElements = document.documentElement.getElementsByTagName("input");
      }
      for (i=0; i < pageElements.length; i++)
      {
        obj = pageElements[i];
    
        if (obj.type == "radio")
        {
         if (objRadioButton.id.substr(0, grdName.length) == grdName)
         {
           if (objRadioButton.id == obj.id)
           {
             obj.checked = true;
           }
           else
           {
             obj.checked = false;
           }
         }
        } 
      }    
    }
    function validate()
    {
        var fName = document.getElementById("txtFirstName");
        var note = document.getElementById("txtNotes");
        var errMsg = "\n";
        if(fName!=null)
        {
            with(fName)
            {
                if(value==null||value=="")
                {
                    errMsg = "You must enter a First Name.\n";
                }
            }
        }
        
        with(note)
        {
            var text = value;
            if(value==null||value=="")
            {
                errMsg += "You must enter a Note.";
            }
            if(text.length>500)
            {
                errMsg += "Your note needs to be less than 500 characters.";
            }
        }

        with(errMsg)
        {
            if(errMsg.length==1)
            {
                return true;
            }
            else
            {
                alert(errMsg);
                return false;
            }
        }
    }
    
    function validateStepOne(){
        var fName = document.getElementById("txtFName");
        var lName = document.getElementById("txtLName");
        var rig = document.getElementById("cboRig");
        var errCount = 0;
        if(fName!=null){
            with(fName){
                if(value==null||value==""){errCount++;}}}
        if(lName!=null){
            with(lName){
                if(value==null||value==""){errCount++;}}}
        if(rig!=null){
            with(rig){
                if(value==null||value=="UNKNOWN"){errCount++;}}}
        if (errCount < 3){return true;}
        else{alert("You must enter a FirstName, LastName, OR choose a Rig.");return false;}}
    
    function GetLength(text){
        var value = text.value;
        var length = value.length;
        if(length<=500){
            document.getElementById('lblCharCount').innerHTML="Message Length: " + length;
            document.getElementById('lblCharCount').style.color = 'Black';}
        else{
            document.getElementById('lblCharCount').innerHTML="Message Length: " + length;
            document.getElementById('lblCharCount').style.color = 'Red';}}
    </script>
</head>
<body style="background-color:#d0d0d0; color:Black;">
    <form id="form1" runat="server">
    <radA:RadAjaxManager ID="ramPatientNotes" runat="server" EnableOutsideScripts="true">
        <AjaxSettings>
            <radA:AjaxSetting AjaxControlID="grdPatients">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="grdPatients" />
                    <radA:AjaxUpdatedControl ControlID="pnlStepTwo" />
                </UpdatedControls>
            </radA:AjaxSetting>
            <radA:AjaxSetting AjaxControlID="rdoNo">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="grdPatients" />
                    <radA:AjaxUpdatedControl ControlID="pnlStepTwo" />
                </UpdatedControls>
            </radA:AjaxSetting>
            <radA:AjaxSetting AjaxControlID="txtNotes">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="lblCharCount" />
                </UpdatedControls>
            </radA:AjaxSetting>
        </AjaxSettings>
    </radA:RadAjaxManager>
    <asp:Panel ID="pnlStepOne" runat="server" Width="100%">
        <table width="100%" style="text-align:justify;" cellpadding="5" cellspacing="5">
            <tr>
                <td><b>Add Patient Note: Step 1 of 2: Identify Patient / Verify Identity</b></td>
            </tr>
            <tr style="height:10px;">
                <td></td>
            </tr>
            <tr>
                <td>Please enter any and all information known about this patient before entering your note:</td>
            </tr>
            <tr style="height:20px;">
                <td></td>
            </tr>
        </table>
        <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
                <td>First Name:</td>
                <td><asp:TextBox ID="txtFName" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><asp:TextBox ID="txtLName" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Rig:</td>
                <td>
                    <asp:DropDownList ID="cboRig" runat="server" Width="205px" DataTextField="Name"
                        DataValueField="rigId" AutoPostBack="false"></asp:DropDownList>
                </td>
            </tr>
        </table>
        <br /><br />
        <table width="100%" cellpadding="5" cellspacing="5">
            <tr align="right">
                <td>
                    <button onclick="javascript:CloseOnReload();" class="btnSmall" style="width:60px">Cancel</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnContinue" runat="server" Text="Continue" Width="60" OnClientClick="javascript:return validateStepOne();" CssClass="btnSmall"/>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlStepTwo" runat="server" Visible="false" Width="100%">
        <table style="width:100%;" cellpadding="5" cellspacing="5">
            <tr>
                <td><b>Add Patient Note: Step 1 of 2: Identify Patient / Verify Identity</b></td>
            </tr>
            <tr>
                <td>A Medic on this Rig has entered a Patient Encounter in the last two weeks that matches the Patient Information you entered.  If any one of the Patient Encounters listed below
                reference the patient you wish to associate a note with, please select the record to the right of the Patient Information and click Continue.  If you wish to view their information
                first, please click on their Patient ID to view the patient encounter.</td>
            </tr>
            <tr style="height:10px;">
                <td></td>
            </tr>
            <tr>
                <td>
                    <radG:RadGrid ID="grdPatients" runat="server" AutoGenerateColumns="False" EnableAJAX="false" Width="100%" CellPadding="3" AllowMultiRowEdit="false" AllowMultiRowSelection="false" EnableOutsideScripts="true"
                        GridLines="Horizontal" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" AllowPaging="True" OnNeedDataSource="grdPatients_NeedDataSource" ForeColor="Black" Skin="none" OnItemCommand="grdPatients_ItemCommand">
                        <MasterTableView GridLines="Horizontal" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" BackColor="White" ForeColor="Black">
                        <HeaderStyle HorizontalAlign="Center" BackColor="White" ForeColor="Black" />
                        <ItemStyle HorizontalAlign="Center" BackColor="White" ForeColor="Black"/>
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <SortExpressions>
                            <radG:GridSortExpression FieldName="EncounterDate" SortOrder="Descending" />
                        </SortExpressions>
                            <Columns>
                                <radG:GridBoundColumn DataField="EncounterDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Encounter Date" UniqueName="EncounterDate">
                                    <HeaderStyle Width="15%" />
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="PatientID" Visible="False" UniqueName="PatientID"></radG:GridBoundColumn>
                                <radG:GridButtonColumn HeaderText="Patient ID" CommandName="Select" DataTextField="PatientID">
                                    <HeaderStyle Width="10%" HorizontalAlign="center" />
                                </radG:GridButtonColumn>
                                <radG:GridTemplateColumn HeaderText="Patient Name" EditFormColumnIndex="3" UniqueName="PatientName">
                                    <HeaderStyle HorizontalAlign="Left" Width="20%"/>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        <%#Eval("LastName")%>, <%#Eval("FirstName")%>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridBoundColumn DataField="ChiefComplaint" HeaderText="Chief Complaint" UniqueName="ChiefComplaint">
                                    <HeaderStyle HorizontalAlign="Left" Width="29%"/>
                                    <ItemStyle HorizontalAlign="Left" />
                                </radG:GridBoundColumn>
                                <radG:GridTemplateColumn HeaderText="Rig" UniqueName="RigName">
                                    <HeaderStyle HorizontalAlign="Left" Width="20%"/>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                       <%#GetRigName(Convert.ToInt32(Eval("RigID"))).ToString()%>
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                                <radG:GridTemplateColumn UniqueName="SelectColumn" HeaderText="Select">
                                    <HeaderStyle Width="6%" />
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rdoSelect" runat="server" AutoPostBack="true" OnCheckedChanged="ToggleRowSelection" />
                                    </ItemTemplate>
                                </radG:GridTemplateColumn>
                            </Columns>
                            <ExpandCollapseColumn Resizable="False" Visible="False">
                                <HeaderStyle Width="20px" />
                            </ExpandCollapseColumn>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                        </MasterTableView>
                        <PagerStyle Mode="NumericPages" HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <SelectedItemStyle BackColor="#F7F7F7" ForeColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"/>
                        <HeaderStyle BackColor="White" ForeColor="Black" />
                        <ItemStyle BackColor="White" ForeColor="Black" />
                    </radG:RadGrid>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:RadioButton ID="rdoNo" runat="server" AutoPostBack="true" Text="No, I Do Not See My Patient Listed" Checked="true" Enabled="true" OnCheckedChanged="ResetRadios"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="right">
                                <button onclick="javascript:CloseOnReload();" class="btnSmall" style="width:60px">Cancel</button>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnContinue2" runat="server" Text="Continue" CssClass="btnSmall" Width="60"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlStepThree" runat="server" Visible="false" Width="100%">
    <table width="100%">
        <tr>
            <td>
                <table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                        <td><b>Add Patient Note: Step 2 of 2: Add Text</b></td>
                    </tr>
                </table>
                <asp:Panel ID="pnlPatient" runat="server" Width="100%" Visible="false">
                    <table cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="right"><b>Patient Last Name:</b></td>
                            <td><asp:Label ID="lblPatientLName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right"><b>Patient First Name:</b></td>
                            <td><asp:Label ID="lblPatientFName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right"><b>Rig:</b></td>
                            <td><asp:label ID="lblRig" runat="server"></asp:label></td>
                        </tr>
                        <tr>
                            <td align="right"><b>Encounter Date & Patient ID:</b></td>
                            <td><asp:Label ID="lblDateAndPatientID" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right"><b>Chief Complaint:</b></td>
                            <td><asp:Label ID="lblChiefComplaint" runat="server"></asp:Label></td>
                        </tr>
                        <tr style="height:10px;">
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlNewPatient" runat="server" Visible="false" Width="100%">
                    <table cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="right"><b>Patient First Name:</b></td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><b>Patient Last Name:</b></td>
                            <td><asp:TextBox ID="txtLastName" runat="server" Width="300px"></asp:TextBox></td>
                        </tr>
                        <tr style="height:10px;">
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
                <table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                        <td>Enter Note Below:</td>
                        <td align="right"><asp:Label ID="lblCharCount" runat="server" Text="Message Length: 0"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div onkeypress="javascript:return GetLength(txtNotes);" onkeyup="javascript:return GetLength(txtNotes);" onkeydown="javascript:return GetLength(txtNotes);">
                                <asp:TextBox ID="txtNotes" runat="server" Height="90" Width="100%" MaxLength="500" TextMode="multiline"></asp:TextBox>
                            </div>
                            <asp:CustomValidator ID="cvNotes" runat="server" OnServerValidate="TextValidate" ControlToValidate="txtNotes" ErrorMessage="Your note must be 500 characters or less."></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:CheckBox ID="chkSendEmail" runat="server" Text="On Call Note:  Send Note via E-Mail to Trinity Main Office" Checked="true" /></td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <button onclick="javascript:CloseOnReload();" class="btnSmall">Cancel</button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClientClick="javascript:return validate();" CssClass="btnSmall"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </asp:Panel>
    </form>
</body>
</html>
