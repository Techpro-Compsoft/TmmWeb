<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="locationinfo.aspx.vb"
    Inherits="JobSheet.Locationinfo" SmartNavigation="true" ValidateRequest="false" %>

<%@ Register TagPrefix="radCln" Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Job Information Sheet</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="/trinity.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../JavaScript/Utilities.js"></script>

    <script type="text/javascript">
        /****
        CheckForEmptyDate(source, arguments)
        This is the ClientValidationFunction for the date controls.  This function checks for empty dates.
        ****/
        function CheckForEmptyDate(source, arguments) {
            var inputTextbox = GetDatePickerInputTextbox(source.id);

            arguments.IsValid = DateStringIsValidDate(inputTextbox.value);
        }
        function ConfirmCancel() {

            var rigName = document.getElementById("lblProjectName");
            if (rigName != null) {
                rigName = document.getElementById("lblProjectName").innerHTML;
            }
            else {
                rigName = "";
            }

            var mainMsg = "Terminating this worksite's job sheet will mean that a new job sheet will need to be created for this worksite when necessary. Are you sure you want to permanently terminate this job sheet";
            var editMsg = " for " + rigName + " worksite?";
            var result;
            if (rigName == "") {
                result = confirm(mainMsg + "?");
            }
            else {
                result = confirm(mainMsg + editMsg);
            }
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }

        function test() {
            if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
                var isMinutesChecked = document.getElementById("<%=rbMinutes.ClientID %>").checked;
                var isValidLatitude = true;
                var isNumericLat1 = true;
                var isRangeLat1 = true;
                var isNumericLatMin = true;
                var isRangeLatMin = true;
                var isNumericLatSec = true;
                var isRangeLatSec = true;
                var isValidLongitude = true;
                var isNumericLong1 = true;
                var isRangeLong1 = true;
                var isNumericLongMin = true;
                var isRangeLongMin = true;
                var isNumericLongSec = true;
                var isRangeLongSec = true;
                var isNumericLong2 = true;
                var isRangeLong2 = true;
                var isValidLonDecimal = true;
                var isValidLatDecimal = true;
                var isNumericLat2 = true;
                var isRangeLat2 = true;
                var isValidDates = true;
                if (isMinutesChecked) {
                    var txtLat1 = document.getElementById("txtLat1");
                    var txtLatMinutes = document.getElementById("txtLatMinutes");
                    var txtLatSeconds = document.getElementById("txtLatSeconds");
                    var ddlNSMinutes = document.getElementById("ddlNSMinutes");

                    if (txtLat1.value == "") {
                        isValidLatitude = false;
                    }
                    if (txtLatMinutes.value == "") {
                        isValidLatitude = false;
                    }
                    if (txtLatSeconds.value == "") {
                        isValidLatitude = false;
                    }
                    if (ddlNSMinutes.value == "") {
                        isValidLatitude = false;
                    }

                    var tmp = 0;
                    tmp = parseInt(txtLat1.value);

                    if (txtLat1.value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLat1 = false;
                            isRangeLat1 = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 90) {
                                isRangeLat1 = false;
                            }
                        }
                    }

                    if (txtLatMinutes.value != "") {
                        tmp = parseInt(txtLatMinutes.value);
                        if (tmp.toString() == "NaN") {
                            isNumericLatMin = false;
                            isRangeLatMin = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 60) {
                                isRangeLatMin = false;
                            }
                        }
                    }

                    tmp = parseInt(txtLatSeconds.value);
                    if (txtLatSeconds.value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLatSec = false;
                            isRangeLatSec = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 60) {
                                isRangeLatSec = false;
                            }
                        }
                    }
                    //////
                    var txtLong1 = document.getElementById("txtLong1");
                    var txtLongMinutes = document.getElementById("txtLongMinutes");
                    var txtLongSeconds = document.getElementById("txtLongSeconds");
                    var ddlEWMinutes = document.getElementById("ddlEWMinutes");

                    if (txtLong1.value == "") {
                        isValidLongitude = false;
                    }
                    if (txtLongMinutes.value == "") {
                        isValidLongitude = false;
                    }
                    if (txtLongSeconds.value == "") {
                        isValidLongitude = false;
                    }
                    if (ddlEWMinutes.value == "") {
                        isValidLongitude = false;
                    }

                    tmp = parseInt(txtLong1.value);
                    if (txtLong1.value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLong1 = false;
                            isRangeLong1 = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 90) {
                                isRangeLong1 = false;
                            }
                        }
                    }
                    tmp = parseInt(txtLongMinutes.value);
                    if (txtLongMinutes.value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLongMin = false;
                            isRangeLongMin = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 60) {
                                isRangeLongMin = false;
                            }
                        }
                    }
                    tmp = parseInt(txtLongSeconds.value);
                    if (txtLongSeconds.value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLongSec = false;
                            isRangeLongSec = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 60) {
                                isRangeLongSec = false;
                            }
                        }
                    }
                }
                ///////////
                else {
                    if (document.getElementById("<%=txtLat2.ClientID %>").value == "") {
                        isValidLatDecimal = false;
                    }
                    if (document.getElementById("<%=ddlNSDecimal.ClientID %>").value == "") {
                        isValidLatDecimal = false;
                    }
                    tmp = parseInt(document.getElementById("<%=txtLat2.ClientID %>").value);
                    if (document.getElementById("<%=txtLat2.ClientID %>").value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLat2 = false;
                            isRangeLat2 = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 90) {
                                isRangeLat2 = false;
                            }
                        }
                    }
                    /////////////
                    var txtLongg2 = document.getElementById("<%=txtLong2.ClientID %>");
                    var dddlESDecimals = document.getElementById("<%=ddlEWDecimals.ClientID %>");

                    if (txtLongg2.value == "") {
                        isValidLonDecimal = false;
                    }
                    if (dddlESDecimals.value == "") {
                        isValidLonDecimal = false;
                    }
                    tmp = parseInt(txtLongg2.value);
                    if (txtLongg2.value != "") {
                        if (tmp.toString() == "NaN") {
                            isNumericLong2 = false;
                            isRangeLong2 = false;
                        }
                        else {
                            if (tmp < 0 || tmp > 180) {
                                isRangeLong2 = false;
                            }
                        }
                    }
                }
                var sd = new Date(document.getElementById("<%=calStartDate.ClientID %>").value.replace(/-/g, "/"));
                var ed = new Date(document.getElementById("<%=calEndDate.ClientID %>").value.replace(/-/g, "/"));
                            
                
                ////////
                var txt = "";
                if (sd > ed) {
                    txt += "- The Start Date must be before the End Date.\n";
                }
                if(!isNumericLat1){
                    txt += "- Latitude degrees must be numeric.\n";
                }
                if (!isRangeLat1) {
                    txt += "- Latitude degrees must be between 0 an 90.\n";
                }
                if(!isNumericLatMin){
                    txt += "- Latitude minutes must be numeric.\n";
                }
                if(!isRangeLatMin){
                    txt += "- Latitude minutes must be between 0 an 60.\n";
                }
                if(!isNumericLatSec){
                    txt += "- Latitude seconds must be numeric.\n";
                }
                if(!isRangeLatSec){
                    txt += "- Latitude seconds must be between 0 an 60.\n";
                }                
                if(!isNumericLong1){
                    txt += "- Longitude degrees must be numeric.\n";
                }
                if(!isRangeLong1){
                    txt += "- Longitude degrees must be between 0 and 180.\n";
                }
                if(!isNumericLongMin){
                    txt += "- Longitude minutes must be numeric.\n";
                }
                if(!isRangeLongMin){
                    txt += "- Longitude minutes must be between 0 and 60.\n";
                }
                if(!isNumericLongSec){
                    txt += "- Longitude seconds must be numeric.\n";
                }
                if(!isRangeLongSec){
                    txt += "- Longitude seconds must be between 0 and 60.\n";
                } 
               
                if(!isNumericLat2){
                    txt += "- Latitude degrees must be numeric.\n";
                }
                if (!isRangeLat2) {
                    txt += "- Latitude must be between 0 and 90 degrees.\n";
                } 
                if(!isNumericLong2){
                    txt += "- Longitude degrees must be numeric.\n";
                }
                if(!isRangeLong2){
                    txt += "- Longitude must be between 0 and 180 degrees.\n";
                }
                if (!isValidLatitude || !isValidLatDecimal) {
                    txt += "- Latitude measurements are required. Please try again.\n";
                }
                if (!isValidLongitude || !isValidLonDecimal) {
                    txt += "- Longitude measurements are required. Please try again.\n";
                }
                if (txt.length > 0) {
                    alert(txt);
                }
                
            } 
        }
        function ValidateLatitude(source, args) {
            var txtLat1 = document.getElementById("txtLat1");
            var txtLatMinutes = document.getElementById("txtLatMinutes");
            var txtLatSeconds = document.getElementById("txtLatSeconds");
            var ddlNSMinutes = document.getElementById("ddlNSMinutes");
            args.IsValid = true;
            if (txtLat1.value == "") {
                args.IsValid = false;
            }
            if (txtLatMinutes.value == "") {
                args.IsValid = false;
            }
            if (txtLatSeconds.value == "") {
                args.IsValid = false;
            }
            if (ddlNSMinutes.value == "") {
                args.IsValid = false;
            }
        }
        function ValidateLongitude(source, args) {
            var txtLong1 = document.getElementById("txtLong1");
            var txtLongMinutes = document.getElementById("txtLongMinutes");
            var txtLongSeconds = document.getElementById("txtLongSeconds");
            var ddlEWMinutes = document.getElementById("ddlEWMinutes");
            args.IsValid = true;
            if (txtLong1.value == "") {
                args.IsValid = false;
            }
            if (txtLongMinutes.value == "") {
                args.IsValid = false;
            }
            if (txtLongSeconds.value == "") {
                args.IsValid = false;
            }
            if (ddlEWMinutes.value == "") {
                args.IsValid = false;
            }

        }
        function ValidateLatDecimal(source, args) {
     
            args.IsValid = true;
            if (document.getElementById("<%=txtLat2.ClientID %>").value == "") {
                args.IsValid = false;
            }
            if (document.getElementById("<%=ddlNSDecimal.ClientID %>").value == "") {
                args.IsValid = false;
            }
        }
        function ValidateLonDecimal(source, args) {
            var txtLongg2 = document.getElementById("<%=txtLong2.ClientID %>");
            var dddlESDecimals = document.getElementById("<%=ddlEWDecimals.ClientID %>");
            args.IsValid = true;
            if (txtLongg2.value == "") {
                args.IsValid = false;
            }
            if (dddlESDecimals.value == "") {
                args.IsValid = false;
            }
        }
    </script>

    <script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>

