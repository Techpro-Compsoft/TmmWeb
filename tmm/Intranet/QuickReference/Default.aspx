<%@ Page Language="vb" AutoEventWireup="false" Inherits="ServiceLocator._Default" CodeBehind="Default.aspx.vb" EnableEventValidation="false"%>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadComboBox.Net2" Namespace="Telerik.WebControls" TagPrefix="radC" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadInput.Net2" Namespace="Telerik.WebControls" TagPrefix="radI" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trinity Medical Management - Service Locator</title>
    <link rel="stylesheet" href="style/Objects.css" type="text/css" />
    <link rel="stylesheet" href="style/Elements.css" type="text/css" />
    <link rel="stylesheet" href="/trinity.css" type="text/css" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache"> <META HTTP-EQUIV="Expires" CONTENT="-1">
    <script type="text/javascript">
    function handleError() {
	    return true;
    }
    	
    	function ShowHide() {
    	    var ctlEmbed = document.getElementById("ctlEmbed");
    	    var spanLoading = document.getElementById("spanLoading");
			if(ctlEmbed != null && ctlEmbed != 'undefined') ctlEmbed.style.visibility = "visible";
			if(spanLoading != null && spanLoading != 'undefined') spanLoading.style.display = "none";
		}
		function Left(str, num) {
			var strLeft = new String(str);
			return strLeft.substr(0, num);
			
		}
        function ServiceInfo(code){
            window.open("drinfo.aspx?code=" + code);
        }

        function RigInfo(code) {
            window.open("riginfo.aspx?RigID=" + code);
        }
        
       function openDRData(ServiceCodeID)
        {
            window.open("drinfo.aspx?code=" + ServiceCodeID);
            return;
        }    
    window.onerror = handleError;


    function validate()
    {
        var retval = true;
        
        if (document.getElementById("cboList") != null)
        {
            if (document.getElementById("cboList").getAttribute("SelectedIndex") == 0 && document.getElementById("rdoRig").getAttribute("Checked") == true)
            {
                alert("Please Choose a Rig.");
                document.all('cboList').focus();
                retval = false;
            }
        }
        else if (document.getElementById("txtCity").value == "" && document.getElementById("rdoCity").checked == true)
        {
            alert("Please Enter a City.");
            document.all('txtCity').focus();
            retval = false;
        }
        
        return retval;   
    }
    
    function OpenDrInfo(Number)
    {
        var link = 'drinfo.aspx?code=' + Number;
        window.open(link);
    }
    </script>
