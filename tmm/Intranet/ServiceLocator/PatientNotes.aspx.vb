Imports TrinityClassLibrary_BL
Imports TrinityClassLibrary_DAL
Imports Telerik.WebControls
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Net.Mail

Partial Public Class PatientNotes
    Inherits UserBasePage

#Region "Variables"

    Private _patients As New List(Of Patient)
    Private patientID As Integer
    Private listRigAll As New List(Of Rig)

#End Region

#Region "Page Load"
    ''' <summary>
    ''' Executes the Page Load Code.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Sets focus to the first textbox onload.
            txtFName.Focus()
            PopulateCombobox()
        End If
    End Sub
#End Region

#Region "Controls"

#Region "Continue1"
    ''' <summary>
    ''' Code that is executed after the user clicks on the first Continue button.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Dim fName As String = Nothing
        Dim lName As String = Nothing
        Dim searchList As List(Of Patient)

        If txtFName.Text.Length > 0 Then fName = txtFName.Text
        If txtLName.Text.Length > 0 Then lName = txtLName.Text
        If cboRig.SelectedIndex > 0 Then
            'Gets the list of Patients if a Rig is selected.
            searchList = PatientProvider.Search(CType(cboRig.SelectedValue, Global.System.Nullable(Of Integer)), fName, lName, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing)
        Else
            'Gets the list of Patients if no Rig is selected.
            searchList = PatientProvider.Search(Nothing, fName, lName, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing)
        End If

        Me.pnlStepOne.Visible = False
        Me.pnlStepTwo.Visible = True

        'Iterates through the list, removing encounters that occurred longer than 2 weeks ago.
        searchList.FindAll(AddressOf SearchPatientList)

        Session("Patients") = searchList
        Me.grdPatients.Rebind()
        grdPatients_Select()
    End Sub
#End Region

#Region "Continue2"
    ''' <summary>
    ''' Code that is executed after the User clicks the 2nd Continue button.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub btnContinue2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue2.Click
        'Hides the previous step.
        Me.pnlStepTwo.Visible = False
        Me.pnlStepThree.Visible = True

        'Checks to see if the User selected a Patient from the grid.
        If Me.rdoNo.Checked Then
            Me.pnlNewPatient.Visible = True
            Me.pnlPatient.Visible = False

            'Populates the textboxes with what the user entered in the first step.
            If Me.txtLName.Text.Length > 0 Then
                Me.txtLastName.Text = Me.txtLName.Text
            End If
            If Me.txtFName.Text.Length > 0 Then
                Me.txtFirstName.Text = Me.txtFName.Text
            End If
            Me.txtFirstName.Focus()
        Else
            Me.pnlPatient.Visible = True
            Me.pnlNewPatient.Visible = False
            Me.txtNotes.Focus()
        End If
    End Sub
#End Region

#Region "Save"
    ''' <summary>
    ''' Saves the Note to the database and will send an Email if the User chose to do so.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim medicUserName As String = HttpContext.Current.User.Identity.Name.ToString()
        Dim currentMedic As Medic = MedicProvider.Fetch(medicUserName)

        ' Checks if it is an existing or new patient.
        If Me.rdoNo.Checked Then
            Me.NewPatient(currentMedic)
        Else
            Me.ExistingPatient(currentMedic)
        End If

        'Closes the RadWindow.
        ClientScript.RegisterStartupScript(Me.GetType(), "Close", "<script>CloseOnReload();</script>")
    End Sub
#End Region

#Region "grdPatients_ItemCommand"
    ''' <summary>
    ''' Sends a QueryString with the selected Patients ID to the Medic App.
    ''' </summary>
    ''' <param name="source"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub grdPatients_ItemCommand(ByVal source As Object, ByVal e As GridCommandEventArgs)
        If e.CommandName = "Select" Then
            Dim strPatientID As String = Nothing
            strPatientID = e.Item.Cells(3).Text
            Me.grdPatients.ResponseScripts.Add("window.open('../Medic/Patient.aspx?PatientID=" & strPatientID.ToString() & "')")
        End If
    End Sub
