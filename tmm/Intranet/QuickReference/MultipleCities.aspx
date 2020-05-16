<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MultipleCities.aspx.vb" Inherits="ServiceLocator.MultipleCities" %>

<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Multiple Cities Found</title>
    <link rel="stylesheet" href="style/Objects.css" type="text/css" />
    <link rel="stylesheet" href="style/Elements.css" type="text/css" />
    <link rel="stylesheet" href="/trinity.css" type="text/css" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache"> <META HTTP-EQUIV="Expires" CONTENT="-1">
    <script language="javascript" type="text/javascript">
    function GetRadWindow()
    {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow;
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
    }
    function CloseOnReload()
    {
        GetRadWindow().Close();
        GetRadWindow().BrowserWindow.document.forms[0].submit();
    }
    </script>
</head>
<body style="background-color:#d0d0d0; color:Black;">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="padding:15px 0px 15px 15px;" align="left">
                    <b>Multiple Cities Found:</b>
                </td>
            </tr>
            <tr>
                <td>
                    <radG:RadGrid ID="rgCities" runat="server" AutoGenerateColumns="False" CellPadding="0" CellSpacing="0" GridLines="Horizontal"
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" AllowPaging="True" ForeColor="Black" Skin="none"
                        OnNeedDataSource="rgCities_NeedDataSource" OnItemCommand="rgCities_ItemCommand" PageSize="10">
                        <HeaderStyle BackColor="White" ForeColor="Black" HorizontalAlign="left"/>
                        <ItemStyle BackColor="White" ForeColor="Black" HorizontalAlign="left"/>
                        <PagerStyle Mode="NumericPages" HorizontalAlign="Center" VerticalAlign="Middle"/>
                        <MasterTableView GridLines="Horizontal" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" BackColor="White" ForeColor="Black">
                            <Columns>
                                <radG:GridButtonColumn HeaderText="City" UniqueName="City" CommandName="Select" DataTextField="CityName">
                                    <HeaderStyle Width="25%" />
                                </radG:GridButtonColumn>
                                <radG:GridButtonColumn HeaderText="State" UniqueName="State" CommandName="Select" DataTextField="State">
                                    <HeaderStyle Width="20%" HorizontalAlign="center" />
                                    <ItemStyle HorizontalAlign="center" />
                                </radG:GridButtonColumn>
                                <radG:GridButtonColumn HeaderText="Country" UniqueName="Country" CommandName="Select" DataTextField="Country">
                                    <HeaderStyle Width="25%" />
                                </radG:GridButtonColumn>
                                <radG:GridButtonColumn HeaderText="Latitude" UniqueName="Latitude" CommandName="Select" DataTextField="Latitude">
                                    <HeaderStyle Width="15%" HorizontalAlign="center" />
                                    <ItemStyle HorizontalAlign="center" />
                                </radG:GridButtonColumn>
                                <radG:GridButtonColumn HeaderText="Longitude" UniqueName="Longitude" CommandName="Select" DataTextField="Longitude">
                                    <HeaderStyle Width="15%" HorizontalAlign="center" />
                                    <ItemStyle HorizontalAlign="center" />
                                </radG:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                    </radG:RadGrid>
                </td>
            </tr>
            <tr>
                <td style="padding:15px 15px 15px 0px;" align="right">
                    <asp:Button ID="btnCancel" runat="server" CssClass="btnSmall" Text="Cancel" OnClick="btnCancel_Click"/>   
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
