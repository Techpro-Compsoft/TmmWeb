Imports System.Collections.Generic
Imports TMMModel
Imports System.Linq

Public Class UserBasePage
    Inherits System.Web.UI.Page

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not Page.IsPostBack Then
            ' Get the user's rights from session.
            Dim securableRights As List(Of Integer)
            securableRights = CType(Session("SecurableRights"), List(Of Integer))

            ' Check to see if the user has rights to this program.
            If securableRights Is Nothing Then Response.Redirect("\Login.aspx")

            If Not (From s In securableRights _
                Select s).Contains(Convert.ToInt32(Securable.Securables.ServiceLocatorUser)) Then
                Response.Redirect("\Login.aspx")
            End If
        End If
    End Sub

End Class