#End Region

#End Region

#Region "Functions"

#Region "GetRigName"
    ''' <summary>
    ''' Gets the current patients rig name. Public because I call it from the aspx page in the RadGrid.
    ''' </summary>
    ''' <param name="RigID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function GetRigName(ByVal RigID As Integer) As String
        ViewState("CurrentRigID") = RigID
        'Gets a list of Rigs from Session.
        listRigAll = CType(Session("ListOfAllRigs"), List(Of Rig))

        'Delegate to get the current Rig.
        Dim existingRig As Rig = listRigAll.Find(AddressOf DelegateGetRigName)

        'Stores Rig Name to Session for use in the save feature.
        Session("RigName") = existingRig.Name

        Return existingRig.Name
    End Function
#End Region

#Region "DelegateGetRigName"
    ''' <summary>
    ''' Delegate to get current Rig Name.
    ''' </summary>
    ''' <param name="item"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function DelegateGetRigName(ByVal item As Rig) As Boolean
        If item.RigID = Convert.ToInt32(ViewState("CurrentRigID")) Then
            Return True
        Else
            Return False
        End If
    End Function
#End Region

#Region "GetPatient"
    ''' <summary>
    ''' Gets the current Patient ID.
    ''' </summary>
    ''' <param name="item"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function GetPatient(ByVal item As Patient) As Boolean
        If item.PatientID = patientID Then
            Return True
        Else
            Return False
        End If
    End Function
#End Region

#Region "GetDateList"
    Private Function SearchPatientList(ByVal item As Patient) As Boolean
        'Gets the date 2 weeks prior of the current date.
        Dim minConsultDate As DateTime = DateTime.Now.Subtract(TimeSpan.FromDays(14))
        If Not (DateTime.Compare(item.EncounterDate.Value, minConsultDate) < 0) Then
            Return True
        Else
            Return False
        End If
    End Function
#End Region

#Region "Validation"
    ''' <summary>
    ''' Validates the Patients Info before building note.
    ''' </summary>
    ''' <param name="stringToValidate"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function ValidateString(ByVal stringToValidate As String) As Boolean
        If (stringToValidate Is Nothing OrElse stringToValidate.Trim() = String.Empty) Then Return False
        Return True
    End Function
#End Region

#Region "GetServer"
    ''' <summary>
    ''' Gets the current Email Server.
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Shared Function GetServer() As String
        Dim server As String = ConfigurationManager.AppSettings("EmailServer").ToString()
        Return server
    End Function
#End Region

#Region "SetNoteSecurityLevel"
    ''' <summary>
    ''' Sets the Notes Security Level based on the current users Security Level.
    ''' </summary>
    ''' <param name="securityLevel"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function SetNoteSecurityLevel(ByVal securityLevel As Medic.MedicSecurityLevel) As Integer
        Dim securityLevelID As Integer
        Select Case securityLevel
            Case Medic.MedicSecurityLevel.Admin
                securityLevelID = 1
                Exit Select
            Case Medic.MedicSecurityLevel.Medic
                securityLevelID = 3
                Exit Select
            Case Medic.MedicSecurityLevel.Physician
                securityLevelID = 2
                Exit Select
        End Select
        Return securityLevelID
    End Function
#End Region

#Region "GetMedicSecurityLevel"
    ''' <summary>
    ''' Sets the medics security level for notes.
    ''' </summary>
    ''' <param name="UserType"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function GetMedicSecurityLevel(ByVal UserType As Integer) As Integer
        Dim mSecurityLevel As Integer
        Select Case UserType
            Case 1
                mSecurityLevel = 3
                Exit Select
            Case 2
                mSecurityLevel = 1
                Exit Select
            Case Else
                mSecurityLevel = 1
                Exit Select
        End Select
    End Function
#End Region

#End Region

#Region "Methods"

