<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="TrinityMedicalManagement.Documents" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Register assembly="RadGrid.Net2" namespace="Telerik.WebControls" tagprefix="radG" %>
<%@ Register assembly="RadAjax.Net2" namespace="Telerik.WebControls" tagprefix="radA" %>
<%@ Register Assembly="RadUpload.Net2" Namespace="Telerik.WebControls" TagPrefix="radU" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Trinity Medical Management - Patient Encounter Documents</title>
	<script language="javascript" src="scripts/pageScripts.js" type="text/javascript"></script>	
	<script src="/JavaScript/RadDatePicker.js" type="text/javascript"></script>
	
    <link href="trinity.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
    body { color:white;}
    .tableHeader 
    { 
        background-color:#307FA3;
        color: #FFFFFF;   
        text-align:left;
        font-family:Arial;
        font-size:12px;
        padding:0px;    
    }
    
    .GridPager_Outlook2007
{
	cursor: default;
	background-color: #307FA3;
	font-family:Arial;
	font-size:11px;
	font-weight:bold;
	color:#FFFFFF;	
}   
    </style>
    <script language="javascript" type="text/javascript">
        function CheckUploadedFilesSize(progressArea, args) {
            if (args.ProgressData != null) {
                if (args.ProgressData.RadUpload.RequestSize > 4194304) {
                    progressArea.CancelRequest();
                    alert('Selected file is too big and cannot be uploaded. Maximum size allowed is 4MB.');
                }
            }
        }
    </script>

