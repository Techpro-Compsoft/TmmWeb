<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DrInfo_Images.aspx.vb" Inherits="ServiceLocator.DrInfo_Images" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="litServiceName" runat="server"></asp:Literal> Images
        
        <asp:Repeater ID="rptrImages" runat="server">
            <HeaderTemplate>
                <table cellpadding="0" cellspacing="0" style="width:100%;">
            </HeaderTemplate>
            <ItemTemplate>
                    <tr>
                        <td style="padding-bottom:5px;">
                            <img src='<%# Eval("Path") %>' alt='<%# Eval("Name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:30px;">
                            <%#Eval("Description")%>
                        </td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
