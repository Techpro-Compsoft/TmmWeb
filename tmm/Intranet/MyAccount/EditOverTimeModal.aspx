<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditOverTimeModal.aspx.vb" Inherits="MyAccount.EditOverTimeModal" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Overtime Availability</title>
    <LINK href="/trinity.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
    	function GetRadWindow(){
			var oWindow = null;
			if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
			else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;//IE (and Moz az well)
			return oWindow;}
		
		function CloseOnReload(){
            RefreshParentPage();
            GetRadWindow().Close();}

        function RefreshParentPage(){GetRadWindow().BrowserWindow.location.reload();}
        
        function MaxLength(){
            var text = document.getElementById('txtComments');
            if (text != null){
                if (text.value.length > 250){
                    text.value = text.value.substr(0, 250);
                    alert("Comment must be less than 250 characters.");
                    return false;}
                else{return true;}}}
    </script>
    <script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
</head>
<body  bgcolor="black">
    <form id="form1" runat="server">
        <div>
            <radA:RadAjaxPanel ID="pnlAjax" runat="server" EnableAJAX="true" EnableOutsideScripts="true">
                <TABLE class="SmallBorder" id="Table1" cellSpacing="1" cellPadding="1" align="center" border="0" width="65%">
			        <TR CLASS="DataGridHdr">
				        <TD class="SecHdr" style="HEIGHT: 20px">&nbsp;
					        <asp:label id="lblHeader" runat="server"></asp:label></TD>
			        </TR>
			        <TR>
				        <TD class="stdFont" align="center">
					        <P>Please enter the following information to help us update your overtime 
						        availability.
					        </P>
    						
					        <TABLE id="Table2" style="HEIGHT: 49px" cellSpacing="1" cellPadding="1" width="100%" border="0" class="stdFont">
						        <TR>
							        <TD class="stdFont" style="WIDTH: 115px; HEIGHT: 26px" align="right">I am available from:</TD>
							        <td class="stdFont" style="HEIGHT: 26px" align="right">
									    <radCln:RadDatePicker ID="rdpStart" runat="server" SkinID="Trinity" MaxDate="3000-12-31" MinDate="1000-01-01">
									        <DatePopupButton CssClass="RadDatePickerButton" />
									        <DateInput MaxLength="10"></DateInput>
									        <Calendar Skin="Trinity"></Calendar>
									    </radCln:RadDatePicker>
									    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								        <radCln:RadDatePicker ID="rdpEnd" runat="server" SkinID="Trinity" MaxDate="3000-12-31" MinDate="1000-01-01">
								            <DatePopupButton CssClass="RadDatePickerButton" />
								            <DateInput MaxLength="10"></DateInput>
								            <Calendar Skin="Trinity"></Calendar>
								        </radCln:RadDatePicker>
							        </td>
						        </TR>
						        <TR>
							        <TD class="stdFont" vAlign="top" align="right">Comments:</TD>
							        <td align="right" vAlign="top">
							            <div id="divNote" onkeypress="return MaxLength();" onpaste="return MaxLength();">
							                <asp:textbox id="txtComments" Width="320px" runat="server" Height="86px" TextMode="MultiLine" MaxLength="250"></asp:textbox>
							            </div>
							        </td>
						        </TR>
						        <tr>
							        <td colspan="2" align="right">
								        <asp:button id="btnSubmit" runat="server" Text="Submit" CssClass="btnSmall"></asp:button>&nbsp;&nbsp;
								        <asp:button id="btnCancel" runat="server" Text="Cancel" OnClientClick="GetRadWindow().Close();" CssClass="btnSmall"></asp:button>
							        </td>
						        </tr>
					        </TABLE>
				        </TD>
			        </TR>
		        </TABLE>
		    </radA:RadAjaxPanel>
        </div>
    </form>
</body>
</html>
