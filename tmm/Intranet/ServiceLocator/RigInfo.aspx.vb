Imports System.Collections.Generic
Imports System.Math
Imports Tmm.dal
Imports ServiceLocatorLibrary

Partial Class RigInfo
    Inherits UserBasePage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack AndAlso Not IsNothing(Session("CurrentRig")) AndAlso IsNumeric(Session("CurrentRig")) Then

            ' Retrieve the rig id from the session
            Dim id As Integer = CInt(Session("CurrentRig"))

            ' Retrieve the selected rig.
            Dim oRig As ServiceLocatorLibrary.Rig = RigComponent.getRigById(id.ToString)

            ' Fill in the fields on the page with the information about the selected rig.
            Me.litAltPhone.Text = oRig.rigAltPhone
            Me.litCompanyName.Text = oRig.rigCompanyName
            Me.litEmployerName.Text = oRig.rigEmployerName

            Me.litLongitude.Text = DataUtil.FormatLongitude(oRig.longitude)
            Me.litLatitude.Text = DataUtil.FormatLatitude(oRig.latitude)

            Me.litMedicID.Text = oRig.medicId
            Me.litMedicName.Text = oRig.medicName
            Me.litRigName.Text = oRig.rigName
            Me.litRigPhone.Text = oRig.rigPhone
        End If

    End Sub
End Class
