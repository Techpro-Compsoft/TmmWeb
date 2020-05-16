<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoAdmin.aspx.cs" Inherits="UsersAdmin.VideoAdmin" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolKit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" ><head id="Head1" runat="server"><title></title>
<link href="RadControls/Grid/Skins/Outlook2007/styles.css" rel="stylesheet" type="text/css" />
<link href="/trinity.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
    legend{  
     color:#ffffff;
    } 
    
            .RadGrid_Outlook2007 .rgCollapse
            {
            	border:0;
            	padding:0;
            	background:url('RadControls/Grid/Skins/OutLook2007/SingleMinus.gif') no-repeat;
            	vertical-align:top;
            	cursor:pointer;
            	height:16px;
            	width:16px;
            }

            .RadGrid_Outlook2007 .rgExpand
            {
            background:url('RadControls/Grid/Skins/OutLook2007/SinglePlus.gif') no-repeat;
            	vertical-align:top;
            	cursor:pointer;
            	height:16px;
            	width:16px;
            	border:0;
            	padding:0;
            }
            
            .RadGrid_Outlook2007 .rgPagePrev
            {
            	display:none;
           }

            .RadGrid_Outlook2007 .rgPageNext
            {
            	display:none;
            }
            
            .DetailTable_Outlook2007
            {
            	position:relative;
            	left:-20px;
            	width:100%;
            }
</style>
<script type="text/javascript" language="javascript">
    function DeleteConfirm(sender,VideoName) 
    {
        var cbFunction = function(args) {
            if (args) {
                if (navigator.appName.indexOf("Microsoft") == -1) {
                    var jscript = sender.href.split(':');
                    setTimeout(jscript[1].replace(/\%20/gi, ' '),1);
                } else {
                    setTimeout(sender.pathname, 1);
                }
            }
        }

        radconfirm("Are you sure you want to permanently delete the " + VideoName + " video?", cbFunction);
    }
