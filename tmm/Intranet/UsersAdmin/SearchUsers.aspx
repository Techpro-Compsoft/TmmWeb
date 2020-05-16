<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchUsers.aspx.cs" Inherits="UsersAdmin.SearchUsers" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadWindow.Net2" namespace="Telerik.WebControls" tagprefix="radW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="/trinity.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; margin-left:0; background-color:#000000;">
    <form id="frm1" runat="server">
        <div style="text-align:center">
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
                        <td style="padding:10px 10px 10px 10px">
                        <table style="width:100%; text-align:left;" class="tblSection">
                            <tr>
                                <td colspan="2" style="text-align:center; background-color:#307FA3; padding:5px 5px 5px 5px"><span class="WhiteText"><b>Users Search:</b></span></td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="WhiteText"><b>First Name</b></span>
                                    <asp:TextBox ID="txtFirstName" runat="server" Width="270px" />
                                </td>
                                <td style="text-align:right">
                                    <span class="WhiteText"><b>Last Name</b></span>
                                    <asp:TextBox ID="txtLastName" runat="server" Width="270px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="WhiteText"><b>E-mail Address</b></span>
                                    <asp:TextBox ID="txtEmail" runat="server" Width="245px" />
                                </td>
                                <td style="text-align:right">
                                    <span class="WhiteText"><b>User Type</b></span>
                                    <asp:DropDownList ID="ddlUserType" runat="server" Width="275px">
                                    <asp:ListItem Value="0" Text="All Users" />
                                    <asp:ListItem Value="1" Text="Office" />
                                    <asp:ListItem Value="2" Text="Medic" />
                                    <asp:ListItem Value="3" Text="Customer" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding-top:5px">
                                    <span class="WhiteText"><b>Status</b></span>
                                    <asp:RadioButton ID="rdoActive" Text="Active" TextAlign="Right" runat="server" GroupName="rdoStatus" CssClass="WhiteText" />&nbsp;&nbsp;
                                    <asp:RadioButton ID="rdoInactive" Text="Inactive" TextAlign="Right" runat="server" GroupName="rdoStatus" CssClass="WhiteText" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:right; padding-bottom:10px">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btnSmall" onclick="btnSearch_Click" />
                                </td>drb
                            </tr>
            </table>
            <rad:RadAjaxPanel ID="pnlSearchResults" runat="server">
           
                <radG:RadGrid ID="rgUsers" runat="server" AutoGenerateColumns="False" OnNeedDataSource="rgUsers_NeedDataSource"
                                GridLines="Vertical" Width="740px" AllowPaging="True" AllowSorting="True" 
                                Skin="Outlook2007">
                                <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                <MasterTableView>
                                    <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        
                                        <radG:GridBoundColumn UniqueName="UserID" DataField="UserID" HeaderText="UserID" Visible="false" />
                                        <radG:GridTemplateColumn SortExpression="SortName" HeaderText="Name">
                                            <ItemTemplate>
                                                <%# GetNameLink(Convert.ToString(Eval("FirstName")),Convert.ToString(Eval("LastName")),Convert.ToInt32(Eval("ID")), Convert.ToString(Eval("CustomerID")), Convert.ToInt32(Eval("UserType.ID"))) %>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridBoundColumn UniqueName="UserType" DataField="UserType.UserType1" HeaderText="User Type" />
                                        <radG:GridBoundColumn UniqueName="Email" DataField="Email" HeaderText="E-mail Address" />
                                        <radG:GridTemplateColumn HeaderText="Status">
                                            <ItemTemplate>
                                                <%# SetStatusText(Convert.ToBoolean(Eval("MedicStatus"))) %>
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                    </Columns>
                                    <SortExpressions>
                                        <radG:GridSortExpression FieldName="LastName" SortOrder="Ascending" />
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
            
        </div>
        <asp:ScriptManager ID="sManager" runat="server"></asp:ScriptManager>
    </form>
</body>
</html>
