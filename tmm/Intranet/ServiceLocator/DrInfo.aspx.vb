Imports System.Collections.Generic
Imports Tmm.dal
Imports ServiceLocatorLibrary
Imports System.Linq
Imports System.Xml.Linq
Imports TMMModel

Partial Class DrInfo
    Inherits UserBasePage

#Region " Page_Load "

    ''' <summary>
    ''' Displays the information about a selected service.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack AndAlso Not IsNothing(Request.QueryString("code")) AndAlso IsNumeric(Request.QueryString("code")) Then
            ' Retrieves the service id number from the querystring
            Dim Code As Integer = CInt(Request.QueryString("code"))

            ' Gets a list of services
            Dim oService As New ServiceLocatorLibrary.Service
            Dim olist As List(Of ServiceLocatorLibrary.Service) = ServiceComponent.getAllServices

            ' Search the list of services for the selected one.
            For Each SerCount As ServiceLocatorLibrary.Service In olist
                If CInt(SerCount.serviceId) = Code Then
                    oService = SerCount
                    Exit For
                End If
            Next

            ' Fill in the fields on the form with the correct information about the service.
            litEmployerName.Text = oService.employerName
            Me.litEmployerPhone.Text = oService.employerPhone
            Me.litServiceName.Text = oService.serviceName
            Me.litServicePhone.Text = oService.mainPhone

            Me.litServiceType.Text = oService.serviceTypename
            Me.litTierDescription.Text = oService.tierDescription


            Me.litAddress.Text = oService.physicalAddress
            Me.litCity.Text = oService.physicalCityName
            Me.litZip.Text = oService.physicalZip

            Me.litLatitude.Text = DataUtil.FormatLatitude(oService.latitude)
            Me.litLongitude.Text = DataUtil.FormatLongitude(oService.longitude)

            Me.litNotes.Text = oService.notes



            ' load the images
            Dim serviceImages As List(Of ServiceImage) = Nothing

            Using tmmEntities As TMM_DEPLOYEntities = New TMM_DEPLOYEntities()

                serviceImages = (From si In tmmEntities.ServiceImage _
                                 Where si.Active AndAlso si.ServiceID = oService.serviceId _
                                 Select si).ToList()

                Session("SL_ServiceImages") = serviceImages
            End Using


            ' load and show the link message
            If (serviceImages IsNot Nothing AndAlso serviceImages.Count > 0) Then
                trImageLink.Visible = True

                litImagesCount.Text = serviceImages.Count.ToString()
            Else
                trImageLink.Visible = False

            End If
        End If
    End Sub

#End Region

End Class
