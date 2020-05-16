<%@ Page Language="vb" AutoEventWireup="false" Codebehind="VideoLibrary.aspx.vb" Inherits="TMMInternet.VideoLibrary" %>
<%@ Register Assembly="TMM_WebControls" Namespace="TMM_WebControls" TagPrefix="TMM" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Trinity Medical Management Intranet Console</title>
		<link href="/trinity.css" rel="stylesheet" type="text/css" />
        <link href="UsersAdmin/RadControls/Grid/Skins/Outlook2007/styles.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        .RadGrid_Outlook2007 .rgCollapse
            {
            	border:0;
            	padding:0;
            	background:url('UsersAdmin/RadControls/Grid/Skins/OutLook2007/SingleMinus.gif') no-repeat;
            	vertical-align:top;
            	cursor:pointer;
            	height:16px;
            	width:16px;
            }
            
            .RadGrid_Outlook2007 .rgDetailTable
            {
            	border:solid 1px #000;
            	width:100%;
            }
            
            .RadGrid_Outlook2007 .rgExpand
            {
            background:url('UsersAdmin/RadControls/Grid/Skins/OutLook2007/SinglePlus.gif') no-repeat;
            	vertical-align:top;
            	cursor:pointer;
            	height:16px;
            	width:16px;
            	border:0;
            	padding:0;
            }
            
            .DetailTable_Outlook2007
            {
            	position:relative;
            	left:-20px;
            	width:100%;
            }
        </style>
       
	</head>
	<body style="margin-top:0; margin-left:0; background-color:#000000;">
	<form runat="server" id="frm1">
	    <telerik:radscriptmanager id="radSM" runat="server" />
	    <telerik:radscriptblock id="radBlock" runat="server">
	        <script type="text/javascript">
                function RebindGrid() {
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
	    <telerik:radajaxmanager id="radAjax" runat="server" >
	        <ajaxsettings>
	            <telerik:ajaxsetting ajaxcontrolid="rgCategories">
	                <updatedcontrols>
	                    <telerik:ajaxupdatedcontrol controlid="rgCategories" />
	                </updatedcontrols>
	            </telerik:ajaxsetting>
	        </ajaxsettings>
	    </telerik:radajaxmanager>	    
		<center>
			<table width="760" style="height:100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
				<tr style="height:78;" valign="top">
					<td>
					    <img src="/images/Trinity_GraphicBar_VideoLib.jpg" alt="" width="760"  height="78"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="100%" class="MenuBar" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td valign="top"><tmm:tmmmenu ID="tmmMenu" runat="server" /></td>
                            </tr>
                            <tr valign="top">
                                <td style="background-color:#000; color:#fff; vertical-align:top;FONT-SIZE:10pt; padding:10px; font-style:italic; FONT-FAMILY:helvetica;vertical-align:top;">
                                    If you have any questions about your access to videos or if your video access has expired, please contact us at tmmoffice@trinitymedicalmanagement.com.
                                </td>
                            </tr>
						</table>
					</td>
				</tr>
				<tr valign="top">
				    <td style="padding:0px 10px 0px 10px; height:100%;" valign="top">
				        <table style="width:100%; vertical-align:top;" cellpadding="0" cellspacing="0">
				            <tr valign="top">
				                <td style="text-align:left; padding-left:0px; vertical-align:top;">
                                    <telerik:radgrid id="rgCategories" Skin="Outlook2007" enableembeddedskins="false"
                                        runat="server" autogeneratecolumns="false" width="100%" 
                                        ondetailtabledatabind="rgCategories_DetailTableDataBind" showheader="false" 
                                        onitemdatabound="rgCategories_ItemDataBound" onneeddatasource="rgCategories_NeedDataSource"
                                        onitemcommand="rgCategories_ItemCommand" onitemcreated="rgCategories_ItemCreated">
                                        <mastertableview datakeynames="ID" gridlines="Horizontal">
                                            <expandcollapsecolumn resizable="false" />
                                            <headerstyle backcolor="#307FA3" forecolor="#ffffff" />
                                            <itemstyle backcolor="#307FA3" forecolor="#ffffff" />
                                            <alternatingitemstyle backcolor="#307FA3" forecolor="#ffffff" />
                                            <columns>
                                                <telerik:gridboundcolumn headertext="" headerstyle-horizontalalign="Left" datafield="Category" headerstyle-width="400px"/>
                                            </columns>
                                            <detailtables>
                                            
                                                <telerik:gridtableview allowpaging="true" expandcollapsecolumn-display="false"
                                                pagesize="50" datakeynames="VideoID" selfhierarchysettings-parentkeyname="ID" hierarchyloadmode="ServerOnDemand" 
                                                gridlines="Horizontal" showheader="true" width="100%">
                                                    <headerstyle backcolor="#000000" forecolor="#ffffff" />
                                                    <expandcollapsecolumn visible="false" display="false" />
                                                    <pagertemplate>
                                                        <div style="width:100%;">
                                                            <div style="float:left;">
                                                                <asp:linkbutton id="lnkViewAll" runat="server" onclientclick="viewAll();return false;" text="View All" commandname="ViewAll" />
                                                            </div>
                                                            <div style="float:right;">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <b><%#Int32.Parse(DataBinder.Eval(Container, "Paging.FirstIndexInPage")) + 1%> - <%#Int32.Parse(DataBinder.Eval(Container, "Paging.LastIndexInPage")) + 1%></b> of <%# DataBinder.Eval(Container, "Paging.DataSourceCount")%> records displayed</b>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <a href="javascript:changePage('prev');return false;">Previous</a>&nbsp;&nbsp;&nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <asp:panel runat="server" ID="NumericPagerPlaceHolder" />
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;&nbsp;&nbsp;<a href="javascript:changePage('next');return false;">Next</a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                          
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </div>
                                                        </div>
                                                    </pagertemplate>
                                                    <pagerstyle prevpagetext="< Previous" nextpagetext="Next >" mode="NumericPages" PagerTextFormat="<b>{2}-{3}</b> of <b>{5}</b> records displayed<br />{4}" />
                                                    <columns>
                                                        <telerik:gridtemplatecolumn headerstyle-horizontalalign="Left" headertext="Video Name" headerstyle-width="120px">
                                                            <itemtemplate>
                                                                <asp:linkbutton id="litViewVideo" runat="server" text='<%# Eval("VideoName") %>' commandname="ViewVideo" commandargument='<%# Eval("VideoID") %>' /><asp:literal id="litVideos" runat="server" />
                                                            </itemtemplate>
                                                        </telerik:gridtemplatecolumn>
                                                        <telerik:gridboundcolumn headertext="Description" headerstyle-horizontalalign="Left" datafield="VideoDescription" headerstyle-width="200px" />
                                                        <telerik:gridtemplatecolumn headertext="Access Type" headerstyle-horizontalalign="Left"  headerstyle-width="160px">
                                                            <itemtemplate>
                                                                <asp:literal id="litAccessType" runat="server" />
                                                            </itemtemplate>
                                                        </telerik:gridtemplatecolumn>
                                                        <telerik:gridtemplatecolumn headertext="Last Viewed" headerstyle-horizontalalign="Left">
                                                            <itemtemplate>
                                                                <asp:literal id="litLastViewed" runat="server" />
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
    </form>
	</body>
</html>
