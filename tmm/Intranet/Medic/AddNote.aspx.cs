using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TrinityClassLibrary_DAL;
using TrinityClassLibrary_BL;
using System.Net.Mail;
using System.Text;
using TMMModel;
using System.Linq;
using System.Xml.Linq;

namespace TrinityMedicalManagement
{
    public partial class AddNote : TMMPage 
    {
        #region + Members

        private TrinityClassLibrary_BL.Rig _currentPatientRig;
        private TrinityClassLibrary_BL.Patient _currentPatient;


        #endregion


        #region + Properties

        #region CurrentPatient

        public TrinityClassLibrary_BL.Patient CurrentPatient
        {
            get
            {
                if (_currentPatient == null)
                {

                    TrinityClassLibrary_BL.Patient cPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
                    if (cPatient != null)
                    {
                        _currentPatient = cPatient;
                    }
                }

                return _currentPatient;
            }
            set 
            {
                Session["Patient"] = value ;
                _currentPatient = value;
            }
        }

        #endregion


        #region CurrentPatientRig
        public TrinityClassLibrary_BL.Rig CurrentPatientRig
        {
            get 
            {
                if (_currentPatientRig == null)
                {
                    TrinityClassLibrary_BL.Rig currentRig = (TrinityClassLibrary_BL.Rig)Session["CurrentPatientRig"];
                    if (currentRig != null)
                    {
                        _currentPatientRig = currentRig;
                    }
                    else
                    {
                        if (CurrentPatient.RigID.HasValue ){
                            TrinityClassLibrary_BL.Rig pRig = RigProvider.Fetch(CurrentPatient.RigID.Value);
                            _currentPatientRig = pRig;
                        }

                    }
                }
                return _currentPatientRig;
            }
            set 
            { 
                Session["CurrentPatientRig"] = value ;
                _currentPatientRig = value;
            }
        }

        #endregion 

        #endregion


        #region Page_Load
        /// <summary>
        /// Page Load will determine if the user chose to Edit an existing note or Add a new one.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!Page.IsPostBack)
            {
                // Checks isEdit in Session to determine if the user is Editing or Adding a note.
                if (Convert.ToBoolean(Session["isEdit"])) 
                {
                    this.EditTrue();
                }
                else 
                {
                    this.EditFalse(); 
                    chkCustomerNotification.Attributes.Add("onclick", "SetSaveAttribute(this);");
                }
                 

                if (!HaveCustomerEmail())
                {
                    chkCustomerNotification.Enabled = false;
                    chkCustomerNotification.Text = "Customer Notification: Send Note via E-mail to Customer ** Customer e-mail address(es) not available";
                }


            }
        }
        #endregion

        #region Controls

        #region Add Note Save Button
        /// <summary>
        /// Saves the EDITED note to the database and sends email if checked.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Gets selected Patient/current User from session and creates a new Note to be saved.
            TrinityClassLibrary_BL.Patient currentPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
            TrinityClassLibrary_BL.Medic currentMedic = (TrinityClassLibrary_BL.Medic)Session["CurrentMedic"];
            AdditionalPatientNote noteToSave = new AdditionalPatientNote();
            string note = null;
            int securityLevelID = 0;
            string errMsg = null;

            // Sets current PatientID.
            noteToSave.PatientID = currentPatient.PatientID;

            // Checks to see which textbox has a note and assigns it to the Note to be saved.
            if (this.txtAdminNote.Text.Trim().Length > 0) { note = this.txtAdminNote.Text; }
            if (this.txtMedicNote.Text.Trim().Length > 0) { note = this.txtMedicNote.Text; }
            if (this.txtPhysicianNote.Text.Trim().Length > 0) { note = this.txtPhysicianNote.Text; }
            if (string.IsNullOrEmpty(note)) { errMsg = "You must enter a note."; }
            else { noteToSave.Notes = note; }

            // Stores the note to session for use in the Email.
            Session["NoteToSave"] = note;

