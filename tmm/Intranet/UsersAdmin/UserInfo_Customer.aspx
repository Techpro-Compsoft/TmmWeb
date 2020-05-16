<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo_Customer.aspx.cs" Inherits="UsersAdmin.UserInfo_Customer" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadTabStrip.Net2" namespace="Telerik.WebControls" tagprefix="radT" %>
<%@ Register src="Controls/User_GeneralInformation.ascx" tagname="User_GeneralInformation" tagprefix="uc1" %>
<%@ Register src="Controls/User_SecurityInformation.ascx" tagname="User_SecurityInformation" tagprefix="uc2" %>
<%@ Register src="Controls/LoginInformation.ascx" tagname="LoginInformation" tagprefix="uc3" %>
<%@ Register src="Controls/AddCredential.ascx" tagname="AddCredential" tagprefix="uc4" %>
<%@ Register src="Controls/CustomerInformation.ascx" tagname="CustomerInformation" tagprefix="uc5" %>
<%@ Register src="Controls/CustomerUser_GeneralInformation.ascx" tagname="CustomerUser_GeneralInformation" tagprefix="uc6" %>
<%@ Register src="Controls/Notifications.ascx" tagname="Notifications" tagprefix="uc7" %>
<%@ Register src="Controls/UserVideoLibraryGrid.ascx" tagname="UserVideoLibraryGrid" tagprefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--Test comment. Please delete. -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<link href="/trinity.css" rel="stylesheet" type="text/css" />
    <script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        // gets the ClientID of trContacts_Notifications
        function GetNotificationsTableRowClientID() 
        {
            // NOTE: returning the ClientID was causing an error
            return 'trContacts_Notifications';
        }
        

        // shows/hides the Notifications table row
        function ToggleNotificationsVisibility() 
        {
            var rdoPatientEncounterNotification_Yes = document.getElementById(GetPatientEncounterNotification_Yes());
            var rdoReceiveNewNoteNotification_Yes = document.getElementById(GetReceiveNewNoteNotification_Yes());
            var rowContacts_Notifications = document.getElementById(GetNotificationsTableRowClientID());

            if (rdoPatientEncounterNotification_Yes.checked || rdoReceiveNewNoteNotification_Yes.checked)
                rowContacts_Notifications.style.display = 'inline';
            else
                rowContacts_Notifications.style.display = 'none';
        }
    </script>
    <link href="RadControls/Grid/Skins/Outlook2007/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
    legend{  
     color:#ffffff;
    } 
