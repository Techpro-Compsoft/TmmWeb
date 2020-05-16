<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master"
    CodeBehind="DocumentTypes.aspx.vb" Inherits="TMMInternet.DocumentTypes" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Services.css" rel="stylesheet" type="text/css" />    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="divContent" style="text-align:left; padding:5px;">
<fieldset style="padding:10px;">
<legend style="color:#ffffff;">Add Document Type </legend>
    <asp:TextBox runat="server" ID="txtType" MaxLength="50" ToolTip="Document Type Name"></asp:TextBox>&nbsp;&nbsp;
    <asp:Button runat="server" ID="btnAddDocumentType" Text="Add Document Type" 
        CssClass="btnSmall" ValidationGroup="grpDocumentType" />
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvDocumentType" runat="server" 
        ControlToValidate="txtType" Display="Dynamic" 
        ErrorMessage="*" ValidationGroup="grpDocumentType">Document Type is Required.</asp:RequiredFieldValidator>
</fieldset>
<br />
<fieldset style="padding:10px;">
<legend style="color:#ffffff;">Current Document Types</legend>   
<asp:Label ID="lblSaveError" runat="server" ForeColor="Red" Visible="false"></asp:Label> 
    <asp:GridView ID="grdDocumentTypes" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
            DataSourceID="EntityDataSource1" style="margin-top: 0px" CellPadding="2" 
            GridLines="Horizontal">
            <RowStyle BackColor="White" ForeColor="Black" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="DateAdded" HeaderText="DateAdded" 
                    SortExpression="DateAdded" DataFormatString="{0:d}" ReadOnly="True" />
                <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                    SortExpression="Active" />
            </Columns>
        
            <FooterStyle BackColor="#307FA3" ForeColor="White" />
            <PagerStyle BackColor="#307FA3" ForeColor="White" />
            <HeaderStyle BackColor="#307FA3" ForeColor="White" />
            <AlternatingRowStyle BackColor="#D1D1D1" />
        
        </asp:GridView>
</fieldset>    
</div>
    
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=TMM_DEPLOYEntities" 
        DefaultContainerName="TMM_DEPLOYEntities" EnableInsert="True" 
        EnableUpdate="True" EntitySetName="IndexDocumentTypes" 
        EntityTypeFilter="IndexDocumentTypes" OrderBy="it.Type" Select="">
    </asp:EntityDataSource>
</asp:Content>
