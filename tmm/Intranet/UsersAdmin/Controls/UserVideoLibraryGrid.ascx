<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserVideoLibraryGrid.ascx.cs" Inherits="UsersAdmin.Controls.UserVideoLibraryGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
    <telerik:radscriptblock id="radSB" runat="server">
        <script type="text/javascript" language="javascript">
            function RebindGrid() 
            {
                var rgCat = $find("<%= grdUserVideos.ClientID %>");
                rgCat.get_masterTableView().rebind();
            }
            
            var tableView = null;
            function pageLoad(sender, args) {
                tableView = $find("<%= grdUserVideos.ClientID %>").get_masterTableView();
            }

            function changePage(argument) {
                var detailTablesArray = $find("<%= grdUserVideos.ClientID %>").get_masterTableView();
                detailTablesArray.page(argument);
            }

            function viewAll() {
                var detailTablesArray = $find("<%= grdUserVideos.ClientID %>").get_masterTableView();
                var pSize = detailTablesArray.PageCount * detailTablesArray.PageSize;
                detailTablesArray.set_pageSize(pSize);
            }
        </script>
    
    </telerik:radscriptblock>
<div style="width:100%; text-align:right; font-family:Arial; font-size:12px;" id="divPrint" runat="server"><a href="" id="aPrint" runat="server" style="border:0px; color:White; padding-bottom:5px;">PRINT <img src="/Images/print.gif" alt="Print"  style="border:0px;" /></a></div><br />
<telerik:RadGrid ID="grdUserVideos" runat="server" AutoGenerateColumns="False" 
    mastertableview-pagerstyle-visible="<%# ShowPager %>" GridLines="Horizontal" 
    Width="100%" AllowPaging="True" AllowSorting="True"  Skin="Outlook2007" 
    OnItemCreated="grdUserVideos_ItemCreated" EnableEmbeddedSkins="false" 
    onneeddatasource="grdUserVideos_NeedDataSource">
    <%--<PagerStyle Mode="NextPrevAndNumeric" HorizontalAlign="Right" NextPageText="Next&nbsp;&gt;" PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />--%>
    <MasterTableView>
        <headerstyle backcolor="#307FA3" forecolor="#ffffff" />
        <Columns>
            <telerik:GridTemplateColumn HeaderText="Video" headerstyle-horizontalalign="Left" itemstyle-horizontalalign="Left">
                <ItemTemplate>
                    <%# Eval("VideoName") %>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Description" headerstyle-horizontalalign="Left" itemstyle-horizontalalign="Left">
                <ItemTemplate>
                    <%# Eval("VideoDescription") %>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Category" headerstyle-horizontalalign="Left" itemstyle-horizontalalign="Left">
                <ItemTemplate>
                    <%# GetCategoryByID(Convert.ToInt32(Eval("VideoCategoryID"))) %>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Access Type" headerstyle-horizontalalign="Left" itemstyle-horizontalalign="Left">
                <ItemTemplate>
                    <%# GetAccessType(Convert.ToDateTime(Eval("Expiration"))) %>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Last Viewed" headerstyle-horizontalalign="Left" itemstyle-horizontalalign="Left">
                <ItemTemplate>
                    <%# GetLastViewText(Convert.ToDateTime(Eval("LastViewed"))) %>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
        </Columns>
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
                                        <a href="javascript:changePage('prev');">Previous</a>&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <asp:panel runat="server" ID="NumericPagerPlaceHolder" />
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<a href="javascript:changePage('next');">Next</a>
                                    </td>
                                </tr>
                            </table>
                              
                        </td>
                    </tr>
                </table>
                </div>
            </div>
        </pagertemplate>
        <pagerstyle prevpagetext="< Previous" nextpagetext="Next >" mode="NumericPages" PagerTextFormat="<b>{2}-{3}</b> of <b>{5}</b> records displayed<br />{4}" alwaysvisible="true"  />
    </MasterTableView>
</telerik:RadGrid>
