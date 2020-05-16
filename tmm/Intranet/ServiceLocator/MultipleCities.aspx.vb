Imports System.Collections.Generic
Imports TrinityClassLibrary_DAL
Imports TrinityClassLibrary_BL
Imports Telerik.WebControls
Imports ServiceLocatorLibrary

Partial Public Class MultipleCities
    Inherits UserBasePage

#Region " Private Variables "
    Private _cityList As List(Of City)
#End Region

#Region " Private Properties "
    ''' <summary>
    ''' Returns a list of the multiple cities found.
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Property CityList() As List(Of City)
        Get
            If _cityList Is Nothing Then
                If Session("CityList") IsNot Nothing Then
                    _cityList = CType(Session("CityList"), List(Of City))
                    Return _cityList
                Else
                    Throw New Exception("The session key 'CityList' is null and should never be entering this page.")
                End If
            Else
                Return _cityList
            End If
        End Get
        Set(ByVal value As List(Of City))
            _cityList = value
        End Set
    End Property
#End Region

#Region " Page Load "
    ''' <summary>
    ''' Handles Page Load.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.rgCities.Rebind()
        End If
    End Sub
#End Region

#Region " rgCities Events "

#Region " rgCities_ItemCommand "
    ''' <summary>
    ''' Handles the ItemCommand event in the rgCities RadGrid.
    ''' </summary>
    ''' <param name="source"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub rgCities_ItemCommand(ByVal source As Object, ByVal e As Telerik.WebControls.GridCommandEventArgs)
        If e.CommandName = "Select" Then
            Dim selectedCity As City = Me.CityList.Item(e.Item.DataSetIndex())
            Session("SelectedCity") = selectedCity
            Session.Remove("CityList")
            ClientScript.RegisterStartupScript(Me.GetType(), "Close", "CloseOnReload();", True)
        End If
    End Sub
#End Region

#Region " rgCities_NeedDataSource "
    ''' <summary>
    ''' Sets the datasource for the rgCities RadGrid (NeedDataSource automatically binds the data)
    ''' </summary>
    ''' <param name="source"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub rgCities_NeedDataSource(ByVal source As System.Object, ByVal e As Telerik.WebControls.GridNeedDataSourceEventArgs) Handles rgCities.NeedDataSource
        Me.rgCities.DataSource = CityList
    End Sub
#End Region

#End Region

#Region " Controls "

#Region " btnCancel_Click "
    ''' <summary>
    ''' Handles onClick event for btnCancel.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        'Set this key to be used in the Default page to show this page was canceled.
        Session("Canceled") = True
        'Close window, reload parent.
        ClientScript.RegisterStartupScript(Me.GetType(), "Close", "CloseOnReload();", True)
    End Sub
#End Region

#End Region

End Class