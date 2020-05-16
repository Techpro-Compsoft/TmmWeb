<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminhome.aspx.vb" Inherits="JobSheet.adminhome" %>

<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Job Sheet Administrator Home</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="/trinity.css" type="text/css" rel="stylesheet">
    <link href="../../Skins/Grid.Trinity.css" rel="stylesheet" type="text/css" />
    
<script language="javascript" type="text/javascript">

    function printJobSheet(id) {
        //alert(id);
        //window.open('../../JobSheetInfo.aspx?rigID=' + id, 'Print', 'location=1; scrollbars=1; resizable=1');
        window.open('PrintPreview.aspx?rigID=' + id, 'Print', 'location=1; scrollbars=1; resizable=1');
    }

</script>
</head>
<body bgcolor="#000000" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="smJobsheets" runat="server">
    </asp:ScriptManager>
    <table height="100%" cellspacing="0" cellpadding="0" width="100%">
        <tr valign="top">
            <td align="center" width="100%">
                <table style="border-right: #307fa3 1px solid; border-top: #307fa3 1px solid; border-left: #307fa3 1px solid;
                    border-bottom: #307fa3 1px solid" height="560" width="758">
                    <tr valign="top" height="100">
                        <td>
                            <img src="images/img_JobInfoSheet.jpg"><br>
                            <uc1:NavigationMenu ID="NavigationMenu1" runat="server"></uc1:NavigationMenu>
                        </td>
                    </tr>
                    <tr height="20">
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%; text-align:right; padding-right: 6px;">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btnSmall" Text="Add New" />
                        </td>
                    </tr>
                    <tr valign="top" height="429">
                        <td valign="top" style="width:748px; padding-left:10px; padding-right:10px">
                            <radG:RadGrid ID="rgJobSheets" runat="server" GridLines="None" Skin="Outlook2007"
                                OnItemCommand="rgJobSheets_ItemCommand" OnSortCommand="rgJobSheets_SortCommand" OnNeedDataSource="rgJobSheets_NeedDataSource"
                                AutoGenerateColumns="false" AllowPaging="false" ShowHeader="true" AllowSorting="true">
                                <MasterTableView AllowNaturalSort="true">
                                    <SortExpressions>
                                        <radG:GridSortExpression FieldName="RigName" SortOrder="Ascending" />
                                    </SortExpressions>
                                    <HeaderStyle CssClass="RadGridHeader_LeftAlign" />
                                    <Columns>
                                        <radG:GridBoundColumn Visible="false" DataField="JobSheetID">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Visible="false" DataField="RigID">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn DataField="Complete" UniqueName="Complete" Visible="false" DataType="System.Boolean">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn Visible="false" DataField="Created">
                                        </radG:GridBoundColumn>
                                        <radG:GridTemplateColumn UniqueName="PrintCol">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ID="btnPrint" ImageUrl="Images/print.gif"
                                                    CommandName="Print" CommandArgument='<%#Eval("RigID").ToString() %>'
                                                    onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='default'" />
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                        <%--<radG:GridHyperLinkColumn UniqueName="PrintCol" DataNavigateUrlField="RigID" DataNavigateUrlFormatString="javascript:printJobSheet({0})" Text="<img src='Images/print.gif' border='0' />">
                                        </radG:GridHyperLinkColumn>--%>
                                        <radG:GridBoundColumn HeaderText="Rig Name" DataField="RigName" SortExpression="RigName" ShowSortIcon="false">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn HeaderText="Medic Name" DataField="MedicName" SortExpression="MedicName" ShowSortIcon="false">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn HeaderText="Phone" DataField="RigPhone" SortExpression="RigPhone" ShowSortIcon="false">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn HeaderText="Age (Days)" DataField="NumberOfDays" SortExpression="NumberOfDays" ShowSortIcon="false">
                                        </radG:GridBoundColumn>
                                        <radG:GridBoundColumn HeaderText="Drilling For" DataField="EmpName" ShowSortIcon="false" SortExpression="EmpName">
                                        </radG:GridBoundColumn>
                                        <radG:GridTemplateColumn HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ID="btnEdit" ImageUrl="images/memobook_blue.gif"
                                                    CommandName="Edit" CommandArgument='<%#Eval("RigID").ToString() %>'
                                                    onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='default'" />
                                            </ItemTemplate>
                                        </radG:GridTemplateColumn>
                                    </Columns>
                                    <NoRecordsTemplate>
                                        <table id="tblNoRecords" runat="server" cellpadding="0" cellspacing="0" class="NoRecordsTable">
                                            <tr>
                                                <td>
                                                    Sorry, but there are currently no active worksite job sheets.
                                                </td>
                                            </tr>
                                        </table>
                                    </NoRecordsTemplate>
                                </MasterTableView>
                            </radG:RadGrid>
                        </td>
                    </tr>
                    <tr height="20px"><td></td></tr>
                    <tr valign="top" height="31">
                        <td align="center">
                            <img src="/images/Grphc_BotBar.jpg">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <iframe id="HiddenPrintFrame" src="Printjobsheet.aspx" width="0" height="0" runat="server">
    </iframe>
    </form>
</body>
</html>