</style>
</head>
	<body style="margin-top:0; margin-left:0; background-color:#000000;">
	<form runat="server" id="frm1" style="text-align:center;">
	<asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
	    
			<table width="760" style="height:100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
				<tr style="height:151" valign="top">
					<td>
					    <img src="images/Trinity_GraphicBar_Users.jpg" alt="" width="760" height="78" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="100%" class="MenuBar">
                            <tr>
                                <td><TMM:TMMMenu ID="tmmMenu" runat="server" /></td>
                            </tr>
						</table>
					</td>
				</tr>
				<tr>
				    <td style="text-align:left; padding:10px;">
				        <span class="WhiteText" ><b>User Information: <asp:Literal ID="litUserHeader" runat="server"></asp:Literal></b></span>
				    </td>
				</tr>
				<tr>
				    <td style="text-align:left; padding:10px;">
				        <uc5:CustomerInformation ID="CustomerInformation1" runat="server" />
				    </td>
				</tr>
				<tr id="trEdit" runat="server">
				    <td style="text-align:left; padding:10px; text-align:right;">
				        <asp:Button ID="btnEditCustomerInfo" runat="server" Text="Edit" CssClass="btnSmall" onclick="btnEditCustomerInfo_Click" CausesValidation="false" />
				    </td>
				</tr>
				<tr id="trSave" runat="server" visible="false">
				    <td style="text-align:left; padding:10px; text-align:right;">
				        <asp:Button ID="btnCancelCustomerInfo" runat="server" Text="Cancel" CssClass="btnSmall" CausesValidation="false" onclick="btnCancelCustomerInfo_Click" />&nbsp;
				        <asp:Button ID="btnSaveCustomerInfo" runat="server" Text="Save" CssClass="btnSmall" onclick="btnSaveCustomerInfo_Click" />
				    </td>
				</tr>
				<tr>
				    <td style="text-align:left; padding:10px; ">
                        <radT:RadTabStrip ID="radTabStrip" runat="server"  AutoPostBack="true" 
                            CausesValidation="false" Skin="Web20" ontabclick="radTabStrip_TabClick">
                            <Tabs>
                                <radT:Tab Text="Contacts"></radT:Tab>
                                <radT:Tab Text="Worksites"></radT:Tab>
                                <radT:Tab Text="Patient Encounters"></radT:Tab>
				                <radT:Tab Text="Video Library" ID="tabVidLib" runat="server"></radT:Tab>
                            </Tabs>
                        </radT:RadTabStrip>
                        <asp:MultiView ID="mvwCustomers" runat="server">
                            <asp:View id="View1" runat="server">
                                <table style="width:100%; border:1px solid white;" id="tblViewContacts" runat="server">
                                    <tr>
                                       <td style="padding:10px;">
                                       <radT:RadTabStrip ID="tabActiveUsers" runat="server"  Skin="Web20" AutoPostBack="true" ontabclick="tabActiveUsers_TabClick" CausesValidation="false">
                                            <Tabs>
                                                <radT:Tab ID="tabActive" runat="server" Value="1" Text="Active Users"></radT:Tab>
                                                <radT:Tab ID="tabInactive" runat="server" Value="0" Text="Inactive Users"></radT:Tab>
                                            </Tabs>
                                        </radT:RadTabStrip>
                                            <radG:RadGrid ID="grdContacts" runat="server" AutoGenerateColumns="False" 
                                                GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
                                                Skin="Outlook2007" onneeddatasource="grdContacts_NeedDataSource">
                                                <PagerStyle Mode="NextPrevAndNumeric" />
                                                
                                                <MasterTableView>
                                                    <HeaderStyle CssClass="RadGridHeader_LeftAlign" Width="20px" />
                                                    <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                                    <RowIndicatorColumn Visible="False">
                                                        <HeaderStyle Width="20px"></HeaderStyle>
                                                    </RowIndicatorColumn>

                                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                                    
                                                    </ExpandCollapseColumn>
                                                    <Columns>
                                                        <radG:GridTemplateColumn HeaderText="Name" SortExpression="LastName">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkName" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkName_Click"><%# Eval("LastName") %>,&nbsp;<%# Eval("FirstName") %></asp:LinkButton> 
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Work Phone">
                                                            <ItemTemplate>
                                                                <%# GetPhoneNumber(6, Convert.ToInt32(Eval("ID")))%>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Fax Number">
                                                            <ItemTemplate>
                                                                <%# GetPhoneNumber(4, Convert.ToInt32(Eval("ID")))%>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Cell Phone">
                                                            <ItemTemplate>
                                                                <%# GetPhoneNumber(2, Convert.ToInt32(Eval("ID")))%>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Email Address" SortExpression="Email">
                                                            <ItemTemplate>
                                                                <%# GetEmail(Convert.ToString(Eval("Email")))%>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Last Login<br />Date/Time">
                                                            <ItemTemplate>
                                                                <%# GetLastLogin(Convert.ToInt32(Eval("ID")))%>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                    </Columns>
                                                    <SortExpressions>
                                                        <radG:GridSortExpression FieldName="LastName" SortOrder="Ascending" />
                                                    </SortExpressions>
                                                    <NoRecordsTemplate>
                                                        Sorry but this customer does not have any contacts.
                                                    </NoRecordsTemplate>
                                                </MasterTableView>
                                            </radG:RadGrid>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="text-align:right; padding:0px 10px 10px 10px; ">
                                            <asp:Button ID="btnAddNewContact" runat="server" Text="Add New Contact" 
                                                CssClass="btnSmall" onclick="btnAddNewContact_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <table style="width:100%; border:1px solid white;" visible="false" id="tblEditContact" runat="server">
                                    <tr id="trContacts_GeneralInformation" runat="server">
                                       <td style="padding:10px;">
                                       
                                           <uc6:CustomerUser_GeneralInformation ID="CustomerUser_GeneralInformation1" 
                                               runat="server" />
                                       
                                       </td>
                                    </tr>
                                    <tr id="trContacts_SecurityInformation" runat="server">
                                        <td  style="padding:10px;">
                                            <uc2:User_SecurityInformation ID="User_SecurityInformation1" runat="server" />
                                        </td>
                                    </tr>
                                    <tr id="trContacts_Notifications" runat="server">
                                        <td style="padding:10px;">
                                        
                                            <uc7:Notifications ID="Notifications1" runat="server" />
                                        
                                        </td>    
                                    </tr>
                                    <tr id="trContacts_LoginInformation" runat="server">
                                        <td  style="padding:10px;">
                                            <asp:Panel ID="pnlGenInfo" runat="server" GroupingText="Login Information"  ForeColor="White" Font-Names="Arial" Font-Size="12px">
                                                <div style="padding:10px;"><uc3:LoginInformation ID="LoginInformation1" runat="server" /></div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr id="trContacts_EditButtons" runat="server">
				                        <td style="padding:0px 10px 10px 10px; text-align:right;">
				                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btnSmall" CausesValidation="false" onclick="btnCancelEdit_Click" />&nbsp;
                                            <asp:Button ID="btnSaveEdit" runat="server" Text="Save" CssClass="btnSmall" onclick="btnSaveEdit_Click" />
				                        </td>
				                    </tr>
				                    <tr id="trContacts_AddButtons" runat="server">
				                        <td style="padding:0px 10px 10px 10px; text-align:right;">
				                            <asp:Button ID="btnContacts_SaveCancel" runat="server" Text="Cancel" 
                                                CssClass="btnSmall" CausesValidation="false" 
                                                onclick="btnContacts_SaveCancel_Click"  />&nbsp;
                                            <asp:Button ID="btnContacts_SaveSave" runat="server" Text="Save" 
                                                CssClass="btnSmall" onclick="btnContacts_SaveSave_Click"  />
				                        </td>
				                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <table style="width:100%; border:1px solid white;" id="tblWorksiteGrid" runat="server">
                                    <tr>
                                       <td colspan="2" style="padding:10px;">
                                            <span class="WhiteText">*NOTE: The following list contains only job sheet and manual longitude and latitude entries.</span>
                                            <radG:RadGrid ID="grdWorksites" runat="server" AutoGenerateColumns="False" 
                                                GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
                                                Skin="Outlook2007" OnNeedDataSource="grdWorksites_NeedDataSource">
                                                <PagerStyle Mode="NextPrevAndNumeric" />

                                                <MasterTableView>
                                                    <HeaderStyle CssClass="RadGridHeader_LeftAlign" Width="20px"></HeaderStyle>                                                    
                                                    
                                                    <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                                    <RowIndicatorColumn Visible="False">
                                                        <HeaderStyle Width="20px"></HeaderStyle>
                                                    </RowIndicatorColumn>

                                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                                    </ExpandCollapseColumn>
                                                    <Columns>
                                                        <radG:GridTemplateColumn HeaderText="Worksite" SortExpression="RigName" >
                                                            <ItemTemplate>
                                                                <asp:LinkButton id="lnkRigName" runat="server" OnClick="lnkRigName_Click"  CommandArgument='<%# Eval("RigID") %>' ><%# Eval("RigName")%></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Status" SortExpression="Active">
                                                            <ItemTemplate>
                                                                <%# ShowActive(Convert.ToBoolean(Eval("Active"))) %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Last Updated" SortExpression="DateAdded">
                                                            <ItemTemplate>
                                                                <%# Eval("DateAdded") %>
                                                                &nbsp;
                                                                <%# Eval("UpdatedBy") %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                    </Columns>
                                                    <SortExpressions>
                                                        <radG:GridSortExpression FieldName="RigName" SortOrder="Ascending" />
                                                    </SortExpressions>
                                                    <NoRecordsTemplate>
                                                        Sorry but this customer does not have any worksites.
                                                    </NoRecordsTemplate>
                                                </MasterTableView>
                                            </radG:RadGrid>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:left; padding:0px 10px 10px 10px;">
                                            <asp:LinkButton CssClass="WhiteLnk" ID="lnkShowStatuses" runat="server" onclick="lnkShowStatuses_Click"></asp:LinkButton>&nbsp;
                                        </td>
                                        <td style="padding:0px 10px 10px 10px; text-align:right;">
                                            <asp:Button ID="btnAddWorksite" runat="server" Text="Add New Worksite" 
                                                CssClass="btnSmall" CausesValidation="false" onclick="btnAddWorksite_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <table style="width:100%; border:1px solid white;" id="tblEditWorkSite" runat="server" visible="false">
                                    <tr>
                                       <td style="padding:10px; width:60%;">
                                            <table>
                                                <tr>
                                                    <td><span class="WhiteText">* Worksite</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_WorksiteName" runat="server" Width="250"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valWorksite_Worksite" runat="server" ErrorMessage="* Required" Display="Dynamic" ControlToValidate="txtWorksite_WorksiteName" ValidationGroup="valWorksite"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="valWorksiteDuplicate" runat="server" ErrorMessage="* Sorry, this worksite already exists. Please try again." Display="Dynamic" ValidationGroup="valWorksite" ControlToValidate="txtWorksite_WorksiteName" OnServerValidate="valWorksiteDuplicate_Validate"></asp:CustomValidator></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">* Drilling For</span></td>
                                                    <td><asp:DropDownList ID="ddlWorksite_DrillingFor" runat="server" Width="255"></asp:DropDownList><br /></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">* Manager First Name</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_ManagerFName" runat="server" width="250"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valWorksite_ManagerFName" runat="server" ErrorMessage="* Required" Display="Dynamic" ControlToValidate="txtWorksite_ManagerFName"  ValidationGroup="valWorksite"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">* Manager Last Name</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_ManagerLName" runat="server" width="250"></asp:TextBox><br /><asp:RequiredFieldValidator ID="valWorksite_ManagerLName" runat="server" ErrorMessage="* Required" Display="Dynamic" ControlToValidate="txtWorksite_ManagerLName"  ValidationGroup="valWorksite"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">* Shift End Date</span></td>
                                                    <td>
                                                        <rad:RadDatePicker ID="radDatePicker" runat="server" Skin="Trinity" DatePopupButton-ImageUrl="images/btn_SelectDate.jpg" DatePopupButton-HoverImageUrl="images/btn_SelectDate.jpg" >
                                                            <DatePopupButton CssClass="RadDatePickerButton" />
                                                            <DateInput MaxLength="10"></DateInput>
								                            <Calendar Skin="Trinity"></Calendar>
                                                        </rad:RadDatePicker><br /><asp:RequiredFieldValidator ID="valDatePicker" runat="server" ErrorMessage="* Required" Display="Dynamic" ControlToValidate="radDatePicker"  ValidationGroup="valWorksite"></asp:RequiredFieldValidator></td>
                                                </tr>
                                            </table>
                                       </td>
                                       <td style="padding:10px; width:40%; vertical-align:top;">
                                            <table>
                                                <tr>
                                                    <td><span class="WhiteText">Phone #</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_MainPhone" runat="server" MaxLength="25"></asp:TextBox></td>
                                                </tr>
                                                 <tr>
                                                    <td><span class="WhiteText">Alternative Phone #</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_AlternativePhone" runat="server" MaxLength="25"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">Fax #</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_MainFax" runat="server" MaxLength="25"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">Contact Phone #</span></td>
                                                    <td><asp:TextBox ID="txtWorksite_ContactPhone" runat="server" MaxLength="25"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">Worksite Status</span></td>
                                                    <td><span class="WhiteText"><asp:RadioButton ID="rdoWorksiteActive_True" Text="Active" GroupName="WSActive" runat="server" />&nbsp;&nbsp;<asp:RadioButton ID="rdoWorksiteActive_False" Text="Inactive" runat="server" GroupName="WSActive" /></span></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="WhiteText">Rig Type</span></td>
                                                    <td><span class="WhiteText"><asp:RadioButton ID="rdoRigType_Land" Text="Land" GroupName="WSType" runat="server" />&nbsp;&nbsp;<asp:RadioButton ID="rdoRigType_Sea" Text="Sea" runat="server" GroupName="WSType" /></span></td>
                                                </tr>
                                            </table>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <rad:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%">
                                            <TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" border="0">
												<TR class="stdFont" align="center">
													<TD style="WIDTH: 50%; text-align:right;">
													    Choose style of Longitude/Latitude entry:</TD>
													<TD style="text-align:left; width:50%;">
													    <asp:radiobutton id="rbMinutes" runat="server" AutoPostBack="True" GroupName="Group1" Text="Minutes and Seconds" Checked="True" tabIndex="6" oncheckedchanged="rbMinutes_CheckedChanged1"></asp:radiobutton>
                                                        <asp:radiobutton id="rbDecimal" runat="server" AutoPostBack="True" GroupName="Group1" Text="Decimals" tabIndex="7" oncheckedchanged="rbDecimal_CheckedChanged1"></asp:radiobutton>
                                                    </TD>
                                                    
												</TR>
												<tr align="center">
													<td class="stdFont" colSpan="2">
														<P class="stdFont">&nbsp;<asp:Panel ID="pnlMinutes" runat="server" Height="48px">
                                                            <table id="Table3" border="0" cellpadding="1" cellspacing="1" width="600">
                                                                <tr class="stdFont">
                                                                    <td align="right" style="HEIGHT: 17px">
                                                                        Latitude:</td>
                                                                    <td style="HEIGHT: 17px">
                                                                        <asp:TextBox ID="txtLat1" runat="server" MaxLength="10" tabIndex="8" 
                                                                            Width="75px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvLat1" runat="server" 
                                                                            ControlToValidate="txtLat1" Display="Dynamic" 
                                                                            ErrorMessage="Please enter Longitude degrees" ValidationGroup="valWorksite">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="cvLat1" runat="server" ControlToValidate="txtLat1" 
                                                                            Display="Dynamic" ErrorMessage="Latitude degrees must be numeric" 
                                                                            Operator="DataTypeCheck" Type="Double" ValidationGroup="valWorksite">*</asp:CompareValidator>
                                                                        <asp:RangeValidator ID="rvLat1" runat="server" ControlToValidate="txtLat1" 
                                                                            Display="Dynamic" ErrorMessage="Latitude degrees must be between 0 an 90." 
                                                                            MaximumValue="90" MinimumValue="0" Type="Double" ValidationGroup="valWorksite">*</asp:RangeValidator>
                                                                        degrees
                                                                        <asp:TextBox ID="txtLatMinutes" runat="server" MaxLength="10" tabIndex="9" 
                                                                            Width="75px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvLatMinutes" runat="server" 
                                                                            ControlToValidate="txtLatMinutes" Display="Dynamic" 
                                                                            ErrorMessage="Please enter Latitude minutes" ValidationGroup="valWorksite">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="cvLatMinutes" runat="server" 
                                                                            ControlToValidate="txtLatMinutes" DESIGNTIMEDRAGDROP="5457" Display="Dynamic" 
                                                                            ErrorMessage="Latitude minutes must be numeric" Operator="DataTypeCheck" 
                                                                            Type="Double" ValidationGroup="valWorksite">*</asp:CompareValidator>
                                                                        <asp:RangeValidator ID="rvLatMinutes" runat="server" 
                                                                            ControlToValidate="txtLatMinutes" Display="Dynamic" 
                                                                            ErrorMessage="Latitude minutes must be between 0 and 60" MaximumValue="60" 
                                                                            MinimumValue="0" Type="Double" ValidationGroup="valWorksite">*</asp:RangeValidator>
                                                                        minutes
                                                                        <asp:TextBox ID="txtLatSeconds" runat="server" MaxLength="10" tabIndex="10" 
                                                                            Width="75px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvLatSeconds" runat="server" 
                                                                            ControlToValidate="txtLatSeconds" Display="Dynamic" 
                                                                            ErrorMessage="Please enter Latitude seconds" ValidationGroup="valWorksite">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="cvLatSeconds" runat="server" 
                                                                            ControlToValidate="txtLatSeconds" Display="Dynamic" 
                                                                            ErrorMessage="Latitude seconds must be numeric" Operator="DataTypeCheck" 
                                                                            Type="Double" ValidationGroup="valWorksite">*</asp:CompareValidator>
                                                                        <asp:RangeValidator ID="rvLatSeconds" runat="server" 
                                                                            ControlToValidate="txtLatSeconds" Display="Dynamic" 
                                                                            ErrorMessage="Latitude seconds must be between 0 and 60" MaximumValue="60" 
                                                                            MinimumValue="0" Type="Double" ValidationGroup="valWorksite">*</asp:RangeValidator>
                                                                        seconds
                                                                        <asp:DropDownList ID="ddlNSMinutes" runat="server" tabIndex="11" Width="40px">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvNSMinutes" runat="server" 
                                                                            ControlToValidate="ddlNSMinutes" Display="Dynamic" 
                                                                            ErrorMessage="Please select a Latitude direction" ValidationGroup="valWorksite">*</asp:RequiredFieldValidator>
                                                                        N/S</td>
                                                                </tr>
                                                                <tr class="stdFont">
                                                                    <td align="right">
                                                                        Longitude:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtLong1" runat="server" MaxLength="10" tabIndex="12" 
                                                                            Width="75px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvLong1" runat="server" 
                                                                            ControlToValidate="txtLong1" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="cvLong1" runat="server" ControlToValidate="txtLong1" 
                                                                            DESIGNTIMEDRAGDROP="5459" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Longitude degrees must be numeric" Operator="DataTypeCheck" 
                                                                            Type="Double">*</asp:CompareValidator>
                                                                        <asp:RangeValidator ID="rvLong1" runat="server" ControlToValidate="txtLong1" 
                                                                            Display="Dynamic" ErrorMessage="Longitude degrees must be between 0 and 180"  ValidationGroup="valWorksite"
                                                                            MaximumValue="180" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                                                        degrees
                                                                        <asp:TextBox ID="txtLongMinutes" runat="server" MaxLength="10" tabIndex="13" 
                                                                            Width="75px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvLongMinutes" runat="server" 
                                                                            ControlToValidate="txtLongMinutes" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Please enter Longitude minutes">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="cvLongMinutes" runat="server" 
                                                                            ControlToValidate="txtLongMinutes" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Longitude minutes must be numberic" Operator="DataTypeCheck" 
                                                                            Type="Double">*</asp:CompareValidator>
                                                                        <asp:RangeValidator ID="rvLongMinutes" runat="server" 
                                                                            ControlToValidate="txtLongMinutes" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Longitude minutes must be between 0 and 60" MaximumValue="60" 
                                                                            MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                                                        minutes
                                                                        <asp:TextBox ID="txtLongSeconds" runat="server" MaxLength="10" tabIndex="14" 
                                                                            Width="75px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvLongSeconds" runat="server" 
                                                                            ControlToValidate="txtLongSeconds" DESIGNTIMEDRAGDROP="4867" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Please enter Longitude seconds">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="cvLongSeconds" runat="server" 
                                                                            ControlToValidate="txtLatSeconds" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Longitude seconds must be numeric" Operator="DataTypeCheck" 
                                                                            Type="Double">*</asp:CompareValidator>
                                                                        <asp:RangeValidator ID="rvLongSeconds" runat="server" 
                                                                            ControlToValidate="txtLongSeconds" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Longitude seconds must be between 0 and 60" MaximumValue="60" 
                                                                            MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                                                        seconds
                                                                        <asp:DropDownList ID="ddlEWMinutes" runat="server" tabIndex="15" Width="40px">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvEWMinutes" runat="server" 
                                                                            ControlToValidate="ddlEWMinutes" Display="Dynamic"  ValidationGroup="valWorksite"
                                                                            ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator>
                                                                        E/W</td>
                                                                </tr>
                                                            </table>
                                                            </asp:Panel>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Panel ID="pnlDecimal" runat="server" Visible="false">
                                                                <table id="Table4" border="0" cellpadding="1" cellspacing="1" width="300">
                                                                    <tr class="stdFont">
                                                                        <td align="right" style="HEIGHT: 16px">
                                                                            Latitude:</td>
                                                                        <td style="HEIGHT: 16px">
                                                                            <asp:TextBox ID="txtLat2" runat="server" MaxLength="10" tabIndex="16" 
                                                                                Width="75px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvLat2" runat="server" 
                                                                                ControlToValidate="txtLat2" Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Please enter Latitude degrees">*</asp:RequiredFieldValidator>
                                                                            <asp:CompareValidator ID="cvLat2" runat="server" ControlToValidate="txtLat2" 
                                                                                Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Latitude degrees must be numeric" Operator="DataTypeCheck" 
                                                                                Type="Double">*</asp:CompareValidator>
                                                                            <asp:RangeValidator ID="rvLat2" runat="server" ControlToValidate="txtLat2" 
                                                                                Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Latitude must be between 0 and 90 degrees" MaximumValue="90" 
                                                                                MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                                                            degrees
                                                                            <asp:DropDownList ID="ddlNSDecimal" runat="server" tabIndex="17" Width="40px">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvNSDecimal" runat="server" 
                                                                                ControlToValidate="ddlNSDecimal" Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Please select a Latitude direction">*</asp:RequiredFieldValidator>
                                                                            N/S</td>
                                                                    </tr>
                                                                    <tr class="stdFont">
                                                                        <td align="right">
                                                                            Longitude:</td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtLong2" runat="server" MaxLength="10" tabIndex="18" 
                                                                                Width="75px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvLong2" runat="server" 
                                                                                ControlToValidate="txtLong2" Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Please enter Longitude degrees">*</asp:RequiredFieldValidator>
                                                                            <asp:CompareValidator ID="cvLong2" runat="server" ControlToValidate="txtLong2" 
                                                                                Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Longitude degrees must be numeric" Operator="DataTypeCheck" 
                                                                                Type="Double">*</asp:CompareValidator>
                                                                            <asp:RangeValidator ID="rvLong2" runat="server" ControlToValidate="txtLong2" 
                                                                                Display="Dynamic" Enabled="False"  ValidationGroup="valWorksite"
                                                                                ErrorMessage="Longitude must be between 0 and 180 degrees" MaximumValue="180" 
                                                                                MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                                                            degrees
                                                                            <asp:DropDownList ID="ddlEWDecimals" runat="server" tabIndex="19" Width="40px">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvEWDecimal" runat="server"  ValidationGroup="valWorksite"
                                                                                ControlToValidate="ddlEWDecimals" Display="Dynamic" Enabled="False" 
                                                                                ErrorMessage="Please select a Longitude direction">*</asp:RequiredFieldValidator>
                                                                            E/W</td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </TABLE>
                                            </rad:RadAjaxPanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
									        <TABLE class="smallBorder" id="Table6" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										        cellPadding="1" width="746" border="0">
										        <TR class="DataGridHdr">
											        <TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Location Supervisor / OIM #1</TD>
										        </TR>
										        <TR>
											        <TD align="center">
												        <TABLE id="Table7" style="HEIGHT: 109px" cellSpacing="1" cellPadding="1" width="80%" border="0">
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px; HEIGHT: 26px" align="right">First Name:</TD>
														        <TD style="WIDTH: 161px; HEIGHT: 26px"><asp:textbox id="txtFName1" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px; HEIGHT: 26px" align="right">Last Name:</TD>
														        <TD style="HEIGHT: 26px"><asp:textbox id="txtLName1" runat="server" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														        <TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtPhone1" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														        <TD style="HEIGHT: 17px"></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">Address:</TD>
														        <TD colSpan="3"><asp:textbox id="txtAddr1" runat="server" Width="423px" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														        <TD colSpan="3"><asp:textbox id="txtCity1" runat="server" Width="208px" MaxLength="50"></asp:textbox>&nbsp;
															        <asp:textbox id="txtState1" runat="server" Width="122px" MaxLength="15"></asp:textbox>&nbsp;
															        <asp:textbox id="txtZip1" runat="server" Width="69px" MaxLength="10"></asp:textbox></TD>
													        </TR>
												        </TABLE>
											        </TD>
										        </TR>
									        </TABLE>
									        <BR>
									        <TABLE class="smallBorder" id="Table8" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										        cellPadding="1" width="746" border="0">
										        <TR class="DataGridHdr">
											        <TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Location Supervisor / OIM #2</TD>
										        </TR>
										        <TR>
											        <TD align="center">
												        <TABLE id="Table9" cellSpacing="1" cellPadding="1" width="80%" border="0">
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">First Name:</TD>
														        <TD style="WIDTH: 161px"><asp:textbox id="txtFName2" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px" align="right">Last Name:</TD>
														        <TD><asp:textbox id="txtLName2" runat="server" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														        <TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtPhone2" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														        <TD style="HEIGHT: 17px"></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">Address:</TD>
														        <TD colSpan="3"><asp:textbox id="txtAddr2" runat="server" Width="423px" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														        <TD colSpan="3"><asp:textbox id="txtCity2" runat="server" Width="208px" MaxLength="50"></asp:textbox>&nbsp;
															        <asp:textbox id="txtState2" runat="server" Width="122px" MaxLength="15"></asp:textbox>&nbsp;
															        <asp:textbox id="txtZip2" runat="server" Width="69px" MaxLength="10"></asp:textbox></TD>
													        </TR>
												        </TABLE>
											        </TD>
										        </TR>
									        </TABLE>
									        <br />
									        <TABLE class="smallBorder" id="Table1" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										        cellPadding="1" width="746" border="0">
										        <TR class="DataGridHdr">
											        <TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Company Rep #1</TD>
										        </TR>
										        <TR>
											        <TD align="center">
												        <TABLE id="Table2" cellSpacing="1" cellPadding="1" width="80%" border="0">
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">First Name:</TD>
														        <TD style="WIDTH: 161px"><asp:textbox id="txtFName3" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px" align="right">Last Name:</TD>
														        <TD><asp:textbox id="txtLName3" runat="server" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														        <TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtPhone3" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														        <TD style="HEIGHT: 17px"></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">Address:</TD>
														        <TD colSpan="3"><asp:textbox id="txtAddr3" runat="server" Width="423px" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														        <TD colSpan="3"><asp:textbox id="txtCity3" runat="server" Width="208px" MaxLength="50"></asp:textbox>&nbsp;
															        <asp:textbox id="txtState3" runat="server" Width="122px" MaxLength="15"></asp:textbox>&nbsp;
															        <asp:textbox id="txtZip3" runat="server" Width="69px" MaxLength="10"></asp:textbox></TD>
													        </TR>
												        </TABLE>
											        </TD>
										        </TR>
									        </TABLE> 
									        <br />
									        <TABLE class="smallBorder" id="Table10" style="WIDTH: 746px; HEIGHT: 134px" cellSpacing="1"
										        cellPadding="1" width="746" border="0">
										        <TR class="DataGridHdr">
											        <TD class="SecHdr" style="HEIGHT: 19px">&nbsp;Company Rep #2</TD>
										        </TR>
										        <TR>
											        <TD align="center">
												        <TABLE id="Table11" cellSpacing="1" cellPadding="1" width="80%" border="0">
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">First Name:</TD>
														        <TD style="WIDTH: 161px"><asp:textbox id="txtFName4" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px" align="right">Last Name:</TD>
														        <TD><asp:textbox id="txtLName4" runat="server" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px; HEIGHT: 17px" align="right">Phone Number:</TD>
														        <TD style="WIDTH: 161px; HEIGHT: 17px"><asp:textbox id="txtPhone4" runat="server" MaxLength="50"></asp:textbox></TD>
														        <TD style="WIDTH: 77px; HEIGHT: 17px"></TD>
														        <TD style="HEIGHT: 17px"></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">Address:</TD>
														        <TD colSpan="3"><asp:textbox id="txtAddr4" runat="server" Width="423px" MaxLength="50"></asp:textbox></TD>
													        </TR>
													        <TR class="stdFont" align="left">
														        <TD style="WIDTH: 124px" align="right">City / State / Zip Code:</TD>
														        <TD colSpan="3"><asp:textbox id="txtCity4" runat="server" Width="208px" MaxLength="50"></asp:textbox>&nbsp;
															        <asp:textbox id="txtState4" runat="server" Width="122px" MaxLength="15"></asp:textbox>&nbsp;
															        <asp:textbox id="txtZip4" runat="server" Width="69px" MaxLength="10"></asp:textbox></TD>
													        </TR>
												        </TABLE>
											        </TD>
										        </TR>
									        </TABLE>     
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align:right; padding:0px 10px 10px 10px;">
                                            <asp:Button ID="btnWorksite_Cancel" runat="server" Text="Cancel" 
                                                CssClass="btnSmall" CausesValidation="false" 
                                                onclick="btnWorksite_Cancel_Click" />&nbsp;<asp:Button 
                                                ID="btnWorksite_Save" runat="server" Text="Save" CssClass="btnSmall" 
                                                ValidationGroup="valWorksite" onclick="btnWorksite_Save_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hidWorksite_ID" runat="server" Value="0" />
                            </asp:View>
                            <asp:View ID="View3" runat="server">
                                <table style="width:100%; border:1px solid white;" id="tbleWorksiteGrid" runat="server">
                                    <tr>
                                       <td style="padding:10px;">
                                            <radG:RadGrid ID="grdEncounters" runat="server" AutoGenerateColumns="False" 
                                                GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
                                                Skin="Outlook2007" onneeddatasource="grdEncounters_NeedDataSource">
                                                <PagerStyle Mode="NextPrevAndNumeric" />

                                                <MasterTableView>
                                                    <HeaderStyle CssClass="RadGridHeader_LeftAlign" Width="20px"></HeaderStyle>
                                                    
                                                    <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                                    <RowIndicatorColumn Visible="False">
                                                        <HeaderStyle Width="20px"></HeaderStyle>
                                                    </RowIndicatorColumn>

                                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                                    </ExpandCollapseColumn>
                                                    
                                                    <Columns>
                                                        <radG:GridTemplateColumn HeaderText="Patient ID" SortExpression="PatientID">
                                                            <ItemTemplate>
                                                                <%# Eval("PatientID") %></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="Patient Name" SortExpression="LastName">
                                                            <ItemTemplate>
                                                                <a href='../Medic/Patient.aspx?patientid=<%# Eval("PatientID") %>'> <%# Eval("LastName") %>,&nbsp;<%# Eval("FirstName") %></a></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="Encounter Date" SortExpression="EncounterDate">
                                                            <ItemTemplate>
                                                                <%# Convert.ToDateTime(Eval("EncounterDate")).ToShortDateString() %></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="Status" SortExpression="EncounterStatus">
                                                            <ItemTemplate>
                                                                <%# GetStatus(Eval("EncounterStatus").ToString()) %></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="SSN" SortExpression="SSN">
                                                            <ItemTemplate>
                                                                <%# Eval("SSN") %></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="Patient Address" SortExpression="Address">
                                                            <ItemTemplate>
                                                                <%# Eval("Address") %>&nbsp;<%# Eval("City") %>,&nbsp;<%# Eval("State") %>&nbsp<%# Eval("Zip") %>&nbsp;<%# Eval("Country") %></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="Home Phone" SortExpression="HomePhone">
                                                            <ItemTemplate>
                                                                <%# Eval("HomePhone") %></ItemTemplate></radG:GridTemplateColumn><radG:GridTemplateColumn HeaderText="Worksite" SortExpression="Location">
                                                            <ItemTemplate>
                                                                <%# Eval("Location") %></ItemTemplate></radG:GridTemplateColumn></Columns>
                                                                <NoRecordsTemplate>
                                                                    Sorry but this user has not created any Patient Encounters.
                                                                </NoRecordsTemplate>
                                                            </MasterTableView>
                                                        </radG:RadGrid></td></tr></table></asp:View>
                            <asp:View ID="view4" runat="server">
                                <table style="width:100%; border:1px solid white;">
                                    <tr>
                                       <td style="padding:10px;">
                                            <uc5:UserVideoLibraryGrid ID="UserVideoLibraryGrid1" runat="server" ShowPager="True" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView></td></tr>
				
				<tr>
					<td style="text-align:left; padding:10px;"><span class="WhiteText"><a href="javascript:history.go(-1)" class="WhiteLnk">&nbsp;&lt;&nbsp;Back</a></span></td>
				</tr>
				<tr valign="bottom">
					<td>
					    <img src="/images/Grphc_BotBar.jpg" alt="" width="760" height="31" />
					</td>
				</tr>
			</table>
		
		</form>
	</body>
</html>

