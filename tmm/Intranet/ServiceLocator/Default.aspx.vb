Imports System.Collections.Generic
Imports TrinityClassLibrary_DAL
Imports TrinityClassLibrary_BL
Imports Telerik.WebControls
Imports ServiceLocatorLibrary
Imports System.Web.UI
Imports System
Imports System.DateTime
Imports Microsoft.VisualBasic

Namespace ServiceLocator

    Partial Class _Default
        Inherits UserBasePage
        Implements ICallbackEventHandler

#Region " Variables "
        Private lstSpecialties As New List(Of PhysicianSpecialty)
        Private hshCoordinates As Dictionary(Of Int32, ServiceLocatorLibrary.Rig)
        Private currentRig As ServiceLocatorLibrary.Rig = Nothing
        Private rigCount As Integer = 0
        Private isRigValid As Boolean

        Public strCallback As String 'Used with callback.
#End Region

#Region " Properties "

#Region " RigCoordinates "
        ''' <summary>
        ''' Dictionary that holds the rig data in the cache.
        ''' </summary>
        Public ReadOnly Property RigCoordinates() As Dictionary(Of Int32, ServiceLocatorLibrary.Rig)
            Get
                If Me.hshCoordinates Is Nothing AndAlso Cache.Item("RigCoordinates") Is Nothing Then
                    Me.hshCoordinates = New Dictionary(Of Int32, ServiceLocatorLibrary.Rig)
                    Cache.Item("RigCoordinates") = Me.hshCoordinates
                    Return Me.hshCoordinates
                End If
                Me.hshCoordinates = DirectCast(Cache.Item("RigCoordinates"), Dictionary(Of Int32, ServiceLocatorLibrary.Rig))
                Return Me.hshCoordinates
            End Get
        End Property
#End Region

#End Region

#Region " Page_Load "
        ''' <summary>
        ''' Binds the values to the comboboxes and refreshes the screen
        ''' </summary>
        ''' <param name="sender"></param>
        ''' <param name="e"></param>
        ''' <remarks></remarks>
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            'Sets the callback string.
            strCallback = Page.ClientScript.GetCallbackEventReference(Me, "rigID", "SetVisibility", "")

            SetJobSheetVisibility()

            'Checks to see if the MultipleCities popup was canceled.
            If Session("Canceled") IsNot Nothing Then
                If CBool(Session("Canceled")) Then 'Remove key and stop operation.
                    Session.Remove("Canceled")
                    Exit Sub
                End If
            End If

            ' Validates that the radius selected is within the allowed range.
            If IsNumeric(Me.txtRadius.Text) AndAlso Not CInt(Me.txtRadius.Text) > 1000 AndAlso Not CInt(Me.txtRadius.Text) < 10 Then

                If Not Page.IsPostBack Then
                    'Show that this is the first load of the page.
                    Session("IsInit") = True

                    ' Saves a list of all rigs to the ddl.
                    Dim rigList As List(Of ServiceLocatorLibrary.Rig) = RigComponent.getAllRigs()
                    rcbList.DataSource = rigList
                    rcbList.DataBind()
                    rcbList.Text = "Select:"

                    ' binds a list of all active employers to the ddl.
                    Dim oPref As List(Of Employer) = EmployerComponent.getActiveEmployers
                    Me.cboPreference.DataSource = oPref
                    Me.cboPreference.DataBind()
                    Me.cboPreference.SelectedValue = "56" 'Trinity Medical Management

                    Dim lstPhysicianSpecialty As List(Of PhysicianSpecialty)
                    If Session("Specialties") Is Nothing Then
                        'Adds the Parent/Child Specialties in a tiered combo box.
                        lstPhysicianSpecialty = PhysicianSpecialtyProvider.FetchList()
                        Session("Specialties") = lstPhysicianSpecialty
                    Else
                        lstPhysicianSpecialty = DirectCast(Session("Specialties"), List(Of TrinityClassLibrary_BL.PhysicianSpecialty))
                    End If

                    Dim lstChildSpecialty As List(Of PhysicianSpecialty)
                    For Each item As PhysicianSpecialty In lstPhysicianSpecialty
                        If Not item.IsChild Then
                            'Stores ParentID in Session for later reference in the GetChildren method.
                            Session("ParentID") = item.SpecialtyID
                            'Adds new item to combo box.
                            Me.cboCategory.Items.Add(New System.Web.UI.WebControls.ListItem(item.Name.ToString(), item.SpecialtyID.ToString()))
                            'Checks to see if item is a child object.
                            lstChildSpecialty = lstPhysicianSpecialty.FindAll(AddressOf GetChildren)
                            'Iterates through the list, adding each child below it's parent.
                            For Each child As PhysicianSpecialty In lstChildSpecialty
                                Me.cboCategory.Items.Add(New System.Web.UI.WebControls.ListItem(" --- " & child.Name.ToString(), child.SpecialtyID.ToString()))
                            Next
                        End If
                    Next
                Else
                    If Not Session.Count > 0 Then
                        Response.Write("<script>alert('Your session has timed out.')</script>")
                        Response.Redirect("/Login.aspx")
                    End If
                End If

                If Me.rdoCity.Checked Then
                    Session("SearchType") = "City"
                    'Refresh the map centering it around a city.
                    RefreshCity()
                Else
                    Session("SearchType") = "Rig"
                    'Refresh the map centering it around a rig.
                    Refresh()
                End If

                Dim ViewString As String = "SVGGenerator.aspx?type=svg"
                'ToDo:shakti
                'Dim SVGHtml As String = "<object id=""Object1"" width=""900"" height=""475"" " &
                '    "codebase=""http://download.adobe.com/pub/adobe/magic/svgviewer/win/3.x/3.03/en/SVGView.exe"" " &
                '    "type=""image/svg-xml""> " &
                '    "<param name=""src"" value=""" & ViewString & """ /> " &
                '    "<embed id=""Embed1"" " &
                '    "name=""chart"" " &
                '    "width=""900px"" " &
                '    "height=""475"" " &
                '    "src=""" & ViewString & """ " &
                '    "type=""image/svg-xml"" " &
                '    "pluginspage=""http://download.adobe.com/pub/adobe/magic/svgviewer/win/3.x/3.03/en/SVGView.exe""> " &
                '    "</embed> " &
                '    "</object>"
                Me.litSVG.Text = ""
            Else
                ' Alerts the user if an invalid value was entered for the raduis.
                ClientScript.RegisterStartupScript(Me.GetType, "Alert", "<script>alert('The radius must be a number between 10 and 1000.');</script>")
            End If
        End Sub
#End Region

#Region " Methods "

#Region " RefreshCity "

        ''' <summary>
        ''' Refreshes the map centering around a city that the user designates.
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub RefreshCity()

            'Checks to see if the user has searched for a city.
            Dim lastCity As String = Nothing
            If Session("LastCity") Is Nothing Then 'Add the current city to session.
                If Me.txtCity.Text.Length > 0 Then
                    Session("LastCity") = Me.txtCity.Text.ToLower()
                Else
                    Exit Sub
                End If
            Else 'Gets the last city searched from Session to compare it against the new criteria.
                lastCity = Session("LastCity").ToString().ToLower()
                If lastCity <> Me.txtCity.Text.ToLower() Then 'Perform a new search by removing the SelectedCity from Session.
                    If Session("SelectedCity") IsNot Nothing Then Session.Remove("SelectedCity")
                    Session("LastCity") = Me.txtCity.Text.ToLower()
                End If
            End If

            Dim oCity As New List(Of City)
            If Session("SelectedCity") IsNot Nothing Then 'Add the selected city to the list.
                oCity.Add(CType(Session("SelectedCity"), City))
            Else 'Initiate search for city.
                oCity = City.GetCity(Me.txtCity.Text, Server.MapPath("XML/Cities.xml"))
            End If

            If oCity.Count > 1 Then 'Multiple cities found.
                If oCity.Count >= 50 Then 'Display alert and cancel operation.
                    ClientScript.RegisterStartupScript(Me.GetType(), "Alert", "alert('50 or more matches were found, please enter your search criteria again.')", True)
                    Exit Sub
                Else 'Save list of cities to session and open radWindow.
                    Session("CityList") = oCity
                    ClientScript.RegisterStartupScript(Me.GetType(), "MultipleCities", "window.radopen(null,'windowMultiple');", True)
                End If
            ElseIf oCity.Count = 1 Then 'Display information based off search criteria.
                If Me.chkShowCities.Checked Then
                    Session("ShowCities") = True
                Else
                    Session("ShowCities") = False
                End If

                If IsPostBack Then
                    Session("IsInit") = False
                End If

                ' Saves the longitude and latitude to the session
                Session("lon") = oCity(0).Longitude
                Session("lat") = oCity(0).Latitude

                'Save ID to session for comparing later.
                Session("CityID") = oCity(0).CityID

                ' Gets a list of services filtered by range, and service type.
                Dim oServices As List(Of Service) = GetInRangeServicesCity(oCity(0), CInt(Me.txtRadius.Text))

                ' Stores the list of services to the session
                Session("Services") = oServices

                ' Stores the selected category to the session.
                Session("Category") = Me.cboCategory.SelectedValue
            Else
                ClientScript.RegisterStartupScript(Me.GetType, "Alert", "<script>alert('City Name Not Found.');</script>")
            End If
        End Sub

#End Region

#Region " Refresh "
        ''' <summary>
        ''' Refreshes the values in the session and redraws the map when a rig is being searched.
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub Refresh()
            If String.IsNullOrEmpty(comboValue.Value) Then
                Return
            End If

            Dim strIDs As String = comboValue.Value
            If IsPostBack Then
                Session("IsInit") = False
            End If

            Session("ShowCities") = Me.chkShowCities.Checked
            ' Stores the selected category to the session.
            Session("Category") = Me.cboCategory.SelectedValue

            Dim rigList As New List(Of ServiceLocatorLibrary.Rig)
            Dim arrID() As String = strIDs.Split(",")
            For Each ID As String In arrID
                currentRig = RigComponent.getRigById(ID)
                rigList.Add(currentRig)
            Next
            currentRig = Nothing
            If rigList.Count > 0 Then
                If rigList.Count = 1 Then
                    currentRig = rigList(0)
                    Session("lat") = currentRig.latitude
                    Session("lon") = currentRig.longitude
                    Dim listServices As List(Of Service) = GetInRangeServices(currentRig, CInt(Me.txtRadius.Text))
                    If listServices.Count > 0 Then
                        Session("Services") = listServices
                    End If
                    If Not DataUtil.IsCoordsValid(currentRig) Then
                        rapMain.ResponseScripts.Add("alert('The selected rig does not currently have a location. Please try selecting the nearest city instead.');")
                    End If
                Else
                    grdServices.DataSource = Nothing
                    grdServices.Visible = False
                    Session("Services") = Nothing
                    Dim avgLat As New Double
                    Dim avgLon As New Double
                    Dim isValid As New Boolean
                    Dim strErr As String = String.Empty
                    rigCount = 0
                    For Each item As ServiceLocatorLibrary.Rig In rigList
                        isValid = False
                        If DataUtil.IsValidCoordinate(item.latitude) Then
                            avgLat += CDbl(item.latitude)
                            isValid = True
                        End If
                        If DataUtil.IsValidCoordinate(item.longitude) Then
                            avgLon += CDbl(item.longitude)
                            isValid = True
                        End If
                        If isValid Then
                            rigCount += 1
                        Else
                            strErr += item.rigName + "\n"
                        End If
                    Next
                    avgLat = avgLat / rigCount
                    avgLon = avgLon / rigCount
                    Session("lat") = avgLat
                    Session("lon") = avgLon
                End If
                Session("RigList") = rigList
            End If
        End Sub

#End Region

#Region " SetJobSheetVisibility "
        ''' <summary>
        ''' Sets the initial visibility of the job sheet button.
        ''' </summary>
        ''' <remarks></remarks>
        Private Sub SetJobSheetVisibility()
            Dim arrID() As String = Me.comboValue.Value.Split(",")
            Dim rigID As String = String.Empty
            Dim length As Integer = 0
            If IsPostBack Then
                length = 1 'On postback the split returns the actual number of items.
            Else
                length = 2 'On initial load the split returns an empty string which counts as 1 item.
            End If

            If arrID.Length = length Then 'Only 1 rig was selected
                currentRig = RigComponent.getRigById(Me.comboValue.Value)
                If DataUtil.IsCoordsValid(currentRig) Then 'Rig has valid coords, show jobsheet button.
                    btnJobSheet.Style.Add("display", "inline")
                    Exit Sub
                End If
            End If

            'Invalid coords or multiple rigs selected - hide jobsheet button.
            btnJobSheet.Style.Add("display", "none")
        End Sub
#End Region

#End Region

#Region " Functions "

#Region " GetInRangeServicesCity "
        ''' <summary>
        ''' Returns a list of services that meet the requests entered by the user.
        ''' </summary>
        ''' <param name="range"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Private Function GetInRangeServicesCity(ByVal oCity As City, ByVal range As Integer) As List(Of Service)
            Dim serviceListByCity As New List(Of Service)
            Dim serviceList As List(Of Service) = New List(Of Service)()
            Me.lstSpecialties = CType(Session("Specialties"), List(Of Global.TrinityClassLibrary_BL.PhysicianSpecialty))
            For Each item As PhysicianSpecialty In lstSpecialties
                If (CInt(Me.cboCategory.SelectedValue) = item.SpecialtyID) Then
                    If (item.IsChild) Then
                        serviceList = ServiceComponent.getFilteredServicesBySpecialty_NoRig(Me.cboPreference.SelectedValue, item.SpecialtyID.ToString())
                    Else
                        serviceList = ServiceComponent.getFilteredServicesByParentID_NoRig(Me.cboPreference.SelectedValue, item.ParentSpecialtyID.ToString())
                    End If
                End If
            Next
            ' Creates a list of services that are within range.
            For Each service As Service In serviceList
                If ServiceComponent.isWithinRadius(range, CDbl(service.latitude), CDbl(service.longitude), CDbl(oCity.Latitude), CDbl(oCity.Longitude)) Then
                    'If the city is in range, then calculate the distance from location.
                    Dim distance As Double = CoordinateCalculations.DistanceBetweenDegreeCoordinates(CDec(service.latitude), CDec(service.longitude), CDec(oCity.Latitude), CDec(oCity.Longitude))
                    distance = Math.Round(distance, 2)
                    service.Distance() = distance.ToString()
                    serviceListByCity.Add(service)
                End If
            Next

            If serviceListByCity.Count = 0 Then
                grdServices.Visible = False
                Me.lnkbtnReset.Style.Add("display", "none")
            Else
                Me.grdServices.Visible = True
                Me.lnkbtnReset.Style.Add("display", "inline")
                'bind the list of services to the grid
                Me.grdServices.DataSource = serviceListByCity
                Me.grdServices.DataBind()
            End If

            Return serviceListByCity
        End Function

#End Region

#Region " GetInRangeServices "
        ''' <summary>
        ''' Returns a list of services that meet the requests entered by the user.
        ''' </summary>
        ''' <param name="oRig"></param>
        ''' <param name="range"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Private Function GetInRangeServices(ByVal oRig As ServiceLocatorLibrary.Rig, ByVal range As Integer) As List(Of Service)
            Dim serviceListByRig As New List(Of Service)
            Dim serviceList As List(Of Service) = New List(Of Service)

            ' Gets a list of services filtered by range and service type
            Me.lstSpecialties = CType(Session("Specialties"), List(Of Global.TrinityClassLibrary_BL.PhysicianSpecialty))
            If Not lstSpecialties Is Nothing Or Not lstSpecialties.Count > 0 Then
                For Each item As PhysicianSpecialty In lstSpecialties
                    If (CInt(Me.cboCategory.SelectedValue) = item.SpecialtyID) Then
                        If (item.IsChild) Then
                            serviceList = ServiceComponent.getFilteredServicesBySpecialty(oRig.rigId, Me.cboPreference.SelectedValue, item.SpecialtyID.ToString(), Me.txtRadius.Text)
                        Else
                            serviceList = ServiceComponent.getFilteredServicesByParentID(oRig.rigId, Me.cboPreference.SelectedValue, item.ParentSpecialtyID.ToString(), Me.txtRadius.Text)
                        End If
                    End If
                Next
            End If

            'Check the service employer selected by the user.
            For Each service As Service In serviceList
                'If the city is in range, then calculate the distance from location.
                Dim distance As Double = CoordinateCalculations.DistanceBetweenDegreeCoordinates(CDec(service.latitude), CDec(service.longitude), CDec(oRig.latitude), CDec(oRig.longitude))
                distance = Math.Round(distance, 2)
                service.Distance = distance.ToString()
                serviceListByRig.Add(service)
            Next

            If serviceListByRig.Count = 0 Then
                grdServices.Visible = False
                Me.lnkbtnReset.Style.Add("display", "none")
            Else
                Me.grdServices.Visible = True
                Me.lnkbtnReset.Style.Add("display", "inline")
                'bind the list of services to the grid
                Me.grdServices.DataSource = serviceListByRig
                Me.grdServices.DataBind()
            End If

            Return serviceListByRig
        End Function