</head>
<body id="bodyMain" bgcolor="#000000" leftmargin="0" topmargin="0" runat="server">
		<form id="Form2" method="post" runat="server">
			<center>
				<table cellspacing="3" cellpadding="6" width="760" border="0" >
					<tr>
						<td>
							<img src="images/ttl_PatientEncounterBar.jpg" alt="" /><br/>
							<UC1:NAVIGATIONMENU ID="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
						</td>
					</tr>
					<tr>
					    <td>
						    <table border="0" width="100%" cellpadding="0" cellspacing="0">
						        <tr>
						            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
						            <td background="images/tab_inactive_mid.gif" width="108px" align="center"><a href="patient.aspx" class="ViewHeaderNotSelected">Patient Information</a></td>
						            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
						            <td width="1px"></td>
						            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
						            <td background="images/tab_inactive_mid.gif" width="112px" align="center"><a href="Medical.aspx" class="ViewHeaderNotSelected">Medical Information</a></td>
						            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
						            <td width="1px"></td>
						            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
						            <td background="images/tab_inactive_mid.gif" width="1px">
                                        <a href="notes.aspx" class="ViewHeaderNotSelected">Notes</a></td>
						            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
						            <td width="1px"></td>
						            <td width="1px"><img src="images/tab_active_lt.gif" /></td>
						            <td background="images/tab_active_mid.gif" width="50px" class="ViewHeaderSelected" align="center">Documents</td>
						            <td width="1px"><img src="images/tab_active_rt.gif" /></td>
						            <td></td>
						            <td align="right"><asp:Literal ID="litSearchLink" runat="server"/></td>
						            <td width="25px"></td>
						        </tr>
						        <tr>
						            <td colspan="18" bgcolor="white" height="3px"></td>
						        </tr>
						    </table>
					    </td>
					</tr>
					<tr>
					    <td>
					        <div style="text-align:left;" class="stdFont"><asp:Literal ID="litPatientData" runat="server"></asp:Literal></div>
					        <table class="tblSection" cellspacing="0" cellpadding="3" width="100%" border="0">
								<tr class="stdFont">
									<td class="secHdr" style=" text-align:left;">Documents</td>
								</tr>
								<tr>
								    <td colspan="2" style="border:solid 1px;" align="left">
								        <div id="divUploadButton" style="text-align:right;">
								            <asp:Button ID="btnUpload" runat="server" CssClass="btnSmall" Text="Upload New Document" 
                                                OnClientClick="ShowHideDiv('divUploadButton','divUploadFile');return false;" />
								        </div>
    								        <div id="divUploadFile" style="width:100%; display:none;">
								            <table width="100%" cellpadding="0" cellspacing="0">
								                <tr>
								                    <td>
								                        * Reference Date
								                    </td>
								                    <td>
								                        * Document Type
								                    </td>
								                </tr>
								                <tr>
								                    <td valign="top">
								                        <radCln:RadDatePicker ID="rdpEncounterStartDate" SkinID="NONE" runat="server"
								                        Width="220px" DatePopupButton-ImageUrl="images/btn_SelectDate.jpg"
								                        DatePopupButton-HoverImageUrl="images/btn_SelectDate.jpg">
								                            <Calendar Skin="Trinity" Width="220px" ShowRowHeaders="false" >

								                                
								                            </Calendar>
								                            <DatePopupButton CssClass="RadDatePickerButton" />
								                            <DateInput MaxLength="10"></DateInput>
								                        </radCln:RadDatePicker>
                                                        &nbsp;<span  id="spnDateError" style="display:none; color:Red;">Required</span>

								                    </td>
								                    <td >							                            
								                            <asp:DropDownList ID="ddlDocType" runat="server" AppendDataBoundItems="true" CausesValidation="false" Width="300px" AutoPostBack="false" /><span  id="spnDocSelectError" style="display:none; color:Red;">Required</span>
								                            <div id="divDocType" runat="server" visible="false">
    								                            
								                                <table width="100%">
								                                    <tr>
								                                        <td>
								                                            New Document Type
								                                        </td>
								                                    </tr>
								                                    <tr>
								                                        <td>
								                                            <asp:TextBox ID="txtDocumentType" runat="server" Width="200px" MaxLength="100" /> <span  id="spnDocTypeError" style="display:none; color:Red;">Required</span>
								                                        </td>
								                                    </tr>
								                                </table>
								                            </div>
								                    </td>
								                </tr>
								                <tr>
								                    <td colspan="2">
								                        * Document Name
								                    </td>
								                </tr>
								                <tr style="width:100%;">
								                    <td colspan="2" style="width:100%;">
								                        <tr><td><radU:RadUpload ID="uplNewDocument"  runat="server" ReadOnlyFileInputs="true" Language="en-US" EnableFileInputSkinning="true" InitialFileInputsCount="1" MaxFileInputsCount="1" MaxFileSize="4194304" ControlObjectsVisibility="None" Skin="Trinity" OnClientAdded="increasingFileInputWidth" />
								                        <div style="display:hidden;"><radU:RadProgressArea Enabled="false" runat="server" CssClass="hidden" id="RadProgressArea1" />
                                                        <radU:RadProgressManager Enabled="false" runat="server" CssClass="hidden"  id="RadProgressManager1"  /></div>
								                    </td>
								                </tr>
								                <tr>
								                    <td style="padding:10px;" align="center" colspan="2">
								                        <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btnSmall" OnClientClick="ShowHideDiv('divUploadFile','divUploadButton');" OnClick="btnCancel_Click" /> 
                                                        <asp:Button ID="btnUploadDocument" runat="server" Text="Upload" CssClass="btnSmall"
                                                            onclick="btnUploadDocument_Click" OnClientClick="return ValidateUploadForm();" />
								                    </td>
								                </tr>
								            </table>
								        </div>
								    </td>
								</tr>
								<tr>
								    <td style="padding:10px;">
								        <asp:Label ID="lblError" runat="server" ForeColor="red"></asp:Label>
                                        <radG:RadGrid  ID="grdDocuments" runat="server" OnItemDataBound="grdDocuments_ItemDataBound" DataKeyNames="DocumentID"
                                         AllowPaging="True" AllowSorting="True" OnItemCommand="grdDocuments_ItemCommand" PageSize="10" Font-Size="12px" 
                                         Skin="Outlook2007" Font-Names="Helvetica" Width="100%"  AutoGenerateColumns="False" GridLines="Vertical">
                                         
                                            <MasterTableView>
                                                <PagerStyle Mode="NextPrevAndNumeric" CssClass="GridPager_Outlook2007" HorizontalAlign="Right"  NextPageText="Next&nbsp;&gt;"
                                                            PrevPageText="&lt;&nbsp;Previous" ShowPagerText="true" 
                                                            PagerTextFormat="&lt;b&gt;{2}-{3}&lt;/b&gt; of &lt;b&gt;{5}&lt;/b&gt; records displayed&lt;br /&gt;{4}"  />
                                                          
                                                <NoRecordsTemplate>
                                                    This patient does not currently have any documents.
                                                </NoRecordsTemplate>
                                                <Columns>
                                                    <radG:GridTemplateColumn HeaderText="REFERENCE DATE" HeaderStyle-HorizontalAlign="Left" >
                                                        <ItemTemplate>
                                                            <%# Eval("ReferenceDate") == null ? "N/A" : Convert.ToDateTime(Eval("ReferenceDate")).ToShortDateString()%>
                                                        </ItemTemplate>
                                                    </radG:GridTemplateColumn>
                                                    
                                                    <radG:GridTemplateColumn HeaderText="DOCUMENT TYPE" ItemStyle-Width="200px" HeaderStyle-Width="200px" HeaderStyle-HorizontalAlign="left" ItemStyle-Wrap="true">
                                                        <ItemTemplate>
                                                            <%# Eval("DocumentType") %>
                                                        </ItemTemplate>
                                                    </radG:GridTemplateColumn>
                                                    
                                                    <radG:GridTemplateColumn HeaderText="DOCUMENT NAME" HeaderStyle-HorizontalAlign="left">
                                                        <ItemStyle Wrap="true" />
                                                        <ItemTemplate>
                                                         <asp:LinkButton ID="lnkViewDoc" CssClass="BlkGridLnk" CausesValidation="false" Text='<%# GetDocumentName(Eval("DocumentLink").ToString()) %>' runat="server" CommandArgument='<%# Eval("DocumentID") %>' CommandName="ViewDoc" />
                                                        </ItemTemplate>
                                                    </radG:GridTemplateColumn>
                                                      
                                                    <radG:GridTemplateColumn HeaderText="ORIGINATION SOURCE" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%# Eval("OriginationSource") %>
                                                        </ItemTemplate>
                                                    </radG:GridTemplateColumn>
                                                    
                                                    <radG:GridTemplateColumn HeaderText="OPTION" UniqueName="Options">
                                                        <ItemTemplate>
                                                            <div style="text-align:center;"><asp:LinkButton ID="lnkShow" CommandArgument='<%# Eval("DocumentID") %>' CommandName="ShowDoc" Text="Show" runat="server" /><asp:LinkButton ID="lnkHide" runat="server" CommandArgument='<%# Eval("DocumentID") %>' CommandName="HideDoc" Text="Hide" /> </div>
                                                        </ItemTemplate>
                                                    </radG:GridTemplateColumn> 
                                                </Columns>   
                                            </MasterTableView>

                             
                                        </radG:RadGrid>
								    </td>
								</tr>
					        </table>
					    </td>
					</tr>
					<tr>

						<td><img src="/images/Grphc_BotBar.jpg" alt="" /></td>
					</tr>
                </table>
            </center>
	<script type="text/javascript">
	    RadUploadNameSpace.RadProgressManager.prototype.ShowInvalidContentMessage = function() {
	        var i = 0;
	    }
	</script>      
    </form>
</body>
</html>



	