#Region "PopulateCombobox"
    ''' <summary>
    ''' Populates the Rig combobox with all Rigs.
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub PopulateCombobox()
        listRigAll = RigProvider.FetchList()
        Session("ListOfAllRigs") = listRigAll
        cboRig.DataSource = listRigAll
        cboRig.DataBind()
        cboRig.Items.Insert(0, "UNKNOWN")
    End Sub
#End Region

#Region "ToggleRowSelection"
    ''' <summary>
    ''' Populates the selected Patients Information.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub ToggleRowSelection(ByVal sender As Object, ByVal e As EventArgs)
        'Activates selected row.
        CType(CType(sender, RadioButton).Parent.Parent, GridItem).Selected = CType(sender, RadioButton).Checked

        'Sets the radio buttons according to the grids radiobutton.
        If CType(sender, RadioButton).Checked Then
            patientID = Convert.ToInt32(Me.grdPatients.SelectedItems(0).Cells(3).Text)

            'Gets a list of Patients from Session.
            Dim patientList As List(Of Patient) = CType(Session("Patients"), List(Of Patient))

            'Delegate to get the current Patient.
            Dim existingPatient As Patient = patientList.Find(AddressOf GetPatient)

            'Stores that Patient to Session.
            Session("ExistingPatient") = existingPatient

            Dim ShortDate As DateFormat = DateFormat.ShortDate
            Me.lblPatientLName.Text = existingPatient.LastName.ToString()
            Me.lblPatientFName.Text = existingPatient.FirstName.ToString()
            If existingPatient.RigID.HasValue Then
                Me.lblRig.Text = GetRigName(CInt(existingPatient.RigID))
            End If
            If existingPatient.EncounterDate.HasValue Then
                Me.lblDateAndPatientID.Text = Me.grdPatients.SelectedItems(0).Cells(2).Text.ToString() & " | " & existingPatient.PatientID.ToString()
            End If
            If Not existingPatient.ChiefComplaint = String.Empty Then
                Me.lblChiefComplaint.Text = existingPatient.ChiefComplaint.ToString()
            End If

            'Ensures the "No Patient" radio button is un-checked.
            Me.rdoNo.Checked = False
        End If
    End Sub
#End Region

#Region "grdPatients_Select"
    ''' <summary>
    ''' Iterates through the grid controls to find all the radio buttons.
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub grdPatients_Select()
        Dim radioButton As RadioButton
        Dim i As Integer = 0
        While i < grdPatients.Items.Count
            radioButton = DirectCast(grdPatients.Items(i).FindControl("rdoSelect"), RadioButton)
            radioButton.Attributes.Add("OnClick", "SelectMeOnly(" + radioButton.ClientID + ", " + "'grdPatients'" + ")")
            i += 1
        End While
    End Sub
#End Region

#Region "ResetRadios"
    ''' <summary>
    ''' Reset the radio buttons to unchecked.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub ResetRadios(ByVal sender As Object, ByVal e As EventArgs)
        Me.grdPatients.Rebind()
        grdPatients_Select()
        Me.lblPatientFName.Text = Nothing
        Me.lblPatientLName.Text = Nothing
        Me.lblRig.Text = Nothing
        Me.lblDateAndPatientID.Text = Nothing
        Me.lblChiefComplaint.Text = Nothing
    End Sub
#End Region

#Region "grdPatients_NeedDataSource"
    ''' <summary>
    ''' Sets the RadGrid datasource to the list of Patients in Session.
    ''' </summary>
    ''' <param name="source"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub grdPatients_NeedDataSource(ByVal source As System.Object, ByVal e As Telerik.WebControls.GridNeedDataSourceEventArgs) Handles grdPatients.NeedDataSource
        Me.grdPatients.DataSource = Session("Patients")
    End Sub
#End Region

#Region "TextValidate"
    ''' <summary>
    ''' Server side validation of the note textbox.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub TextValidate(ByVal sender As Object, ByVal e As ServerValidateEventArgs)
        e.IsValid = (e.Value.Length <= 500)
    End Sub
