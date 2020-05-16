<%@ Page Language="vb" AutoEventWireup="false" Codebehind="FileManagement.aspx.vb" Inherits="QuickReference.FileManagement"%>
<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>FileUpload</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/trinity.css" type="text/css" rel="stylesheet">
		<SCRIPT language="javascript">
		
			function openWin()
			{
				var details = new String();
				details = "height=300,width=365,menubar=no,resizable=no,scrollbars=yes,status=no,toolbar=no,";
				var thisPage = window.open("catmanagement.aspx", "category", details);
			}
			
			function insertFileName(File, target)
			{
				var FileName = String(File.value).replace(/\'|\"/, "");
				var x = String(FileName).lastIndexOf("\\") + 1;
				var z = String(FileName).lastIndexOf(".");
				var TargetInput = document.forms[0].elements[target];			
												
				FileName = String(FileName).substring(x, z);
				TargetInput.value = FileName;
			}
			
		</SCRIPT>
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" encType="multipart/form-data" RUNAT="server">
			<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<TR vAlign="top">
					<TD align="center" width="100%">
						<TABLE style="BORDER-RIGHT: #307fa3 1px solid; BORDER-TOP: #307fa3 1px solid; BORDER-LEFT: #307fa3 1px solid; BORDER-BOTTOM: #307fa3 1px solid"
							height="560" cellSpacing="0" cellPadding="0" width="758">
							<TR vAlign="top" height="100">
								<TD><IMG src="images/Grphc_QuickRefAdmin.jpg"><BR>
									<UC1:NAVIGATIONMENU id="NavigationMenu1" RUNAT="server"></UC1:NAVIGATIONMENU></TD>
							</TR>
							<TR vAlign="top" height="429">
								<TD align="center">
									<TABLE cellSpacing="0" cellPadding="3" width="98%" border="0">
										<TR>
											<TD colSpan="2">&nbsp;</TD>
										</TR>
										<TR id="rowQuickRefListButtons" RUNAT="server">
											<TD width="50%"><INPUT class="btnSmall" onclick="location.href='QuickRef_New.aspx';" type="button" value=" Create New Quick Reference "
													name="btnCreateNew"></TD>
											<TD align="right" width="50%"><INPUT class="btnSmall" onclick="location.href='QuickReferenceList.aspx';" type="button"
													value=" View Quick Reference List " name="btnViewFiles"></TD>
										</TR>
										<TR id="rowQuickRefAddButtons" RUNAT="server">
											<TD align="right" colSpan="2"><INPUT class="btnSmall" onclick="location.href='QuickRef_Add.aspx';" type="button" value=" Return to Current Quick Reference "
													name="btnEditExisting"></TD>
										</TR>
										<TR>
											<TD colSpan="2">&nbsp;</TD>
										</TR>
										<TR vAlign="top">
											<TD align="center" colSpan="2">
												<TABLE class="normal" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TR class="DataGridHdr">
														<TD colSpan="4">Trinity File Management</TD>
													</TR>
													<TR>
														<TD><STRONG><ASP:LABEL id="lblAttachFile" RUNAT="server">File</ASP:LABEL></STRONG></TD>
														<TD><INPUT id="AttachFile" style="WIDTH: 240px; HEIGHT: 22px" type="file" onchange="insertFileName(this, 'txtFileName');"
																size="40" name="AttachFile" RUNAT="server"></TD>
														<TD><STRONG><ASP:LABEL id="lblFileName" RUNAT="server">File Name</ASP:LABEL></STRONG></TD>
														<TD><INPUT id="txtFileName" style="WIDTH: 240px" type="text" maxLength="45" name="txtFileName"
																RUNAT="server"></TD>
													</TR>
													<TR>
														<TD><STRONG>Existing Category</STRONG></TD>
														<TD><SELECT id="cboCategory" style="WIDTH: 240px" name="cboCategory" RUNAT="server">
																<OPTION selected></OPTION>
															</SELECT>
														</TD>
														<TD><STRONG>New Category</STRONG></TD>
														<TD><INPUT id="txtNewCategory" style="WIDTH: 240px" type="text" maxLength="30" name="Text1"
																RUNAT="server"></TD>
													</TR>
													<TR>
														<TD>&nbsp;</TD>
														<TD>
															<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="0">
																<TR>
																	<TD style="WIDTH: 93px">
																		<asp:button id="btnEditCat" CssClass="btnSmall" OnClientClick="javascript:openWin();" runat="server" Text="Edit Categories"></asp:button></TD>
																	<TD>
																		<asp:Button id="btnRefeshList" CssClass="btnSmall" runat="server" Text="Refresh List"></asp:Button></TD>
																	<TD></TD>
																</TR>
															</TABLE>
														</TD>
														<TD>&nbsp;</TD>
														<TD>&nbsp;</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD colSpan="2">&nbsp;</TD>
										</TR>
										<TR>
											<TD colSpan="2">&nbsp;<ASP:BUTTON id="btnUpload" RUNAT="server" CSSCLASS="btnSmall" TEXT=" Upload "></ASP:BUTTON></TD>
										</TR>
									</TABLE>
									<BR>
									<TABLE id="tblSummary" cellSpacing="0" cellPadding="3" width="98%" RUNAT="server">
										<TR>
											<TD><ASP:LABEL id="lblMessage" RUNAT="server" FORECOLOR="#ff0033"></ASP:LABEL><BR>
											</TD>
										</TR>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="0" width="98%">
										<TR id="rowWarning" RUNAT="server">
											<TD class="stdFont">*NOTE: The files listed here are read-only, they CANNOT be 
												modified. To modify the file you should delete the file then upload the new 
												copy, or upload the new copy with a different file name.<BR>
												<BR>
												Files Currently on the Trinity Web server in the Quick Reference attachments 
												directory.
											</TD>
										</TR>
										<TR class="stdFont" id="rowNoResults" RUNAT="server">
											<TD style="HEIGHT: 15px">Currently there are no files on the Trinity Web Server in 
												the Quick Reference attachments directory.</TD>
										</TR>
										<TR id="rowShow" RUNAT="server">
											<TD align="right"><ASP:LINKBUTTON id="lbShow" RUNAT="server" FORECOLOR="#FFFFFF" FONT-SIZE="x-small"></ASP:LINKBUTTON></TD>
										</TR>
										<TR id="rowResults" RUNAT="server">
											<TD align="center"><ASP:DATAGRID id="grdResults" RUNAT="server" CSSCLASS="normal" FONT-SIZE="X-Small" ALLOWPAGING="True"
													BORDERCOLOR="White" BORDERWIDTH="1px" BORDERSTYLE="Solid" HEIGHT="1px" CELLPADDING="2" GRIDLINES="None" AUTOGENERATECOLUMNS="False"
													ALLOWSORTING="True" WIDTH="100%">
													<AlternatingItemStyle CssClass="AlternatingItem"></AlternatingItemStyle>
													<ItemStyle CssClass="Item"></ItemStyle>
													<HeaderStyle CssClass="DataGridHdr"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="ID"></asp:BoundColumn>
														<asp:ButtonColumn Text="Select" DataTextField="FileName" HeaderText="Name" CommandName="Select"></asp:ButtonColumn>
														<asp:BoundColumn DataField="CategoryName" HeaderText="Category"></asp:BoundColumn>
														<asp:BoundColumn DataField="TypeName" HeaderText="File Type"></asp:BoundColumn>
														<asp:BoundColumn DataField="UploadDateTime" HeaderText="Upload Date and Time"></asp:BoundColumn>
														<asp:ButtonColumn Text="Delete" HeaderText="Action" CommandName="Delete">
															<ItemStyle Width="19px"></ItemStyle>
														</asp:ButtonColumn>
													</Columns>
													<PagerStyle Font-Size="12px" Font-Names="arial" HorizontalAlign="Right" ForeColor="White" BackColor="#307FA3"
														Mode="NumericPages"></PagerStyle>
												</ASP:DATAGRID></TD>
										</TR>
										<TR>
											<TD>&nbsp;</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR vAlign="top" height="31">
								<TD align="center"><IMG src="/images/Grphc_BotBar.jpg"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
