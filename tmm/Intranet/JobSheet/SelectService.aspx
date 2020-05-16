<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SelectService.aspx.vb"
    Inherits="JobSheet.SelectService" %>

<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Information Sheet</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link rel="stylesheet" href="style/Objects.css" type="text/css" />
    <link rel="stylesheet" href="style/Elements.css" type="text/css" />
    <link rel="stylesheet" href="/trinity.css" type="text/css" />
</head>
<body bgcolor="#000000" topmargin="0">
    <form id="form1" method="post" runat="server">

    <script type="text/javascript">
        function ToggleTables(tblName) {
            var str = "," + document.getElementById("expandStatus").value + ",";
            if (str.indexOf("," + tblName + ",") == -1) {
                str = str.substring(1, str.length) + tblName;
                document.getElementById("tr" + tblName).style.display = "";
                document.getElementById("spn" + tblName).innerHTML = "<img src='images/minimize.gif'>";
            }
            else {
                str = str.split("," + tblName + ",").join(",");
                str = str.substring(1, str.length - 1);
                document.getElementById("tr" + tblName).style.display = "none";
                document.getElementById("spn" + tblName).innerHTML = "<img src='images/maximize.gif'>";
            }
            if (str.indexOf(",") == 0) {
                str = str.substring(1, str.length);
            }
            document.getElementById("expandStatus").value = str;
        }
        function ExpandDefault() {
            var arr = new Array();
            arr = document.getElementsByTagName("tr");
            var tableRow;
            var strHidden = "," + document.getElementById("expandStatus").value + ",";
            var temp;
            for (i = 0; i < arr.length; i++) {
                tableRow = arr[i];
                if (tableRow.id != null && tableRow.id.indexOf("tr") > -1) {
                    temp = "," + tableRow.id.split("tr").join("") + ",";
                    if (strHidden.indexOf(temp) == -1) {
                        tableRow.style.display = "none";
                    }
                }
            }
            var ar = new Array();
            ar = document.getElementsByTagName("span");
            for (i = 0; i < ar.length; i++) {
                tableRow = ar[i];
                if (tableRow.id != null && tableRow.id.indexOf("spn") > -1) {
                    temp = "," + tableRow.id.split("spn").join("") + ",";
                    if (strHidden.indexOf(temp) == -1) {
                        tableRow.innerHTML = "<img src='images/maximize.gif'>";
                    }
                    else {
                        tableRow.innerHTML = "<img src='images/minimize.gif'>";
                    }
                }
            }
        }
        function ConfirmDelete(tblName) {
            var rigName = document.getElementById("rigName").value;
            var catName = document.getElementById("cat" + tblName).innerHTML;
            var msg = confirm("Are you sure you wish to delete this " + catName + " service from the " + rigName + " worksite?");
            if (msg) {
                var str = "," + document.getElementById("expandStatus").value + ",";
                str = str.split("," + tblName + ",").join(",");
                if (str.indexOf(",") == 0) {
                    str = str.substring(1, str.length - 1);
                }
                if (str.lastIndexOf(",") == (str.length - 1)) {
                    str = str.substring(0, str.length - 2);
                }
                document.getElementById("expandStatus").value = str;
                return true;
            }
            else {
                return false;
            }
        }
        function SetButtonVisible() {
            var upButtons = document.getElementsByName("orderUpButtons");
            var downButtons = document.getElementsByName("orderDownButtons");
            var numUp = upButtons.length;
            var numDown = downButtons.length;
            if (numUp > 0) {
                downButtons(numDown - 1).firstChild.style.display = "none";
                upButtons(0).firstChild.style.display = "none";
            }
        }
        function ConfirmCancel() {
            var rigName = document.getElementById("rigName").value;
            var msg = confirm("Terminating this worksite's job sheet will mean that a new job sheet will need to be created for this worksite when necessary. Are you sure you want to permanently terminate this job sheet for " + rigName + " worksite?");
            if (msg) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <input id="rigName" type="hidden" runat="server" />
    <table height="100%" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="top">
            <td align="center" width="100%">
                <table style="border-right: #307fa3 1px solid; border-top: #307fa3 1px solid; border-left: #307fa3 1px solid;
                    border-bottom: #307fa3 1px solid" height="560" width="758">
                    <tr valign="top" height="100">
                        <td>
                            <img src="images/img_JobInfoSheet.jpg"><br />
                            <uc1:NavigationMenu ID="NavigationMenu1" runat="server"></uc1:NavigationMenu>
                        </td>
                    </tr>
                    <tr height="20">
                        <td align="center">
                            <cc1:ProgressIndicator ID="ucProgress" runat="server" BoookEndStartActive="images/img_Start_o.gif"
                                BoookEndFinishActive="images/img_End_o.gif" StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif,images/btn_Step4.gif"
                                SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif,images/btn_Step4_o.gif"
                                UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif,images/btn_Step4_d.gif"
                                LinkURLs="locationinfo.aspx,contractingcompany.aspx,SelectService.aspx,edit-complete.aspx"
                                Height="48px" CurrentStep="3" LastAvailableStep="3" BoookEndFinish="images/img_End.gif"
                                BoookEndStart="images/img_Start.gif" BoookEndGraphics="True"></cc1:ProgressIndicator>
                        </td>
                    </tr>
                    <tr valign="top" height="429">
                        <td valign="top" align="center">
                            <table id="Table1" cellspacing="1" cellpadding="1" width="98%" border="0">
                                <tr>
                                    <td style="color: White; text-align: right; width: 25%" class="stdFont">
                                        Select an Applicable Service:
                                    </td>
                                    <td style="width: 5px;">
                                    </td>
                                    <td style="text-align:left; padding-left:10px">
                                        <asp:DropDownList ID="cboCategory" runat="server" DataTextField="Name" DataValueField="SpecialtyID"
                                            Width="245px" AutoPostBack="true" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <radG:RadGrid ID="grdSearchResults" runat="server" AutoGenerateColumns="False" Width="887" AllowSorting="true"
                                 AllowPaging="True" PageSize="10" ShowHeader="true" Skin="Outlook2007">
                                <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;"
                                    PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}" />
                                <MasterTableView AllowNaturalSort="true">
                                    
                                    <HeaderStyle CssClass="RadGridHeader_LeftAlign" />
                                    <ItemStyle HorizontalAlign="Left" />
                                    <AlternatingItemStyle HorizontalAlign="Left" BackColor="#D1D1D1" />
                                    <Columns>
                                        <radG:GridTemplateColumn HeaderText="Service Name" SortExpression="ServiceName">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkServiceName" runat="server" CommandName="ViewService" Style="color: #000000;"
                                                    CommandArgument='<%# Eval("ServiceID") %>' Text='<%# Eval("ServiceName") %>' />
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <radG:GridBoundColumn DataField="EmployerName" HeaderText="EMPLOYER NAME" SortExpression="EmployerName">
                                            
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="ServiceTypeName" HeaderText="SERVICE TYPE" SortExpression="ServiceTypeName">
                                            
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="PhysicalCityName" HeaderText="CITY" SortExpression="PhysicalCityName">
                                            
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="MainPhone" HeaderText="PHONE NUMBER" SortExpression="MainPhone">
                                           
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="DistanceAsDouble" UniqueName="Distance" HeaderText="DISTANCE"  SortExpression="DistanceAsDouble" DataType="System.Double">
                                          
                                        </radG:GridBoundColumn>
                                        
                                        <radG:GridBoundColumn DataField="TierDescription" HeaderText="TIER" SortExpression="TierOrderAsInt">
                                            
                                        </radG:GridBoundColumn>
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
                            <br />
                            <table width="100%"><tr><td style="width:100%; text-align:center">
                            <asp:Label ID="ServiceHdr" runat="server" CssClass="stdFont" />
                            </td></tr></table>
                            <br />
                            <input id="expandStatus" type="hidden" runat="server" />
                            <asp:Repeater ID="rptServices" runat="server">
                                <ItemTemplate>
                                    <table style="border-right: #307fa3 1px solid; border-top: #307fa3 1px solid; border-left: #307fa3 1px solid;
                                        border-bottom: #307fa3 1px solid;" width="100%" cellspacing="0">
                                        <tr class="DataGridHdr">
                                                <td id="serviceHdr" style="vertical-align: top; font-weight: bold; text-align:left; background-color: #307FA3" class="SecHdr">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width:80%" onclick="ToggleTables('<%#Eval("ServiceID").ToString() %>')">
                                                                <span id='spn<%#Eval("ServiceID").ToString() %>' style="text-decoration: underline; cursor: pointer;"></span>
                                                                <span id='cat<%#Eval("ServiceID").ToString() %>' style="color:White"><%#Eval("ServiceName")%></span>
                                                            </td>
                                                            <td style="width:20%; text-align:right">
                                                                <table>
                                                                    <tr>
                                                                        <td id="orderDownButtons" style="width:15px">
                                                                            <asp:ImageButton runat="server" ID="btnMoveDown" CommandName="moveServiceDown" CommandArgument='<%#Eval("ServiceID") %>'
                                                                            ImageUrl="images/arrow_down.gif" ImageAlign="Right" />
                                                                        </td>
                                                                        <td id="orderUpButtons" style="width:15px">                                                            
                                                                            <asp:ImageButton ID="btnMoveUp" runat="server" CommandName="moveServiceUp" CommandArgument='<%#Eval("ServiceID") %>'
                                                                            ImageUrl="images/arrow_top.gif" ImageAlign="Right" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                            </td>
                                        </tr>
                                        <tr id='tr<%#Eval("ServiceID").ToString() %>'>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr class="stdFont">
                                                        <td style="width: 25%; text-align:left">
                                                            Company Name:
                                                        </td>
                                                        <td style="width: 75%; text-align:left" colspan="3">
                                                            <%#Eval("Name") %>
                                                        </td>
                                                    </tr>
                                                    <tr class="stdFont">
                                                        <td style="width: 25%; text-align:left">
                                                            Approximate Distance:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("Distance").ToString() %>
                                                            miles
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            Approximate Time:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("Time").ToString() %>
                                                            minutes
                                                        </td>
                                                    </tr>
                                                    <tr class="stdFont">
                                                        <td style="width: 25%; text-align:left">
                                                            Phone Number:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("PhoneNumber") %>
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            Alternative Phone Number:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("AltPhoneNumber") %>
                                                        </td>
                                                    </tr>
                                                    <tr class="stdFont">
                                                        <td style="width: 25%; text-align:left">
                                                            Fax Number:
                                                        </td>
                                                        <td style="width: 75%; text-align:left" colspan="3">
                                                            <%#Eval("FaxNumber") %>
                                                        </td>
                                                    </tr>
                                                    <tr class="stdFont">
                                                        <td style="width: 25%; text-align:left">
                                                            Latitude:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("Latitude").ToString() %>
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            Longitude:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("Longitude").ToString() %>
                                                        </td>
                                                    </tr>
                                                    <tr class="stdFont">
                                                        <td style="width: 25%; text-align:left">
                                                            Location:
                                                        </td>
                                                        <td style="width: 25%; text-align:left">
                                                            <%#Eval("City") %>,
                                                            <%#Eval("State") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; text-align: right" colspan="4">
                                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btnSmall" OnClientClick='<%# "return ConfirmDelete(" & Eval("ServiceID") & ");" %>'
                                                                CommandArgument='<%# Eval("ServiceID") %>' CommandName="deleteService" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnSmall" OnClientClick="return ConfirmCancel();" />
                            <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btnSmall" PostBackUrl="edit-complete.aspx" />
                        </td>
                    </tr>
                    <tr valign="top" height="31">
                        <td align="center">
                            <img src="/images/Grphc_BotBar.jpg" width="907" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
