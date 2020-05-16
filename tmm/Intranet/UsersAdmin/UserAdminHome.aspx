<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAdminHome.aspx.cs" Inherits="UsersAdmin.UserAdminHome" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>

<%@ Register Assembly="RadTabStrip.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadWindow.Net2" namespace="Telerik.WebControls" tagprefix="radW" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
	<link href="/trinity.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
    legend{  
     color:#ffffff;
    } 
</style>
</head>
	<body style="margin-top:0; margin-left:0; background-color:#000000;">
	<form runat="server" id="frm1">
	    <center>
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
				    <td style="padding:20px 0px 10px 0px;">
				        <table style="width:100%;">
				            <tr>
				                <td style="text-align:left; padding-left:10px;">
				                    <span class="WhiteText">User Type</span>
				   
				                    <asp:DropDownList ID="ddlUserTypes" runat="server" Width="250"  
                                        AutoPostBack="true" onselectedindexchanged="ddlUserTypes_SelectedIndexChanged">
				                        <asp:ListItem Text="Trinity - Office" Value="1" Selected="True"></asp:ListItem>
				                        <asp:ListItem Text="Trinity - Medic" Value="2"></asp:ListItem>
				                        <asp:ListItem Text="Customer" Value="3"></asp:ListItem>
				                    </asp:DropDownList>
				                </td>
				                <td style="text-align:right; padding-right:10px;">
				                    <asp:Button ID="btnAddNewUser" runat="server" Text="Add New User" 
                                        CssClass="btnSmall" onclick="btnAddNewUser_Click" />
				                </td>
				            </tr>
				        </table>
				    </td>
             
				</tr>
				<tr>
				    <td style="padding:10px;">
                        <rad:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                        <table style="width:100%;margin-bottom:-4px; ">
                            <tr>
                                <td>
                                    <rad:RadTabStrip ID="tabActiveUsers" runat="server"  Skin="Web20" AutoPostBack="true"
                                        ontabclick="tabActiveUsers_TabClick">
                                        <Tabs>
                                            <rad:Tab ID="tabActive" runat="server" Value="1" Text="Active Users"></rad:Tab>
                                            <rad:Tab ID="tabInactive" runat="server" Value="0" Text="Inactive Users"></rad:Tab>
                                        </Tabs>
                                    </rad:RadTabStrip>
                                </td>
                                <td style="text-align:right;">
                                    <a href="SearchUsers.aspx" runat="server" style="color:White; font-family:Arial; font-size:10pt;">Search Users</a>
                                </td>
                            </tr>
                        </table>
                            <radG:RadGrid ID="grdOfficeUsers" runat="server" AutoGenerateColumns="False"
                                GridLines="Vertical" Width="740px" AllowPaging="True" AllowSorting="True" 
                                Skin="Outlook2007" onneeddatasource="grdOfficeUsers_NeedDataSource" >
                            <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />                            
                                <MasterTableView>
                                    
                                    <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <radG:GridTemplateColumn SortExpression="LastName" HeaderText="Name">
                                            <ItemTemplate>
                                                <%# GetNameLink(Convert.ToString(Eval("FirstName")),Convert.ToString(Eval("LastName")),Convert.ToInt32(Eval("ID"))) %>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>         
                                        <radG:GridTemplateColumn SortExpression="Addr1" HeaderText="Address">
                                            <ItemTemplate>
                                                <%#Eval("Addr1")%> <%#Eval("Addr2")%><br />
                                                <%#Eval("City")%> <%#Eval("State")%> <%#Eval("PostalCode")%><br />
                                                <%#Eval("Country")%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn HeaderText="Contact Numbers">
                                            <ItemTemplate>
                                                <%# GetMedicOrOfficePhoneNumbers(((System.Collections.Generic.List<TMMModel.Phones>)Eval("PhoneNumbers")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn SortExpression="Email" HeaderText="Email Address">
                                            <ItemTemplate>
                                                <%# GetEmail(Convert.ToString(Eval("Email")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn HeaderText="Last Login<br />Date/Time" >
                                            <ItemTemplate>
                                                <%# GetLastLogin2((System.Collections.Generic.List<TMMModel.vwLastUserLoginPerUser>)(Eval("LastLogin")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                    </Columns>
                                    <SortExpressions>
                                        <radG:GridSortExpression FieldName="LastName" SortOrder="Ascending" />
                                    </SortExpressions>
                                    <NoRecordsTemplate>
                                        Sorry but there are no Office Users to display.
                                    </NoRecordsTemplate>
                                </MasterTableView>
                            </radG:RadGrid>
                            
                            <radG:RadGrid ID="grdMedicUsers" runat="server" AutoGenerateColumns="False"
                                GridLines="Vertical" Width="740px" AllowPaging="True" AllowSorting="True" 
                                Skin="Outlook2007" onneeddatasource="grdMedicUsers_NeedDataSource" >
                                <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                <MasterTableView>
                                    <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <radG:GridTemplateColumn SortExpression="LastName" HeaderText="Name">
                                            <ItemTemplate>
                                                <%# GetNameLink(Convert.ToString(Eval("FirstName")),Convert.ToString(Eval("LastName")),Convert.ToInt32(Eval("ID"))) %>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>         
                                        <radG:GridTemplateColumn SortExpression="CurrentWorksiteName" HeaderText="Current Worksite">
                                            <ItemTemplate>
                                                <%# Eval("CurrentWorksiteName") %>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn HeaderText="Contact Numbers">
                                            <ItemTemplate>
                                                <%# GetMedicOrOfficePhoneNumbers(((System.Collections.Generic.List<TMMModel.Phones>)Eval("PhoneNumbers")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn SortExpression="Email" HeaderText="Email Address">
                                            <ItemTemplate>
                                                <%# GetEmail(Convert.ToString(Eval("Email")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn HeaderText="Last Login<br />Date/Time" >
                                            <ItemTemplate>
                                                <%# GetLastLogin2((System.Collections.Generic.List<TMMModel.vwLastUserLoginPerUser>)(Eval("LastLogin")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                    </Columns>
                                    <SortExpressions>
                                        <radG:GridSortExpression FieldName="LastName" SortOrder="Ascending" />
                                    </SortExpressions>
                                    <NoRecordsTemplate>
                                        Sorry but there are no Medics to display.
                                    </NoRecordsTemplate>
                                </MasterTableView>
                            </radG:RadGrid>  
                            
                            <radG:RadGrid ID="grdCustomerUsers" runat="server" AutoGenerateColumns="False"
                                GridLines="Vertical" Width="740px" AllowPaging="True" AllowSorting="True" 
                                Skin="Outlook2007" onneeddatasource="grdCustomerUsers_NeedDataSource" >
                                <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                <MasterTableView>
                                    
                                    <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <radG:GridTemplateColumn SortExpression="Name" HeaderText="Name">
                                            <ItemTemplate>
                                                <%# GetNameLink(Convert.ToString(Eval("Name")), Convert.ToInt32(Eval("ID")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>         
                                        <radG:GridTemplateColumn SortExpression="Addr1" HeaderText="Address">
                                            <ItemTemplate>
                                                <%#Eval("Addr1")%> <%#Eval("Addr2")%><br />
                                                <%#Eval("City")%> <%#Eval("State")%> <%#Eval("PostalCode")%><br />
                                                <%#Eval("Country")%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn HeaderText="Contact Numbers">
                                            <ItemTemplate>
                                                <%# GetCustomerPhoneNumbers(((System.Collections.Generic.List<TMMModel.Phones>)Eval("PhoneNumbers")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn SortExpression="Email" HeaderText="Email Address">
                                            <ItemTemplate>
                                                <%# GetEmail(Convert.ToString(Eval("Email")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridTemplateColumn HeaderText="Last Login">
                                            <ItemTemplate>
                                                <%# GetLastCustomerLogin(Convert.ToInt32(Eval("ID")))%>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                    </Columns>
                                    <SortExpressions>
                                        <radG:GridSortExpression FieldName="Name" SortOrder="Ascending" />
                                    </SortExpressions>
                                    <NoRecordsTemplate>
                                        Sorry but there are no Customer Users to display.
                                    </NoRecordsTemplate>
                                </MasterTableView>
                            </radG:RadGrid>
                        </rad:RadAjaxPanel>
				    </td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr valign="bottom">
					<td>
					    <img src="/images/Grphc_BotBar.jpg" alt="" width="760" height="31" />
					</td>
				</tr>
			</table>
		</center>
		<radW:RadWindowManager ID="radWindowMgr" runat="server" Modal="true" Height="250px" Width="500px"></radW:RadWindowManager>

		</form>
	</body>
</html>