</head>
<body style="text-align:center; margin-top:0px; margin-left:0px;">
    <form id="form1" runat="server">
    <radA:RadAjaxPanel ID="rapMain" runat="server" EnableOutsideScripts="true" EnableAJAX="true">
    <script type="text/javascript">
        var supressDropDownClosing = false;
        var closeCount = 0;
        var rigCount = 0;
        
        function OnClientDropDownClosing(combobox)
        {
            var isChecked = document.getElementById("isChecked");
            if(isChecked.value == "true")
            {
                if(closeCount == 1)
                {
                    isChecked.value = "false";
                    closeCount = 0;
                }
                else { closeCount += 1; }
                return ( ! supressDropDownClosing);
            }
                closeCount = 0;
                return true;
        }
        
        function OnClientSelectedIndexChanging(combobox) { return ( ! supressDropDownClosing); }
        
        function OnClientDropDownOpening(combobox) { supressDropDownClosing = true; }
        
        function checkboxClick()
        {            
            var isChecked = document.getElementById("isChecked");
            collectSelectedItems();
            isChecked.value = "true";
        }
        
        function getItemCheckBox(item)
        {
            //Get the 'div' representing the current RadComboBox Item.
            var itemDiv = document.getElementById(item.ClientID);
            //Get the collection of all 'input' elements in the 'div' (which are contained in the Item).
            var inputs = itemDiv.getElementsByTagName("input");
            for (var inputIndex = 0; inputIndex < inputs.length; inputIndex++)
            {   
                var input = inputs[inputIndex];
                //Check the type of the current 'input' element.
                if (input.type == "checkbox") { return input; }
            }
            return null;
        }
        
        function collectSelectedItems()
        {
            var items = rcbList.Items;
            var selectedItemsTexts = "";
            var selectedItemsValues = "";
            var itemsCount = items.length;
            rigCount = 0;
            for (var itemIndex = 0; itemIndex < itemsCount; itemIndex++)
            {
                var item = items[itemIndex];
                var checkbox = getItemCheckBox(item);
                
                //Check whether the Item's CheckBox) is checked.
                if (checkbox.checked)
                {
                    rigCount += 1;
                    selectedItemsTexts += item.Text + ", ";
                    selectedItemsValues += item.Value + ", ";
                }
            }
            
            selectedItemsTexts = selectedItemsTexts.substring(0, selectedItemsTexts.length - 2);
            selectedItemsValues = selectedItemsValues.substring(0, selectedItemsValues.length - 2);
            
            //Set the text of the RadComboBox with the texts of the selected Items, separated by ','.
            rcbList.SetText(selectedItemsTexts);

            //Set the comboValue hidden field value with values of the selected Items, separated by ','.
            document.getElementById("comboValue").value = selectedItemsValues;
            
            if(rigCount == 1)
            {
                var rigID = selectedItemsValues;
                <%=strCallback%>
            }
            else { document.getElementById('<%= btnJobSheet.ClientID %>').style.display = "none"; }
            
            //Clear the selection that RadComboBox has made internally.
            if (selectedItemsValues == "") { rcbList.ClearSelection(); }
        }
        
        function SetVisibility(isValid)
        {
            var btnJobSheet = document.getElementById('<%= btnJobSheet.ClientID %>');
            if(isValid=="True") { btnJobSheet.style.display = "inline"; }
            else { btnJobSheet.style.display = "none"; }
        }
        
        window.onload = collectSelectedItems;
    </script>
    <asp:Label ID="lblRadOpen" runat="server" Visible="false"></asp:Label>
    <input type="hidden" id="comboValue" value="" runat="server" />
    <input type="hidden" id="isChecked" value="" runat="server" />
    <div style="width:900px;">
        <table width="100%">
            <tr>
                <td><img src="Images/Trinity_GraphicBar_Services.jpg" alt="Trinity_Header"/></td>
            </tr>
            <tr>
                <td><uc1:NavigationMenu id="menu" runat="server"></uc1:NavigationMenu></td>
            </tr>
            <tr>
                <td>
                    <div id="mainContainer" style="width:100%; height:200px; margin-left:-3px;">
                        <table style="width:100%;" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="height:15px;"></td>
                            </tr>
                            <tr>
                                <td colspan="3"><button onclick="window.radopen('PatientNotes.aspx', 'windowNotes')" class="btnSmall" title="Create A New Patient Note">Add Patient Note</button></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height:5px;"></td>
                            </tr>
                            <tr>
                                <td style="width:49%;">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlLocationInformation" runat="server" Height="100">
                                                    <fieldset style="height:115px; margin-top:9px;">
                                                        <legend style="font-size:11px;">LOCATION INFORMATION</legend>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr style="height:40px;">
                                                                    <td style="width:5px;"></td>
                                                                    <td valign="top"><asp:RadioButton ID="rdoRig" runat="server" GroupName="GrpChoice" Checked="true" OnCheckedChanged="rdoRig_CheckedChanged" AutoPostBack="true"/></td>
                                                                    <td valign="top" width="100%">&nbsp;Choose a Rig:&nbsp;
                                                                        <radC:RadComboBox ID="rcbList" runat="server" DataTextField="rigName" DataValueField="rigID" AutoPostBack="false" TabIndex="1"
                                                                            Width="229" Height="150" AllowCustomText="true" HighlightTemplatedItems="true" Skin="Classic"
                                                                            OnClientDropDownOpening="OnClientDropDownOpening"
                                                                            OnClientDropDownClosing="OnClientDropDownClosing"
                                                                            OnClientSelectedIndexChanging="OnClientSelectedIndexChanging">
                                                                            <ItemTemplate>
                                                                                <div align="left">
                                                                                    <asp:CheckBox ID="chkRig" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rigName") %>' ForeColor="Black" Font-Size="12px" onclick="checkboxClick();" AutoPostBack="false"/>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                        </radC:RadComboBox>&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnJobSheet" runat="server"  ImageUrl="Images/memobook_blue.gif" ToolTip="View Job Info Sheet" />
                                                                        <br />&nbsp;&nbsp;&nbsp;<span class="WhiteItalic" style="vertical-align:top;">(NOTE: If more than one rig is selected, services will not be displayed.)</span>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height:40px;">
                                                                    <td style="width:5px;"></td>
                                                                    <td><asp:RadioButton ID="rdoCity" runat="server" GroupName="GrpChoice" AutoPostBack="true" OnCheckedChanged="rdoCity_CheckedChanged" TabIndex="2"/></td>
                                                                    <td>&nbsp;Enter a City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCity" runat="server" Enabled="false" AutoPostBack="false" TabIndex="3" Width="230" Height="25"></asp:TextBox></td>
                                                                </tr>
                                                            </table>   
                                                    </fieldset>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height:15px;"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <fieldset>
                                                    <div style="padding-left:10px; padding-right:5px; padding-top:5px; padding-bottom:5px;">
                                                        Radius (from Rig):&nbsp;&nbsp;
                                                        <asp:TextBox ID="txtRadius" runat="server" MaxLength="4" Width="40px" Text="100" TabIndex="4"></asp:TextBox>
                                                        &nbsp;&nbsp;miles&nbsp;&nbsp; | &nbsp;&nbsp;Show Cities:&nbsp;&nbsp;
                                                        <asp:CheckBox ID="chkShowCities" runat="Server" Checked="true" TabIndex="5" />
                                                    </div>
                                                </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width:2%;"></td>
                                <td style="width:49%;">
                                    <fieldset style="height:107px;">
                                        <table>
                                            <tr>
                                                <td style="height:5px;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:5px;"></td>
                                                <td>Category:</td>
                                                <td style="width:10px;"></td>
                                                <td align="right"><asp:DropDownList ID="cboCategory" runat="server" TabIndex="6" DataTextField="Name" DataValueField="SpecialtyID" Width="245px"></asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="height:15px;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:5px;"></td>
                                                <td>Service Preference:</td>
                                                <td style="width:10px;"></td>
                                                <td align="right"><asp:DropDownList ID="cboPreference" runat="server" DataTextField="EmployerName" DataValueField="EmployerID" TabIndex="7" Width="245px"></asp:DropDownList></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <table width="100%">
                                        <tr>
                                            <td style="height:15px;"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right;"><asp:Button ID="btnGo"  runat="server" Text="GO" OnClientClick="return validate();" TabIndex="8" CssClass="btnSmall" Width="50" ToolTip="Search"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div id="mapPanelContainer" runat="server" style="width:900px; border:solid 1px #ccccff; background-color:#000000;">
                        <table width="100%">
                            <tr>
                                <td style="text-align:center; color:#FFFFFF; font-size:8pt;">
                                    If you are experiencing issues viewing the map below click here to download the
                                    <a href="/Intranet/ServiceLocator/SVGView.exe" title="Download Adobe SVG Viewer">Adobe SVG viewer</a>.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <!--[if gte IE 6]><script language="javascript">document.write("<NOSCRIPT class=clickfix><OBJECT style=\"display:none\">"); </script> <!--<![endif]-->
                                    <asp:Literal ID="litSVG" runat="server"></asp:Literal><!--[if gte IE 6]></OBJECT></NOSCRIPT><!--<![endif]-->
                                </td>
                            </tr>
                            <tr>
                                <td align="center"><img src="Images/legend_new.gif" alt="Legend"/></td>
                            </tr>
                        </table>
                    </div>
                    <table width="100%" style="margin-left:-3px;">
                        <tr>
                            <td style="height:10px;"></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="font-size:12px;"><asp:LinkButton ID="lnkbtnReset" runat="server" Text="RESET GRID" ToolTip="Resets the grids sorting to its default values." OnClick="lnkbtnReset_Click"></asp:LinkButton></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <radG:RadGrid ID="grdServices" runat="server" AutoGenerateColumns="false" Width="907" BorderColor="#ccccff" BorderWidth="1px"
                                    BorderStyle="solid" AllowSorting="true" CellPadding="2" GroupingEnabled="false" EnableAJAX="false" Skin="none">
                                    <MasterTableView GridLines="both" AllowMultiColumnSorting="true" CellPadding="2">
                                        <HeaderStyle BackColor="black" Height="20px" ForeColor="white" Font-Bold="true" HorizontalAlign="center" Font-Size="12px" />
                                        <ItemStyle ForeColor="white" BackColor="black" Font-Size="14px" Height="35"/>
                                        <AlternatingItemStyle ForeColor="white" BackColor="black" Font-Size="14px" Height="35"/>
                                        <SortExpressions>
                                            <radG:GridSortExpression FieldName="TierOrderAsInt" SortOrder="ascending" />
                                            <radG:GridSortExpression FieldName="DistanceAsDouble" SortOrder="ascending" />
                                        </SortExpressions>
                                        <Columns>
                                            <radG:GridTemplateColumn HeaderText="SERVICE NAME" SortExpression="ServiceName" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif">
                                                <HeaderStyle Width="22%" />
                                                <ItemTemplate>
                                                    <a href='javascript:openDRData(<%#Eval("ServiceID").ToString()%>);' style="color:#FFFFFF;" title="Doctor Information"><%#Eval("ServiceName") %></a>
                                                </ItemTemplate>
                                            </radG:GridTemplateColumn>
                                            <radG:GridBoundColumn DataField="EmployerName" HeaderText="EMPLOYER NAME" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif">
                                                <HeaderStyle Width="17%" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="ServiceTypeName" HeaderText="SERVICE TYPE" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif">
                                                <HeaderStyle Width="12%" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="PhysicalCityName" HeaderText="CITY" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif">
                                                <HeaderStyle Width="12%" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="MainPhone" HeaderText="PHONE NUMBER" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif">
                                                <HeaderStyle Width="13%" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="DistanceAsDouble" HeaderText="DISTANCE" SortExpression="DistanceAsDouble" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif" >
                                                <HeaderStyle Width="11%" />
                                            </radG:GridBoundColumn>
                                            <radG:GridBoundColumn DataField="TierDescription" HeaderText="TIER" SortExpression="TierOrderAsInt" SortAscImageUrl="Images/SortAsc.gif" SortDescImageUrl="Images/SortDesc.gif" >
                                                <HeaderStyle Width="13%" />
                                            </radG:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </radG:RadGrid> 
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height:10px;"></td>
            </tr>
            <tr>
                <td align="center"><img src="/images/Grphc_BotBar.jpg" alt="Footer" width="100%"/></td>
            </tr>
        </table>
        <asp:HiddenField ID="hiddenTierDesc" runat="server" Value="TierOrderAsInt" />
        <asp:HiddenField ID="hiddenDistance" runat="server" Value="DistanceAsDouble" />
    </div>
    <radW:RadWindowManager ID="radWindow" runat="server">
        <Windows>
            <radW:RadWindow ID="windowNotes" NavigateUrl="PatientNotes.aspx" runat="server" Modal="true" Height="500px" Width="850px"
                VisibleStatusBar="false" DestroyOnClose="false" left="" Title="Patient Notes" Top="" Behavior="close"
                BorderColor="white" BorderStyle="solid" BorderWidth="2" />
            <radW:RadWindow ID="windowMultiple" NavigateUrl="MultipleCities.aspx" runat="server" Modal="true" Width="600px" Height="430px"
                VisibleStatusBar="false" DestroyOnClose="false" Left="" Title="Multiple Cities Found" Top="" Behavior="close"
                BorderColor="white" BorderStyle="solid" BorderWidth="2" />
        </Windows>
    </radW:RadWindowManager>
    </radA:RadAjaxPanel>
    </form>
    <script language="JScript" type="text/jscript" src="ClickFix.js"></script>
</body>
</html>
