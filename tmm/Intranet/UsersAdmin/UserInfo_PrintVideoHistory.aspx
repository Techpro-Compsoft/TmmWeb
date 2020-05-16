<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo_PrintVideoHistory.aspx.cs" Inherits="UsersAdmin.UserInfo_PrintVideoHistory" %>
<%@ Register src="Controls/UserVideoLibraryGrid.ascx" tagname="UserVideoLibraryGrid" tagprefix="uc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="RadControls/Grid/Skins/Outlook2007/styles.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">

        function hidePrint() {
            document.getElementById('spnPrint').style.display = 'none';
        }
    
    </script>
    
    <style media="print" type="text/css">
        .PrintButton
        {
        	display:none;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
	<asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    	<center>
			<table width="760" cellpadding="0" cellspacing="0" border="0" class="SmallBorder" style="border:1px solid black; height:100%;">
				<tr style="height:151" valign="top">
					<td>
					    <img src="images/Trinity_GraphicBar_Users.jpg" alt="" width="760" height="78" />
					</td>
				</tr>
			    <tr>
				    <td>
				        <table style="width:100%; font-family:Arial; font-size:12px;">
				            <tr>
				                <td style="text-align:left;">
				                    <asp:Literal ID="litDate" runat="server"></asp:Literal>               
				                </td>
				                <td style="text-align:right; color:Black;">
				                    <span id="spnPrint"><a href="javascript:window.print(); " style="border:0px; color:Black;" class="PrintButton">PRINT <img src="/Images/print.gif" alt="Print"  style="border:0px;" /></a></span>
				                </td>
				            </tr>
				        </table>
				    </td>
				</tr>
				<tr>
				    <td style="text-align:center; font-family:Arial; font-size:20px; font-weight:bold;">
				        Video History: <asp:Literal ID="litUserName" runat="server"></asp:Literal>
				    </td>
				</tr>
				<tr>
				    <td>
				        <uc5:UserVideoLibraryGrid ID="UserVideoLibraryGrid1" runat="server" ShowPager="False" />    
				    </td>
				</tr>
			</table>
		</center>
    </form>
</body>
</html>
