<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectUser.aspx.cs" Inherits="TrinityMedicalManagement.SelectUser" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="trinity.css" type="text/css" rel="stylesheet" />
	<script language="javascript" type="text/javascript" src="scripts/pageScripts.js"></script>
	<script type="text/javascript">
	    function ValidateForm() 
	    {
	        var chkBoxes = document.getElementsByTagName("INPUT");
	        for (x = 0; x < chkBoxes.length; x++) {
	            if (chkBoxes[x].type == "checkbox") {
	                if (chkBoxes[x].checked) {
	                    return true;
	                }
	            }
	        }
	        alert('You must select at least one person to notify of this note. Please try again.');
	        return false;
	    }
	</script>
</head>
<body style="background-color:#d0d0d0";>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td rowspan="5">
                            
                            </td>
                            <td>
                                Please select who you would like to notify of this note from the listing below.
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;"> 
                                <radG:RadGrid ID="radCompanyUsers" BorderStyle="None" runat="server" Skin="None" ItemStyle-BorderStyle="None"
                                     AlternatingItemStyle-BorderStyle="None" OnItemDataBound="radCompanyUsers_ItemDataBound" AutoGenerateColumns="false"
                                      GridLines="None" >
                                    <MasterTableView BorderStyle="None" DataKeyNames="FirstName,LastName,Email">
                                        <Columns>
                                            <radG:GridTemplateColumn UniqueName="colUserName">
                                                <ItemTemplate>
                                                    <asp:CheckBox id="chkUser" runat="server" CausesValidation="False" Font-Overline="False" />
                                                    <asp:Literal ID="litUsername" runat="server" />
                                                    <asp:Literal ID="litEmail" runat="server" Visible="false" />
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                </radG:RadGrid>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Button id="btnOK" runat="server" CssClass="btnSmall" Text="OK" OnClientClick="return ValidateForm();" OnClick="btnOK_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