            if (CurrentMedicSecurityLevel != MedicSecurityLevel.NONE)
            {
                if (CurrentMedicSecurityLevel == MedicSecurityLevel.Medic) { noteToSave.SecurityLevelID = (int)AdditionalPatientNote.SecurityLevels.AllUsers ; }
                else
                {
                    // Checks to see which radio button is checked to set SecurityLevelID.
                    if (this.rdoAdminOnly.Checked) { securityLevelID = (int)AdditionalPatientNote.SecurityLevels.AdminOnly; }
                    if (this.rdoAdminPhysiciansOnly.Checked) { securityLevelID = (int)AdditionalPatientNote.SecurityLevels.AdminAndPhysiciansOnly; }
                    if (this.rdoAllUsers.Checked) { securityLevelID = (int)AdditionalPatientNote.SecurityLevels.AllUsers ; }
                    if (securityLevelID == 0) { errMsg += "/nYou must select a Security Level."; }
                    else { noteToSave.SecurityLevelID = securityLevelID; }
                }
            }
            else { noteToSave.SecurityLevelID = (int)AdditionalPatientNote.SecurityLevels.AdminOnly  ; }

            // Created by current users MedicID.
            noteToSave.CreatedByUserID = currentMedic.MedicID;

            // Sets created date to today.
            noteToSave.DateCreated = DateTime.Now;

            // The following are null and false since this is a new note.
            noteToSave.LastModifiedByUserID = null;
            noteToSave.DateLastModified = null;
            noteToSave.Reviewed = false;
            noteToSave.IsDeleted = false;
            noteToSave.TempNoteID = null; // TempID is not used by this App.

