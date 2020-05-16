Imports TMMModel

Partial Public Class DrInfo_Images
    Inherits System.Web.UI.Page


#Region " + Members "

    Private _serviceImages As List(Of ServiceImage)

#End Region


#Region " + Properties "

#Region " ServiceImages "
    ''' <summary>
    ''' gets the service images from the session
    ''' </summary>
    Private ReadOnly Property ServiceImages() As List(Of ServiceImage)
        Get
            _serviceImages = TryCast(Session("SL_ServiceImages"), List(Of ServiceImage))

            Return _serviceImages
        End Get
    End Property
#End Region

#End Region


#Region " + Events "

#Region " Page_Load(...) "
    ''' <summary>
    ''' loads the page
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (ServiceImages IsNot Nothing AndAlso ServiceImages.Count > 0) Then
            ' bind the repeater
            rptrImages.DataSource = ServiceImages
            rptrImages.DataBind()

        End If
    End Sub
#End Region

#End Region


#Region " + Helpers "

    ' nothing here

#End Region

End Class