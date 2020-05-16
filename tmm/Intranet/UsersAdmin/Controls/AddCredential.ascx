<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCredential.ascx.cs" Inherits="UsersAdmin.Controls.AddCredential" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="rad" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>

<script type="text/javascript">

    function valSelectCredVal(source, arguments) 
    {
        arguments.IsValid = (arguments.Value!="0");
    }
    
    function checkForAddCred() {
        //alert(document.getElementById('<% = ddlSelectCred.ClientID %>').value == "-1");

        if (document.getElementById('<% = ddlSelectCred.ClientID %>') != null) 
        {
            if (document.getElementById('<% = ddlSelectCred.ClientID %>').value == "-1") 
            {
                document.getElementById('trNewCredType').style.display = "";
                document.getElementById('<%= valNewCredType.ClientID %>').enabled = true;
            }
            else 
            {            
                document.getElementById('trNewCredType').style.display = "none";
                document.getElementById('<%= valNewCredType.ClientID %>').enabled = false;
            }
        }
    }
</script>
<script type="text/javascript" src="Scripts/MaxLength.js"></script>
<script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
<style type="text/css">
.MasterTable_Outlook2007_NoAlt .GridHeader_Outlook2007_NoAlt
{
	text-align: left;
}
</style>
<asp:Panel ID="pnlGenInfo" runat="server" GroupingText="Credentials"  ForeColor="White" Font-Names="Arial" Font-Size="12px">

<table style="color:White; width:100%; text-align:left; border:0px;" cellpadding="0">
    <tr>
        <td>
            <table cellpadding="8" style="vertical-align:top;" width="100%">
                <tr id="trAddCredTable" runat="server">
                    <td>
                        <table style="width:100%">
                            <tr>
                            
                                <td>* Credential<br /><asp:DropDownList ID="ddlSelectCred" runat="server"
                                        Width="400px" onselectedindexchanged="ddlSelectCred_SelectedIndexChanged"></asp:DropDownList><br /><asp:CustomValidator ID="valCred" runat="server" ControlToValidate="ddlSelectCred" ErrorMessage="* Required" Display="Dynamic" ClientValidationFunction="valSelectCredVal" ValidationGroup="valAddCred"></asp:CustomValidator></td>
                                <td>* Expiration Date<br />
                                <rad:RadDatePicker ID="radDate" Width="200px" runat="server" Skin="Trinity" DatePopupButton-ImageUrl="../images/btn_SelectDate.jpg" DatePopupButton-HoverImageUrl="../images/btn_SelectDate.jpg" >
                                    <DatePopupButton CssClass="RadDatePickerButton" />
								    <DateInput MaxLength="10"></DateInput>
								    <Calendar Skin="Trinity"></Calendar>
                                </rad:RadDatePicker><br /><asp:RequiredFieldValidator ID="valCredExpDate" runat="server" ControlToValidate="radDate" ErrorMessage="* Required" Display="Dynamic" ValidationGroup="valAddCred"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr id="trNewCredType">
                                <td colspan="2">* New Credential Type<br /><asp:TextBox ID="txtNewCredType" runat="server" Width="400px"></asp:TextBox><asp:RequiredFieldValidator ID="valNewCredType" runat="server" ErrorMessage="* Required" Display="Dynamic" ControlToValidate="txtNewCredType"  ValidationGroup="valAddCred"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2">Note<br /><textarea id="txtNote" runat="server" style="width:100%; height:40px;" onkeyup="FixTextarea(this)" onkeypress="return textMaxLength(this, '49', event);" onpaste='return maxLengthPaste(this)'  ></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:right;"><asp:button ID="btnCancel" runat="server" 
                                        Text="Cancel" CssClass="btnSmall" CausesValidation="false" 
                                        onclick="btnCancel_Click" />&nbsp;<asp:button ID="btnAdd" runat="server" 
                                        Text="Add" CssClass="btnSmall" ValidationGroup="valAddCred" 
                                        onclick="btnAdd_Click" /></td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
                <tr id="trAddButton" runat="server">
                    <td style="text-align:right;">
                        <asp:Button ID="btnAddCredential" runat="server" Text="Add Credential" 
                            CssClass="btnSmall" CausesValidation="false" onclick="btnAddCredential_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <radG:RadGrid ID="grdCredentials" runat="server" AutoGenerateColumns="False" 
                            GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True"  
                            Skin="Outlook2007_NoAlt" EnableAJAX="true" CommandItemDisplay="Top" 
                            onneeddatasource="grdCredentials_NeedDataSource" 
                            onitemdatabound="grdCredentials_ItemDataBound" 
                            oneditcommand="grdCredentials_EditCommand" 
                            onupdatecommand="grdCredentials_UpdateCommand"
                            onitemcommand="grdCredentials_ItemCommand" 
                            ondeletecommand="grdCredentials_DeleteCommand" >
                          
                            <PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                            <MasterTableView>

                                <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px"  HorizontalAlign="Left"></HeaderStyle>
                                </RowIndicatorColumn>

                                <ExpandCollapseColumn Visible="False" Resizable="False">
                                <HeaderStyle Width="20px" ></HeaderStyle>
                                </ExpandCollapseColumn>
                                <Columns>
                                   <radG:GridTemplateColumn HeaderText="Credential" SortExpression="MedCredTypeString" HeaderStyle-HorizontalAlign="Left">
                                        <ItemStyle  width="200" HorizontalAlign="Left"/>
                                        <ItemTemplate>
                                            <%# Eval("MedCredTypeString")%>
                                        </ItemTemplate>
                                   </radG:GridTemplateColumn>
                                   <radG:GridTemplateColumn HeaderText="Expiration Date" SortExpression="ExpDate" >
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("ExpDate")).ToShortDateString()%>
                                        </ItemTemplate>
                                   </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" CommandName="Edit" runat="server" Text="Edit" CausesValidation="false"></asp:LinkButton>&nbsp;
                                            <asp:LinkButton ID="lnkDelete" OnClientClick="return confirm('Are you sure you want to remove this credential from the user\'s credential list?');" CommandName="Delete" runat="server" Text="Delete" CausesValidation="false" CommandArgument='<%# Eval("TempID") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                </Columns>
                                <SortExpressions>
                                    <radG:GridSortExpression FieldName="ExpDate" SortOrder="Ascending" />
                                </SortExpressions>
                                <EditFormSettings UserControlName="Controls/AddCredential_Edit.ascx" EditFormType="WebUserControl">
                                    <EditColumn UniqueName="EditCol1"></EditColumn>
                                </EditFormSettings>
                                <NoRecordsTemplate>
                                    There are currently no credentials for this user.
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </radG:RadGrid>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">

checkForAddCred();

</script>
</asp:Panel>