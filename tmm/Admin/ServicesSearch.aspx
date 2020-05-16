<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master"
    CodeBehind="ServicesSearch.aspx.vb" Inherits="TMMInternet.ServicesSearch" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Services.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        // gets the ClientID of txtRadius
        function GetRadiusTextboxClientID() 
        {
            return '<%= txtRadius.ClientID %>';
        }
    </script>


    <radA:RadAjaxManager ID="ramServiceLocator" runat="server">
    </radA:RadAjaxManager>


    <table id="tdWrapper" cellpadding="0" cellspacing="0">
        <tr>
            <td id="tdTitle" colspan="2">
                Services Search:
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top; padding-left:10px; padding-right:10px;">
            
                <fieldset class="FieldSet">
                    <legend style="color:#ffffff;">LOCATION INFORMATION</legend>
                    
                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td id="tdWorksite">
                                <asp:RadioButton ID="rdoWorksite" runat="server" AutoPostBack="true" Checked="true" GroupName="LocationInformation" />
                                Choose a Worksite:&nbsp;
                            </td>
                            <td id="tdWorksite_Input">
                                <asp:DropDownList ID="ddlWorksite" runat="server" AppendDataBoundItems="true" CssClass="WorksiteDropDownList" AutoPostBack="true">
                                    <asp:ListItem Text="Select A Worksite" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvWorksite" runat="server" ErrorMessage="Please select a worksite and try again." 
                                    Text="*" ControlToValidate="ddlWorksite" InitialValue="-1" Display="Dynamic" CssClass="ErrorColor" />
                            </td>
                        </tr>
                        <tr>
                            <td id="tdCity">
                                <asp:RadioButton ID="rdoCity" runat="server" AutoPostBack="true" GroupName="LocationInformation" />
                                Enter a City:&nbsp;
                            </td>
                            <td id="tdCity_Input">
                                <asp:TextBox ID="txtCity" runat="server" CssClass="CityTextbox" />
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Please enter a city and try again." Text="*"
                                    ControlToValidate="txtCity" Display="Dynamic" CssClass="ErrorColor" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td style="padding-left:10px; padding-right:10px; vertical-align:top;">
                <fieldset class="FieldSet">
                    <legend style="color:#ffffff;" title=""></legend>
                    
                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td id="tdCategory">
                                Category:&nbsp;
                            </td>
                            <td id="tdCategory_Input">
                                <asp:DropDownList runat="server" ID="ddlCategory" AppendDataBoundItems="true" CssClass="CategoryDropDownList">
                                </asp:DropDownList> 
                            </td>
                        </tr>
                        <tr>
                            <td id="tdPreference">
                                Service Preference:&nbsp;
                            </td>
                            <td id="tdPreference_Input">
                                <asp:DropDownList runat="server" ID="ddlPreference" AppendDataBoundItems="true" CssClass="PreferenceDropDownList">
                                </asp:DropDownList> 
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        
        
        <tr>
            <td id="tdRadius">
                <fieldset class="FieldSet_Radius">
                    <legend style="color:#ffffff;" ></legend>
                    
                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td>
                                Radius (from Worksite):&nbsp;
                                <asp:TextBox ID="txtRadius" runat="server" CssClass="RadiusTextbox" MaxLength="10" Text="100" 
                                    onkeyup="FixNumericInput(this, event, 1000);"
                                    onkeypress="return IsNumericInput_KeyPress(this, event);" 
                                    onpaste="return IsNumericInput_Paste(this, event);" />
                                &nbsp;miles
                                
                                <asp:RequiredFieldValidator ID="rfvRadius" runat="server" ErrorMessage="Please enter a radius and try again." Text="*"
                                    ControlToValidate="txtRadius" Display="Dynamic" CssClass="ErrorColor" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td id="tdSearch">
                <table width="100%">
                    <tr>
                        <td align="left" style="text-align:left; padding-left:5px;">
                            <asp:CheckBox ID="chkInactiveSearch" runat="server" Text="Display Inactive Services" Checked="false" />
                        </td>
                        <td>
                            <asp:Button class="btnSmall" runat="server" ID="btnSearch" Text="Search" OnClientClick="return btnSearch_ClientClick(this, event);" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
    
    <asp:ValidationSummary ID="ValidationSummary" runat="server" />  
     
    <table cellpadding="0" cellspacing="0" style="width:100%; text-align:left; padding-top:5px;">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td id="tdAddServiceButton">
               <asp:Button ID="btnAddService" runat="server" CssClass="btnSmall" Text="Add New Service" ToolTip="Add New Service" 
                    CausesValidation="false" /> 
            &nbsp;<asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td id="tdResults" runat="server" visible="false">
                <%-- The SortExpression values correspond to the SortFieldEnum values in AddService.aspx.vb --%>
                <radG:RadGrid ID="grdSearchResults" runat="server" AutoGenerateColumns="False"
                        AllowSorting="True" AllowPaging="True" PageSize="10" ShowHeader="true" Skin="Outlook2007">
                    <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  /> 
                    <MasterTableView AllowCustomSorting="true" DataKeyNames="ServiceID">
                        <HeaderStyle CssClass="RadGridHeader_LeftAlign" />
                        <Columns>
                            <radG:GridTemplateColumn HeaderText="Service Name" SortExpression="0">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkServiceName" runat="server" CommandName="ViewService" style="color:#000000;"
                                        CommandArgument='<%# Eval("ServiceID") %>' Text='<%# Eval("ServiceName") %>' />
                                </ItemTemplate>           
                            </radG:GridTemplateColumn>
                            
                            <radG:GridTemplateColumn HeaderText="Employer Name" SortExpression="1">
                                <ItemTemplate>
                                    <%# GetEmployerName(Eval("EmployerName")) %>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>

                            <radG:GridTemplateColumn HeaderText="Service Type" SortExpression="2">
                                <ItemTemplate>
                                    <%# GetServiceType(Eval("ServiceTypeName")) %>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>

                            <radG:GridTemplateColumn HeaderText="City" SortExpression="3">
                                <ItemTemplate>
                                    <%# GetCity(Eval("PhysicalCityName")) %>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>

                            <radG:GridTemplateColumn HeaderText="Phone Number" SortExpression="4"> 
                                <ItemTemplate>
                                    <%# GetPhoneNumber(Eval("MainPhone")) %>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                            <radG:GridButtonColumn ButtonType="LinkButton" Text="Delete" CommandName="Delete" ConfirmText="Are you sure you wish to permanently delete this service?"></radG:GridButtonColumn>
                        </Columns>
                        
                        <NoRecordsTemplate>
                            <table id="tblNoRecords" runat="server" cellpadding="0" cellspacing="0" class="NoRecordsTable">
                                <tr>
                                    <td>
                                        Sorry, but there are currently no services that meet the above criteria.
                                    </td>
                                </tr>
                            </table>
                        </NoRecordsTemplate>
                    </MasterTableView>
                </radG:RadGrid>
            </td>
        </tr>
    </table>

    <radW:RadWindowManager ID="radWindow" runat="server">
        <Windows>
            <radW:RadWindow ID="windowMultiple" NavigateUrl="/ServiceLocator/MultipleCities.aspx" runat="server" Modal="true" Width="600px" 
                Height="430px" VisibleStatusBar="false" DestroyOnClose="false" Left="" Title="Multiple Cities Found" Top="" Behavior="close"
                BorderColor="white" BorderStyle="solid" BorderWidth="2" />
        </Windows>
    </radW:RadWindowManager>

</asp:Content>