</script>
</head>
<body style="margin-top:0; margin-left:0; background-color:#000000;">
    <form runat="server" id="frm1">
    <asp:scriptmanager id="SM" runat="server" />
    <telerik:radscriptblock id="radSB" runat="server">
        <script type="text/javascript" language="javascript">
            function RebindGrid() 
            {
                var rgCat = $find("<%= rgCategories.ClientID %>");
                rgCat.get_masterTableView().rebind();
            }
            
            var tableView = null;
            function pageLoad(sender, args) {
                tableView = $find("<%= rgCategories.ClientID %>").get_masterTableView();
            }

            function changePage(argument) {
                var detailTablesArray = $find("<%= rgCategories.ClientID %>").get_detailTables();
                detailTablesArray[0].page(argument);
            }

            function viewAll() {
                var detailTablesArray = $find("<%= rgCategories.ClientID %>").get_detailTables();
                var pSize = detailTablesArray[0].PageCount * detailTablesArray[0].PageSize;
                detailTablesArray[0].set_pageSize(pSize);
            }
        </script>
    
    </telerik:radscriptblock>
	    <%--<telerik:radscriptmanager id="radSM" runat="server" enablepartialrendering="true" />--%>
	    <telerik:radajaxmanager id="radAjax" runat="server" EnableEmbeddedScripts="true">
	        <ajaxsettings>
	            <telerik:ajaxsetting ajaxcontrolid="rgCategories">
	                <updatedcontrols>
	                    <telerik:ajaxupdatedcontrol controlid="rgCategories" />
	                    <telerik:ajaxupdatedcontrol controlid="radWindowMgr" />
	                </updatedcontrols>
	            </telerik:ajaxsetting>
	        </ajaxsettings>
	    </telerik:radajaxmanager>
	    <center>
			<table width="760" style="height:100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
				<tr style="height:78" valign="top">
					<td>
					    <img src="images/Trinity_GraphicBar_VideoAdmin.jpg" alt="" width="760" height="78" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="100%" class="MenuBar">
                            <tr>
                                <td><tmm:tmmmenu ID="tmmMenu" runat="server" /></td>
                            </tr>
						</table>
					</td>
				</tr>
				<tr>
				    <td valign="middle" align="right" style="padding:10px 10px 0px 0px;">
				        <asp:button id="btnAdd" runat="server" onclick="btnAdd_Click" text="Add Category" cssclass="btnSmall" causesvalidation="false" />
				    </td>
				</tr>
				<tr>
				    <td style="padding:20px 0px 0px 0px; width:100%;">
				        <table style="width:100%;">
				            <tr>
				                <td style="text-align:left; padding:0px 10px;">
                                    <telerik:radgrid id="rgCategories" Skin="Outlook2007"  enableembeddedskins="false"
                                        runat="server" autogeneratecolumns="false"  width="100%" 
                                        ondetailtabledatabind="rgCategories_DetailTableDataBind" 
                                        onitemdatabound="rgCategories_ItemDataBound" onneeddatasource="rgCategories_NeedDataSource"
                                        onitemcommand="rgCategories_ItemCommand" onitemcreated="rgCategories_ItemCreated">
                                        <mastertableview datakeynames="ID" gridlines="Horizontal">
                                            <expandcollapsecolumn resizable="false" />
                                            <headerstyle backcolor="#307FA3" forecolor="#ffffff" />
                                            <itemstyle backcolor="#003366" forecolor="#ffffff" />
                                            <alternatingitemstyle backcolor="#003366" forecolor="#ffffff" />
                                            <columns>
                                                
                                                <telerik:gridboundcolumn headertext="Categories" datafield="Category" headerstyle-width="540px"/>
                                                <telerik:gridtemplatecolumn headertext="Options">
                                                    <itemtemplate>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:linkbutton id="lnkCatEdit" runat="server" text="Edit Category Name" commandname="EditCat" commandargument='<%# Eval("ID") %>' cssclass="WhiteLnk" />
                                                                </td>
                                                                <td align="center" style="padding-left:5px;width:15px;" >
                                                                    <asp:imagebutton id="ibCatUp" runat="server" commandargument='<%# Eval("ID") %>' commandname="CatUp" tooltip="Up" imageurl="Images/arrow_top.gif"/>
                                                                </td>
                                                                <td align="center" style="width:15px;">
                                                                    <asp:imagebutton id="ibCatDown" runat="server" commandargument='<%# Eval("ID") %>' commandname="CatDown" style="text-decoration:none;" tooltip="Down" imageurl="Images/arrow_down.gif" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </itemtemplate>
                                                    <itemstyle horizontalalign="left" />
                                                    
                                                </telerik:gridtemplatecolumn>
                                            </columns>
                                            <detailtables>
                                            
                                                <telerik:gridtableview allowpaging="true" expandcollapsecolumn-display="false" pagerstyle-alwaysvisible="true"
                                                pagesize="5" datakeynames="ID" selfhierarchysettings-parentkeyname="ID" hierarchyloadmode="ServerOnDemand" 
                                                gridlines="Horizontal" width="100%" nodetailrecordstext="No Videos Available">
                                                    <headerstyle backcolor="#000000" forecolor="#ffffff" />
                                                    <expandcollapsecolumn visible="false" display="false" />
                                                    <pagertemplate>
                                                        <div style="width:100%;">
                                                            <div style="float:left;">
                                                                <asp:linkbutton id="lnkViewAll" runat="server" text="View All" onclientclick="viewAll();return false;" commandname="ViewAll" />
                                                            </div>
                                                            <div style="float:right;">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <b><%#(int)DataBinder.Eval(Container, "Paging.FirstIndexInPage") + 1%> - <%#(int)DataBinder.Eval(Container, "Paging.LastIndexInPage") + 1%></b> of <%# DataBinder.Eval(Container, "Paging.DataSourceCount")%> records displayed</b>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <a id="lnkPrev" runat="server" href="javascript:changePage('prev');">Previous</a>&nbsp;&nbsp;&nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <asp:panel runat="server" ID="NumericPagerPlaceHolder" />
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;&nbsp;&nbsp;<a id="lnkNext" runat="server" href="javascript:changePage('next');">Next</a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                          
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </div>
                                                        </div>
                                                    </pagertemplate>
                                                    <pagerstyle prevpagetext="< Previous" nextpagetext="Next >" mode="NumericPages"  PagerTextFormat="<b>{2}-{3}</b> of <b>{5}</b> records displayed<br />{4}" />
                                                    <columns>
                                                        <telerik:gridboundcolumn headerstyle-horizontalalign="Left" headertext="Videos" datafield="Name" headerstyle-width="350px" itemstyle-width="350px"/>
                                                        <telerik:gridtemplatecolumn headertext="Views" itemstyle-horizontalalign="left" headerstyle-width="50px" itemstyle-width="50px">
                                                            <itemtemplate>
                                                                <asp:literal id="litVideoViews" runat="server" />
                                                            </itemtemplate>
                                                        </telerik:gridtemplatecolumn>
                                                        <telerik:gridtemplatecolumn headertext="Last Viewed" headerstyle-width="140px" itemstyle-width="140px" >
                                                            <itemtemplate>
                                                                <asp:literal id="litLastViewed" runat="server" />
                                                            </itemtemplate>
                                                        </telerik:gridtemplatecolumn>
                                                        <telerik:gridtemplatecolumn headertext="Options" itemstyle-horizontalalign="left">
                                                            <itemtemplate>
                                                                <table cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td align="left" style="width:45px;">
                                                                            <asp:linkbutton id="lnkVideoEdit" text="Edit" runat="server" commandname="VideoEdit" commandargument='<%# Eval("ID") %>' />
                                                                        </td>
                                                                        <td align="left" style="width:45px;">
                                                                            <asp:linkbutton id="lnkVideoDelete" text="Delete" runat="server" commandname="VideoDelete" commandargument='<%# Eval("ID") %>' onclientclick='DeleteConfirm(this,"<%# Eval("Video") %>"); return false;' />
                                                                        </td>
                                                                        <td  align="right" style="width:15px;">
                                                                            <asp:imagebutton id="ibVidUp" runat="server" commandargument='<%# Eval("ID") %>' commandname="VidUp" tooltip="Up" imageurl="Images/arrow_top.gif" />
                                                                        </td>
                                                                        <td align="left" style="width:15px;">
                                                                            <asp:imagebutton id="ibVidDown" runat="server" commandargument='<%# Eval("ID") %>' commandname="VidDown" tooltip="Down" imageurl="Images/arrow_down.gif" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </itemtemplate>
                                                        </telerik:gridtemplatecolumn>
                                                    </columns>
                                                </telerik:gridtableview>
                                            </detailtables>
                                            
                                        </mastertableview>
                                        <clientsettings>
                                            <clientevents />
                                        </clientsettings>
                                    </telerik:radgrid>
				                </td>
				            </tr>
				        </table>
				    </td>
				</tr>
				<tr valign="bottom">
					<td>
					    <img src="/images/Grphc_BotBar.jpg" alt="" width="760" height="31" />
					</td>
				</tr>
			</table>
		</center>
		<telerik:radwindowmanager ID="radWindowMgr" runat="server" Modal="true" 
            Height="250px" Width="400px"/>

		</form>
	</body>
</html>