#End Region

#Region " GetChildren "
        Private Function GetChildren(ByVal item As PhysicianSpecialty) As Boolean
            'Checks to see if ParentID of current item is equal to ParentID stored in Session and if SpecialtyID <> ParentID.
            'If so, then returns true because this item is a child.
            If (item.ParentSpecialtyID = Convert.ToInt32(Session("ParentID"))) AndAlso (item.SpecialtyID <> item.ParentSpecialtyID) Then
                Return True
            Else
                Return False
            End If
        End Function
#End Region

#Region " GetRigFromCache "
        ''' <summary>
        ''' Retrieves the rig from the cache if it exists.
        ''' Rig information is only valid for 3 hours, then it must be refreshed.
        ''' </summary>
        ''' <param name="RigID">The ID of the rig in question.</param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Private Function GetRigFromCache(ByVal RigID As Integer) As ServiceLocatorLibrary.Rig
            Dim oRig As ServiceLocatorLibrary.Rig = Nothing
            ' Determine if the rig is in the cached dictionary.
            If Me.RigCoordinates.Count > 0 AndAlso Me.RigCoordinates.ContainsKey(RigID) Then
                oRig = Me.RigCoordinates.Item(RigID)
                ' If the rig's data is > 3 hours old, it should be removed.
                If Now > oRig.LastDataRetrieveStamp.AddHours(3) Then
                    Me.RigCoordinates.Remove(RigID)
                    oRig = Nothing
                End If
            End If
            If oRig Is Nothing Then
                oRig = RigComponent.getRigById(RigID.ToString())
                Me.RigCoordinates.Add(RigID, oRig)
            End If
            Return oRig
        End Function
#End Region

#End Region

#Region " Callback Events "

#Region " RaiseCallbackEvent "
        ''' <summary>
        ''' Executes code after the callback has been initialized.
        ''' </summary>
        ''' <param name="eventArgument"></param>
        ''' <remarks></remarks>
        Public Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
            currentRig = RigComponent.getRigById(CInt(eventArgument))
            isRigValid = DataUtil.IsCoordsValid(currentRig)
        End Sub
