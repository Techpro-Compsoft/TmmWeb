<%@ Page Language="vb" AutoEventWireup="false" Codebehind="default.aspx.vb" Inherits="MyAccount.Default1" EnableViewState="true"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register TagPrefix="radA" Namespace="Telerik.WebControls" Assembly="RadAjax.Net2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN">
<html>
	<head>
		<title>My Account</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="trinity.css" type="text/css" rel="stylesheet">
	</head>
	<body bgColor="#000000" topMargin="0">
		<form id="Form1" method="post" RUNAT="server">
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
							                                            <td height="23px" style="background-color:#FFFFFF;">
							                                                <img src="images/tab_active_lt.gif" />
							                                            </td>
							                                            <td background="images/tab_active_mid.gif" class="ViewHeaderSelected">
							                                                My Account
							                                            </td>
							                                            <td style="background-color:#FFFFFF;">
							                                                <img src="images/tab_active_rt.gif" />
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
									        <table cellSpacing="1" cellPadding="1" width="98%" border="0" align="center" style="border:solid 1px #FFFFFF;"> <%-- class="SmallBorder"> --%>
	                                            <tr>
		                                            <td style="width:60%; padding-left:3px; vertical-align:top;">
			                                            <table id="Table2" cellSpacing="1" cellPadding="1" border="0" align="left" style="text-align:left; width:100%;">
				                                            <tr>
					                                            <td class="stdFont_Bold" style="width:105px;">
					                                                Name:
					                                            </td>
					                                            <td class="stdFont">
						                                            <asp:Label id="lblName" runat="server"></asp:Label>
					                                            </td>
				                                            </tr>
                                            				
                                            				<tr id="trWorksite" runat="server">
					                                            <td class="stdFont_Bold" style="width:105px; padding-top:20px;">
					                                                Current Worksite:
					                                            </td>
					                                            <td class="stdFont" style="padding-top:20px;">
						                                            <asp:Literal ID="litWorksite" runat="server" />
						                                            <asp:DropDownList ID="ddlWorksite" runat="server" Width="215px" AutoPostBack="false"></asp:DropDownList>
					                                            </td>
				                                            </tr>
                                            				
				                                            <tr>
					                                            <td class="stdFont_Bold" style="width:105px; padding-top:20px;" vAlign="top" >
					                                                <asp:literal ID="litAddressType" runat="server" />
					                                            </td>
					                                            <td style="padding-top:20px;">
					                                                <table cellpadding="0" cellspacing="0" class="stdFont" style="width:100%;">
					                                                    <tr>
					                                                        <td style="vertical-align:middle">
					                                                            <asp:Label id="lblAddress" runat="server"></asp:Label>
						                                                        <asp:TextBox ID="txtAddress1" runat="server" MaxLength="50" Width="215px" />
						                                                        &nbsp;
						                                                        <asp:RequiredFieldValidator id="rfvAddress1" runat="server" ControlToValidate="txtAddress1"
						                                                            Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" />
					                                                        </td>
					                                                    </tr>
					                                                    <tr>
					                                                        <td style="vertical-align:middle; padding-top:5px;">
					                                                            <asp:Literal ID="litCity" runat="server" />
					                                                            <asp:TextBox ID="txtCity" runat="server" MaxLength="50" Width="215px" />
					                                                        </td>
					                                                    </tr>
					                                                    <tr>
					                                                        <td>
					                                                            <asp:RequiredFieldValidator id="rfvCity" runat="server" ControlToValidate="txtCity"
						                                                            Display="Dynamic" ErrorMessage="* City is Required" SetFocusOnError="true" />
					                                                        </td>
					                                                    </tr>
					                                                    <tr>
					                                                        <td style="vertical-align:middle; padding-top:5px;">
					                                                            <asp:Literal ID="litStateZip" runat="server" />
						                                                        <asp:TextBox ID="txtState" runat="server" MaxLength="25" Width="160px" /> 
						                                                        &nbsp;<asp:TextBox ID="txtPostalCode" runat="server" MaxLength="15" Width="50px" />
					                                                        </td>
					                                                    </tr>

					                                                    <tr>
					                                                        <td>
					                                                            <asp:RequiredFieldValidator id="rfvState" runat="server" ControlToValidate="txtState"
						                                                            Display="Dynamic" ErrorMessage="* State is Required" SetFocusOnError="true" />
					                                                        </td>
					                                                    </tr>
					                                                    <tr>
					                                                        <td>
					                                                            <asp:RequiredFieldValidator id="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode"
						                                                            Display="Dynamic" ErrorMessage="* Postal Code is Required" SetFocusOnError="true" />
					                                                        </td>
					                                                    </tr>
					                                                    <tr>
					                                                        <td style="vertical-align:middle; padding-top:2px;">
					                                                            <asp:Label id="lblCountry" runat="server"></asp:Label>
						                                                        <asp:TextBox ID="txtCountry" runat="server" Width="215px" MaxLength="50" />
					                                                        </td>
					                                                    </tr>
					                                                    <tr>
					                                                        <td>
					                                                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry"
						                                                            Display="Dynamic" ErrorMessage="* Country is Required" SetFocusOnError="true" />    
					                                                        </td>
					                                                    </tr>
					                                                </table>
					                                            </td>
				                                            </tr>
			                                            </table>
		                                            </td>
		                                            <td valign="top">
		                                                <table cellpadding="0" cellspacing="0" style="width:100%; vertical-align:middle;" class="stdFont">
		                                                    <tr>
		                                                        <td class="stdFont_Bold" style="width:85px;">
		                                                            Home Phone:
		                                                        </td>
		                                                        <td>
		                                                            <asp:Literal ID="litHomePhone" runat="server" />
		                                                            <asp:TextBox ID="txtHomePhone" runat="server" MaxLength="25" />
		                                                        </td>
		                                                    </tr>
		                                                    <tr id="trFaxNumber" runat="server">
		                                                        <td class="stdFont_Bold" style="padding-top:5px;">
		                                                            Fax:
		                                                        </td>
		                                                        <td style="padding-top:5px;">
		                                                            <asp:Literal ID="litFaxNumber" runat="server" />
		                                                            <asp:TextBox ID="txtFaxNumber" runat="server" MaxLength="25" />
		                                                        </td>
		                                                    </tr>
		                                                    <tr>
		                                                        <td class="stdFont_Bold" style="padding-top:5px;">
		                                                            Cell Phone:
		                                                        </td>
		                                                        <td style="padding-top:5px;">
		                                                            <asp:Literal ID="litCellPhone" runat="server" />
		                                                            <asp:TextBox ID="txtCellPhone" runat="server" MaxLength="25" />
		                                                        </td>
		                                                    </tr>
		                                                    <tr id="trOtherPhone" runat="server">
		                                                        <td class="stdFont_Bold" style="padding-top:5px;">
		                                                            Other Phone:
		                                                        </td>
		                                                        <td style="padding-top:5px;">
		                                                            <asp:Literal ID="litOtherPhone" runat="server" />
		                                                            <asp:TextBox ID="txtOtherPhone" runat="server" MaxLength="25" />
		                                                        </td>
		                                                    </tr>
		                                                    <tr id="trUserAccess" runat="server" visible="false">
		                                                        <td colspan="2" style="padding-top:20px;">
					                                                <asp:Repeater ID="rptrUserAccess" runat="server">
					                                                    <HeaderTemplate>
					                                                        <table cellpadding="0" cellspacing="0" style="width:100%;">
					                                                            <tr>
					                                                                <td class="stdFont_Bold">
					                                                                    User Access 
					                                                                </td>
					                                                            </tr>
					                                                    </HeaderTemplate>
					                                                    <ItemTemplate>
					                                                            <tr>
					                                                                <td class="stdFont">
					                                                                    <%#Container.DataItem%>
					                                                                </td>
					                                                            </tr>
					                                                    </ItemTemplate>
					                                                    <FooterTemplate>
					                                                        </table>
					                                                    </FooterTemplate>
					                                                </asp:Repeater>
					                                            </td>
		                                                    </tr>
		                                                </table>
		                                            </td>
	                                            </tr>
                                            		
                                                <tr>
                                                    <td colspan="2" style="padding:0px 3px 3px 3px;">
                                                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                            <tr>
                                                                <td class="stdFont_Bold" style="width:110px; padding-top:20px;" vAlign="middle" >
                                                                    Email Address:
                                                                </td>
		                                                        <td class="stdFont" style="padding-top:20px;" valign="middle">
			                                                        <asp:Label id="lblEmail" runat="server"></asp:Label>
			                                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="215px" />
			                                                        <asp:RequiredFieldValidator id="rfvEmail" runat="server" ControlToValidate="txtEmail"
						                                                Display="Dynamic" ErrorMessage="* Required" SetFocusOnError="true" />
						                                            <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" Display="dynamic"
                                                                        ControlToValidate="txtEmail" ErrorMessage="* Invalid E-mail Address" SetFocusOnError="true"
                                                                        ValidationExpression="^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$" />
		                                                        </td>        
		                                                        <td style="text-align:right; vertical-align:bottom;">
		                                                            <asp:Button id="btnEdit" runat="server" Text="Edit" ToolTip="Edit" CssClass="btnSmall"></asp:Button>
		                                                            <asp:Button id="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CssClass="btnSmall" CausesValidation="false"></asp:Button>
		                                                            <asp:Button id="btnSave" runat="server" Text="Save" ToolTip="Save" CssClass="btnSmall"></asp:Button>
		                                                        </td>
                                                            </tr>
                                                        </table>
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
		</form>
	</body>
</html>
