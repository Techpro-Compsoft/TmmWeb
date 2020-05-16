Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports system.Web.Security
Imports system.Web.UI
Imports system.Web.UI.WebControls
Imports system.Web.UI.WebControls.WebParts
Imports system.Web.UI.HtmlControls
Imports system.Xml
Imports system.IO
Imports ICSharpCode.SharpZipLib.GZip
Imports ServiceLocatorLibrary

Namespace SVG

#Region " Enum "

#Region " SVGOutputType "

    Public Enum SVGOutputType
        SVG
        SVGZ
    End Enum

#End Region

#End Region

    ''' <summary>
    ''' This class Generates and displays the SVG Map.
    ''' </summary>
    ''' <remarks></remarks>
    Partial Class SVGGenerator
        Inherits UserBasePage

#Region " Private Variables "

        Private lon As Double = -720
        Private lat As Double = -360
        Private scale As String = "4"
        Private width As String = "1440"
        Private height As String = "720"
        Private outputType As String = String.Empty
        Private ShowCities As Boolean = True
        Private isInit As Boolean = True
        Private SVGOutput As SVGOutputType = SVGOutputType.SVG
        Private startSVG As String = String.Empty
        Private endSVG As String = String.Empty

#End Region

#Region " Private Constants "

        Private Const earthsRadius As Integer = 6371

#End Region

#Region " Page Load "
        ''' <summary>
        ''' loads the parameters from the querystring and calls the functions to draw the SVG map.
        ''' </summary>
        ''' <param name="sender"></param>
        ''' <param name="e"></param>
        ''' <remarks></remarks>
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Dim airportID As String = String.Empty

            RetrieveSessionAndQueryString()

            SVGOutput = SVGOutputType.SVG
            startSVG = Server.MapPath(ConfigurationManager.AppSettings("StartTemplatePath"))
            endSVG = Server.MapPath(ConfigurationManager.AppSettings("EndTemplatePath"))

            If Not Session("RigList") Is Nothing Then
                Dim rigList As List(Of ServiceLocatorLibrary.Rig) = CType(Session("RigList"), List(Of ServiceLocatorLibrary.Rig))
                If rigList.Count > 1 Then 'Multiple rigs selected.  Calculate distance.
                    ConfigureMultipleRigs(rigList)
                Else
                    'Only apply lat/lon if they are valid.
                    If DataUtil.IsCoordsValid(rigList(0)) Then
                        SetCloseRigValues()
                    End If
                End If
            End If

            LoadSVG()
        End Sub
#End Region

#Region " LoadSVG "
        ''' <summary>
        ''' Configures the SVG Viewer.
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub LoadSVG()
            Dim readerStart As StreamReader = Nothing
            Dim readerEnd As StreamReader = Nothing
            Dim writeToStream As Stream = Nothing
            If SVGOutput = SVGOutputType.SVGZ Then
                Response.ContentType = "application/x-gzip"
                Dim output As Stream = Response.OutputStream
                writeToStream = New GZipOutputStream(output)
            Else
                Response.ContentType = "text/xml"
                writeToStream = Response.OutputStream
                Try
                    'Load start of SVG
                    readerStart = New StreamReader(startSVG)
                    Dim svgStart As String = readerStart.ReadToEnd()

                    svgStart = svgStart.Replace("{lon}", lon.ToString())
                    svgStart = svgStart.Replace("{lat}", lat.ToString())
                    svgStart = svgStart.Replace("{scale}", scale)
                    svgStart = svgStart.Replace("{Width}", width)
                    svgStart = svgStart.Replace("{Height}", height)

                    'Create SVG for world map, airports, and flights
                    Dim svg As New ServiceLocatorLibrary.SVG.SVGCreator
                    Dim startbytes As Array = svg.GetBytes(svgStart)
                    writeToStream.Write(CType(startbytes, Byte()), 0, startbytes.Length)

                    'Create map
                    svg.GenerateWorldSvg(writeToStream, Server.MapPath(ConfigurationManager.AppSettings("WorldPath")))

                    ' Create Cities if checked
                    If ShowCities AndAlso Not isInit Then
                        svg.GenerateCitiesSVG(writeToStream, Server.MapPath(ConfigurationManager.AppSettings("CitiesPath")))
                    End If

                    ' If this is the initial load, do not load the rigs and services on the initial load.
                    If Not isInit Then
                        If Session("SearchType") IsNot Nothing AndAlso Session("SearchType").ToString = "Rig" Then
                            'Create Rigs
                            svg.GenerateRigsSVG(writeToStream, Server.MapPath(ConfigurationManager.AppSettings("RigPath")), CInt(scale))
                        End If

                        'Create Services
                        svg.GenerateServicesSVG(writeToStream, Server.MapPath(ConfigurationManager.AppSettings("ServicesPath")))
                    End If

                    'Load end of SVG
                    readerEnd = New StreamReader(endSVG)
                    Dim endBytes As Array = svg.GetBytes(readerEnd.ReadToEnd())
                    writeToStream.Write(CType(endBytes, Byte()), 0, endBytes.Length)
                Catch ex As Exception
                    ClientScript.RegisterStartupScript(Me.GetType, "Error", "<script type='text/javascript'>alert('An error has occurred');</script>")
                Finally
                    ' Close the readers.
                    If (readerStart IsNot Nothing) Then readerStart.Close()
                    If (readerEnd IsNot Nothing) Then readerEnd.Close()
                    If (writeToStream IsNot Nothing) Then writeToStream.Close()
                End Try
            End If
        End Sub
