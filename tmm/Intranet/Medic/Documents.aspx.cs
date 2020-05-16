using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Runtime.InteropServices;
using System.Linq;
using System.Xml.Linq;
using TMMModel;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace TrinityMedicalManagement
{
    public partial class Documents : TMMPage
    {

        private int _newdocumentID;

       #region + Properties
            
        
       #region NewDocumentID
       public int NewDocumentID
       {
           get { return _newdocumentID; }
           set { _newdocumentID = value; }
       }
        
       #endregion
 

        #region OrigiantionSource
        public string OriginationSource
        {
            get
            {
                if (currentUserInfo.UserType.ID == (int)UserType.Types.Medic || currentUserInfo.UserType.ID == (int)UserType.Types.Office)
                {
                    return "Trinity";
                }

                return "Non-Trinity";
            }
        }
        #endregion


        #endregion


        #region + Events


        #region Page_Load
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            rdpEncounterStartDate.DateInput.Attributes.Add("onclick", "TogglePopup('" + rdpEncounterStartDate.ClientID + "')");

            if (CurrentPatientEncounter == null)
            {
                Response.Redirect("patient.aspx");
            }

            if (!Page.IsPostBack)
            {

                if (Request.QueryString["UploadError"] == "1")
                {
                    string errMsg = "<script>alert('Selected file is too big and cannot be uploaded. Maximum size allowed is 4MB.');";
                    HttpContext.Current.Response.Write(errMsg);
                }

                LoadDocumentList();
                LoadDocumentTypes();
                ShowHideOptions();

                // Display the patient information to the screen.
                if (CurrentRig != null) litPatientData.Text = CurrentRig.Name + ": ";
                litPatientData.Text += CurrentPatientEncounter.LastName + ", " + CurrentPatientEncounter.FirstName + " (" + Convert.ToDateTime(CurrentPatientEncounter.EncounterDate).ToShortDateString() + ")";
            }

        } 
        #endregion


        #region btnUploadDocument_Click
        /// <summary>
        /// Handles the btnUploadDocument Click Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUploadDocument_Click(object sender, EventArgs e)
        {
            
            SaveNewDocument();
        }

        #endregion


        #region btnCancel_Click
        /// <summary>
        /// Handles the cancel button click event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearUploadForm();
        }

        #endregion
      
        
        #region + Grid Events

        #region grdDocuments_ItemCommand
        protected void grdDocuments_ItemCommand(object sender, Telerik.WebControls.GridCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                int docID = Int32.Parse(e.CommandArgument.ToString());
                /* Sets the visible property of the selected document to allow non-admins to view the file */
                if (e.CommandName == "ShowDoc")
                {
                    using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                    {
                        var q = (from doc in ef.PatientDocument
                                 where doc.DocumentID == docID
                                 select doc).FirstOrDefault();

                        q.Visible = true;
                        ef.SaveChanges();
                    }

                }

                /* Sets the visible property of the selected document to deny non-admins the ability to view the file */
                if (e.CommandName == "HideDoc")
                {
                    using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                    {
                        var q = (from doc in ef.PatientDocument
                                 where doc.DocumentID == docID
                                 select doc).FirstOrDefault();

                        q.Visible = false;
                        ef.SaveChanges();
                    }
                }

                if (e.CommandName == "ViewDoc")
                {
                    try
                    {
                        using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                        {
                            var q = (from doc in ef.PatientDocument
                                     where doc.DocumentID == docID
                                     select doc).FirstOrDefault();

                            string fileName = GetDocumentName(q.DocumentLink);
                            FileInfo fileInfo = new FileInfo(UploadLocation + docID.ToString());

                            // Get the network credentials and use them to impersonate the user with priviledges.
                            string UserName = System.Configuration.ConfigurationManager.AppSettings["UserName"].ToString();
                            string Password = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
                            string Domain = System.Configuration.ConfigurationManager.AppSettings["Domain"].ToString();

                            // Impersonate the user in order to get the document.
                            //CreateIdentity(UserName, Domain, Password);

                            // Set up the response to receive the file.
                            Response.Clear();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                            Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                            Response.ContentType = "application/octet-stream";
                            Response.WriteFile(fileInfo.FullName);

                            // Get the file as a byte array and send it to the response.
                            Byte[] fileBytes = null;
                            using (FileStream fs = new FileStream(UploadLocation + docID.ToString(), FileMode.Open, FileAccess.Read))
                            {
                                try
                                {
                                    BinaryReader br = new BinaryReader(fs);
                                    fileBytes = br.ReadBytes((int)fileInfo.Length);

                                    using (BinaryWriter fw = new BinaryWriter(Response.OutputStream))
                                    {
                                        try
                                        {
                                            fw.Write(fileBytes, 0, fileBytes.Length);
                                        }
                                        catch
                                        {
                                            lblError.Text = "Error: Unable to retrieve the file requested.";
                                        }
                                    }
                                }
                                catch
                                {
                                    lblError.Text = "Error: Unable to read the file.";
                                }

                            }
                            Response.End();
                        }

                    }
                    catch
                    {
                    }
                }
            }

            LoadDocumentList();
        }
        #endregion


        #region grdDocuments_ItemDataBound
        public void grdDocuments_ItemDataBound(object sender, Telerik.WebControls.GridItemEventArgs e)
        {
            if (e.Item.DataItem != null && e.Item.DataItem.GetType() == typeof(PatientDocument))
            {
                Telerik.WebControls.GridItem item = e.Item;
                PatientDocument pDoc = (PatientDocument)e.Item.DataItem;
                LinkButton lnkHide = (LinkButton)item.FindControl("lnkHide");
                LinkButton lnkShow = (LinkButton)item.FindControl("lnkShow");
                if (lnkHide != null && lnkShow != null)
                {

                    if (pDoc.Visible)
                    {
                        lnkHide.Visible = true;
                        lnkShow.Visible = false;
                    }
                    else
                    {
                        lnkShow.Visible = true;
                        lnkHide.Visible = false;
                    }
                }
            }

        }
        #endregion


        #endregion


        #region ddlDocType_SelectedIndexChanged
        protected void ddlDocType_SelectedIndexChanged(Object sender, EventArgs e)
        {
            if (ddlDocType.SelectedValue == "AddType")
            {
                divDocType.Visible = true;
            } 
            else 
            {
                divDocType.Visible = false;
            }
        }
        #endregion


        #endregion


        #region + Helpers


        #region LoadDocumentList
        /// <summary>
        /// Loads the different document types list
        /// </summary>
        private void LoadDocumentList()
        {
            using (TMM_DEPLOYEntities tmmEntities = new TMM_DEPLOYEntities())
            {
                
                List<PatientDocument> foundDocs = new List<PatientDocument>();
                
                if (IsAdminUser)
                {
                    var document = (from docs in tmmEntities.PatientDocument
                                    where docs.Patient.PatientID == CurrentPatientEncounter.PatientID
                                    select docs);

                    foundDocs.AddRange(document);
                }
                else
                {
                    var document = (from docs in tmmEntities.PatientDocument
                                    where docs.Patient.PatientID == CurrentPatientEncounter.PatientID &&
                                    docs.Visible==true 
                                    select docs);

                    foundDocs.AddRange(document);
                }

                grdDocuments.DataSource = foundDocs;
                grdDocuments.DataBind();

            }
        } 
        #endregion


        #region LoadDocumentTypes
        /// <summary>
        /// Loads the different document type to the 
        /// </summary>
        private void LoadDocumentTypes()
        {
            ddlDocType.Items.Add(new ListItem("Select Document Type"));
            ddlDocType.Items.Add(new ListItem("Add New Document Type","AddType"));
            using (TMM_DEPLOYEntities tmmEntities = new TMM_DEPLOYEntities())
            {
                var docTypes = (from types in tmmEntities.PatientDocument
                                select types.DocumentType).Distinct() ;            
                foreach (string dtype in docTypes ) {
                    ddlDocType.Items.Add(dtype);
                }
            }

        }
        #endregion


        #region SaveNewDocument()
        /// <summary>
        /// Saves new documents to the database
        /// </summary>
        private void SaveNewDocument()
        {
            foreach (Telerik.WebControls.UploadedFile uplFile in uplNewDocument.UploadedFiles)
            {
                PatientDocument pDoc = new PatientDocument();

                pDoc.DocumentLink = UploadLocation + uplFile.FileName;
                pDoc.DocumentType = ddlDocType.Text;
                pDoc.LocationType = (int)LocationType.Trinity;
                pDoc.ReferenceDate = rdpEncounterStartDate.SelectedDate.Value ;
                pDoc.Active = true;
                pDoc.OriginationSource = OriginationSource;
                pDoc.DateAdded = DateTime.Now;
                pDoc.Visible = true;

                if (ddlDocType.SelectedValue == "AddType")
                    pDoc.DocumentType = txtDocumentType.Text;

                using (TMM_DEPLOYEntities tmmEntities = new TMM_DEPLOYEntities())
                {
                    tmmEntities.Attach(CurrentPatientEncounter);
                    pDoc.Patient = CurrentPatientEncounter;
                    tmmEntities.AddToPatientDocument(pDoc);
                    tmmEntities.SaveChanges();
                    tmmEntities.Detach(CurrentPatientEncounter);
                }
                _newdocumentID = pDoc.DocumentID;
                HandleUploadedFile(pDoc.DocumentID, uplFile);

                NotifyUsers();
            }

            ClientScript.RegisterStartupScript(grdDocuments.GetType(), "UploadComplete", "<script>document.getElementById('divUploadFile').style.display = 'none'; document.getElementById('divUploadButton').style.display = 'block';</script>");
            LoadDocumentList();
            ClearUploadForm();

        }
        #endregion


        #region Identity Helpers
        // Methods used to impersonate the user with the correct credentials to access the patient documents.

        [System.Runtime.InteropServices.DllImport("advapi32.dll", SetLastError = true)]
        private static extern bool LogonUser(String lpszUsername, String lpszDomain, String lpszPassword,
                   int dwLogonType, int dwLogonProvider, ref IntPtr phToken);

        [System.Runtime.InteropServices.DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        private extern static bool CloseHandle(IntPtr handle);

        public static void CreateIdentity(string User, string Domain, string Password)
        {
            // The Windows NT user token.
            IntPtr tokenHandle = new IntPtr(0);

            const int LOGON32_PROVIDER_DEFAULT = 0;
            const int LOGON32_LOGON_NETWORK_CLEARTEXT = 3;

            tokenHandle = IntPtr.Zero;

            bool returnValue = LogonUser(User, Domain, Password,
                 LOGON32_LOGON_NETWORK_CLEARTEXT, LOGON32_PROVIDER_DEFAULT,
                 ref tokenHandle);
            if (false == returnValue)
            {
                int ret = Marshal.GetLastWin32Error();
                throw new Exception("LogonUser failed with error code: " + ret);
            }
            System.Security.Principal.WindowsIdentity id = new System.Security.Principal.WindowsIdentity(tokenHandle);
            CloseHandle(tokenHandle);
            id.Impersonate();
        }
        #endregion


        #region HandleUploadedFile
        /// <summary>
        /// Handles saving the file to the specified location
        /// </summary>
        /// <param name="docID"></param>
        private void HandleUploadedFile(int docID, Telerik.WebControls.UploadedFile uploadFile)
        {
            //Saves the file to the server
            uploadFile.SaveAs(UploadLocation + docID.ToString());
                
    
        }

        #endregion


        #region ClearUploadForm
        /// <summary>
        /// Resets the upload form to its default.
        /// </summary>
		private void ClearUploadForm()
        {
            txtDocumentType.Text = string.Empty;
            rdpEncounterStartDate.Clear();
            ddlDocType.SelectedIndex = 0;
            divDocType.Visible = false;
            string clearuploadscript = "<script>var who=document.getElementsByName('" + uplNewDocument.UniqueID + "')[0];if (who != null) {who.value=''; var who2= who.cloneNode(false); who2.onchange= who.onchange; who.parentNode.replaceChild(who2,who);}</script>";
            ClientScript.RegisterStartupScript(grdDocuments.GetType(), "ClearUplaod", clearuploadscript);
        }
 
	    #endregion


        #region GetNotifyList
        /// <summary>
        /// Returns a list of all users that need to be notified
        /// </summary>
        /// <returns></returns>
        private List<UserInfo> GetNotifyList()
        {
            List<UserInfo> emailList = new List<UserInfo>();

            using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
            {                                  
                var userList = (from c in ef.UserInfo
                                where c.UserType.ID == (int)UserType.Types.Office  &&
                                c.Active == true
                                select c);

                
                foreach (UserInfo uInfo in userList)
                {

                    var securables = (from c in ef.User_Securable
                                      where c.UserID == uInfo.ID &&
                                      c.SecurableID == (int) Securable.Securables.ReceiveDocumentNotification &&
                                      c.Active == true
                                      select c);

                    List<User_Securable> uSecurable = new List<User_Securable>();
                    uSecurable.AddRange(securables );

                    foreach (User_Securable uSec in uSecurable)
                    {
                        if (uSec.SecurableID == (int)Securable.Securables.ReceiveDocumentNotification)
                        {
                            emailList.Add(uInfo);
                        }
                    }
                    
                }
            }

            return emailList;

        }
        
        #endregion


        #region GetDocumentName
        /// <summary>
        /// Returns the uploaded documents name
        /// </summary>
        /// <param name="fileLocation"></param>
        /// <returns></returns>
        public string GetDocumentName(string fileLocation)
        {
            string pat = @"^(?<1>.*[\\/])(?<2>.+)\.(?<3>.+)?$|^(?<1>.*[\\/])(?<2>.+)$|^(?<2>.+)\.(?<3>.+)?$|^(?<2>.+)$";
            Regex r = new Regex(pat);
            Match m = r.Match(fileLocation );
            string fileExt = m.Groups[3].Captures[0].ToString();
            string fileName = m.Groups[2].Captures[0].ToString();
            string file = fileName + "." + fileExt;
            return file;
        }
        #endregion


        #region NotifyUsers
        /// <summary>
        /// Send an email notifying users of a new document
        /// </summary>
        private void NotifyUsers()
                {

                    List<UserInfo> notifyList = GetNotifyList();

                    string subjectText = GetXMLText("Documents","NotifyUsersSubject"  );
                    string bodyText = GetXMLText("Documents","NotifyUsersBody");

                    foreach (UserInfo users  in  notifyList )
                    {
                        System.Net.Mail.MailMessage mMessage = new System.Net.Mail.MailMessage();

                        Dictionary<string, string> replaceText = new Dictionary<string, string>();
                        replaceText.Add("[PatientEncounter]", CurrentPatientEncounter.PatientID.ToString());
                        replaceText.Add("[OriginationSource]", OriginationSource);
                        replaceText.Add("[UploadDate]",DateTime.Today.ToShortDateString()  );
                        replaceText.Add("[username]", currentUserInfo.UserSecurity.Username );
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
                        replaceText.Add("[MedicImpression]", CurrentPatientNotes.ImpressionNotes);
                        replaceText.Add("[PatientIllnessInjuryHistory]", CurrentPatientEncounter.PatientHistory);
                        replaceText.Add("[Notes]", CurrentPatientEncounter.Notes);
                        replaceText.Add("[UserFullName]", users.FirstName + ' ' + users.LastName);
                        replaceText.Add("[WebLink]", PatientEncounterLocation + "patient.aspx?PatientID=" + CurrentPatientEncounter.PatientID);

                        mMessage.To.Add(new MailAddress(users.Email ));
                        mMessage.From = new MailAddress(ConfigurationManager.AppSettings["SupportEmail"].ToString());
                        mMessage.Body = ReplaceText(replaceText, bodyText);
                        mMessage.Subject = ReplaceText(replaceText, subjectText);
                        mMessage.IsBodyHtml = true;

                        SendMail smtpMail = new SendMail();
                        smtpMail.SendEmail(mMessage);
                    }
                        AddNotificationLog(notifyList);
                    
                }
        #endregion


        #region ShowHideOptions
        /// <summary>
        /// Shows or Hides the Option column of the grid based on the users role.
        /// </summary>
        private void ShowHideOptions()
        {
            Telerik.WebControls.GridColumn grdColumn = grdDocuments.Columns.FindByUniqueName("Options");
            if (grdColumn != null)
            {

                if (IsAdminUser)
                {
                    grdColumn.Visible = true;
                }
                else
                {
                    grdColumn.Visible = false;
                }
            }
        }
        #endregion


        #region OnUploadError
        public void OnUploadError(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError(); if (ex.Message == "Maximum request length exceeded.")
            {
                string errMsg =  "<script>alert('Selected file is too big and cannot be uploaded. Maximum size allowed is 4MB.');";
                ClientScript.RegisterClientScriptBlock(typeof(Page), "UploadError",errMsg );
                ClearUploadForm();
                Response.Write(errMsg);

                using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                {
                    var pdoc = (from doc in ef.PatientDocument
                                where doc.DocumentID == _newdocumentID
                                select doc).FirstOrDefault();

                    ef.DeleteObject(pdoc);
                }
                
                Server.ClearError();

            }

        } 
        #endregion


        #region AddNotificationLog
        /// <summary>
        /// Adds entries to the notificationlog
        /// </summary>
        /// <param name="sentToID"></param>
        private void AddNotificationLog(List<UserInfo> sentToID)
        {
            DateTime notificationDate = DateTime.Now;
            int uploadUserID = currentUserInfo.ID;

            NotificationLog uNote = new NotificationLog();
            
            uNote.DateSent  = DateTime.Now;
            uNote.CreatedByID = currentUserInfo.ID;
            

            using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
            {
                ef.AddToNotificationLog(uNote);

                foreach (UserInfo  Recip in sentToID)
                {
                    //ef.Attach(uNote);
                    NotificationLogRecipients logRecip = new NotificationLogRecipients();
                    logRecip.DateAdded = DateTime.Now;
                    logRecip.NotificationLog = uNote;
                    logRecip.RecipientID = Recip.ID;

                    ef.AddToNotificationLogRecipients(logRecip);
                    //ef.Detach(uNote);
                }

                ef.SaveChanges();
            }
        }
        #endregion

        #endregion

    }
}