            if(string.IsNullOrEmpty(errMsg))
            {
                // Saves note to the database.
                AdditionalPatientNoteProvider.Save(noteToSave);

                // Determines what Level the current User is and will save the encounter to the DB and send an email if checked.
                switch (CurrentMedicSecurityLevel ){
                    case MedicSecurityLevel.Physician :
                        if (this.chkPhysicianEmail.Checked)
                        { 
                            this.SendEmail();
                            if (chkCustomerNotification.Checked)
                            {
                                SendCustomerEmail();
                            }
                            Response.Write("<script language='javascript'>alert('Your note has been saved and emailed.');</script>");
                        }
                        else
                        {
                            Response.Write("<script language='javascript'>alert('Your note has been saved.');</script>");
                        }
                        break;
                    case MedicSecurityLevel.Admin:
                        if (this.chkAdminEmail.Checked)
                        { 
                            this.SendEmail();
                            if (chkCustomerNotification.Checked)
                            {
                                SendCustomerEmail();
                            }
                            Response.Write("<script language='javascript'>alert('Your note has been saved and emailed.');</script>");
                        }
                        else
                        {
                            Response.Write("<script language='javascript'>alert('Your note has been saved.');</script>");
                        }
                        break;
                    case MedicSecurityLevel.Medic:
                        Response.Write("<script language='javascript'>alert('Your note has been saved.');</script>");
                        break;
                }
                // Removes the session variables that will no longer be needed after save.
                Session.Remove("CurrentMedic");
                Session.Remove("CurrentPatientRig");
                Session.Remove("PatientInfo");
                Session.Remove("NoteToSave");
                Session.Remove("efCustomerEmails");
                Response.Write("<script>var oWindow = null; if (window.radWindow) oWindow = window.radWindow; else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; oWindow.Close();oWindow.BrowserWindow.GetNotesPanel().AjaxRequest();oWindow.BrowserWindow.GetRadWindowManager().CloseAll();</script>");
                
            }
            else{ Response.Write("<script language='javascript'>alert('" + errMsg + "');</script>"); }
        }
        #endregion

        #region Edit Note Save Button
        /// <summary>
        /// Saves the EDITED note to the database and sends email if checked.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            // Gets selected Patient/current User from session and creates a new Note to be saved.
            TrinityClassLibrary_BL.Patient currentPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
            TrinityClassLibrary_BL.Medic currentMedic = (TrinityClassLibrary_BL.Medic)Session["CurrentMedic"];
            AdditionalPatientNote noteToSave = (AdditionalPatientNote)Session["CurrentNoteToSave"];
            Session.Remove("CurrentNoteToSave");
            string note = null;
            int securityLevelID = 0;
            string errMsg = null;

            // Sets current PatientID.
            noteToSave.PatientID = currentPatient.PatientID;

            // Ensures the textbox has a value before saving to the note.
            if (this.txtAdminEditNote.Text.Trim().Length > 0) { note = this.txtAdminEditNote.Text; }
            if (string.IsNullOrEmpty(note)) { errMsg = "You must enter a note."; }
            else { noteToSave.Notes = note; }

            // Stores the note to session for use in the Email.
            Session["NoteToSave"] = note;
            
            // Checks to see which radio button is checked to set SecurityLevelID.
            if (this.rdoEditAdmin.Checked) { securityLevelID = (int)AdditionalPatientNote.SecurityLevels.AdminOnly; }
            if (this.rdoEditPhysicians.Checked) { securityLevelID = (int)AdditionalPatientNote.SecurityLevels.AdminAndPhysiciansOnly ; }
            if (this.rdoEditAllUsers.Checked) { securityLevelID = (int)AdditionalPatientNote.SecurityLevels.AllUsers ; }
            if (securityLevelID == 0) { errMsg += "/nYou must select a Security Level."; }
            else { noteToSave.SecurityLevelID = securityLevelID; }

            // Created by current users MedicID.
            noteToSave.CreatedByUserID = currentMedic.MedicID;

            // Sets created date to today.
            noteToSave.DateCreated = DateTime.Now;

            // The following are null and false since this is a new note.
            noteToSave.LastModifiedByUserID = null;
            noteToSave.DateLastModified = null;
            noteToSave.Reviewed = false;
            noteToSave.IsDeleted = false;
            noteToSave.TempNoteID = null; // TempID is not used by this App.

            if (string.IsNullOrEmpty(errMsg))
            {
                ClientScript.RegisterStartupScript(GetType(), "Close", "<script>var oWindow = null; if (window.radWindow) oWindow = window.radWindow; else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; oWindow.Close();oWindow.BrowserWindow.GetNotesPanel().AjaxRequest();</script>");

                // Saves note to the database.
                AdditionalPatientNoteProvider.Save(noteToSave);

                // Saves the encounter to the DB and sends an email(if checked).
                if (this.chkAdminEditEmail.Checked) 
                { 
                    this.SendEditEmail();

                    if (chkCustomerNotification.Checked)
                    {

                        SendCustomerEmail();
                    }
                    Response.Write("<script language='javascript'>alert('Your note has been saved and emailed.');</script>");
                }
                else 
                {
                    Response.Write("<script language='javascript'>alert('Your note has been saved.');</script>"); 
                }

                // Removes the session variables that will no longer be needed after save.
                Session.Remove("CurrentMedic");
                Session.Remove("CurrentPatientRig");
                Session.Remove("PatientInfo");
                Session.Remove("NoteToSave");
            }
            else { Response.Write("<script language='javascript'>alert('" + errMsg + "');</script>"); }
        }
        #endregion

        #endregion

        #region Functions

        #region IsNull
        /// <summary>
        /// Returns an ArrayList of the Patient Information needed to populate the Add/Edit notes literal.
        /// </summary>
        /// <param name="patientInfo"></param>
        /// <returns></returns>
        private ArrayList IsNull(ArrayList patientInfo)
        {
            // Gets the selected Patient from session.
            string rigName = null;
            string fName = null;
            string lName = null;
            string encounter = null;

            // Checks Patient RigID for null.
            if (CurrentPatient.RigID.HasValue) { rigName = CurrentPatientRig.Name; }
            else { rigName = "Unknown"; }

            // Checks Patient LastName for null.
            if (string.IsNullOrEmpty(CurrentPatient.LastName)) { lName = "Unknown"; }
            else { lName = CurrentPatient.LastName; }

            // Checks Patient FirstName for null.
            if (string.IsNullOrEmpty(CurrentPatient.FirstName)) { fName = "Unknown"; }
            else { fName = CurrentPatient.FirstName; }

            // Checks Patient EncounterDate for null.
            if (CurrentPatient.EncounterDate.HasValue) { encounter = CurrentPatient.EncounterDate.Value.ToShortDateString(); }
            else { encounter = "Unknown"; }

            // Adds Patient Information to the ArrayList.
            patientInfo.Add(rigName);
            patientInfo.Add(fName);
            patientInfo.Add(lName);
            patientInfo.Add(encounter);

            return patientInfo;
        }
        #endregion

        #region HaveCustomerEmail
        /// <summary>
        /// Returns if THe customer has any users that need to receive notifications
        /// </summary>
        /// <returns>
        /// True: When the customer has a user with the ReceiveDocumentNotification Securable
        /// False: If none of the customers user has the ReceiveDocumentNotification Securable
        /// </returns>
        private bool HaveCustomerEmail()
        {

            List<UserInfo> CustomersWithEmails = GetNotifyUsers(CurrentPatientEncounter.RigID.Value );

            if (CustomersWithEmails == null || CustomersWithEmails.Count() == 0)
            {
                return false;
            }

            return true;
                
            
        }
        #endregion

        #endregion

        #region Methods

        #region EditTrue
        /// <summary>
        /// Executes the following code if a User clicked on an Additonal Note to EDIT on the Notes page.
        /// </summary>
        protected void EditTrue()
        {
            string medicName = HttpContext.Current.User.Identity.Name.ToString();
            TrinityClassLibrary_BL.Medic currentMedic = MedicProvider.Fetch(medicName);
            AdditionalPatientNote currentNote = AdditionalPatientNoteProvider.Fetch(Convert.ToInt32(Session["NoteID"]));
            Session["CurrentNoteToSave"] = currentNote;

            // Gets the current Patient stored in Session from the Patient page.
            TrinityClassLibrary_BL.Patient currentPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];

            TrinityClassLibrary_BL.Rig currentPatientRig = RigProvider.Fetch(Convert.ToInt32(currentPatient.RigID));

            // Stores the current Medic and Patients Rig to session for use in the Save/Email methods.
            Session["CurrentMedic"] = currentMedic;
            Session["CurrentPatientRig"] = currentPatientRig;

            // Gets the current Notes Security Level.
            this.NoteSecurityLevel(currentNote.SecurityLevel);

            // Populates textbox with the current note attached to Patient (if any).
            if (string.IsNullOrEmpty(currentNote.Notes)) { this.txtAdminEditNote.Text = ""; }
            else { this.txtAdminEditNote.Text = currentNote.Notes.ToString(); this.lblEditCharCount.Text = "Message Length: " + this.txtAdminEditNote.Text.Length.ToString(); }

            // Calls IsNull to check the patient variables for nulls before placing into literal.
            ArrayList patientInfo = new ArrayList();
            this.IsNull(patientInfo);

            this.litEditPatientInfo.Text = patientInfo[0].ToString() + ": " + patientInfo[1].ToString() + ", " + patientInfo[2].ToString() + " (" + patientInfo[3].ToString() + ")";

            // Stores PatientInfo to session for use in the Email method.
            Session["PatientInfo"] = this.litEditPatientInfo.Text;

            // Shows the Edit Form - Ensures Add Form is hidden.
            this.pnlEditNote.Visible = true;
            this.pnlAddNote.Visible = false;
        }
        #endregion

        #region EditFalse
        /// <summary>
        /// Executes the following code if a User clicked the ADD NOTE button on the Notes page.
        /// </summary>
        protected void EditFalse()
        {
            string medicName = HttpContext.Current.User.Identity.Name.ToString();
            TrinityClassLibrary_BL.Medic currentMedic = MedicProvider.Fetch(medicName);

            // Gets the selected Patient from Session that was stored in the Patient page.
            TrinityClassLibrary_BL.Patient currentPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];

            TrinityClassLibrary_BL.Rig currentPatientRig = RigProvider.Fetch(Convert.ToInt32(currentPatient.RigID));

            // Stores the current Medic and Patients Rig to session for use in the Save/Email methods.
            Session["CurrentMedic"] = currentMedic;
            Session["CurrentPatientRig"] = currentPatientRig;

            // Gets the current Medics security level.
            this.MedicSecurityLevelView( );
            
            // Calls IsNull to check the patient variables for nulls before placing into literal.
            ArrayList patientInfo = new ArrayList();
            this.IsNull(patientInfo);

            // Populates the Patient Info literal.
            this.litPatientInfo.Text = patientInfo[0].ToString() + ": " + patientInfo[1].ToString() + ", " + patientInfo[2].ToString() + " (" + patientInfo[3].ToString() + ")";

            // Stores PatientInfo to session for use in the Email method.
            Session["PatientInfo"] = this.litEditPatientInfo.Text;

            // Shows the Add form - Ensures Edit Form is hidden.
            this.pnlEditNote.Visible = false;
            this.pnlAddNote.Visible = true;

        }
        #endregion

        #region Emails

        #region SendEmail
        /// <summary>
        /// Executes if the User is ADDING a note and chose to send an Email.
        /// </summary>
        private void SendEmail()
        {
            TrinityClassLibrary_BL.Medic currentMedic = (TrinityClassLibrary_BL.Medic)Session["CurrentMedic"];
            TrinityClassLibrary_BL.Patient currentPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
            string server = ConfigurationManager.AppSettings["EmailServer"].ToString();
            string emailSender = currentMedic.EmailAddress.ToString();
            string emailRecipient = ConfigurationManager.AppSettings["MedicAppEmailRecipient"].ToString();

            StringBuilder emailBody = new StringBuilder();
            MailMessage mailMsg = new MailMessage(emailSender, emailRecipient);
            SmtpClient mailClient = new SmtpClient();
            mailClient.Host = server;

            string emailSubject = "On Call Note ADDED for Rig: " + Session["PatientInfo"].ToString();
            emailSubject = emailSubject.Replace(":", " -");

            mailMsg.Subject = emailSubject;
            emailBody.Append("The following patient note has been added by a physician via the Trinity Intranet:\n\n");
            emailBody.Append(Session["PatientInfo"].ToString() + "\n\n");
            emailBody.Append("Chief Complaint: " + currentPatient.ChiefComplaint + "\n\n");
            emailBody.Append("Physician Username: " + currentMedic.UserName + "\n\n");
            emailBody.Append("Note Entered: " + Convert.ToDateTime(DateTime.Now.ToShortDateString()) + "\n\n");
            emailBody.Append("Physician Note: " + Session["NoteToSave"].ToString() + "\n\n");
            emailBody.Append("This note may now be viewed both online and via the Trinity Medical Manager.\n\n");
            mailMsg.Body = emailBody.ToString();

            mailClient.Send(mailMsg);
        }
        #endregion

        #region SendEditEmail
        /// <summary>
        /// Executes if the User is EDITING a note and chose to send an Email.
        /// </summary>
        private void SendEditEmail()
        {
            TrinityClassLibrary_BL.Medic currentMedic = (TrinityClassLibrary_BL.Medic)Session["CurrentMedic"];
            TrinityClassLibrary_BL.Patient currentPatient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
            string server = ConfigurationManager.AppSettings["EmailServer"].ToString();
            string emailSender = currentMedic.EmailAddress.ToString();
            string emailRecipient = ConfigurationManager.AppSettings["MedicAppEmailRecipient"].ToString();

            StringBuilder emailBody = new StringBuilder();
            MailMessage mailMsg = new MailMessage(emailSender, emailRecipient);
            SmtpClient mailClient = new SmtpClient();
            mailClient.Host = server;

            string emailSubject = "On Call Note EDITED for Rig: " + Session["PatientInfo"].ToString();
            emailSubject = emailSubject.Replace(":", " -");

            mailMsg.Subject = emailSubject;
            emailBody.Append(Session["PatientInfo"].ToString() + "\n\n");
            emailBody.Append("Chief Complaint: " + currentPatient.ChiefComplaint + "\n\n");
            emailBody.Append("Physician Username: " + currentMedic.UserName + "\n\n");
            emailBody.Append("Note Entered: " + Convert.ToDateTime(DateTime.Now.ToShortDateString()) + "\n\n");
            emailBody.Append("Physician Note: " + Session["NoteToSave"].ToString() + "\n\n");
            emailBody.Append("This note may now be viewed both online and via the Trinity Medical Manager.\n\n");
            mailMsg.Body = emailBody.ToString();

            mailClient.Send(mailMsg);
        }
        #endregion

        #region SendCustomerEmail
        /// <summary>
        /// Send the customer an email notifying them of a change in the patient notes
        /// </summary>
        /// <param name="CustomerEmails"></param>
        private void SendCustomerEmail()
        {
            Dictionary<string, string> CustomerEmails = Session["efCustomerEmails"] as Dictionary<string, string>;
            if (CustomerEmails != null)
            {

                string EmailBody = GetXMLText("AddNote", "NotifyCustomerBody");
                string EmailSubject = GetXMLText("AddNote", "NotifyCustomerSubject");

                foreach (KeyValuePair<string, string> customerEmail in CustomerEmails)
                {
                    string emailAddress = customerEmail.Key;
                    string customerName = customerEmail.Value;

                    Dictionary<string, string> replaceText = new Dictionary<string, string>();
                    replaceText.Add("[PatientEncounter]", CurrentPatientEncounter.PatientID.ToString());
                    replaceText.Add("[EncounterDate]", CurrentPatientEncounter.EncounterDate.Value.ToShortDateString());
                    UserInfo origMedic = null;

                    if (CurrentPatientEncounter.Medic.HasValue)
                    {
                        origMedic = GetMedicByID(CurrentPatientEncounter.Medic.Value);
                    }

                    if (origMedic != null)
                    {
                        replaceText.Add("[TrinityUser]", origMedic.UserSecurity.Username);
                    }
                    else
                    {
                        replaceText.Add("[TrinityUser]", "[N/A]");
                    }

                    replaceText.Add("[PatientName]", CurrentPatientEncounter.FirstName + " " + CurrentPatientEncounter.LastName);
                    replaceText.Add("[WorksiteName]", CurrentRig.Name);
                    replaceText.Add("[PatientAddress]", CurrentPatientEncounter.Address);
                    replaceText.Add("[PatientCity]", CurrentPatientEncounter.City);
                    replaceText.Add("[PatientState]", CurrentPatientEncounter.State);
                    replaceText.Add("[PatientZIP]", CurrentPatientEncounter.Zip);
                    replaceText.Add("[PatientCountry]", CurrentPatientEncounter.Country);
                    replaceText.Add("[PatientBirthdate]", CurrentPatientEncounter.Birthdate.ToString());
                    replaceText.Add("[PatientAge]", CurrentPatientEncounter.Age.ToString());
                    replaceText.Add("[PatientSex]", CurrentPatientEncounter.Sex);
                    replaceText.Add("[PatientChiefComplaint]", CurrentPatientEncounter.Complaint);

                    if (CurrentPatientNotes != null)
                    {
                        replaceText.Add("[MedicImpression]", CurrentPatientNotes.ImpressionNotes);
                    }
                    else
                    {
                        replaceText.Add("[MedicImpression]", "[N/A]");
                    }

                    replaceText.Add("[PatientIllnessInjuryHistory]", CurrentPatientEncounter.PatientHistory);
                    replaceText.Add("[Notes]", CurrentPatientEncounter.Notes);
                    replaceText.Add("[UserFullName]", customerName);
                    replaceText.Add("[WebLink]", PatientEncounterLocation + "patient.aspx?PatientID=" + CurrentPatientEncounter.PatientID);


                    EmailBody = ReplaceText(replaceText, EmailBody);

                    MailMessage mMessage = new MailMessage();
                    mMessage.Body = EmailBody;
                    mMessage.Subject = EmailSubject;
                    mMessage.To.Add(new MailAddress(emailAddress));
                    mMessage.IsBodyHtml = true;

                    SendMail sMailClient = new SendMail();
                    sMailClient.SendEmail(mMessage);

                }
            }
        }
        #endregion

        #endregion

        #region NoteSecurityLevel
        /// <summary>
        /// Method to retrive the current Notes Security Level.
        /// </summary>
        /// <param name="currentNote"></param>
        protected void NoteSecurityLevel(AdditionalPatientNote.SecurityLevels currentNote)
        {
            switch (currentNote)
            {
                case AdditionalPatientNote.SecurityLevels.AdminOnly:
                    this.rdoEditAdmin.Checked = true;
                    break;
                case AdditionalPatientNote.SecurityLevels.AdminAndPhysiciansOnly:
                    this.rdoEditPhysicians.Checked = true;
                    break;
                case AdditionalPatientNote.SecurityLevels.AllUsers:
                    this.rdoEditAllUsers.Checked = true;
                    break;
            }
        }
        #endregion

        #region MedicSecurityLevel
        /// <summary>
        /// Method to retrieve the current Medics Security Level.
        /// </summary>
        /// <param name="currentMedic"></param>
        protected void MedicSecurityLevelView()
        {
            switch (CurrentMedicSecurityLevel )
            {
                case MedicSecurityLevel.Admin:
                    this.pnlAdminView.Visible = true;
                    this.pnlMedicView.Visible = false;
                    this.pnlPhysicianView.Visible = false;
                    break;
                case MedicSecurityLevel.Physician:
                    this.pnlAdminView.Visible = false;
                    this.pnlMedicView.Visible = false;
                    this.pnlPhysicianView.Visible = true;
                    break;
                case MedicSecurityLevel.Medic:
                    this.pnlAdminView.Visible = false;
                    this.pnlMedicView.Visible = true;
                    this.pnlPhysicianView.Visible = false;
                    btnPreview.Visible = false;
                    break;
                
            }
        }
        #endregion

        #endregion
    }
}
