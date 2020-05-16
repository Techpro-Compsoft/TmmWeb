<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="TrinityMedicalManagement.CustomerHome" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx"  %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Customer Home</title>
    <link href="trinity.css" type="text/css" rel="stylesheet">
    
    <style type="text/css">

.RadGrid_Outlook2007
{
	background-color: #dfecff;
	color: WindowText;
	border: 1px solid #99CCCC;
}

.MasterTable_Outlook2007
{
	background-color: #ffffff;
	color: WindowText;
	border: 0;
	-moz-user-select: -moz-none;
	border-top: solid 1px #6593cf;
}

.MasterTable_Outlook2007 .GridHeader_Outlook2007,
.MasterTable_Outlook2007 .ResizeHeader_Outlook2007
{
	text-align: center;
	border-bottom: solid 1px #6593cf;
	background-color: #307FA3;
	font-family:Arial;
	font-size:11px;
	font-weight:bold;
	color:#FFFFFF;	
}

.GridPager_Outlook2007
{
	cursor: default;
	background-color: #307FA3;
	font-family:Arial;
	font-size:11px;
	font-weight:bold;
	color:#FFFFFF;	
}
        </style>
    </head>
<body id="bodyMain" leftMargin="0" topMargin="0" runat="server" style="background-color:#000000">
<script type="text/javascript">

    function valDates(source, args) {
        args.IsValid = document.getElementById("<%= rdpEncounterStartDate.ClientID %>").value < document.getElementById("<%= rdpEncounterEndDate.ClientID %>").value;

    }
