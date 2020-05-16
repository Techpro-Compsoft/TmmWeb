<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo_Office.aspx.cs" Inherits="UsersAdmin.UserInfo_Office" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadTabStrip.Net2" namespace="Telerik.WebControls" tagprefix="radT" %>
<%@ Register src="Controls/User_GeneralInformation.ascx" tagname="User_GeneralInformation" tagprefix="uc1" %>
<%@ Register src="Controls/User_SecurityInformation.ascx" tagname="User_SecurityInformation" tagprefix="uc2" %>
<%@ Register src="Controls/LoginInformation.ascx" tagname="LoginInformation" tagprefix="uc3" %>
<%@ Register src="Controls/UserVideoLibraryGrid.ascx" tagname="UserVideoLibraryGrid" tagprefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<link href="/trinity.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
    legend{  
     color:#ffffff;
    } 
</style>
<link href="RadControls/Grid/Skins/Outlook2007/styles.css" rel="stylesheet" type="text/css" />
</head>
	<body style="margin-top:0; margin-left:0; background-color:#000000;">
	<form runat="server" id="frm1">
	<asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
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
				    <td style="text-align:left; padding:10px;">
				        <span class="WhiteText" ><b>User Information: <asp:Literal ID="litUserHeader" runat="server"></asp:Literal></b></span>
				    </td>
				</tr>
				<tr>
				    <td style="padding:10px;">
				        <radT:RadTabStrip ID="tabStrip" runat="server" ontabclick="tabStrip_TabClick" AutoPostBack="true" CausesValidation="false" Skin="Web20">
				            <Tabs>
				                <radT:Tab ID="tabPersonalInformation" runat="server" Text="Personal Information"></radT:Tab>
				                <radT:Tab ID="tabPatientEncounters" runat="server" Text="Patient Encounters"></radT:Tab>
				                <radT:Tab ID="tabLoginInformation" runat="server" Text="Login Information"></radT:Tab>
				                <radT:Tab ID="tabVideoLibrary" runat="server" Text="Video Library"></radT:Tab>
				            </Tabs>
				        </radT:RadTabStrip>
			            <asp:MultiView ID="mvwUserInfo" runat="server" ActiveViewIndex="0">
                            <asp:View runat="server">
                            <table style="width:100%; border:1px solid white;">
                                <tr>
                                    <td style="padding:10px;">
                                        <uc1:User_GeneralInformation ID="User_GeneralInformation1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:10px;">
                                        <uc2:User_SecurityInformation ID="User_SecurityInformation1" runat="server" />
                                    </td>
                                </tr>
                                <tr id="trEdit" runat="server">
                                    <td style="padding:0px 10px 10px 10px; text-align:right;">
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btnSmall" onclick="btnEdit_Click" />
                                    </td>
                                </tr>
                                <tr id="trSave" runat="server">
                                    <td style="padding:0px 10px 10px 10px; text-align:right;">
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall"  CausesValidation="false"
                                            onclick="btnCancel_Click" />&nbsp;
                                        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btnSmall" 
                                            onclick="btnSave_Click" />
                                    </td>
                                </tr>
                            </table>
                                
                            </asp:View>
                            <asp:View runat="server">
                                <table style="width:100%; border:1px solid white;">
                                    <tr>
                                       <td style="padding:10px;">
                                            <radG:RadGrid ID="grdEncounters" runat="server" AutoGenerateColumns="False" 
                                                GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
                                                Skin="Outlook2007" onneeddatasource="grdUsers_NeedDataSource">
                                                <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />

                                                <MasterTableView>

                                                    <RowIndicatorColumn Visible="False">
                                                    <HeaderStyle Width="20px"></HeaderStyle>
                                                    </RowIndicatorColumn>

                                                    <ExpandCollapseColumn Visible="False" Resizable="False">
                                                    <HeaderStyle Width="20px"></HeaderStyle>
                                                    </ExpandCollapseColumn>
                                                    <Columns>
                                                        <radG:GridTemplateColumn HeaderText="Patient ID" SortExpression="PatientID">
                                                            <ItemTemplate>
                                                                <%# Eval("PatientID") %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Patient Name" SortExpression="LastName">
                                                            <ItemTemplate>
                                                                <a href='../Medic/Patient.aspx?patientid=<%# Eval("PatientID") %>'> <%# Eval("LastName") %>,&nbsp;<%# Eval("FirstName") %></a>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Encounter Date" SortExpression="EncounterDate">
                                                            <ItemTemplate>
                                                                <%# Convert.ToDateTime(Eval("EncounterDate")).ToShortDateString() %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Status" SortExpression="EncounterStatus">
                                                            <ItemTemplate>
                                                                <%# GetStatus(Eval("EncounterStatus").ToString()) %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="SSN" SortExpression="SSN">
                                                            <ItemTemplate>
                                                                <%# Eval("SSN") %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Patient Address" SortExpression="Address">
                                                            <ItemTemplate>
                                                                <%# Eval("Address") %>&nbsp;<%# Eval("City") %>,&nbsp;<%# Eval("State") %>&nbsp<%# Eval("Zip") %>&nbsp;<%# Eval("Country") %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Home Phone" SortExpression="HomePhone">
                                                            <ItemTemplate>
                                                                <%# Eval("HomePhone") %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                        <radG:GridTemplateColumn HeaderText="Worksite" SortExpression="Location">
                                                            <ItemTemplate>
                                                                <%# Eval("Location") %>
                                                            </ItemTemplate>
                                                        </radG:GridTemplateColumn>
                                                    </Columns>
                                                    <SortExpressions>
                                                        <radG:GridSortExpression FieldName="EncounterDate" SortOrder="Descending" />
                                                    </SortExpressions>
                                                    <NoRecordsTemplate>
                                                        Sorry but this user has not created any Patient Encounters.
                                                    </NoRecordsTemplate>
                                                </MasterTableView>
                                            </radG:RadGrid>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View runat="server">
                                <table style="width:100%; border:1px solid white;">
                                    <tr>
                                       <td style="padding:10px;">
                                            <uc3:LoginInformation ID="LoginInformation1" runat="server" />
                                        </td>
                                    </tr>
                                </table>

                            </asp:View>
                            <asp:View ID="View5" runat="server">
                                <table style="width:100%; border:1px solid white;">
                                    <tr>
                                       <td style="padding:10px;">
                                            <uc5:UserVideoLibraryGrid ID="UserVideoLibraryGrid1" runat="server" ShowPager="True" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>    
				    </td>
				</tr>
                
				<tr>
					<td style="text-align:left; padding:10px;"><span class="WhiteText"><a href="javascript:history.go(-1)" class="WhiteLnk">&nbsp;&lt;&nbsp;Back</a></span></td>
				</tr>
				<tr valign="bottom">
					<td>
					    
					    <img src="/images/Grphc_BotBar.jpg" alt="" width="760" height="31" />
					</td>
				</tr>
			</table>
		</center>
		</form>
	</body>
</html>
