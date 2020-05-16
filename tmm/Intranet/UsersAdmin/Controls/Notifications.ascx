<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Notifications.ascx.cs" Inherits="UsersAdmin.Controls.Notifications" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<asp:Panel ID="pnlNotes" runat="server" GroupingText="Notifications"  ForeColor="White" Font-Names="Arial" Font-Size="12px">
<asp:HiddenField ID="hidUserID" runat="server" Value="0" />
<table style="color:White; width:100%; text-align:left; border:0px;" cellpadding="0">
    <tr>
        <td style="padding:10px;">
            <radG:RadGrid ID="grdNotifications" runat="server" AutoGenerateColumns="False" 
                GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
                Skin="Outlook2007" HorizontalAlign="Left" 
                onneeddatasource="grdNotifications_NeedDataSource" >
                <PagerStyle Mode="NextPrevAndNumeric" />

                <MasterTableView>
                    <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                    <RowIndicatorColumn Visible="False">
                    <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>

                    <ExpandCollapseColumn Visible="False" Resizable="False">
                    <HeaderStyle Width="20px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <Columns>
                        <radG:GridTemplateColumn HeaderText="Received Date" >
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("DateAdded")).ToShortDateString() %>
                            </ItemTemplate>
                        </radG:GridTemplateColumn>
                        <radG:GridTemplateColumn HeaderText="Notification Subject" >
                            <ItemTemplate>
                                New Patient Encounter: #<%# Eval("PatientID") %>
                            </ItemTemplate>
                        </radG:GridTemplateColumn>
                    </Columns>
                    <NoRecordsTemplate>
                        Sorry but this user has not received any notifications.
                    </NoRecordsTemplate>
                </MasterTableView>
                
            </radG:RadGrid>
        </td>
    </tr>
</table>
</asp:Panel>