</script>
<script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
		<form id="frmMain" method="post" runat="server">
			<CENTER>
				<TABLE style="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid; background-color:black;" width="765"  class="WhiteText">
					<TR>
						<TD><IMG src="images/ttl_PatientEncounterBar.jpg"><BR>
                            <UC1:NAVIGATIONMENU ID="TMMMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
                        </TD>
					</TR>
					<tr>
					    <td></td>
					</tr>
					<tr >
					    <td>
					        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="SmallBorder">
					            <tr>
					                <td>
					                    <table border="0" cellpadding="0" cellspacing="0" style="width:95%">

					                        <tr>
					                            
					                            <td align="center">
					                                <table border="0" cellpadding="0" cellspacing="0" style="width:100%; padding-top:5px;">
					                                    <tr style="width:100%">
					                                        <td style="width:20%"></td>
					                                        <td style="width:60%" align="center"><span class="WhiteText"><strong>Patient Encounter Search</strong></span></td>
					                                        <td style="width:20%; text-align:right;" align="right"><a href="" class="WhiteLnk" onclick="window.open('SearchTips.aspx','','width=500,height=350');return false;">Search Tips?</a></td>
					                                    </tr>
					                                </table>
					                            </td>
					                            
					                        </tr>
					                        <tr>
					                            <td style="height:10px;">&nbsp;</td>
					                        </tr>
					                        <tr>
					                            <td align="center">
					                                <table border="0"cellspacing="0" style="width:100%; padding:0px 10px 0px 10px;">
					                                    <tr style="width:100%">
					                                        <td style="width:50%; text-align:left;"><span class="WhiteText">First Name</span> <asp:TextBox ID="txtFName" runat="server" MaxLength="50"></asp:TextBox></td>
					                                        <td style="width:50%; text-align:left;"><span class="WhiteText">Last Name</span> <asp:TextBox ID="txtLName" runat="server" MaxLength="50"></asp:TextBox></td>
					                                    </tr>
					                                    <tr>
					                                        <td style="text-align:left;"><span class="WhiteText">Worksite</span> <asp:DropDownList ID="ddlWorksites" runat="server" Width="200px"></asp:DropDownList>
					                                        <td style="text-align:left;"><span class="WhiteText">SSN</span> <asp:TextBox ID="txtSSN" runat="server" MaxLength="11"></asp:TextBox></td>
					                                    </tr>
					                                    <tr>
					                                        <td colspan="2" style="text-align:left;">
					                                            <span class="WhiteText">Encounter Date Range </span>
                                                                <radCln:RadDatePicker ID="rdpEncounterStartDate" runat="server" Skin="Trinity" Width="220px" DatePopupButton-ImageUrl="images/btn_SelectDate.jpg" DatePopupButton-HoverImageUrl="images/btn_SelectDate.jpg">
                                                                    <DatePopupButton CssClass="RadDatePickerButton" />
								                                    <DateInput MaxLength="10" ReadOnly="true"></DateInput>
								                                    <Calendar Skin="Trinity"></Calendar>
                                                                </radCln:RadDatePicker>
                                                                <span class="WhiteText">&nbsp;&nbsp;TO&nbsp;&nbsp;</span>
                                                                <radCln:RadDatePicker ID="rdpEncounterEndDate" runat="server" Skin="Trinity" Width="220px" DatePopupButton-ImageUrl="images/btn_SelectDate.jpg" DatePopupButton-HoverImageUrl="images/btn_SelectDate.jpg">
                                                                    <DatePopupButton CssClass="RadDatePickerButton" />
								                                    <DateInput MaxLength="10" ReadOnly="true"></DateInput>
								                                    <Calendar Skin="Trinity"></Calendar>
                                                                </radCln:RadDatePicker>
                                                                <br /><asp:CustomValidator ID="valDates" runat="server" ErrorMessage="Start Date must be before End Date." Display="Dynamic" ClientValidationFunction="valDates"></asp:CustomValidator>
                                                            </td>
					                                    </tr>
					                                    <tr>
					                                        <td align="right" style="width:50%">
                                                                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btnSmall" onclick="btnClear_Click" />&nbsp;
                                                            </td>
					                                        <td align="left"  style="width:50%">
                                                                &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btnSmall" onclick="btnSearch2_Click" />
                                                            </td>
					                                    </tr>
					                                </table>
					                            </td>
					                            
					                        </tr>
					                        <tr style="height:5px">
					                            <td></td>
					                        </tr>
					                        <tr>
					                            
					
					                            
					                        </tr>
					                    </table>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					<tr>
					    <td style="text-align:center"><span class="WhiteText"><asp:label id="lblRecCnt" runat="server" Visible="False"></asp:label></span></td>
					</tr>
					<tr>
					    <td>
                        <radG:RadGrid ID="rgEncounterResults" runat="server" AutoGenerateColumns="False" GridLines="Vertical" Width="755px" AllowPaging="True" AllowSorting="True"  Skin="Outlook2007" onneeddatasource="rgEncounterResults_NeedDataSource" OnItemCommand="rgEncounterResults_ItemCommand">
                            <ExportSettings>
                                <Pdf PageWidth="8.5in" PageHeight="11in" PageTopMargin="" PageBottomMargin="" PageLeftMargin="" PageRightMargin="" PageHeaderMargin="" PageFooterMargin=""></Pdf>
                            </ExportSettings>
                            <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;"
                            PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                            <MasterTableView>
                    
                                <NoRecordsTemplate>
                                    There are currently no Patient Encounters matching the above criteria.
                                </NoRecordsTemplate>        
                                <SortExpressions>
                                    <radG:gridsortexpression FieldName="PatientID" SortOrder="Descending" />
                                </SortExpressions>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn Visible="False" Resizable="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <Columns>
                                    <radG:gridboundcolumn DataField="patientID" HeaderText="Patient ID" SortExpression="patientID"
                                        UniqueName="column">
                                        <ItemStyle Width="30px" />
                                    </radG:gridboundcolumn>
                                    <radG:gridbuttoncolumn CommandArgument="PatientID" CommandName="Select" 
                                        DataTextField="PatientName" HeaderText="Patient Name" 
                                        SortExpression="PatientName" UniqueName="column1">
                                    </radG:gridbuttoncolumn>
                                    <radG:gridtemplatecolumn HeaderText="Encounter Date" 
                                        SortExpression="EncounterDate">
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("EncounterDate")).ToShortDateString() %>
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </radG:gridtemplatecolumn>
                                    <radG:gridboundcolumn DataField="Status" HeaderText="Status" SortExpression="Status" 
                                        UniqueName="column">
                                    </radG:gridboundcolumn>
                                    <radG:gridboundcolumn DataField="SSN" HeaderText="SSN" UniqueName="column3">
                                        <ItemStyle Width="65px" />
                                    </radG:gridboundcolumn>
                                    <radG:gridboundcolumn DataField="PatientAddress" HeaderText="Patient Address" SortExpression="PatientAddress" 
                                        UniqueName="column">
                                    </radG:gridboundcolumn>
                                    <radG:gridboundcolumn DataField="HomePhone" HeaderText="Home Phone" 
                                        UniqueName="column5">
                                        <ItemStyle Width="70px" />
                                    </radG:gridboundcolumn>
                                    <radG:gridboundcolumn DataField="Rig" HeaderText="Worksite" SortExpression="Rig" 
                                        UniqueName="column">
                                    </radG:gridboundcolumn>
                                </Columns>
                            </MasterTableView>
                        </radG:RadGrid>
                        <br />
                        </td>
					</tr>
                </TABLE>
            </CENTER>
        <br /><br />
    </form>
</body>
</html>