#End Region

#Region " GetCallbackResult "
        ''' <summary>
        ''' Sends the sponsers name to a javascript function to update the label in the disclaimer.
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function GetCallbackResult() As String Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult
            Return isRigValid
        End Function
#End Region

#End Region

#Region " Controls "

#Region " grdServices_ItemCommand "

        ''' <summary>
        ''' If a service is selected in the grid, open a new window to display the information about that service.
        ''' </summary>
        ''' <param name="source"></param>
        ''' <param name="e"></param>
        ''' <remarks></remarks>
        Protected Sub grdServices_ItemCommand(ByVal source As Object, ByVal e As Telerik.WebControls.GridCommandEventArgs) Handles grdServices.ItemCommand
            If e.CommandName = "Service" Then
                'If a user clicks on the name of a service on the grid then redirect to the service info page.
                ClientScript.RegisterStartupScript(Me.GetType, "DrInfo", "<script>window.open('drinfo.aspx?code=" & e.CommandArgument.ToString() & "');</script>")
            End If
        End Sub

#End Region

#Region " btnJobSheet_Click1 "
        ''' <summary>
        ''' If a user clicks on the Job Sheet Info button for the page, then redirect them to the Job Sheet Info page.
        ''' </summary>
        ''' <param name="sender"></param>
        ''' <param name="e"></param>
        ''' <remarks></remarks>
        Protected Sub btnJobSheet_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnJobSheet.Click
            Dim arrID() As String = Me.comboValue.Value.Split(",")
            Dim rigID As String = String.Empty
            If arrID.Length = 1 Then
                rigID = Me.comboValue.Value
                currentRig = RigComponent.getRigById(rigID)
                If DataUtil.IsCoordsValid(currentRig) Then
                    'Only display job sheets for rigs with valid coords.
                    rapMain.ResponseScripts.Add("window.open('jobsheetinfo.aspx?rigid=" & rigID & "');")
                End If
            End If
        End Sub
