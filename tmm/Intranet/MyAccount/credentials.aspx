<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="credentials.aspx.vb" Inherits="MyAccount.credentials" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Credentials</title>
    
    <link href="trinity.css" type="text/css" rel="stylesheet">
</head>
<body bgColor="#000000" topMargin="0">
    <form id="form1" runat="server">
        <div>
            <table height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<tr vAlign="top">
					<td align="center" width="100%">
						<table class="SmallBorder"
							height="560" width="758">
							<tr vAlign="top" height="100">
								<td>
								    <IMG src="images/Grphc_MyAccount.jpg">
								    <BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
								</td>
							</tr>
							<tr height="20">
								<td></td>
							</tr>
							
							<tr vAlign="top" height="429">
								<td vAlign="top" class="stdFont" style="padding-left:7px;">
								
								    <radA:RadAjaxPanel ID="pnlAjax" runat="server" EnableAJAX="true" EnableOutsideScripts="true">
								
								        <!-- "Tabstrip" -->
								        <table border="0" cellpadding="0" cellspacing="0" style="text-align:left;" align="center" width="98%">
							                <tr>
							                    <td id="tdMyAccount" runat="server">
							                        <table cellpadding="0" cellspacing="0" style="text-align:center;">
							                            <tr>
							                                <td>
							                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
							                                        <tr>
							                                            <td height="23px" style="background-color:#548C9A;">
							                                                <img src="images/tab_inactive_lt.gif" />
							                                            </td>
							                                            <td background="images/tab_inactive_mid.gif">
							                                                <a href="default.aspx" class="ViewHeaderNotSelected">My Account</a>
							                                            </td>
							                                            <td style="background-color:#548C9A;">
							                                                <img src="images/tab_inactive_rt.gif" />
							                                            </td>       
							                                        </tr>
							                                    </table>
							                                </td>
    							                            
    							                            <td id="tdCredentials" runat="server">
    							                                <table cellpadding="0" cellspacing="0" style="width:100%;">
    							                                    <tr>
    							                                        <td width="2px"></td>
    							                            
							                                            <td style="background-color:#FFFFFF;">
							                                                <img src="images/tab_active_lt.gif" />
							                                            </td>
							                                            <td background="images/tab_active_mid.gif" class="ViewHeaderSelected">
							                                                Credentials
							                                            </td>
							                                            <td style="background-color:#FFFFFF;">
							                                                <img src="images/tab_active_rt.gif" />
							                                            </td>       
    							                                    </tr>
    							                                </table>
    							                            </td>
    							                            
    							                            <td id="tdOvertimeAvailability" runat="server">
    							                                <table cellpadding="0" cellspacing="0" style="width:100%;">
    							                                    <tr>
    							                                        <td width="2px"></td>
    							                            
							                                            <td style="background-color:#548C9A;">
							                                                <img src="images/tab_inactive_lt.gif" />
							                                            </td>
							                                            <td background="images/tab_inactive_mid.gif">
                                                                            <a href="overtimelist.aspx" class="ViewHeaderNotSelected">Overtime Availability</a>
                                                                        </td>
							                                            <td style="background-color:#548C9A;">
							                                                <img src="images/tab_inactive_rt.gif" />
							                                            </td>
    							                                    </tr>
    							                                </table>
    							                            </td>
							                            </tr>    
							                        </table>
							                    </td>
    							                
							                </tr>
							            </table>
							            <!-- END Tabstrip -->
    								
									    <div>
									        <table id="table3" cellSpacing="1" cellPadding="1" width="98%" align="center" style="border:solid 1px #FFFFFF;">
		                                        <tr class="stdFont">
			                                        <td align="center">
				                                        <p class="stdFont">
				                                            <font class="stdFont" face="Times New Roman" color="#000000" size="3">
				                                                <%-- The SortExpression values correspond to the SortFieldEnum values in credentials.aspx.vb --%>
						                                        <asp:DataGrid id="grdResults" RUNAT="server" CSSCLASS="normal" WIDTH="740px" ALLOWSORTING="true"
							                                        AUTOGENERATECOLUMNS="False" GRIDLINES="None" CELLPADDING="2" HEIGHT="1px" BORDERSTYLE="Solid"
							                                        BORDERWIDTH="1px" BORDERCOLOR="White" font-SIZE="X-Small">
							                                        <AlternatingItemStyle CssClass="AlternatingItem"></AlternatingItemStyle>
							                                        <ItemStyle CssClass="Item"></ItemStyle>
							                                        <HeaderStyle CssClass="DataGridHdr" ForeColor="#FFFFFF"></HeaderStyle>
							                                        <Columns>
								                                        <asp:BoundColumn Visible="False" DataField="MedicCredID" SortExpression="1"></asp:BoundColumn>
								                                        <asp:TemplateColumn HeaderText="Credential" SortExpression="2">
								                                            <ItemTemplate>
								                                                <%# Eval("IndexMedicCredentials.MedicCredentialType") %>
								                                            </ItemTemplate>
								                                        </asp:TemplateColumn>
								                                        <asp:TemplateColumn HeaderText="Expiration Date" SortExpression="3">
								                                            <ItemTemplate>
								                                                 <%# GetMedicCredExpDate(Eval("MedicCredExpDate")) %>
								                                            </ItemTemplate>
								                                        </asp:TemplateColumn>
								                                        <asp:TemplateColumn HeaderText="Note" SortExpression="4">
								                                            <ItemTemplate>
								                                                <%# GetMedicCredNote(Eval("MedicCredNote")) %>
								                                            </ItemTemplate>
								                                        </asp:TemplateColumn>
							                                        </Columns>
							                                        <PagerStyle Height="10px" Font-Size="X-Small" Font-Names="Arial" HorizontalAlign="Right" BackColor="#307FA3"
								                                        Mode="NumericPages"></PagerStyle>
						                                        </asp:DataGrid>
						                                    </font>
					                                        
					                                        <asp:Label id="lblNoCredentials" runat="server" Text="There is currently no credential information available."></asp:Label>
					                                    </p>
			                                        </td>
		                                        </tr>
	                                        </table>
									    </div>
									
									</radA:RadAjaxPanel>
								</td>
							</tr>
							<tr vAlign="top" height="31">
								<td align="center"><IMG src="/images/Grphc_BotBar.jpg"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
        
        </div>
    </form>
</body>
</html>
