<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="overtimelist.aspx.vb" Inherits="MyAccount.overtimelist" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Overtime Availability</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="trinity.css" type="text/css" rel="stylesheet">
		<script type="text/javascript">
		    function OpenAdd()
		    {
		        var oWnd = window.radopen(null, "rwOvertime");
		        oWnd.SetUrl(oWnd.GetUrl());
		    }
		    
		    function GetRadWindow()
		    {
		        var oWindow = null;
		        if (window.radWindow) oWindow = window.radWindow;
		        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
		        return oWindow;
		    }
        </script>
        
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" RUNAT="server">
			<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<TR vAlign="top">
					<TD align="center" width="100%">
						<TABLE class="SmallBorder"
							height="560" width="758">
							<TR vAlign="top" height="100">
								<TD>
								    <IMG src="images/Grphc_OvertimeAvail.jpg">
								    <BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
								</TD>
							</TR>
							<tr height="20">
								<td></td>
							</tr>
							<TR vAlign="top" height="429">
								<TD vAlign="top" align="center">
									<radA:RadAjaxPanel ID="pnlAjax" runat="server" EnableOutsideScripts="true">
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
							                                            <td background="images/tab_inactive_mid.gif" class="ViewHeaderNotSelected">
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
    							                            
							                                            <td style="background-color:#548C9A;">
							                                                <img src="images/tab_inactive_lt.gif" />
							                                            </td>
							                                            <td background="images/tab_inactive_mid.gif">
							                                                <a href="credentials.aspx" class="ViewHeaderNotSelected">Credentials</a>
							                                            </td>
							                                            <td style="background-color:#548C9A;">
							                                                <img src="images/tab_inactive_rt.gif" />
							                                            </td>       
    							                                    </tr>
    							                                </table>
    							                            </td>
    							                            
    							                            <td id="tdOvertimeAvailability" runat="server">
    							                                <table cellpadding="0" cellspacing="0" style="width:100%;">
    							                                    <tr>
    							                                        <td width="2px"></td>
    							                            
							                                            <td style="background-color:#FFFFFF;">
							                                                <img src="images/tab_active_lt.gif" />
							                                            </td>
							                                            <td background="images/tab_active_mid.gif" class="ViewHeaderSelected">
                                                                            Overtime Availability
                                                                        </td>
							                                            <td style="background-color:#FFFFFF;">
							                                                <img src="images/tab_active_rt.gif" />
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
									    <TABLE  id="Table1" cellSpacing="1" cellPadding="1" width="98%" align="center" style="border:solid 1px #FFFFFF;"> <!--class="SmallBorder"-->
										    <TR>
										        <TD align="center"> <!-- class="SmallBorder"-->
										            <P class="stdFont">
										                I am available and interested in working overtime (should the need exist) for the following date ranges:
										            </P>
											        <P>
                                                        &nbsp;
    	                                                <radG:RadGrid  ID="grdResults" runat="server" DataKeyNames="OvertimeAvailID"
                                                             AllowPaging="True" AllowSorting="True" OnItemCommand="grdResults_ItemCommand" PageSize="5" Font-Size="12px" 
                                                             Skin="Outlook2007" Font-Names="Helvetica" Width="740px"  AutoGenerateColumns="False" GridLines="Vertical">
                                                             
                                                            <MasterTableView>
                                                                <PagerStyle Mode="NextPrevAndNumeric" ForeColor="White" CssClass="GridPager_Outlook2007" HorizontalAlign="Right"  NextPageText="Next&nbsp;&gt;"
                                                                            PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" 
                                                                            PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                                                <Columns>
													                <radG:GridBoundColumn Visible="False" DataField="OvertimeAvailID"></radG:GridBoundColumn>
													                <radG:GridBoundColumn DataField="AvailStartDate" HeaderText="Start Date" DataFormatString="{0:d}">
														                <ItemStyle VerticalAlign="Top"></ItemStyle>
													                </radG:GridBoundColumn>
													                <radG:GridBoundColumn DataField="AvailEndDate" HeaderText="End Date" DataFormatString="{0:d}">
														                <ItemStyle VerticalAlign="Top"></ItemStyle>
													                </radG:GridBoundColumn>
													                <radG:GridTemplateColumn HeaderText="Note">
														                <ItemStyle VerticalAlign="Top"></ItemStyle>
														                <ItemTemplate>
													                        <%# GetOvertimeNote(Eval("AvailNote")) %>
													                    </ItemTemplate>
													                </radG:GridTemplateColumn>
                                                                    <radG:GridTemplateColumn HeaderText="Actions">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lbModify" CausesValidation="false" 
                                                                                CommandName="Modify" CommandArgument='<%# Eval("OvertimeAvailID") %>' Text="Modify"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </radG:GridTemplateColumn>
                                                                    <radG:GridTemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" ID="lbDelete" CausesValidation="false" 
                                                                                CommandName="Delete" CommandArgument='<%# Eval("OvertimeAvailID") %>' Text="Delete"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </radG:GridTemplateColumn>
                                                                </Columns>   
                                                            </MasterTableView>
                                                        </radG:RadGrid>
&nbsp;
                                                    </P>
										        </TD>
									        </TR>
									        <TR>
										        <TD class="SmallBorder" align="center">
											        <P align="right">
											            <asp:button id="btnAddNew" CssClass="btnSmall" Text="Add New" runat="server" OnClientClick="return false;" />
											        </P>
										        </TD>
									        </TR>
									    </TABLE>
									    <P align="left">
                                            <radW:RadWindowManager ID="RadWindowManager1" runat="server" Modal="True">
                                                <Windows>
                                                    <radW:RadWindow ID="rwOvertime" runat="server" OpenerElementId="btnAddNew" Modal="True" NavigateUrl="editovertimemodal.aspx?mode=new" Behavior="None"
                                                        SkinsPath="~/RadControls/Window/Skins" Title="Add Overtime" Top="" Height="360px" Left="" ClientCallBackFunction="__doPostBack('btnAddNew','')" Width="750px"/>
                                                </Windows>
                                            </radW:RadWindowManager>
                                            &nbsp;</P>
                                        <p align="left"></p>
									</radA:RadAjaxPanel>
								</TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="left"><IMG src="/images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