#End Region

#Region "NewPatient"
    Protected Sub NewPatient(ByVal currentMedic As Medic)
        Dim lastName As String = "Unknown"
        Dim firstName As String = "Unknown"
        Dim rigName As String = Me.cboRig.SelectedItem.Text
        Dim currentDate As DateTime = DateTime.Now()
        Dim noteToSave As New AdditonalPatientNoteTemp

        firstName = Me.txtFirstName.Text
        If Not Me.txtLastName.Text = Nothing Then lastName = Me.txtLastName.Text

        ' Builds note.
        noteToSave.PatientFirstName = firstName
        noteToSave.PatientLastName = lastName
        noteToSave.RigID = CInt(Me.cboRig.SelectedValue)
        noteToSave.Notes = Me.txtNotes.Text
        noteToSave.SecurityLevelID = Me.SetNoteSecurityLevel(GetMedicSecurityLevel(currentMedic.UserTypeID))
        noteToSave.IsDeleted = False
        noteToSave.CreatedByUserID = currentMedic.MedicID
        noteToSave.DateCreated = currentDate
        noteToSave.Reviewed = False

        ' Updates database.
        AdditionalPatientNoteTempProvider.Save(noteToSave)

        If Me.chkSendEmail.Checked Then
            Me.NewPatientEmail(rigName, lastName, firstName, currentMedic, currentDate)
            Response.Write("<script language='javascript'>alert('Your note has been saved and e-mail sent.');</script>")
        Else
            Response.Write("<script language='javascript'>alert('Your note has been saved.');</script>")
        End If
    End Sub
#End Region

#Region "NewPatientEmail"
    ''' <summary>
    ''' Builds and Sends an Email for a Patient that doesn't exist in the database.
    ''' </summary>
    ''' <param name="rigName"></param>
    ''' <param name="lastName"></param>
    ''' <param name="firstName"></param>
    ''' <param name="currentMedic"></param>
    ''' <param name="currentDate"></param>
    ''' <remarks></remarks>
    Private Sub NewPatientEmail(ByVal rigName As String, ByVal lastName As String, ByVal firstName As String, ByVal currentMedic As Medic, ByVal currentDate As DateTime)
        ' Set up Email.
        Dim server As String = GetServer()
        Dim mailClient As New SmtpClient(server)
        Dim emailSender As String = ConfigurationManager.AppSettings("SendErrorEmailFromAddress").ToString()
        If Not currentMedic.EmailAddress = String.Empty Then emailSender = currentMedic.EmailAddress.ToString()
        Dim emailRecipient As String = ConfigurationManager.AppSettings("EmailRecipient").ToString()
        Dim mailmsg As New MailMessage(emailSender, emailRecipient)
        Dim emailBody As New StringBuilder

        ' Build message.
        mailmsg.Subject = "On Call (temp)Note Added for Rig: " + rigName + " - " + lastName + ", " + firstName + " (" + currentDate + ")"
        emailBody.AppendLine(rigName & ": " & lastName & ", " & firstName & " (" & currentDate & ")" & vbCrLf)
        emailBody.AppendLine("Physician Username: " & currentMedic.UserName & vbCrLf)
        emailBody.AppendLine("Note Entered: " & currentDate & vbCrLf)
        emailBody.AppendLine("Physician Note: " & Me.txtNotes.Text & vbCrLf)
        mailmsg.Body = emailBody.ToString()

        ' Send message.
        mailClient.Send(mailmsg)
    End Sub
#End Region

#Region "ExistingPatient"
    ''' <summary>
    ''' Builds and saves a note for a Patient that already exists in the database.
    ''' </summary>
    ''' <param name="currentMedic"></param>
    ''' <remarks></remarks>
    Protected Sub ExistingPatient(ByVal currentMedic As Medic)
        Dim existingPatient As Patient = CType(Session("ExistingPatient"), Patient)
        Dim lastName As String = "Unknown"
        Dim firstName As String = "Unknown"
        Dim stringDate As String = "Unknown"
        Dim chiefComplaint As String = "Unknown"
        Dim rigName As String = Me.cboRig.SelectedItem.Text
        Dim currentDate As DateTime = DateTime.Now()
        Dim noteToSave As New AdditionalPatientNote

        ' Validation
        If Not existingPatient Is Nothing Then
            If Me.ValidateString(existingPatient.LastName) Then lastName = existingPatient.LastName
            If Me.ValidateString(existingPatient.FirstName) Then firstName = existingPatient.FirstName
            If existingPatient.EncounterDate.HasValue Then stringDate = existingPatient.EncounterDate.Value.ToString("MM/dd/yyyy")
            If Me.ValidateString(existingPatient.ChiefComplaint) Then chiefComplaint = existingPatient.ChiefComplaint
        End If

        ' Builds note.
        noteToSave.PatientID = existingPatient.PatientID
        noteToSave.Notes = Me.txtNotes.Text
        noteToSave.SecurityLevelID = Me.SetNoteSecurityLevel(GetMedicSecurityLevel(currentMedic.UserTypeID))
        noteToSave.IsDeleted = False
        noteToSave.CreatedByUserID = currentMedic.MedicID
        noteToSave.DateCreated = currentDate
        noteToSave.Reviewed = False

        ' Updates database.
        AdditionalPatientNoteProvider.Save(noteToSave)

        If Me.chkSendEmail.Checked Then
            Me.ExistingPatientEmail(rigName, lastName, firstName, currentMedic, currentDate, stringDate, chiefComplaint)
            Response.Write("<script language='javascript'>alert('Your note has been saved and e-mail sent.');</script>")
        Else
            Response.Write("<script language='javascript'>alert('Your note has been saved.');</script>")
        End If
    End Sub