#End Region

#Region " rdoRig "
        'If the Rig RadioButton is checked then the List ComboBox gains focus and disables the City TextBox.
        Protected Sub rdoRig_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            txtCity.Enabled = False
            rcbList.Enabled = True
            rapMain.FocusControl(rcbList)
        End Sub
#End Region

#Region " rdoCity "
        'If the City RadioButton is checked then the City TextBox gains focus and disables the List ComboBox.
        Protected Sub rdoCity_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            txtCity.Enabled = True
            rcbList.Enabled = False
            rapMain.FocusControl(txtCity)
        End Sub
#End Region

#Region " lnkbtnReset "
        'Resets the sorting of grid to it's default values.
        Protected Sub lnkbtnReset_Click(ByVal sender As Object, ByVal e As EventArgs)

            'Clears previous SortExpressions.
            Me.grdServices.MasterTableView.SortExpressions.Clear()

            Me.grdServices.MasterTableView.SortExpressions.AllowMultiColumnSorting = True

            'Adds the SortExpression for TierID.
            Dim tierOrder As New GridSortExpression
            tierOrder.FieldName = Me.hiddenTierDesc.Value
            tierOrder.SetSortOrder("Ascending")
            Me.grdServices.MasterTableView.SortExpressions.AddSortExpression(tierOrder)

            'Adds the SortExpression for Distance.
            Dim distance As New GridSortExpression
            distance.FieldName = Me.hiddenDistance.Value
            distance.SetSortOrder("Ascending")
            Me.grdServices.MasterTableView.SortExpressions.AddSortExpression(distance)

            'Rebinds the grid to refresh changes.
            Me.grdServices.Rebind()

        End Sub
#End Region

#End Region

    End Class
End Namespace
