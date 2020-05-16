<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ServiceInfo.aspx.vb" Inherits="TMMInternet.ServiceInfo" %>

<%@ Register Assembly="RadUpload.Net2" Namespace="Telerik.WebControls" TagPrefix="radU" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="AddService.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #divChkList {
            float: left;
            width: 250px;
            overflow-y: auto;
            height: 268px;
        }

    </style>

    <script type="text/javascript">

        window.onload = scroll();

        // Gets the ClientID of trAddImage
        function GetAddImageRowClientID() {
            return '<%= trAddImage.ClientID %>';
        }

        // Gets the ClientID of trUpload
        function GetUploadRowClientID() {
            return '<%= trUpload.ClientID %>';
        }

        // returns the ClientID of the upload control
        function GetUploadClientID() {
            return '<%= uplImage.ClientID %>';
        }

        // returns the ClientID of txtImageName
        function GetImageNameTextboxClientID() {
            return '<%= txtImageName.ClientID %>';
        }

        // returns the ClientID of txtImageDescription
        function GetImageDescriptionTextboxClientID() {
            return '<%= txtImageDescription.ClientID %>';
        }

        function scroll() {

            if (document.getElementById('<%= hdnScrollPosition.ClientID%>') != null) {
                document.getElementById('divChkList').scrollTop = document.getElementById('<%= hdnScrollPosition.ClientID%>').value;
            }
        }
    </script>

    <input type="hidden" id="hdnScrollPosition" runat="server" />

    <h3>
        <asp:Label ID="lblError" runat="server" Font-Bold="False" Font-Size="Medium"
            ForeColor="Red"></asp:Label>
        <asp:Literal ID="litPageHeader" runat="server" />
    </h3>

    <div id="buttonDiv">
        <asp:Panel ID="pnlAddEditButtons" runat="server">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CssClass="btnSmall" />
            &nbsp;
                            <asp:Button ID="btnSaveService" runat="server" Text="Save Changes" ToolTip="Save Changes" CssClass="btnSmall" OnClientClick="return btnSaveService_ClientClick(this, event);" />
        </asp:Panel>

        <asp:Button ID="btnEditService" runat="server" Text="Edit" ToolTip="Edit" CssClass="btnSmall" CausesValidation="false" />
        <asp:Button ID="btnDeleteService" runat="server" Text="Delete" ToolTip="Delete" CssClass="btnSmall" CausesValidation="false" OnClientClick="return confirm('Are you sure you wish to permanently delete this service?');" />
    </div>
    <fieldset>

        <legend style="color: #ffffff;">Service Information</legend>

        <table id="tblServiceInfo" cellpadding="0" cellspacing="0" class="stdFont_Bold ServiceInfoTable">
            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td class="tblServiceInfo_Column_0">Service Name</td>
                <td class="tblServiceInfo_Column_1" style="font-weight: normal;">
                    <asp:TextBox ID="txtServiceName" runat="server" CssClass="TextBoxLarge" MaxLength="75" />
                    <asp:Literal ID="litServiceName" runat="server" />
                </td>
                <td class="tblServiceInfo_Column_2">
                    <span class="ErrorColor">*</span>&nbsp;&nbsp;Service Phone
                </td>
                <td class="tblServiceInfo_Column_3" style="font-weight: normal;">
                    <asp:TextBox ID="txtServicePhone" runat="server" CssClass="TextBoxMedium" MaxLength="25" />
                    <asp:Literal ID="litServicePhone" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvServiceName" runat="server" CssClass="ErrorColor" ControlToValidate="txtServiceName"
                        Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvServicePhone" runat="server" CssClass="ErrorColor" ControlToValidate="txtServicePhone"
                        Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
            </tr>

            <tr>
                <td style="width: 5px;"></td>
                <td>
                    <radA:RadAjaxManager ID="radMGR" runat="server">
                        <ajaxsettings>
                            <radA:AjaxSetting AjaxControlID="ddlEmployers">
                                <UpdatedControls>
                                    <radA:AjaxUpdatedControl ControlID="txtEmployerPhone" />
                                </UpdatedControls>
                            </radA:AjaxSetting>
                        </ajaxsettings>
                    </radA:RadAjaxManager>
                    Employer Name
                </td>
                <td class="tblServiceInfo_Column_1" style="font-weight: normal;">
                    <asp:DropDownList ID="ddlEmployers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployers_SelectedIndexChanged" CssClass="DropDownListLarge" AppendDataBoundItems="true">
                        <asp:ListItem Text="Not Applicable" Value="-1" />
                    </asp:DropDownList>
                    <asp:Literal ID="litEmployerName" runat="server" />
                </td>
                <td class="tblServiceInfo_Column_2">Employer Phone</td>
                <td class="tblServiceInfo_Column_3" style="font-weight: normal;">
                    <asp:TextBox ID="txtEmployerPhone" runat="server" CssClass="TextBoxMedium" MaxLength="25" />
                    <asp:Literal ID="litEmployerPhone" runat="server" />&nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td>Service Type</td>
                <td style="font-weight: normal;">
                    <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="DropDownListLarge" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Service" Value="-1" />
                    </asp:DropDownList>
                    <asp:Literal ID="litServiceType" runat="server" />
                </td>
                <td>
                    <span class="ErrorColor">*</span>&nbsp;&nbsp;Trinity's Tier
                </td>
                <td style="font-weight: normal;">
                    <asp:DropDownList ID="ddlTier" runat="server" CssClass="DropDownListMedium" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Tier" Value="-1" />
                    </asp:DropDownList>
                    <asp:Literal ID="litTier" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvServiceType" runat="server" CssClass="ErrorColor" ControlToValidate="ddlServiceType"
                        Display="Dynamic" ErrorMessage="* Please select a service type." InitialValue="-1" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvTier" runat="server" CssClass="ErrorColor" ControlToValidate="ddlTier"
                        Display="Dynamic" ErrorMessage="* Please select a tier." InitialValue="-1" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
            </tr>

            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td>Category</td>
                <td style="font-weight: normal;">
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="DropDownListLarge" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Category" Value="-1" />
                    </asp:DropDownList>
                    <asp:Literal ID="litCategory" runat="server" />
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;Service Status</td>
                <td style="font-weight: normal;">
                    <asp:RadioButtonList ID="rdoServiceStatus" runat="server" Width="100%" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Text="Active" Value="Active" />
                        <asp:ListItem Selected="False" Text="Inactive" Value="Inactive" />
                    </asp:RadioButtonList>
                    <asp:Literal ID="litServiceStatus" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" CssClass="ErrorColor" ControlToValidate="ddlCategory"
                        Display="Dynamic" ErrorMessage="* Please select a category." InitialValue="-1" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
                <td></td>
                <td class="ErrorCell"></td>
            </tr>

            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td>Address</td>
                <td style="font-weight: normal;">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="TextBoxLarge" MaxLength="50" />
                    <asp:Literal ID="litAddress" runat="server" />
                </td>
                <td></td>
                <td style="font-weight: normal;"></td>
            </tr>
            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" CssClass="ErrorColor" ControlToValidate="txtAddress"
                        Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
                <td></td>
                <td class="ErrorCell"></td>
            </tr>

            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td>City/State</td>
                <td style="font-weight: normal;">
                    <asp:DropDownList ID="ddlCityState" runat="server" CssClass="DropDownListLarge" AutoPostBack="True" OnSelectedIndexChanged="ddlCityState_OnSelectedIndexChanged">
                        <asp:ListItem Text="Select City/State" Value="-1" />
                    </asp:DropDownList>
                    <asp:Literal runat="server" ID="litCityState"></asp:Literal>
                </td>
                <td></td>
                <td style="font-weight: normal;"></td>
            </tr>

            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvCityState" runat="server" CssClass="ErrorColor" ControlToValidate="ddlCityState"
                        Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" InitialValue="-1" ValidationGroup="ServiceInfo" />
                </td>
                <td></td>
                <td class="ErrorCell"></td>
            </tr>

            <tr runat="server" id="additionalCityState">
                <td style="width: 5px;"><span class="ErrorColor"></span></td>
                <td>Additional<br />
                    City/State</td>
                <td style="font-weight: normal;">
                    <div id="divChkList" onscroll="javascript:document.getElementById('<%= hdnScrollPosition.ClientID%>').value = this.scrollTop;">
                        <asp:CheckBoxList ID="chkCityState" runat="server" OnSelectedIndexChanged="chkCityState_OnSelectedIndexChanged" AutoPostBack="True"></asp:CheckBoxList>
                    </div>
                    <asp:Literal runat="server" ID="litAdditionalCityState"></asp:Literal>
                </td>
                <td>Selected<br />
                    City/State
                </td>
                <td style="font-weight: normal;">
                    <asp:ListBox runat="server" ID="lstCityStateSelected" Width="201px" Height="268px"/>
                </td>
            </tr>

            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell"></td>
                <td></td>
                <td class="ErrorCell"></td>
            </tr>

            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td>Zip Code</td>
                <td style="font-weight: normal;">
                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBoxSmall" MaxLength="12" />
                    <asp:Literal ID="litZipCode" runat="server" />
                </td>
                <td></td>
                <td style="font-weight: normal;"></td>
            </tr>
            <tr>
                <td style="width: 5px;"></td>
                <td></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" CssClass="ErrorColor" ControlToValidate="txtZipCode"
                        Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
                <td></td>
                <td class="ErrorCell"></td>
            </tr>

            <tr>
                <td style="width: 5px;"><span class="ErrorColor">*</span></td>
                <td>Country</td>
                <td style="font-weight: normal;">
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="TextBoxLarge" MaxLength="50" Text="United States" />
                    <asp:Literal ID="litCountry" runat="server" />
                </td>
                <td colspan="2" style="padding-bottom: 0px;"></td>
            </tr>
            <tr>
                <td style="width: 5px;"></td>
                <td style="padding-bottom: 5px;" class="ErrorCell"></td>
                <td class="ErrorCell">
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" CssClass="ErrorColor" ControlToValidate="txtCountry"
                        Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" ValidationGroup="ServiceInfo" />
                </td>
                <td style="padding-top: 0px;"></td>
            </tr>

            <tr>
                <td colspan="5" style="padding-left: 0px;">
                    <table id="Table5" cellspacing="1" cellpadding="1" width="100%" border="0">
                        <tr id="trLatLongInstructions" runat="server" class="stdFont" align="center">
                            <td colspan="2" style="text-align: left; padding-left: 4px;">
                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                    <tr>
                                        <td style="text-align: left; width: 250px;">Choose style of Longitude/Latitude entry:
                                        </td>
                                        <td style="text-align: left; font-weight: normal;">
                                            <asp:RadioButton ID="rdoMinutes" runat="server" AutoPostBack="True" GroupName="Group1" Text="Minutes and Seconds"
                                                Checked="True" />&nbsp;&nbsp;<asp:RadioButton ID="rdoDecimal" runat="server" AutoPostBack="True" GroupName="Group1" Text="Decimals" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr align="center">
                            <td class="stdFont" colspan="2">
                                <asp:Panel ID="pnlMinutes" runat="server">
                                    <table id="Table3" cellspacing="1" cellpadding="1" border="0" style="width: 100%;">
                                        <tr class="stdFont">
                                            <td style="height: 16px; text-align: left; width: 86px; padding-left: 2px;">
                                                <span class="ErrorColor">*</span>&nbsp;&nbsp;&nbsp;&nbsp;Latitude:
                                            </td>
                                            <td style="height: 17px; font-weight: normal;">
                                                <asp:TextBox ID="txtLat1" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;" />
                                                <asp:Literal ID="litLat1" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLat1" runat="server" ControlToValidate="txtLat1" ValidationGroup="LatitudeLongitude"
                                                    Display="Dynamic" ErrorMessage="Please enter Latitude degrees">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic"
                                                    Type="Double" Operator="DataTypeCheck" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Latitude degrees must be numeric">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLat1" runat="server" ControlToValidate="txtLat1" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" ErrorMessage="Latitude degrees must be between 0 an 90."
                                                    MaximumValue="90" MinimumValue="0">*</asp:RangeValidator>
                                                degrees
                                            </td>
                                            <td style="font-weight: normal;">
                                                <asp:TextBox ID="txtLatMinutes" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;" />
                                                <asp:Literal ID="litLatMinutes" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLatMinutes" runat="server" ControlToValidate="txtLatMinutes" ValidationGroup="LatitudeLongitude"
                                                    Display="Dynamic" ErrorMessage="Please enter Latitude minutes">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLatMinutes" runat="server" ControlToValidate="txtLatMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude minutes must be numeric" DESIGNTIMEDRAGDROP="5457">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLatMinutes" runat="server" ControlToValidate="txtLatMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" ErrorMessage="Latitude minutes must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                minutes
                                            </td>
                                            <td style="font-weight: normal;">
                                                <asp:TextBox ID="txtLatSeconds" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;"></asp:TextBox>
                                                <asp:Literal ID="litLatSeconds" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLatSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please enter Latitude seconds">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLatSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" Operator="DataTypeCheck" ErrorMessage="Latitude seconds must be numeric">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLatSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" ErrorMessage="Latitude seconds must be between 0 and 60" MaximumValue="60" MinimumValue="0">**</asp:RangeValidator>
                                                seconds
                                            </td>
                                            <td style="text-align: right; padding-right: 4px; font-weight: normal;">
                                                <asp:DropDownList ID="ddlNSMinutes" runat="server" Width="40px" Style="background-color: #FFFFFF;">
                                                    <asp:ListItem Text="" Value="" />
                                                    <asp:ListItem Text="N" Value="N" />
                                                    <asp:ListItem Text="S" Value="S" />
                                                </asp:DropDownList>
                                                <asp:Literal ID="litNSMinutes" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvNSMinutes" runat="server" ControlToValidate="ddlNSMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator>
                                                <asp:Literal ID="litNS" runat="server" Text="N/S"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr class="stdFont">
                                            <td style="height: 16px; padding-top: 5px; text-align: left; padding-left: 2px;">
                                                <span class="ErrorColor">*</span>&nbsp;&nbsp;&nbsp;&nbsp;Longitude:
                                            </td>
                                            <td style="padding-top: 5px; font-weight: normal;">
                                                <asp:TextBox ID="txtLong1" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;"></asp:TextBox>
                                                <asp:Literal ID="litLong1" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic"
                                                    ValidationGroup="LatitudeLongitude" ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic" Type="Double" ValidationGroup="LatitudeLongitude"
                                                    Operator="DataTypeCheck" ErrorMessage="Longitude degrees must be numeric" DESIGNTIMEDRAGDROP="5459">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLong1" runat="server" ControlToValidate="txtLong1" Display="Dynamic" Type="Double" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Longitude degrees must be between 0 and 180" MaximumValue="180" MinimumValue="0">*</asp:RangeValidator>
                                                degrees
                                            </td>
                                            <td style="padding-top: 5px; font-weight: normal;">
                                                <asp:TextBox ID="txtLongMinutes" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;"></asp:TextBox>
                                                <asp:Literal ID="litLongMinutes" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLongMinutes" runat="server" ControlToValidate="txtLongMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please enter Longitude minutes">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLongMinutes" runat="server" ControlToValidate="txtLongMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude minutes must be numberic">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLongMinutes" runat="server" ControlToValidate="txtLongMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" ErrorMessage="Longitude minutes must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                minutes
                                            </td>
                                            <td style="padding-top: 5px; font-weight: normal;">
                                                <asp:TextBox ID="txtLongSeconds" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;"></asp:TextBox>
                                                <asp:Literal ID="litLongSeconds" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLongSeconds" runat="server" ControlToValidate="txtLongSeconds" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please enter Longitude seconds" DESIGNTIMEDRAGDROP="4867">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLongSeconds" runat="server" ControlToValidate="txtLatSeconds" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" Operator="DataTypeCheck" ErrorMessage="Longitude seconds must be numeric">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLongSeconds" runat="server" ControlToValidate="txtLongSeconds" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    Type="Double" ErrorMessage="Longitude seconds must be between 0 and 60" MaximumValue="60" MinimumValue="0">*</asp:RangeValidator>
                                                seconds
                                            </td>
                                            <td style="padding-top: 5px; text-align: right; font-weight: normal;">
                                                <asp:DropDownList ID="ddlEWMinutes" runat="server" Width="40px" Style="background-color: #FFFFFF;">
                                                    <asp:ListItem Value="" Text="" />
                                                    <asp:ListItem Value="E" Text="E" />
                                                    <asp:ListItem Value="W" Text="W" />
                                                </asp:DropDownList>
                                                <asp:Literal ID="litEWMinutes" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvEWMinutes" runat="server" ControlToValidate="ddlEWMinutes" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator>
                                                <asp:Literal ID="litEW" runat="server" Text="E/W"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>

                                <asp:Panel ID="pnlDecimal" runat="server" Visible="false">
                                    <table id="Table4" cellspacing="1" cellpadding="1" border="0" style="width: 100%;">
                                        <tr class="stdFont">
                                            <td style="height: 16px" style="text-align: left; padding-left: 2px; width: 106px;">
                                                <span class="ErrorColor">*</span> Latitude:
                                            </td>
                                            <td style="text-align: left; font-weight: normal;">
                                                <asp:TextBox ID="txtLat2" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;"></asp:TextBox>
                                                <asp:Literal ID="litLat2" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic"
                                                    ErrorMessage="Please enter Latitude degrees" ValidationGroup="LatitudeLongitude">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic" Type="Double"
                                                    Operator="DataTypeCheck" ErrorMessage="Latitude degrees must be numeric">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLat2" runat="server" ControlToValidate="txtLat2" Display="Dynamic" Type="Double" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Latitude must be between 0 and 90 degrees" MaximumValue="90" MinimumValue="0">*</asp:RangeValidator>
                                                degrees
                                            </td>
                                            <td style="text-align: left; font-weight: normal;">
                                                <asp:DropDownList ID="ddlNSDecimal" runat="server" Width="40px" Style="background-color: #FFFFFF;">
                                                    <asp:ListItem Text="" Value="" />
                                                    <asp:ListItem Text="N" Value="N" />
                                                    <asp:ListItem Text="S" Value="S" />
                                                </asp:DropDownList>
                                                <asp:Literal ID="litNSDecimal" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvNSDecimal" runat="server" ControlToValidate="ddlNSDecimal" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator>
                                                N/S
                                            </td>
                                        </tr>
                                        <tr class="stdFont">
                                            <td style="height: 16px; padding-top: 5px; text-align: left; padding-left: 2px;">
                                                <span class="ErrorColor">*</span> Longitude:
                                            </td>
                                            <td style="text-align: left; padding-top: 5px; width: 185px; font-weight: normal;">
                                                <asp:TextBox ID="txtLong2" runat="server" MaxLength="10" Width="75px" Style="background-color: #FFFFFF;"></asp:TextBox>
                                                <asp:Literal ID="litLong2" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic"
                                                    ErrorMessage="Please enter Longitude degrees" ValidationGroup="LatitudeLongitude">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic" Type="Double" ValidationGroup="LatitudeLongitude"
                                                    Operator="DataTypeCheck" ErrorMessage="Longitude degrees must be numeric">*</asp:CompareValidator>
                                                <asp:RangeValidator ID="rvLong2" runat="server" ControlToValidate="txtLong2" Display="Dynamic" Type="Double" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Longitude must be between 0 and 180 degrees" MaximumValue="180" MinimumValue="0">*</asp:RangeValidator>
                                                degrees
                                            </td>
                                            <td style="text-align: left; padding-top: 5px; font-weight: normal;">
                                                <asp:DropDownList ID="ddlEWDecimals" runat="server" Width="40px" Style="background-color: #FFFFFF;">
                                                    <asp:ListItem Value="" Text="" />
                                                    <asp:ListItem Value="E" Text="E" />
                                                    <asp:ListItem Value="W" Text="W" />
                                                </asp:DropDownList>
                                                <asp:Literal ID="litEWDecimals" runat="server"></asp:Literal>

                                                <asp:RequiredFieldValidator ID="rfvEWDecimals" runat="server" ControlToValidate="ddlEWDecimals" Display="Dynamic" ValidationGroup="LatitudeLongitude"
                                                    ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator>
                                                E/W
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="5" style="padding: 15px 5px 5px 5px;">

                    <table cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #FFFFFF; padding: 5px 5px 5px 5px;">
                        <tr id="trAddImage" runat="server" style="display: inline;">
                            <td style="text-align: right;">
                                <asp:Button ID="btnAddImage" runat="server" ToolTip="Add Image" Text="Add Image"
                                    CssClass="btnSmall" CausesValidation="false" OnClientClick="return btnAddImage_ClientClick(this, event);" />
                            </td>
                        </tr>
                        <tr id="trUpload" runat="server" style="display: none;">
                            <td style="padding: 5px 5px 0px 5px;">
                                <table cellpadding="0" cellspacing="0" style="width: 100%; border: solid 1px #FFFFFF;">
                                    <tr>
                                        <td style="padding-top: 5px; padding-left: 5px;">
                                            <span class="ErrorColor">*</span> Image Name
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <span class="ErrorColor">*</span> Image File
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 5px; vertical-align: top;">
                                            <asp:TextBox ID="txtImageName" runat="server" CssClass="TextBoxLarge" MaxLength="75" />
                                            <asp:RequiredFieldValidator ID="rfvImageName" runat="server" ControlToValidate="txtImageName" CssClass="ErrorColor"
                                                Display="Dynamic" ErrorMessage="<br />* Required" SetFocusOnError="true" ValidationGroup="ImageUpload" />
                                        </td>
                                        <td style="vertical-align: top;">
                                            <radU:RadUpload ID="uplImage" runat="server" AllowedFileExtensions=".jpg,.gif" ControlObjectsVisibility="None"
                                                OverwriteExistingFiles="true" Skin="Trinity" EnableFileInputSkinning="true" OnClientAdded="IncreaseFileInputWidth"
                                                MaxFileInputsCount="1" TabIndex="-1" ReadOnlyFileInputs="true" Language="en-US" OnClientFileSelected="ValidateFileType" />
                                            <span id="spnImageError" style="display: none; margin-top: -3px; position: relative; vertical-align: top;" class="ErrorColor">
                                                <%-- Error text is dynamically populated --%>
                                            </span>

                                            <span style="font-weight: normal;">
                                                <asp:Literal ID="litImageFileName" runat="server" Visible="false" />
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="padding-top: 10px; padding-left: 5px;">Image Description
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="padding-left: 5px; padding-right: 12px;">
                                            <asp:TextBox ID="txtImageDescription" runat="server" TextMode="MultiLine" CssClass="TextArea"
                                                onkeyup="FixTextarea(this, 1000); RemoveHTML(this, event);"
                                                onkeypress="return TextMaxLength(this, '1000', event);"
                                                onpaste='return MaxLengthPaste(this, 1000)' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right; padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
                                            <asp:Button ID="btnCancelUpload" runat="server" Text="Cancel" ToolTip="Cancel Upload"
                                                CssClass="btnSmall" CausesValidation="false" /><%-- OnClientClick="return btnCancelUpload_ClientClick(this, event);" />--%>
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnSaveImage" runat="server" Text="Save" ToolTip="Save Image"
                                                CssClass="btnSmall" ValidationGroup="ImageUpload" OnClientClick="return btnSaveImage_ClientClick(this, event)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%-- The SortExpression values correspond to the SortFieldEnum values in AddService.aspx.vb --%>
                                <radG:RadGrid ID="grdImages" runat="server" AutoGenerateColumns="False"
                                    AllowSorting="True" AllowPaging="True" PageSize="10" ShowHeader="true" Skin="Outlook2007">
                                    <mastertableview allowcustomsorting="true">
                                        <HeaderStyle CssClass="RadGridHeader_LeftAlign" />
                                        <Columns>
                                            <radG:GridBoundColumn DataField="ID" Visible="false"></radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="Name" HeaderText="Image Name" SortExpression="1" HeaderStyle-Width="100px"></radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="Description" HeaderText="Image Description" HeaderStyle-Width="420px" SortExpression="2"></radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="Path" HeaderText="Image File" SortExpression="3"></radG:GridBoundColumn>
                                            <radG:GridTemplateColumn HeaderText="Options" HeaderStyle-Width="70px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" ToolTip="Edit" CausesValidation="false"
                                                        CommandArgument='<%# Eval("Path") %>' CommandName="Edit" />
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" ToolTip="Delete"
                                                        CausesValidation="false" CommandArgument='<%# Eval("Path") %>' CommandName="Delete" 
                                                        OnClientClick="return btnDelete_ClientClick(this, event);" /> 
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                        </Columns>
                                        
                                        <NoRecordsTemplate>
                                            <table id="tblNoRecords" runat="server" cellpadding="0" cellspacing="0" class="NoRecordsTable">
                                                <tr>
                                                    <td style="padding-left:3px;">
                                                        There are currently no images uploaded for this service.
                                                    </td>
                                                </tr>
                                            </table>
                                        </NoRecordsTemplate>
                                    </mastertableview>
                                </radG:RadGrid>


                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="vertical-align: top; padding-top: 15px;">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td style="vertical-align: top; width: 45px;">Notes
                            </td>
                            <td style="padding-right: 7px; font-weight: normal; width: 675px;">
                                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" CssClass="TextArea"
                                    onkeyup="FixTextarea(this, 500); RemoveHTML(this, event);"
                                    onkeypress="return TextMaxLength(this, '500', event);"
                                    onpaste='return MaxLengthPaste(this, 500);' />
                                <asp:Literal ID="litNotes" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="padding-bottom: 5px;"></td>
            </tr>
        </table>

    </fieldset>

    <div style="text-align: left; padding-top: 10px;">
        <asp:LinkButton ID="btnBack" runat="server" ToolTip="Back" Text="&lt; Back" CssClass="stdFont" PostBackUrl="ServicesSearch.aspx" />
    </div>

    <asp:ValidationSummary ID="vsLatitudeLongitude" runat="server" DisplayMode="BulletList" CssClass="ErrorColor"
        ShowMessageBox="true" ShowSummary="false" ValidationGroup="LatitudeLongitude" />

</asp:Content>
