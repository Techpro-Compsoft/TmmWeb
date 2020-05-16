<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoInformation.aspx.cs" Inherits="UsersAdmin.VideoInformation" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadTabStrip.Net2" namespace="Telerik.WebControls" tagprefix="radT" %>
<%@ Register Assembly="AjaxControlToolKit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register src="Controls/User_GeneralInformation.ascx" tagname="User_GeneralInformation" tagprefix="uc1" %>
<%@ Register src="Controls/User_SecurityInformation.ascx" tagname="User_SecurityInformation" tagprefix="uc2" %>
<%@ Register src="Controls/UserVideoPermissionRow.ascx" tagname="UserVideoPermissionRow" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<link href="/trinity.css" rel="stylesheet" type="text/css" />
	

	<style type="text/css">

/*the HiddenPicker CSS class and the following two CSS rules are required only
if you want to minimize the space taken up by the invisible datetimepicker*/



.HiddenPicker
{
	display:inline;
}
.HiddenPicker td
{
	padding:0 !important;
}


.HideTextBox
{
	width:1px !important;
	border:0 !important;
	margin:0 !important;
	background:none transparent !important;
}

</style>
	
</head>
	<body style="margin-top:0; margin-left:0; background-color:#000000;">
	<form runat="server" id="frm1">
	<asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
	
	<telerik:RadCodeBlock ID="rcb1" runat="server">
	
	<script type="text/javascript">

	    function showDiv(div, show) {
	        ctrlDiv = document.getElementById(div);
	        if (show) {
	            ctrlDiv.style.display = '';
	        }
	        else {
	            ctrlDiv.style.display = 'none';
	        }
	    }
	
	</script>
	
	</telerik:RadCodeBlock>
	<telerik:RadAjaxManager ID="radajaxmgr2" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="rdpExpiresOn_Medic">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rdpExpiresOn_Medic" />
                    <telerik:AjaxUpdatedControl ControlID="litExpiresOn_medic" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rdpExpiresOn_Company">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rdpExpiresOn_Company" />
                    <telerik:AjaxUpdatedControl ControlID="litExpiresOn_Company" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rdpExpiresOn_Customer">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rdpExpiresOn_Customer" />
                    <telerik:AjaxUpdatedControl ControlID="litExpiresOn_Customer" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
	</telerik:RadAjaxManager>
	
	    <center>
			<table width="760" style="height:100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
				<tr style="height:151" valign="top">
					<td>
					    <img src="/images/Trinity_GraphicBar_VideoAdmin.jpg" alt="" width="760" height="78" />
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
				    <td style="color:White; background-color:#307FA3; font-family:Arial; height:30px;">EDIT VIDEO</td>
				</tr>
				<tr>
				    <td style="text-align:right; color:White; font-family:Arial; font-size:12px; padding-right:5px;">
				        <span style="color:red;">*</span> Indicates a required field
				    </td>
				</tr>
                <tr>
                    <td style="text-align:left; padding:15px 0px 15px 15px;">
                        <span class="WhiteText">
                            <table cellspacing="0">
                                <tr>
                                    <td style="width:150px;"><span style="color:red; font-size:12px;">*</span> Name:</td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" Width="250px" MaxLength="100"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" Text="Required" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span style="color:red; font-size:12px;">*</span> Category:</td>
                                    <td><asp:DropDownList ID="ddlCategory" runat="server" Width="256px"></asp:DropDownList> </td>
                                </tr>
                                <tr  style="vertical-align:top;">
                                    <td style=" padding-top:5px;"><span style="color:red; font-size:12px;">*</span> Description:</td>
                                    <td><asp:TextBox ID="txtDescription" runat="server" Width="400px" Height="100px" MaxLength="200" TextMode="MultiLine" Font-Names="Arial"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" Text="Required" ControlToValidate="txtDescription" Display="Dynamic"></asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                            <br />
                            Please specify users who will have access to this video below.<br />
                            <div style="padding-left:25px;">                                
                                <asp:CheckBox ID="chkMedic" runat="server"  onclick="showDiv('divMedicOptions',this.checked);" Text="Medic Users" />
                                <div style="padding-left:25px;" id="divMedicOptions">
                                    <asp:RadioButton ID="rdoMedic_All" runat="server" GroupName="grpUserType_Medic" onclick="showDiv('divAllMedicUsers',this.checked); showDiv('divSpecificMedicUsers',!this.checked); " Text="All Medic Users" /><br />
                                    <div style="padding-left:25px;" id="divAllMedicUsers">
                                        Access Type:
                                        <br />
                                        <div style="padding-left:25px;">
                                            <asp:RadioButton ID="rdoMedic_Unlimited" runat="server" Text="Unlimited" GroupName="grpmedic_choices" onclick="showDiv('divExpiresOn_Medic',!this.checked);" />
                                            <br />
                                            <table cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdoMedic_Expires" runat="server" Text="Expires" GroupName="grpmedic_choices" onclick="showDiv('divExpiresOn_Medic',this.checked);" />        
                                                    </td>
                                                    <td>
                                                        <div id="divExpiresOn_Medic" style="width: 200px; padding-top:3px;">
                                                            on
                                                            <telerik:RadDatePicker ID="rdpExpiresOn_Medic" runat="server" OnSelectedDateChanged="rdpExpiresOn_Medic_SelectedDateChanged"
                                                                AutoPostBack="true" Width="26px">
                                                                <DateInput ID="DateInput1" runat="server" CssClass="HideTextBox" AutoPostBack="True">
                                                                </DateInput>
                                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x">
                                                                </Calendar>
                                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                            </telerik:RadDatePicker>&nbsp;&nbsp;
                                                            <asp:Literal ID="litExpiresOn_medic" runat="server"></asp:Literal>
                                                        </div>        
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                            <br />
                                        </div>
                                    </div>
                                    <asp:RadioButton ID="rdoMedic_Specific" runat="server" GroupName="grpUserType_Medic" onclick="showDiv('divAllMedicUsers',!this.checked); showDiv('divSpecificMedicUsers',this.checked); " Text="Specific Medic Users" /><br />
                                <div  id="divSpecificMedicUsers">
                                    <br />Search for User: &nbsp;&nbsp;<telerik:RadComboBox ID="ddlMedics" runat="server" MarkFirstMatch="true" EmptyMessage="Select..." AllowCustomText="true" DataTextField="FullName" DataValueField="UserID"></telerik:RadComboBox>&nbsp;&nbsp;
                                    <asp:Button ID="btnSearchMedics" runat="server" Text="Submit" 
                                        CssClass="btnSmall" onclick="btnSearchMedics_Click" /><br /><br />
                                    <table style="width:619px; background-color:#347DA0;"><tr><td style="width:200px;">NAME</td><td style="width:200px;">ACCESS TYPE</td><td style="width:219px;">EXPIRATION DATE</td></tr></table>
                                    <asp:Panel ID="pnlMedicUsers" runat="server" ScrollBars="Auto" Height="200px" Width="619px">    
                                        <asp:Repeater ID="rptMedicUsers" runat="server" 
                                            onitemdatabound="rptMedicUsers_ItemDataBound">
                                            <ItemTemplate>
                                                <uc3:UserVideoPermissionRow ID="medRow" runat="server" />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </asp:Panel>
                                    <uc3:UserVideoPermissionRow ID="uvpRow_Medic" runat="server" />
                                </div>
                                </div>
                            </div>
                            <hr style="width:97%;" />
                            <div style="padding-left:25px;">
                            <asp:CheckBox ID="chkCompany" runat="server" onclick="showDiv('divCompanyOptions',this.checked);" Text="Company Users" />
                                <div style="padding-left:25px;" id="divCompanyOptions">
                                    <asp:RadioButton ID="rdoCompany_All" runat="server" GroupName="grpUserType_company" onclick="showDiv('divAllCompanyUsers',this.checked);  showDiv('divSpecificCompanyUsers',!this.checked); " text="All Company Users" /><br />
                                    <div style="padding-left:25px; width:350px;" id="divAllCompanyUsers">
                                        Access Type:
                                        <br />
                                        <div style="padding-left:25px;">
                                            <asp:RadioButton ID="rdoCompany_Unlimited" runat="server" Text="Unlimited" GroupName="grpcompany_choices" onclick="showDiv('divExpiresOn_Company',!this.checked);"/>
                                            <br />
                                            <table cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdoCompany_Expires" runat="server" Text="Expires" GroupName="grpcompany_choices" onclick="showDiv('divExpiresOn_Company',this.checked);" />        
                                                    </td>
                                                    <td>
                                                        <div id="divExpiresOn_Company" style="width: 200px; padding-top:3px;">
                                                            on
                                                            
                                                            <telerik:RadDatePicker ID="rdpExpiresOn_Company" runat="server" Width="26px" OnSelectedDateChanged="rdpExpiresOn_Company_SelectedDateChanged"
                                                                AutoPostBack="true">
                                                                <DateInput ID="DateInput2" runat="server" CssClass="HideTextBox" AutoPostBack="True">
                                                                </DateInput>
                                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x">
                                                                </Calendar>
                                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                            </telerik:RadDatePicker>&nbsp;&nbsp;
                                                            <asp:Literal ID="litExpiresOn_Company" runat="server"></asp:Literal>
                                                        
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                            <br />
                                        </div>
                                    </div>
                                    <asp:RadioButton ID="rdoCompany_Specific" runat="server" GroupName="grpUserType_company" onclick="showDiv('divAllCompanyUsers',!this.checked);  showDiv('divSpecificCompanyUsers',this.checked); " text="Specific Company Users" /><br />
                                <div  id="divSpecificCompanyUsers">
                                    <br />Search for User: &nbsp;&nbsp;<telerik:RadComboBox ID="ddlCompanyUsers" runat="server" MarkFirstMatch="true" EmptyMessage="Select..." AllowCustomText="true" DataTextField="FullName" DataValueField="UserID"></telerik:RadComboBox>&nbsp;&nbsp;
                                    <asp:Button ID="btnSearchCompanyUser" runat="server" Text="Submit" 
                                        CssClass="btnSmall" onclick="btnSearchCompanyUser_Click" /><br /><br />
                                    <table style="width:619px; background-color:#347DA0;"><tr><td style="width:200px;">NAME</td><td style="width:200px;">ACCESS TYPE</td><td style="width:219px;">EXPIRATION DATE</td></tr></table>
                                    <asp:Panel ID="pnlCompanyUsers" runat="server" ScrollBars="Auto" Height="200px" Width="619px">    
                                        <asp:Repeater ID="rptCompanyUsers" runat="server" 
                                            onitemdatabound="rptCompanyUsers_ItemDataBound">
                                            <ItemTemplate>
                                                <uc3:UserVideoPermissionRow ID="companyRow" runat="server" />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </asp:Panel>
                                    <uc3:UserVideoPermissionRow ID="uvpRow_Company" runat="server" />
                                </div>
                                </div>
                            </div>
                            <hr style="width:97%;" />
                            <div style="padding-left:25px;">        
                                <asp:CheckBox ID="chkCustomer" runat="server" onclick="showDiv('divCustomerOptions',this.checked); " Text="Customer Users" />
                                <div style="padding-left:25px;" id="divCustomerOptions">
                                    <asp:RadioButton ID="rdoCustomer_All" runat="server" GroupName="grpUserType_Customer" onclick="showDiv('divAllCustomerUsers',this.checked); showDiv('divSpecificCustomerUsers',!this.checked);" Text="All Customer Users" /><br />
                                    <div style="padding-left:25px;" id="divAllCustomerUsers">
                                        Access Type:
                                        <br />
                                        <div style="padding-left:25px;">
                                            <asp:RadioButton ID="rdoCustomer_Unlimited" runat="server" Text="Unlimited" GroupName="grpcustomer_choices" onclick="showDiv('divExpiresOn_Customer',!this.checked);" />
                                            <br />
                                            <table cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdoCustomer_Expires" runat="server" Text="Expires" GroupName="grpcustomer_choices"  onclick="showDiv('divExpiresOn_Customer',this.checked);"/>        
                                                    </td>
                                                    <td>
                                                        <div id="divExpiresOn_Customer" style="width: 200px; padding-top:3px;">
                                                            on
                                                            <telerik:RadDatePicker ID="rdpExpiresOn_Customer" runat="server" Width="26px" OnSelectedDateChanged="rdpExpiresOn_Customer_SelectedDateChanged"
                                                                AutoPostBack="true">
                                                                <DateInput ID="DateInput3" runat="server" CssClass="HideTextBox" AutoPostBack="True">
                                                                </DateInput>
                                                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x">
                                                                </Calendar>
                                                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                                            </telerik:RadDatePicker>&nbsp;&nbsp;
                                                            <asp:Literal ID="litExpiresOn_Customer" runat="server"></asp:Literal>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </div>
                                    </div>
                                    <asp:RadioButton ID="rdoCustomer_Specific" runat="server" GroupName="grpUserType_Customer" onclick="showDiv('divAllCustomerUsers',!this.checked); showDiv('divSpecificCustomerUsers',this.checked); " Text="Specific Customer Users" />
                                    <div  id="divSpecificCustomerUsers">
                                        <br />Search for User: &nbsp;&nbsp;<telerik:RadComboBox ID="ddlCustomers" runat="server" MarkFirstMatch="true" EmptyMessage="Select..." AllowCustomText="true" DataTextField="FullName" DataValueField="UserID"></telerik:RadComboBox>&nbsp;&nbsp;
                                        <asp:Button ID="btnSearchCustomer" runat="server" Text="Submit" 
                                            CssClass="btnSmall" onclick="btnSearchCustomer_Click" /><br /><br />
                                        <table style="width:619px; background-color:#347DA0;"><tr><td style="width:200px;">NAME</td><td style="width:200px;">ACCESS TYPE</td><td style="width:219px;">EXPIRATION DATE</td></tr></table>
                                        <asp:Panel ID="pnlCustomerUsers" runat="server" ScrollBars="Auto" Height="200px" Width="619px">    
                                            <asp:Repeater ID="rptCustomerUsers" runat="server" 
                                                onitemdatabound="rptCustomerUsers_ItemDataBound">
                                                <ItemTemplate>
                                                    <uc3:UserVideoPermissionRow ID="customerRow" runat="server" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </asp:Panel>
                                        <uc3:UserVideoPermissionRow ID="uvpRow_Customer" runat="server" />
                                    </div>
                                    </div>
                            </div>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td style=" padding-left:40px; padding-right:40px;">
                        <table style="width:100%;">
                            <tr>
                                <td style="text-align:left;"><asp:Button ID="btnCancel" CausesValidation="false" runat="server" onclick="btnCancel_Click" Text="Cancel" CssClass="btnSmall" /></td>
                                <td style="text-align:right;"><asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" CssClass="btnSmall"/></td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
			</table>
		</center>
		
		    
        <telerik:RadCodeBlock ID="rdb2" runat="server">
		    
		<script type="text/javascript">

		    showDiv('divMedicOptions', document.getElementById('<%= chkMedic.ClientID %>').checked);
		    showDiv('divAllMedicUsers', document.getElementById('<%= rdoMedic_All.ClientID %>').checked);
		    showDiv('divSpecificMedicUsers', document.getElementById('<%= rdoMedic_Specific.ClientID %>').checked);
		    showDiv('divExpiresOn_Medic', document.getElementById('<%= rdoMedic_Expires.ClientID %>').checked);

		    showDiv('divCompanyOptions', document.getElementById('<%= chkCompany.ClientID %>').checked);
		    showDiv('divAllCompanyUsers', document.getElementById('<%= rdoCompany_All.ClientID %>').checked);
		    showDiv('divSpecificCompanyUsers', document.getElementById('<%= rdoCompany_Specific.ClientID %>').checked);
		    showDiv('divExpiresOn_Company', document.getElementById('<%= rdoCompany_Expires.ClientID %>').checked);

		    showDiv('divCustomerOptions', document.getElementById('<%= chkCustomer.ClientID %>').checked);
		    showDiv('divAllCustomerUsers', document.getElementById('<%= rdoCustomer_All.ClientID %>').checked);
		    showDiv('divSpecificCustomerUsers', document.getElementById('<%= rdoCustomer_Specific.ClientID %>').checked);
		    showDiv('divExpiresOn_Customer', document.getElementById('<%= rdoCustomer_Expires.ClientID %>').checked);
		
		</script>
		
		</telerik:RadCodeBlock>
		
	</form>
    </body>
</html>