#End Region

#Region "ExistingPatientEmail"
    ''' <summary>
    ''' Sends an Email for a Patient that already exists in the database.
    ''' </summary>
    ''' <param name="rigName"></param>
    ''' <param name="lastName"></param>
    ''' <param name="firstName"></param>
    ''' <param name="currentMedic"></param>
    ''' <param name="currentDate"></param>
    ''' <param name="stringDate"></param>
    ''' <param name="chiefComplaint"></param>
    ''' <remarks></remarks>
    Private Sub ExistingPatientEmail(ByVal rigName As String, ByVal lastName As String, ByVal firstName As String, ByVal currentMedic As Medic, ByVal currentDate As DateTime, ByVal stringDate As String, ByVal chiefComplaint As String)
        Dim server As String = GetServer()
        Dim mailClient As New SmtpClient(server)
        Dim emailSender As String = ConfigurationManager.AppSettings("SendErrorEmailFromAddress").ToString()
        If Not currentMedic.EmailAddress = String.Empty Then emailSender = currentMedic.EmailAddress.ToString()
        Dim emailRecipient As String = ConfigurationManager.AppSettings("EmailRecipient").ToString()
        Dim mailmsg As New MailMessage(emailSender, emailRecipient)
        Dim emailBody As New StringBuilder

        ' Build message.
        mailmsg.Subject = "On Call Note Added for Rig: " + rigName + " - " + lastName + ", " + firstName + " (" + stringDate + ")"
        emailBody.AppendLine(rigName & ": " & lastName & ", " & firstName & " (" & stringDate & ")" & vbCrLf)
        emailBody.AppendLine("Chief Complaint: " & chiefComplaint & vbCrLf)
        emailBody.AppendLine("Physician Username: " & currentMedic.UserName & vbCrLf)
        emailBody.AppendLine("Note Entered: " & currentDate & vbCrLf)
        emailBody.AppendLine("Physician Note: " & Me.txtNotes.Text & vbCrLf)
        mailmsg.Body = emailBody.ToString()

        ' Send message.
        mailClient.Send(mailmsg)
    End Sub
#End Region

#End Region

End Class