</head>
<body bgcolor="#000000" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <table height="100%" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="top">
            <td align="center" width="100%">
                <table style="border-right: #307fa3 1px solid; border-top: #307fa3 1px solid; border-left: #307fa3 1px solid;
                    border-bottom: #307fa3 1px solid" height="560" width="758">
                    <tr valign="top" height="100">
                        <td>
                            <img src="images/img_JobInfoSheet.jpg" /><br>
                            <uc1:NavigationMenu ID="NavigationMenu1" runat="server"></uc1:NavigationMenu>
                        </td>
                    </tr>
                    <tr height="20">
                        <td style="height: 21px" align="center">
                            <cc1:ProgressIndicator ID="ucProgress" BoookEndGraphics="True" BoookEndStartActive="images/img_Start_o.gif"
                                BoookEndFinishActive="images/img_End_o.gif" BoookEndStart="images/img_Start.gif"
                                BoookEndFinish="images/img_End.gif" LastAvailableStep="1" CurrentStep="1" Height="48px"
                                LinkURLs="locationinfo.aspx,contractingcompany.aspx,SelectService.aspx,edit-complete.aspx"
                                UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif"
                                SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif"
                                StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif"
                                runat="server"></cc1:ProgressIndicator>
                        </td>
                    </tr>
                    <tr valign="top" height="429">
                        <td valign="top" align="center">
                            <table class="smallBorder" id="Table1" cellspacing="1" cellpadding="1" width="98%"
                                align="center" border="0">
                                <tr class="DataGridHdr">
                                    <td class="SecHdr">
                                        &nbsp;Location Information
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table id="Table2" cellspacing="1" cellpadding="1" width="95%" border="0">
                                            <tr class="stdFont">
                                                <td style="width: 130px; height: 17px; vertical-align: middle" align="right">
                                                    Project Name:
                                                </td>
                                                <td style="width: 155px; height: 17px">
                                                    <asp:Label ID="lblProjectName" runat="server" />
                                                    <asp:DropDownList ID="ddlProjects" runat="server" DataTextField="rigName" DataValueField="rigID"
                                                        AutoPostBack="true" CausesValidation="false" />
                                                    <asp:CompareValidator ID="cvProjects" runat="server" ControlToValidate="ddlProjects"
                                                        ValueToCompare="-1" Operator="NotEqual" ErrorMessage="You must select a Project Name in order to continue the job sheet. Please try again."
                                                        Display="Dynamic">*</asp:CompareValidator>
                                                </td>
                                                <td style="width: 175px; height: 17px" align="right">
                                                    Project Number:
                                                </td>
                                                <td style="height: 17px">
                                                    <asp:TextBox ID="txtProjectNum" runat="server" MaxLength="50" TabIndex="1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 130px" align="right">
                                                    Block:
                                                </td>
                                                <td style="width: 150px">
                                                    <asp:TextBox ID="txtBlock" runat="server" MaxLength="50" TabIndex="2"></asp:TextBox>
                                                </td>
                                                <td style="width: 175px" align="right">
                                                    Facility Type:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFacilityType" runat="server" MaxLength="50" TabIndex="3"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 130px" align="right">
                                                    Start Date:
                                                </td>
                                                <td style="width: 160px">
                                                    <radCln:RadDatePicker ID="calStartDate" runat="server" SkinID="Trinity">
                                                        <DatePopupButton CssClass="RadDatePickerButton" />
                                                        <DateInput MaxLength="10">
                                                        </DateInput>
                                                        <Calendar Skin="Trinity">
                                                        </Calendar>
                                                    </radCln:RadDatePicker>
                                                </td>
                                                <td style="width: 175px" align="right">
                                                    Approximate End Date:
                                                </td>
                                                <td>
                                                    <radCln:RadDatePicker ID="calEndDate" runat="server" SkinID="Trinity">
                                                        <DatePopupButton CssClass="RadDatePickerButton" />
                                                        <DateInput MaxLength="10">
                                                        </DateInput>
                                                        <Calendar Skin="Trinity">
                                                        </Calendar>
                                                    </radCln:RadDatePicker>
                                                    <asp:CompareValidator ID="cmpDates" runat="server" Display="Dynamic" ErrorMessage="The Start Date must be before the End Date"
                                                        ControlToValidate="calStartDate" ControlToCompare="calEndDate" Operator="LessThan"
                                                        Type="Date">*</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="4">
                                                    <p class="stdFont">
                                                        <br>
                                                        <table id="Table5" cellspacing="1" cellpadding="1" width="100%" border="0">
                                                            <tr class="stdFont" align="center">
                                                                <td style="width: 334px" align="right">
                                                                    &nbsp;Choose style of Longitude/Latitude entry:&nbsp;
                                                                </td>
                                                                <td align="left">
                                                                    <asp:RadioButton ID="rbMinutes" runat="server" AutoPostBack="True" GroupName="Group1"
                                                                        Text="Minutes and Seconds" Checked="True" TabIndex="6"></asp:RadioButton><asp:RadioButton
                                                                            ID="rbDecimal" runat="server" AutoPostBack="True" GroupName="Group1" Text="Decimals"
                                                                            TabIndex="7"></asp:RadioButton>
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td class="stdFont" colspan="2" style="width: 650px">
                                                                    <p class="stdFont">
                                                                        <asp:Panel ID="pnlMinutes" Height="48px" runat="server">
                                                                            <table id="Table3" cellspacing="1" cellpadding="5" width="680" border="0">
                                                                                <tr class="stdFont">
                                                                                    <td style="height: 22px;" align="right">
                                                                                        Latitude:
                                                                                    </td>
                                                                                    <td style="height: 22px;">
                                                                                        Degrees
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLat1" TabIndex="8" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLat1" runat="server" ControlToValidate="txtLat1"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic"
                                                                                            Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude degrees must be numeric">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic"
                                                                                            Type="Double" ErrorMessage="Latitude degrees must be between 0 an 90." MaximumValue="90"
                                                                                            MinimumValue="0">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        Minutes
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLatMinutes" TabIndex="9" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLatMinutes" runat="server" ControlToValidate="txtLatMinutes"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLatMinutes" runat="server" ControlToValidate="txtLatMinutes"
                                                                                            Display="Dynamic" Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude minutes must be numeric"
                                                                                            DESIGNTIMEDRAGDROP="5457">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLatMinutes" runat="server" ControlToValidate="txtLatMinutes"
                                                                                            Display="Dynamic" Type="Double" ErrorMessage="Latitude minutes must be between 0 and 60"
                                                                                            MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        Seconds
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLatSeconds" TabIndex="10" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLatSeconds" runat="server" ControlToValidate="txtLatSeconds"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLatSeconds" runat="server" ControlToValidate="txtLatSeconds"
                                                                                            Display="Dynamic" Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude seconds must be numeric">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLatSeconds" runat="server" ControlToValidate="txtLatSeconds"
                                                                                            Display="Dynamic" Type="Double" ErrorMessage="Latitude seconds must be between 0 and 60"
                                                                                            MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        N/S
                                                                                    </td>
                                                                                    <td align="left">
                                                                                        <asp:DropDownList ID="ddlNSMinutes" TabIndex="11" runat="server" Width="50px">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvNSMinutes" runat="server" ControlToValidate="ddlNSMinutes"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr class="stdFont">
                                                                                    <td align="right">
                                                                                        Longitude:
                                                                                    </td>
                                                                                    <td>
                                                                                        Degrees
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLong1" TabIndex="12" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLong1" runat="server" ControlToValidate="txtLong1"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic"
                                                                                            Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude degrees must be numeric"
                                                                                            DESIGNTIMEDRAGDROP="5459">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic"
                                                                                            Type="Double" ErrorMessage="Longitude degrees must be between 0 and 180" MaximumValue="180"
                                                                                            MinimumValue="0">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        Minutes
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLongMinutes" TabIndex="13" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLongMinutes" runat="server" ControlToValidate="txtLongMinutes"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLongMinutes" runat="server" ControlToValidate="txtLongMinutes"
                                                                                            Display="Dynamic" Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude minutes must be numberic">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLongMinutes" runat="server" ControlToValidate="txtLongMinutes"
                                                                                            Display="Dynamic" Type="Double" ErrorMessage="Longitude minutes must be between 0 and 60"
                                                                                            MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        Seconds
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLongSeconds" TabIndex="14" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLongSeconds" runat="server" ControlToValidate="txtLongSeconds"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLongSeconds" runat="server" ControlToValidate="txtLatSeconds"
                                                                                            Display="Dynamic" Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude seconds must be numeric">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLongSeconds" runat="server" ControlToValidate="txtLongSeconds"
                                                                                            Display="Dynamic" Type="Double" ErrorMessage="Longitude seconds must be between 0 and 60"
                                                                                            MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        E/W
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlEWMinutes" TabIndex="15" runat="server" Width="50px">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvEWMinutes" runat="server" ControlToValidate="ddlEWMinutes"
                                                                                            Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </p>
                                                                    <p class="stdFont">
                                                                        <asp:Panel ID="pnlDecimal" Height="32px" runat="server">
                                                                            <table id="Table4" cellspacing="1" cellpadding="1" width="650" border="0">
                                                                                <tr class="stdFont" style="vertical-align: middle;">
                                                                                    <td style="width: 160px">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td style="height: 16px; vertical-align: middle;" align="right">
                                                                                        Latitude:
                                                                                    </td>
                                                                                    <td style="height: 16px; vertical-align: middle;">
                                                                                        Degrees&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLat2" TabIndex="16" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLat2" runat="server" ControlToValidate="txtLat2"
                                                                                            Display="Dynamic" Enabled="False">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic"
                                                                                            Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude degrees must be numeric"
                                                                                            Enabled="False">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic"
                                                                                            Type="Double" ErrorMessage="Latitude must be between 0 and 90 degrees" MaximumValue="90"
                                                                                            MinimumValue="0" Enabled="False">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td style="vertical-align: middle;">
                                                                                        N/S&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlNSDecimal" TabIndex="17" runat="server" Width="50px">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvNSDecimal" runat="server" ControlToValidate="ddlNSDecimal"
                                                                                            Display="Dynamic" Enabled="False">*</asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                    <td style="width: 160px">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr class="stdFont">
                                                                                    <td style="width: 160px">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td style="vertical-align: middle;" align="right">
                                                                                        Longitude:
                                                                                    </td>
                                                                                    <td style="vertical-align: middle;">
                                                                                        Degrees&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtLong2" TabIndex="18" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rfvLong2" runat="server" ControlToValidate="txtLong2"
                                                                                            Display="Dynamic" Enabled="False">*</asp:RequiredFieldValidator>
                                                                                        <asp:CompareValidator ID="cvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic"
                                                                                            Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude degrees must be numeric"
                                                                                            Enabled="False">*</asp:CompareValidator>
                                                                                        <asp:RangeValidator ID="rvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic"
                                                                                            Type="Double" ErrorMessage="Longitude must be between 0 and 180 degrees" MaximumValue="180"
                                                                                            MinimumValue="0" Enabled="False">*</asp:RangeValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        E/W&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlEWDecimals" TabIndex="19" runat="server" Width="50px">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvEWDecimal" runat="server" ControlToValidate="ddlEWDecimals"
                                                                                            Display="Dynamic" Enabled="False">*</asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                    <td style="width: 160px">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </p>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 130px" align="right">
                                                    Phone Number:
                                                </td>
                                                <td style="width: 160px"><%--
                                                    <asp:Label ID="lblRigPhone" runat="server"></asp:Label>--%>
                                                    <asp:TextBox ID="txtRigPhone" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="width: 190px" align="right">
                                                    Alternative Phone Number:
                                                </td>
                                                <td>
                                                    <%--<asp:Label ID="lblAltRigPhone" runat="server"></asp:Label>--%>
                                                    <asp:TextBox runat="server" ID="txtAltRigPhone"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 130px; height: 31px" align="right">
                                                    Fax Number:
                                                </td>
                                                <td style="width: 160px; height: 31px">
                                                    <%--<asp:Label ID="lblRigFax" runat="server"></asp:Label>--%>
                                                    <asp:TextBox ID="txtRigFax" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="width: 190px; height: 31px" align="right">
                                                    Work Schedule:
                                                </td>
                                                <td style="height: 31px">
                                                    <asp:TextBox ID="txtWorkSchedule" runat="server" MaxLength="50" TabIndex="20"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 130px" align="right">
                                                    Trinity Personnel (#1):
                                                </td>
                                                <td style="width: 160px">
                                                    <asp:Label ID="lblPersonnel1" runat="server"></asp:Label><asp:DropDownList ID="cboPersonnel1"
                                                        runat="server" Width="152px" TabIndex="21">
                                                    </asp:DropDownList>                                                    
                                                </td>
                                                <td style="width: 190px" align="right">
                                                    Trinity Personnel (#2):
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cboPersonnel2" runat="server" Width="136px" TabIndex="23">
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="cvPersonnel" runat="server" ControlToValidate="cboPersonnel2"
                                                        Operator="NotEqual" ErrorMessage="Trinity Personnel (#1) cannot be the same as Trinity Personnel (#2)"
                                                        ControlToCompare="cboPersonnel1">*</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td align="right">
                                                    Shift End Date:
                                                </td>
                                                <td>
                                                    <%--<asp:TextBox id="txtShiftEndDate1" runat="server" Width="75px" tabIndex="22"></asp:TextBox>
															<obout:Calendar id="calShiftEndDate1" runat="server" TextArrowRight=" " TextArrowLeft=" " StyleFolder="\calendar\styles\trinity"
																TextBoxId="txtShiftEndDate1" DatePickerMode="True"></obout:Calendar>
															<asp:CompareValidator id="cvShiftEndDate1" runat="server" ControlToValidate="txtShiftEndDate1" Type="Date"
																Operator="DataTypeCheck" ErrorMessage="You must enter a date for the shift end date of personnel #1.">*</asp:CompareValidator>
															<asp:RequiredFieldValidator id="rfvShiftEndDate1" runat="server" ControlToValidate="txtShiftEndDate1" ErrorMessage="Enter a shift end date for Trinity personnel #1.">*</asp:RequiredFieldValidator></td>--%>
                                                    <radCln:RadDatePicker ID="calShiftEndDate1" runat="server" SkinID="Trinity">
                                                        <DatePopupButton CssClass="RadDatePickerButton" />
                                                        <DateInput MaxLength="10">
                                                        </DateInput>
                                                        <Calendar Skin="Trinity">
                                                        </Calendar>
                                                    </radCln:RadDatePicker>
                                                    <asp:CustomValidator ID="cvShiftEndDate1_Required" runat="server" CssClass="ErrorColor"
                                                        EnableClientScript="true" Display="dynamic" SetFocusOnError="true" ErrorMessage="You must enter a date for the shift end date of personnel #1."
                                                        Text="*" />
                                                </td>
                                                <td align="right">
                                                    Shift End Date:
                                                </td>
                                                <td>
                                                    <%--<asp:TextBox id="txtShiftEndDate2" runat="server" Width="75px" tabIndex="24"></asp:TextBox>
															<obout:Calendar id="calShiftEndDate2" runat="server" TextArrowRight=" " TextArrowLeft=" " StyleFolder="\calendar\styles\trinity"
																TextBoxId="txtShiftEndDate2" DatePickerMode="True"></obout:Calendar>
															<asp:CompareValidator id="cvShiftEndDate2" runat="server" ControlToValidate="txtShiftEndDate2" Type="Date"
																Operator="DataTypeCheck" ErrorMessage="You must enter a date for the shift end date of personnel #2.">*</asp:CompareValidator>
															<asp:RequiredFieldValidator id="rfvShiftEndDate2" runat="server"  ControlToValidate="txtShiftEndDate2" ErrorMessage="Enter a shift end date for Trinity personnel #2.">*</asp:RequiredFieldValidator></td>--%>
                                                    <radCln:RadDatePicker ID="calShiftEndDate2" runat="server" SkinID="Trinity">
                                                        <DatePopupButton CssClass="RadDatePickerButton" />
                                                        <DateInput MaxLength="10">
                                                        </DateInput>
                                                        <Calendar Skin="Trinity">
                                                        </Calendar>
                                                    </radCln:RadDatePicker>
                                                    <asp:CustomValidator ID="cvShiftEndDate2_Required" runat="server" CssClass="ErrorColor"
                                                        EnableClientScript="true" Display="dynamic" SetFocusOnError="true" ErrorMessage="You must enter a date for the shift end date of personnel #2."
                                                        Text="*" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table class="smallBorder" id="Table10" style="height: 134px" cellspacing="1" cellpadding="1"
                                width="98%" border="0">
                                <tr class="DataGridHdr">
                                    <td class="SecHdr" style="height: 19px">
                                        &nbsp;Location&nbsp;Manager
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table id="Table11" cellspacing="1" cellpadding="1" width="80%" border="0">
                                            <tr class="stdFont">
                                                <td style="width: 125px" align="right">
                                                    First Name:
                                                </td>
                                                <td style="width: 205px">
                                                    <asp:TextBox ID="txtMgrFName" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="width: 67px" align="right">
                                                    Last Name:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMgrLName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 125px; height: 17px" align="right">
                                                    Phone Number:
                                                </td>
                                                <td style="width: 205px; height: 17px">
                                                    <asp:TextBox ID="txtMgrPhone" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="width: 67px; height: 17px">
                                                </td>
                                                <td style="height: 17px">
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 125px" align="right">
                                                    Address:
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtMgrAddr" runat="server" Width="425px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="stdFont">
                                                <td style="width: 125px" align="right">
                                                    City / State / Zip Code:
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtCity" runat="server" Width="213px"></asp:TextBox>&nbsp;
                                                    <asp:TextBox ID="txtState" runat="server" Width="125px" MaxLength="15"></asp:TextBox>&nbsp;
                                                    <asp:TextBox ID="txtZip" runat="server" Width="75px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table id="Table12" cellspacing="1" cellpadding="1" width="98%" border="0">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall" OnClientClick="return ConfirmCancel();" />
                                        &nbsp;<asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btnSmall" OnClientClick="test();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr valign="top" height="31">
                        <td align="center">
                            <img src="/images/Grphc_BotBar.jpg" alt="" />
                        </td>
                    </tr>
                </table>
                <asp:CustomValidator ID="cvLat" runat="server" ErrorMessage="Latitude measurements are required. Please try again."
                    ClientValidationFunction="ValidateLatitude" EnableClientScript="true">&nbsp;</asp:CustomValidator>
                <asp:CustomValidator ID="cvLon" runat="server" ErrorMessage="Longitude measurements are required. Please try again."
                    ClientValidationFunction="ValidateLongitude" EnableClientScript="true">&nbsp;</asp:CustomValidator>
                <asp:CustomValidator ID="cvLatD" runat="server" ErrorMessage="Latitude measurements are required. Please try again."
                    Enabled="false" ClientValidationFunction="ValidateLatDecimal" EnableClientScript="true">&nbsp;</asp:CustomValidator>
                <asp:CustomValidator ID="cvLonD" runat="server" ErrorMessage="Longitude measurements are required. Please try again."
                    Enabled="false" ClientValidationFunction="ValidateLonDecimal" EnableClientScript="true">&nbsp;</asp:CustomValidator>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False"></asp:ValidationSummary>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
