<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginInformation.ascx.cs" Inherits="UsersAdmin.Controls.LoginInformation" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>

<style type="text/css">
.MasterTable_Outlook2007 .GridHeader_Outlook2007
{
	text-align: left;
}
</style>
        
        
<table style="width:100%; border:1px solid white; color:White; text-align:left;" cellpadding="8">
    <tr>
        <td>Month<br /><asp:DropDownList ID="ddlMonth" runat="server" Width="200"></asp:DropDownList></td>
        <td>Year<br /><asp:DropDownList ID="ddlYear" runat="server" Width="150"></asp:DropDownList></td>
        <td style="text-align:right;"><asp:Button ID="btnSubmit" runat="server" 
                Text="Submit" CssClass="btnSmall" onclick="btnSubmit_Click" /></td>
    </tr>
</table>
<br />
<radG:RadGrid ID="grdLogins" runat="server" AutoGenerateColumns="False" 
    GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
    Skin="Outlook2007" HorizontalAlign="Left" onneeddatasource="grdLogins_NeedDataSource" >
    <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}" />
    <MasterTableView>
        
        <RowIndicatorColumn Visible="False">
        <HeaderStyle Width="20px"  HorizontalAlign="Left"></HeaderStyle>
        </RowIndicatorColumn>

        <ExpandCollapseColumn Visible="False" Resizable="False">
        </ExpandCollapseColumn>
        <Columns>
            <radG:GridTemplateColumn HeaderText="Login Date/Time" SortExpression="DateAdded" >
                <ItemStyle  width="200" HorizontalAlign="Left"/>
                <ItemTemplate>
                    <%# Eval("DateAdded") %>
                </ItemTemplate>
            </radG:GridTemplateColumn>
            <radG:GridTemplateColumn HeaderText="IP Address of Login" SortExpression="IP">
                <ItemStyle  width="200" HorizontalAlign="Left"/>
                <ItemTemplate>
                    <%# Eval("IP") %>
                </ItemTemplate>
            </radG:GridTemplateColumn>
        </Columns>
        <SortExpressions>
            <radG:GridSortExpression FieldName="DateAdded" SortOrder="Descending" />
        </SortExpressions>
        <NoRecordsTemplate>
            Sorry but this user has not logged into the site for the selected criteria.
        </NoRecordsTemplate>
    </MasterTableView>
</radG:RadGrid>