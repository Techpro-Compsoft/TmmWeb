<%@ Register TagPrefix="uc1" TagName="NavigationMenu" Src="controls/NavigationMenu.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="CatManagement.aspx.vb" Inherits="QuickReference.CatManagement"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Edit Categories</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/trinity.css" type="text/css" rel="stylesheet">
		<SCRIPT language="JavaScript" src="scripts/richtext.js" type="text/javascript"></SCRIPT>
	</HEAD>
	<BODY bgColor="#000000" topMargin="0">
		<FORM id="Form1" method="post" RUNAT="server">
			<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="325" border="0">
				<TR class="stdFont">
					<TD></TD>
					<TD align="right">
						<asp:LinkButton id="lbtnClose" runat="server" CssClass="WhiteLnk">Close Window</asp:LinkButton><A HREF="javascript:window.close();" CLASS="WhiteLnk"></A></TD>
				</TR>
			</TABLE>
			<TABLE class="SmallBorder" cellSpacing="0" cellPadding="3" width="325" border="0">
				<TR class="stdFont">
					<TD class="secHdr" colSpan="2">Edit Categories</TD>
				</TR>
				<TR class="stdFont">
					<TD align="right">Select Category:</TD>
					<TD><asp:dropdownlist id="cboCategory" Width="208px" runat="server"></asp:dropdownlist></TD>
				</TR>
				<TR class="stdFont">
					<TD align="center" colSpan="2">
						<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="165" border="0">
							<TR>
								<TD style="WIDTH: 131px" align="right"><asp:button id="btnRename" runat="server" CssClass="btnSmall" Text="Rename"></asp:button></TD>
								<TD style="WIDTH: 3px" align="center"><asp:button id="btnAdd" runat="server" CssClass="btnSmall" Text="Add"></asp:button></TD>
								<td align="left"><asp:button id="btnDelete" runat="server" CssClass="btnSmall" Text="Delete"></asp:button></td>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR class="stdFont">
					<TD align="center" colSpan="2">&nbsp;
						<asp:panel id="pnlEdit" runat="server" Visible="False" HorizontalAlign="Center">
							<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="300" border="0">
								<TR class="stdFont">
									<TD style="WIDTH: 128px" align="right">Old&nbsp;Category Name:</TD>
									<TD align="left">
										<asp:Label id="lblOldName" runat="server"></asp:Label></TD>
								</TR>
								<TR class="stdFont">
									<TD style="WIDTH: 128px" align="right">New&nbsp;Category Name:
									</TD>
									<TD align="left">
										<asp:TextBox id="txtNewName" runat="server"></asp:TextBox></TD>
								</TR>
								<TR class="stdFont">
									<TD style="WIDTH: 128px" align="right">
										<asp:Button id="btnCancel" CssClass="btnSmall" runat="server" Text="Cancel"></asp:Button></TD>
									<TD align="left">
										<asp:Button id="btnSave" CssClass="btnSmall" runat="server" Text="Save Change"></asp:Button></TD>
								</TR>
							</TABLE>
						</asp:panel><asp:panel id="pnlAdd" runat="server" Visible="False">
							<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="300" border="0">
								<TR>
									<TD class="stdFont" style="WIDTH: 130px" align="right">New Category Name:</TD>
									<TD>
										<asp:TextBox id="txtAddCategory" runat="server"></asp:TextBox></TD>
								</TR>
								<TR class="stdFont">
									<TD style="WIDTH: 130px" align="right">
										<asp:Button id="btnNewCancel" CssClass="btnSmall" runat="server" Text="Cancel"></asp:Button></TD>
									<TD align="left">
										<asp:Button id="btnNewSave" CssClass="btnSmall" runat="server" Text="Save Change"></asp:Button></TD>
								</TR>
							</TABLE>
						</asp:panel><asp:panel id="pnlDelete" runat="server" Visible="False" Height="76px">
							<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="300" border="0">
								<TR class="stdFont">
									<TD style="WIDTH: 140px" align="right">Category to Delete:</TD>
									<TD>
										<asp:Label id="lblDelete" runat="server"></asp:Label></TD>
								</TR>
								<TR class="stdFont">
									<TD style="WIDTH: 140px" align="right">
										<asp:Button id="btnCancelDelete" CssClass="btnSmall" runat="server" Text="Cancel"></asp:Button></TD>
									<TD>
										<asp:Button id="btnConfirmDelete" CssClass="btnSmall" runat="server" Text="Confirm"></asp:Button></TD>
								</TR>
							</TABLE>
						</asp:panel><asp:label id="lblError" runat="server" ForeColor="Red"></asp:label></TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
