Imports System.Collections.Generic
Imports Tmm.dal
Imports ServiceLocatorLibrary

Namespace ServiceLocator
    Partial Class JobSheetInfo
        Inherits UserBasePage

#Region " Page_Load "

        ''' <summary>
        ''' Loads the page with all of the Job Sheet information.
        ''' </summary>
        ''' <param name="sender"></param>
        ''' <param name="e"></param>
        ''' <remarks></remarks>
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            If Not Page.IsPostBack AndAlso Not IsNothing(Request.QueryString("rigID")) AndAlso IsNumeric(Request.QueryString("rigID")) Then

                'Retrie a jobsheet object.
                Dim oJobSheet As ServiceLocatorLibrary.JobSheet = ServiceLocatorLibrary.JobSheet.GetJobSheetByRigID(Request.QueryString("rigID"))

                'Fill the fields on the page.
                With oJobSheet
                    Me.litAltPhone.Text = .RigAltPhone
                    Me.litBlock.Text = .Block
                    Me.litFacilityType.Text = .FacilityType
                    Me.litLatitude.Text = DataUtil.FormatLatitude(.Latitude.ToString())
                    Me.litLongitude.Text = DataUtil.FormatLongitude(.Longitude.ToString())
                    Me.litProjectNumber.Text = .ProjectNumber
                    Me.litRigFax.Text = .RigFax
                    Me.litRigName.Text = .RigName
                    Me.litRigPhone.Text = .RigPhone

                    Dim Medic1 As Medic = Medic.GetMedicByID(.Medic1ID)
                    Dim Medic2 As Medic = Medic.GetMedicByID(.Medic2ID)

                    ' Load Medic 1
                    Me.litMedic1CellPhone.Text = Medic1.CellPhone
                    Me.litMedic1Email.Text = Medic1.Email
                    Me.litMedic1Name.Text = Medic1.Name
                    Me.litMedic1HomePhone.Text = Medic1.Homephone

                    ' Load Medic 2
                    Me.litMedic2CellPhone.Text = Medic2.CellPhone
                    Me.litMedic2Email.Text = Medic2.Email
                    Me.litMedic2Name.Text = Medic2.Name
                    Me.litMedic2HomePhone.Text = Medic2.Homephone

                    ' Load OIM 1
                    Me.litOIM1Name.Text = .OIM1FName & " " & .OIM1LName
                    Me.litOIM1Phone.Text = .OIM1Phone
                    Me.litOIM1Address.Text = .OIM1Address
                    Me.litOIM1CityStateZip.Text = .OIM1City & ", " & .OIM1State & ", " & .OIM1Zip

                    ' Load OIM 2
                    Me.litOIM2Name.Text = .OIM2FName & " " & .OIM2LName
                    Me.litOIM2Phone.Text = .OIM2Phone
                    Me.litOIM2Address.Text = .OIM2Address
                    Me.litOIM2CityStateZip.Text = .OIM2City & ", " & .OIM2State & ", " & .OIM2Zip

                    ' Load Loc Mgr
                    Me.litLocMgrName.Text = .LocMgrFName & " " & .LocMgrLName
                    Me.litLocMgrPhone.Text = .LocMgrPhone
                    Me.litLocMgrAddress.Text = .LocMgrAddress
                    Me.litLocMgrCityStateZip.Text = .LocMgrCity & ", " & .LocMgrState & ", " & .LocMgrZip

                    ' Load RigComp
                    Me.litRigCompName.Text = .RigCompName
                    Me.litRigCompAddress.Text = .RigCompAddress
                    Me.litRigCompPhone.Text = .RigCompPhone
                    Me.litRigCompCityStateZip.Text = .RigCompCity & ", " & .RigCompState & ", " & .RigCompZip
                    Me.litRigFax.Text = .RigCompFax

                    ' Load Emp
                    Me.litEmpName.Text = .EmpName
                    Me.litEmpAddress.Text = .EmpAddress
                    Me.litEmpPhoneNumber.Text = .EmpPhone
                    Me.litEmpCityStateZip.Text = .EmpCity & ", " & .EmpState & ", " & .EmpZip
                    Me.litEmpFax.Text = .EmpFax
                    Me.litEmpContactName.Text = .EmpContactFName & " " & .EmpContactLName

                    Me.litCompMan1Address.Text = .CompMan1Address
                    Me.litCompMan1CityStateZip.Text = .CompMan1City & ", " & .CompMan1State & ", " & .CompMan1Zip
                    Me.litCompMan1Name.Text = .CompMan1FName & " " & .CompMan1LName
                    Me.litCompMan1Phone.Text = .CompMan1Phone

                    Me.litCompMan2Address.Text = .CompMan2Address
                    Me.litCompMan2CityStateZip.Text = .CompMan2City & ", " & .CompMan2State & ", " & .CompMan2Zip
                    Me.litCompMan2Name.Text = .CompMan2FName & " " & .CompMan2LName
                    Me.litCompMan2Phone.Text = .CompMan1Phone

                    Me.litHeliName.Text = .HeliName
                    Me.litHeliAddress.Text = .HeliAddress
                    Me.litHeliContactName.Text = .HeliContactFName & " " & .HeliContactLName
                    Me.litHeliCityStateZip.Text = .HeliCity & ", " & .HeliState & ", " & .HeliZip
                    Me.litHeliPhone.Text = .HeliPhone
                    Me.litHeliFax.Text = .HeliFax
                    Me.litHeliLongitude.Text = DataUtil.FormatLongitude(.HeliLongitude)
                    Me.litHeliLatitude.Text = DataUtil.FormatLatitude(.HeliLatitude)

                    Me.litBoatName.Text = .BoatName
                    Me.litBoatAddress.Text = .BoatAddress
                    Me.litBoatContactName.Text = .BoatContactFName & " " & .BoatContactLName
                    Me.litCompMan2CityStateZip.Text = .BoatCity & ", " & .BoatState & ", " & .BoatZip
                    Me.litBoatPhone.Text = .BoatPhone
                    Me.litBoatFax.Text = .BoatFax
                    Me.litBoatLongitude.Text = DataUtil.FormatLongitude(.BoatLongitude)
                    Me.litBoatLatitude.Text = DataUtil.FormatLatitude(.BoatLatitude)

                    Me.litEvacNmcName.Text = .EvacNmcName
                    Me.litEvacNmcDistance.Text = .EvacNmcDistance
                    Me.litEvacNmcTime.Text = .EvacNmcTime
                    Me.litEvacNmcCity.Text = .EvacNmcCity
                    Me.litEvacNmcPhone.Text = .EvacNmcPhone
                    Me.litEvacNmcState.Text = .EvacNmcState
                    Me.litEvacNmcAltPhone.Text = .EvacNmcAltPhone
                    Me.litEvacNmcFax.Text = .EvacNmcFax
                    Me.litEvacNmcLongitude.Text = DataUtil.FormatLongitude(.EvacNmcLongitude)
                    Me.litEvacNmcLatitude.Text = DataUtil.FormatLatitude(.EvacNmcLatitude)

                    Me.litEvacMC1Name.Text = .EvacMC1Name
                    Me.litEvacMC1Distance.Text = .EvacMC1Distance
                    Me.litEvacMC1Time.Text = .EvacMC1Time
                    Me.litEvacMC1City.Text = .EvacMC1City
                    Me.litEvacMC1Phone.Text = .EvacMC1Phone
                    Me.litEvacMC1State.Text = .EvacMC1State
                    Me.litEvacMC1AltPhone.Text = .EvacMC1AltPhone
                    Me.litEvacMC1Fax.Text = .EvacMC1Fax
                    Me.litEvacMC1Longitude.Text = DataUtil.FormatLongitude(.EvacMC1Longitude)
                    Me.litEvacMC1Latitude.Text = DataUtil.FormatLatitude(.EvacMC1Latitude)

                    Me.litEvacMC2Name.Text = .EvacMC2Name
                    Me.litEvacMC2Distance.Text = .EvacMC2Distance
                    Me.litEvacMC2Time.Text = .EvacMC2Time
                    Me.litEvacMC2City.Text = .EvacMC2City
                    Me.litEvacMC2Phone.Text = .EvacMC2Phone
                    Me.litEvacMC2State.Text = .EvacMC2State
                    Me.litEvacMC2AltPhone.Text = .EvacMC2AltPhone
                    Me.litEvacMC2Fax.Text = .EvacMC2Fax
                    Me.litEvacMC2Longitude.Text = DataUtil.FormatLongitude(.EvacMC2Longitude)
                    Me.litEvacMC2Latitude.Text = DataUtil.FormatLatitude(.EvacMC2Latitude)

                    Me.litEvacCGName.Text = .EvacCGName
                    Me.litEvacCGDistance.Text = .EvacCGDistance
                    Me.litEvacCGTime.Text = .EvacCGTime
                    Me.litEvacCGCity.Text = .EvacCGCity
                    Me.litEvacCGPhone.Text = .EvacCGPhone
                    Me.litEvacCGtate.Text = .EvacCGState
                    Me.litEvacCGAltPhone.Text = .EvacCGAltPhone
                    Me.litEvacCGFax.Text = .EvacCGFax
                    Me.litEvacCGLongitude.Text = DataUtil.FormatLongitude(.EvacCGLongitude)
                    Me.litEvacCGLatitude.Text = DataUtil.FormatLatitude(.EvacCGLatitude)

                    ' Load Ambulance 1
                    Me.litAmbAltPhone.Text = .AmbAltPhone
                    Me.litAmbCity.Text = .AmbCity
                    Me.litAmbDistance.Text = .AmbDistance
                    Me.litAmbFax.Text = .AmbFax
                    Me.litAmbLatitude.Text = DataUtil.FormatLatitude(.AmbLatitude)
                    Me.litAmbLongitude.Text = DataUtil.FormatLongitude(.AmbLongitude)
                    Me.litAmbName.Text = .AmbName
                    Me.litAmbPhone.Text = .AmbPhone
                    Me.litAmbState.Text = .AmbState
                    Me.litAmbTime.Text = .AmbTime

                    ' Load Trauma Center 1
                    Me.litTrauma1AltPhone.Text = .Trauma1AltPhone
                    Me.litTrauma1CityState.Text = .Trauma1City & ", " & .Trauma2State
                    Me.litTrauma1Distance.Text = .Trauma1Distance
                    Me.litTrauma1Fax.Text = .Trauma1Fax
                    Me.litTrauma1Latitude.Text = DataUtil.FormatLatitude(.Trauma1Latitude)
                    Me.litTrauma1Longitude.Text = DataUtil.FormatLongitude(.Trauma1Longitude)
                    Me.litTrauma1Name.Text = .Trauma1Name
                    Me.litTrauma1Phone.Text = .Trauma1Phone
                    Me.litTrauma1RadFreq.Text = .Trauma1RadFreq
                    Me.litTrauma1Time.Text = .Trauma1Time

                    ' Load Trauma Center 2
                    Me.litTrauma2AltPhone.Text = .Trauma2AltPhone
                    Me.litTrauma2CityState.Text = .Trauma2City & ", " & .Trauma2State
                    Me.litTrauma2Distance.Text = .Trauma2Distance
                    Me.litTrauma2Fax.Text = .Trauma2Fax
                    Me.litTrauma2Latitude.Text = DataUtil.FormatLatitude(.Trauma2Latitude)
                    Me.litTrauma2Longitude.Text = DataUtil.FormatLongitude(.Trauma2Longitude)
                    Me.litTrauma2Name.Text = .Trauma2Name
                    Me.litTrauma2Phone.Text = .Trauma2Phone
                    Me.litTrauma2RadFreq.Text = .Trauma2RadFreq
                    Me.litTrauma2Time.Text = .Trauma2Time

                    ' Load Burn Center
                    Me.litBurnAltPhone.Text = .BurnAltPhone
                    Me.litBurnCityState.Text = .BurnCity & ", " & .BurnState
                    Me.litBurnDistance.Text = .BurnDistance
                    Me.litBurnFax.Text = .BurnFax
                    Me.litBurnLatitude.Text = DataUtil.FormatLatitude(.BurnLatitude)
                    Me.litBurnLongitude.Text = DataUtil.FormatLongitude(.BurnLongitude)
                    Me.litBurnName.Text = .BurnName
                    Me.litBurnPhone.Text = .BurnPhone
                    Me.litBurnRadFreq.Text = .BurnRadFreq
                    Me.litBurnTime.Text = .BurnTime

                    ' Load Clinic
                    Me.litClinicAltPhone.Text = .ClinicAltPhone
                    Me.litClinicCityState.Text = .ClinicCity & ", " & .ClinicState
                    Me.litClinicDistance.Text = .ClinicDistance
                    Me.litClinicFax.Text = .ClinicFax
                    Me.litClinicLatitude.Text = DataUtil.FormatLatitude(.ClinicLatitude)
                    Me.litClinicLongitude.Text = DataUtil.FormatLongitude(.ClinicLongitude)
                    Me.litClinicName.Text = .ClinicName
                    Me.litClinicPhone.Text = .ClinicPhone
                    Me.litClinicRadFreq.Text = .ClinicRadFreq
                    Me.litClinicTime.Text = .ClinicTime


                End With

            End If

        End Sub

#End Region

    End Class
End Namespace