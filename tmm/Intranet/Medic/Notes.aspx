<%@ Page language="c#" Inherits="TrinityMedicalManagement.Notes" ValidateRequest="false" Codebehind="Notes.aspx.cs" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Trinity Medical Management - Patient Encounter</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> <META HTTP-EQUIV="Expires" CONTENT="-1">
		<link href="trinity.css" type="text/css" rel="stylesheet" />
		<script language="javascript" type="text/javascript" src="scripts/pageScripts.js"></script>
		<script language="javascript" type="text/javascript" src="scripts/validate.js"></script>
		<script type="text/javascript">
		    function OnClientClose() {
		        // Javascript Console
		        var win = GetRadWindowManager().GetWindowByName('winNote');
		        win.GetContentFrame().contentWindow.OnClientClose();
		    }

            function GetNotesPanel() {
                return <%= radNotes.ClientID %>
                }

		    function CloseOnReload() { GetRadWindow().Close(); }

		</script>
	</head>
	<body id="bodyMain" BGCOLOR="#000000" LEFTMARGIN="0" TOPMARGIN="0" RUNAT="server">
		<form id="Form1" method="post" runat="server">
			<input type="hidden" id="txtStatus" name="txtStatus" runat="server">
			<center>
				<table cellspacing="3" cellpadding="6" width="760" border="0">
					<TR>
						<TD>
							<IMG SRC="images/ttl_PatientEncounterBar.jpg"><BR>
							<asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
							<UC1:NAVIGATIONMENU ID="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU>
						</TD>
					</TR>
					<TR>
						<TD>
						    <asp:Panel ID="pnlAddEditHeader" runat="server">
							    <table border=0 width="100%">
							        <tr class="tblHdr">
							            <td>Notes: Step 3 of 3</td>
							            <td align="right"><asp:Literal ID="litSearchLink" runat="server" /></td>
							            <td width="25px">&nbsp</td>
							        </tr>
							    </table>
							</asp:Panel>
							<asp:Panel ID="pnlViewHeader" runat="server" Visible="false">
							    <table border="0" width="100%" cellpadding="0" cellspacing="0">
							        <tr>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="108px" align="center"><a href="patient.aspx" class="ViewHeaderNotSelected">Patient Information</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="112px" align="center"><a href="medical.aspx" class="ViewHeaderNotSelected">Medical Information</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_active_lt.gif" /></td>
							            <td background="images/tab_active_mid.gif" width="1px" class="ViewHeaderSelected">Notes</td>
							            <td width="1px"><img src="images/tab_active_rt.gif" /></td>
							            <td width="1px"></td>
							            <td width="1px"><img src="images/tab_inactive_lt.gif" /></td>
							            <td background="images/tab_inactive_mid.gif" width="1px">
                                            <a href="documents.aspx" class="ViewHeaderNotSelected">Documents</a></td>
							            <td width="1px"><img src="images/tab_inactive_rt.gif" /></td>
							            <td></td>
							            <td align="right"><asp:Literal ID="litSearchLink2" runat="server" /></td>
							            <td width="25px"></td>
							        </tr>
							        <tr>
							            <td colspan="18" bgcolor="white" height="3px"></td>
							        </tr>
							    </table>
							</asp:Panel>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" />
						</TD>
					</TR>
					<TR CLASS="stdFont">
						<TD>
						    <asp:Literal ID="litPatientData" runat="server"></asp:Literal>
						    <div style="padding-top:5px; padding-bottom:15px;">
						        Required notes are categorized below; however, additional notes may be added at any time by using the <b>Add Note</b> feature on this screen.
						    </div>
							<TABLE CLASS="tblSection" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">
							    <tr class="DataGridHdr">
							        <td colspan="2"><span class="WhiteText">Required Notes</span></td>
							    </tr>
							    <tr height="10px">
							        <td colspan="2"></td>
							    </tr>
								<TR>
									<TD><ASP:LABEL ID="Label3" RUNAT="server" CSSCLASS="WhiteText"><b>PHYSICAL EXAM / OTHER INFORMATION</b></ASP:LABEL></TD>
									<TD ALIGN="right"><INPUT NAME="btnEdit1" runat="server" CLASS="btnSmall" TYPE="button" VALUE=" Edit " ONCLICK="popWindow('txtPhysicalNotes', 'Physical Exam/Other Information');" id="Button1"></TD>
								</TR>
								<TR>
									<TD COLSPAN="2">
										<ASP:TEXTBOX ID="txtPhysicalNotes" RUNAT="server" TEXTMODE="MultiLine" onkeyup="return CheckTextBoxMaxLength(this,2000,true);" onpaste="return MaxPasteLength(this,2000);" onkeypress="return CheckTextBoxMaxLength(this,2000,true);" CSSCLASS="txtArea" HEIGHT="61px"></ASP:TEXTBOX><SPAN class="showTip" runat="server" style="width:auto;" id="tipPhysicalNote" onmouseout="hideTip(this);">?</SPAN>
                                        <SPAN ID="spantxtPhysicalNotes" RUNAT="server" style="border: solid 1px gray;" CLASS="view"></SPAN><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the patient's physical notes." ControlToValidate="txtPhysicalNotes" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
										
									</TD>
								</TR>
								<TR>
									<TD>&nbsp;</TD>
								</TR>
								<TR>
									<TD><ASP:LABEL ID="Label2" RUNAT="server" CSSCLASS="WhiteText"><b>INITIAL IMPRESSION</b></ASP:LABEL></TD>
									<TD ALIGN="right"><INPUT NAME="btnEdit2" CLASS="btnSmall" runat="server" TYPE="button" VALUE=" Edit " id="button0" ONCLICK="popWindow('txtImpressionNotes', 'Initial Impression');"></TD>
								</TR>
								<TR>
									<TD COLSPAN="2">
										<ASP:TEXTBOX ID="txtImpressionNotes" RUNAT="server" CSSCLASS="txtArea" HEIGHT="61px" onkeyup="return CheckTextBoxMaxLength(this,2000,true);" onpaste="return MaxPasteLength(this,2000);" onkeypress="return CheckTextBoxMaxLength(this,2000,true);" TEXTMODE="MultiLine"></ASP:TEXTBOX><SPAN class="showTip" runat="server" style="width:auto;" id="tipInitialNote" onmouseout="hideTip(this);">?</SPAN>
                                        <SPAN ID="spantxtImpressionNotes" RUNAT="server" style="border: solid 1px gray;" CLASS="view"></SPAN>
									    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter you first impression notes." ControlToValidate="txtImpressionNotes" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
									</TD>
								</TR>
								<TR>
									<TD>&nbsp;</TD>
								</TR>
								<TR>
									<TD><ASP:LABEL ID="Label4" RUNAT="server" CSSCLASS="WhiteText"><b>RECOMMENDATIONS</b></ASP:LABEL></TD>
									<TD ALIGN="right"><input name="btnEdit3" class="btnSmall" type="button" value=" Edit " onclick="popWindow('txtRecommendationNotes', 'Recommendations');" id="Button3" runat="server"/></TD>
								</TR>
								<TR>
									<TD COLSPAN="2">
										<ASP:TEXTBOX ID="txtRecommendationNotes" RUNAT="server" CSSCLASS="txtArea" onkeyup="return CheckTextBoxMaxLength(this,2000,true);" onpaste="return MaxPasteLength(this,2000);" onkeypress="return CheckTextBoxMaxLength(this,2000,true);" HEIGHT="61px" TEXTMODE="MultiLine"></ASP:TEXTBOX><SPAN class="showTip" runat="server" style="width:auto;" id="tipRecommendationNote" onmouseout="hideTip(this);">?</SPAN>
                                        <SPAN ID="spantxtRecommendationNotes" RUNAT="server" style="border: solid 1px gray;" CLASS="view"></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your recommendations." ControlToValidate="txtRecommendationNotes" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
									</TD>
								</TR>
								<TR>
									<TD>&nbsp;</TD>
								</TR>
								<TR>
									<TD><ASP:LABEL ID="Label5s" RUNAT="server" CSSCLASS="WhiteText"><b>FOLLOW-UP INSTRUCTIONS</b></ASP:LABEL></TD>
									<TD ALIGN="right"><INPUT NAME="btnEdit4" CLASS="btnSmall" runat="server" TYPE="button" VALUE=" Edit " ONCLICK="popWindow('txtInstructionNotes', 'Follow-up Instructions');" id="Button2"></TD>
								</TR>
								<TR>
									<TD COLSPAN="2">
										<ASP:TEXTBOX ID="txtInstructionNotes" RUNAT="server" CSSCLASS="txtArea" onkeyup="return CheckTextBoxMaxLength(this,2000,true);" onpaste="return MaxPasteLength(this,2000);" onkeypress="return CheckTextBoxMaxLength(this,2000,true);" HEIGHT="61px" TEXTMODE="MultiLine"></ASP:TEXTBOX><SPAN class="showTip" runat="server" style="width:auto;" id="tipFollowUpNote" onmouseout="hideTip(this);">?</SPAN>
                                        <SPAN ID="spantxtInstructionNotes" RUNAT="server" style="border: solid 1px gray;" CLASS="view"></SPAN>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter you follow-up instruction." ControlToValidate="txtInstructionNotes" ValidationGroup="PageSubmit">*</asp:RequiredFieldValidator>
									</TD>
								</TR>
							</TABLE>
							<br />
							<TABLE CLASS="tblSection" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">
							    <tr class="DataGridHdr">
							        <td><span class="WhiteText">Additional Notes</span></td>
							        <td align="right">
                                        <asp:LinkButton ID="btnAddNote" runat="server" Text="Add Note" CssClass="btnSmall" OnClick="btnAddNote_Click"></asp:LinkButton>
                                    </td>
							    </tr>
							    <tr>
							        <td colspan="2" style="width:100%;"><radA:RadAjaxPanel ID="radNotes" runat="server" OnAjaxRequest="RebindNotes" EnableAJAX="false">
							                <div style="background-color:#d0d0d0; padding:10px; height:100px; overflow:auto; width:760px; font-size:12px; max-width:760px;">
                                                <asp:Repeater ID="rptNotes" runat="server" onitemcommand="rptNotes_ItemCommand" >
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" ImageUrl='<%#Eval("SecurityImage")%>' Visible='<%#Eval("ImageVisible")%>'  runat="server" />
                                                            <asp:LinkButton ID="lnkbtnEditNote" CommandName="NoteID" CommandArgument='<%#Eval("NoteID")%>' runat="server" ><%#Eval("Link")%></asp:LinkButton>
                                                        <%#Eval("Notes")%><br /><br />
                                                    </ItemTemplate>
                                                </asp:Repeater>
							                </div>								</radA:RadAjaxPanel>
							        </td>
							    </tr>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD><asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btnSmall"/>&nbsp;&nbsp;&nbsp;
							<ASP:BUTTON ID="btnContinue" RUNAT="server" CSSCLASS="btnSmall" TEXT="Submit Patient Encounter" onclick="btnContinue_Click" ValidationGroup="PageSubmit"></ASP:BUTTON></TD>
					</TR>
					<TR>
						<TD><IMG SRC="/images/Grphc_BotBar.jpg"></TD>
					</TR>
				</TABLE>
			</CENTER>
        <radW:RadWindowManager ID="radWindow" runat="server">
            <Windows>
                <radW:RadWindow ID="winNote" NavigateUrl="AddNote.aspx" runat="server" Modal="true" Height="500px" Width="725px"
                    VisibleStatusBar="false" DestroyOnClose="false" left="" Title="Notes" Top="" Behavior="None"
                    BorderColor="white" BorderStyle="solid" BorderWidth="2" Enabled="true" ReloadOnShow="true"/>
                    
                <radW:RadWindow ID="editNote" NavigateUrl="AddNote.aspx" runat="server" Modal="true" Height="700px" Width="725px"
                    VisibleStatusBar="false" DestroyOnClose="false" left="" Title="Notes" Top="" Behavior="None"
                    BorderColor="white" BorderStyle="solid" BorderWidth="2" Enabled="true" ReloadOnShow="true"/>
            
                <radW:RadWindow ID="winSelectUsers" NavigateUrl="SelectUser.aspx" runat="server" Modal="true" Height="500px" Width="700px"
                    VisibleStatusBar="false" DestroyOnClose="true" left="" Title="Select Users" Top="" Behavior="None"
                    BorderColor="white" BorderStyle="solid" BorderWidth="2" Enabled="true" ReloadOnShow="true" OnClientClose="OnClientClose()"/>

                <radW:RadWindow ID="previewNote" NavigateUrl="PreviewNote.aspx" runat="server" Modal="true" Height="700px" Width="600px"
                    VisibleStatusBar="false" DestroyOnClose="true" left="" Title="Preview Note" Top="" Behavior="Close"
                    BorderColor="white" BorderStyle="solid"  BorderWidth="2" Enabled="true" ReloadOnShow="true"/>
                
            </Windows>
        </radW:RadWindowManager> 
		</FORM>
	</BODY>
</HTML>