#End Region

#Region " ConfigureMultipleRigs "
        ''' <summary>
        ''' Calculates distance and sets values if more than 1 rig was selected.
        ''' </summary>
        ''' <param name="rigList"></param>
        ''' <remarks></remarks>
        Private Sub ConfigureMultipleRigs(ByVal rigList As List(Of ServiceLocatorLibrary.Rig))
            Dim lastLat As Double = 0
            Dim lastLon As Double = 0
            Dim distance As Double = 0
            Dim currDistance As Double = 0

            'Iterates through the list of rigs calculating the farthest distance between 2.
            For Each Rig As ServiceLocatorLibrary.Rig In rigList
                'Ensures coordinates are valid, if not then skip this record.
                If Not DataUtil.IsValidCoordinate(Rig.latitude) Then Continue For
                If Not DataUtil.IsValidCoordinate(Rig.longitude) Then Continue For
                If lastLat = 0 And lastLon = 0 Then 'First valid rig, set values and continue.
                    lastLat = Rig.latitude
                    lastLon = Rig.longitude
                    Continue For
                End If
                currDistance = GetDistance(lastLat, Rig.latitude, lastLon, Rig.longitude, earthsRadius)
                If distance < currDistance Then 'New max distance found.
                    distance = currDistance
                    lastLat = Rig.latitude
                    lastLon = Rig.longitude
                End If
            Next

            If distance > 5000 Then 'Rigs won't be seen on previous scale.
                lon = -720 'Set default lat/lon to show entire world.
                lat = -360
                scale = "7" 'Increase the scale size.
                If distance > 10000 Then 'Increase scale more.
                    scale = "6"
                    If distance > 15000 Then '5 will cover anything farther than 15,000 km apart.
                        scale = "5"
                    End If
                End If
            Else
                SetCloseRigValues()
            End If
        End Sub
#End Region

#Region " RetrieveSessionAndQueryString "
        ''' <summary>
        ''' Gets all values from session keys and query string.
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub RetrieveSessionAndQueryString()
            'Grab id off of querystring if they want to filter flights based upon airport code
            If Session("IsInit") IsNot Nothing Then
                isInit = CBool(Session("IsInit"))
            End If

            If Session("ShowCities") IsNot Nothing Then
                ShowCities = CBool(Session("ShowCities"))
            End If

            If Request.QueryString("Type") IsNot Nothing Then
                outputType = Request.QueryString("type").ToString
            Else
                outputType = "SVG"
            End If

            ' set the longitude for the center of the map.
            If DataUtil.IsValidCoordinate(Session("lon")) Then
                lon = CDbl(Session("lon"))
            End If

            ' Set the latitude for the center of the map.
            If DataUtil.IsValidCoordinate(Session("lat")) Then
                lat = CDbl(Session("lat"))
            End If
        End Sub
#End Region

#Region " ToRad "
        ''' <summary>
        ''' Converts lat/lon to radian.
        ''' </summary>
        ''' <param name="coord"></param>
        ''' <returns>double</returns>
        ''' <remarks></remarks>
        Private Function ToRad(ByVal coord As Double) As Double
            Return coord * Math.PI / 180
        End Function
#End Region

#Region " GetDistance "
        ''' <summary>
        ''' Gets distance between 2 sets of coords in kilometers.
        ''' </summary>
        ''' <param name="lat1"></param>
        ''' <param name="lat2"></param>
        ''' <param name="lon1"></param>
        ''' <param name="lon2"></param>
        ''' <param name="radius"></param>
        ''' <returns>double</returns>
        ''' <remarks></remarks>
        Private Function GetDistance(ByVal lat1 As Double, ByVal lat2 As Double, ByVal lon1 As Double, ByVal lon2 As Double, ByVal radius As Integer) As Double
            Return Math.Acos(Math.Sin(ToRad(lat1)) * Math.Sin(ToRad(lat2)) + Math.Cos(ToRad(lat1)) * Math.Cos(ToRad(lat2)) * Math.Cos(ToRad(lon2 - lon1))) * radius
        End Function
#End Region

#Region " SetCloseRigValues "
        ''' <summary>
        ''' Zooms map in closer to accomodate rigs that are close to each other.
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub SetCloseRigValues()
            lat = lat * -1
            ' adjust the lon and lat so the the center of the screen is shown.
            lon = (lon * CInt(scale)) - 45
            lat = (lat * CInt(scale)) - 22.5
            width = "90"
            height = "45"
        End Sub
#End Region

    End Class

End Namespace
