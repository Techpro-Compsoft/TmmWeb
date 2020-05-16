using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Reflection;
using TrinityBLO;
using System.Collections.Generic;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for Notes.
	/// </summary>
	public partial class Notes : TMMPage
	{

#region Protected

	
        //infiniedge.sql clsutility = new infiniedge.sql();

#endregion
		
#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

#region User Controls

#region Button Events

		protected void btnContinue_Click(object sender, System.EventArgs e)
		{
            Page.Validate("PageSubmit");
            if (Page.IsValid)
            {
                txtImpressionNotes.ReadOnly = false;
                txtInstructionNotes.ReadOnly = false;
                txtPhysicalNotes.ReadOnly = false;
                txtRecommendationNotes.ReadOnly = false;
                //Creating and Storing MedicNotes object into session to transfer to save.Notes.aspx
                MedicNotes newNotes = new MedicNotes();
                newNotes.PhysicalNotes = txtPhysicalNotes.Text;
                newNotes.ImpressionNotes = txtImpressionNotes.Text;
                newNotes.InstructionNotes = txtInstructionNotes.Text;
                newNotes.RecommendationNotes = txtRecommendationNotes.Text;

                Session["newNotes"] = newNotes;
                Server.Transfer("save.Notes.aspx");
            } else {
                ValidationSummary1.ValidationGroup = "PageSubmit";
            }
		}

        protected void btnAddNote_Click(object sender, EventArgs e)
        {
            // Sets isEdit to false in Session for use in the AddNote page.
            Session["isEdit"] = false;
            // JavaScript to open the RadWindow.  For some reason it would not work in the OnClientClick event.
            ClientScript.RegisterStartupScript(GetType(), "RadWindow", "<script>window.radopen('AddNote.aspx','winNote')</script>");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.Session.RemoveAll();
            Response.Redirect("~/Patient.aspx");
        }

#endregion

#endregion

#region Page Load

		protected override void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);

            Session["SearchComplete"] = true;

			if(Session["mode"] == null)
			{
				if(Session["PatientID"] == null)
				{
					Response.Redirect("SessionTimedOut.aspx");
				}
			}

            if (!IsPostBack)
            {
                LoadTips();

                // Get the patient information from session.
                TrinityClassLibrary_BL.Patient patient = (TrinityClassLibrary_BL.Patient)Session["Patient"];

                // Get the patient's rig information from session.
                TrinityClassLibrary_BL.Rig rig = null;
                if (patient.RigID.HasValue) rig = (TrinityClassLibrary_BL.Rig)Session["PatientRig"];

                // Display the patient information to the screen.
                if (rig != null) litPatientData.Text = rig.Name + ": ";
                litPatientData.Text += patient.LastName + ", " + patient.FirstName + " (" + Convert.ToDateTime(patient.EncounterDate).ToShortDateString() + ")";

                // Get all medic records from data.
                List<TrinityClassLibrary_BL.Medic> allMedics = TrinityClassLibrary_DAL.MedicProvider.FetchList();

                // Get all notes for this encounter that are not marked as deleted.
                List<TrinityClassLibrary_BL.AdditionalPatientNote> notes = TrinityClassLibrary_DAL.AdditionalPatientNoteProvider.FetchList(patient.PatientID, false);

                // Get the user's medic information.
                TrinityClassLibrary_BL.Medic currentUser = allMedics.Find(delegate(TrinityClassLibrary_BL.Medic currentMedic)
                    {
                        if(currentMedic.MedicID == Convert.ToInt32(Session["MedicPK"])) return true;
                        return false;
                    });
                //ViewState["CurrentMedicSecurity"] = currentUser.SecurityLevel.Value.ToString();

                // Filters out notes the user does not have rights to view.
                notes = FilterNotes(notes, currentUser);

                // Displays the additional notes at the bottom of the screen.
                DisplayNotes(allMedics, notes, currentUser);
            }
			//DataUtility clsData = new DataUtility();

			//StringBuilder strSQL = new StringBuilder();
			
			if(Session["mode"] != null)
			{
				if(Session["mode"].ToString() == "view")
				{
					btnContinue.Visible = false;
					btnReset.Visible = false;

                    DataTool dbTool = new DataTool();
                    DataTable dtPatientNotes = dbTool.getPatientNotes(Session["PatientID"].ToString());
					// add the javascript onload event that will initialize the span tables
					bodyMain.Attributes.Add("onLoad", "initSpan()");

					// disable the input boxes and show the data from the database                   
					enterData();

					//clsData.doIncompletes(strSQL.ToString(), Page);
                    //Filling Spans with datatable
                    if (dtPatientNotes.Rows.Count > 0)
                    {
                        if (dtPatientNotes.Rows[0][1] != null){txtImpressionNotes.Text = dtPatientNotes.Rows[0][1].ToString();}
                        if (dtPatientNotes.Rows[0][3] != null){txtInstructionNotes.Text = dtPatientNotes.Rows[0][3].ToString();}
                        if (dtPatientNotes.Rows[0][0] != null){txtPhysicalNotes.Text = dtPatientNotes.Rows[0][0].ToString();}
                        if (dtPatientNotes.Rows[0][2] != null){txtRecommendationNotes.Text = dtPatientNotes.Rows[0][2].ToString();}
                        if (dtPatientNotes.Rows[0][1] != null){spantxtImpressionNotes.InnerHtml = dtPatientNotes.Rows[0][1].ToString();}
                        if (dtPatientNotes.Rows[0][3] != null){spantxtInstructionNotes.InnerHtml = dtPatientNotes.Rows[0][3].ToString();}
                        if (dtPatientNotes.Rows[0][0] != null){spantxtPhysicalNotes.InnerHtml = dtPatientNotes.Rows[0][0].ToString();}
                        if (dtPatientNotes.Rows[0][2] != null){spantxtRecommendationNotes.InnerHtml = dtPatientNotes.Rows[0][2].ToString();}
                    }

                    // Set the visibility of the header panels.
                    pnlAddEditHeader.Visible = false;
                    pnlViewHeader.Visible = true;
                }
                else if (Session["mode"].ToString() == "edit")
                {

                    DataTool dbTool = new DataTool();
                    DataTable dtPatientNotes = dbTool.getPatientNotes(Session["PatientID"].ToString());

                    if (!Page.IsPostBack)
                    {

                        if (dtPatientNotes.Rows.Count > 0)
                        {
                            //Filling Textboxes with datatable
                            txtImpressionNotes.Text = dtPatientNotes.Rows[0][1].ToString();
                            txtInstructionNotes.Text = dtPatientNotes.Rows[0][3].ToString();
                            txtPhysicalNotes.Text = dtPatientNotes.Rows[0][0].ToString();
                            txtRecommendationNotes.Text = dtPatientNotes.Rows[0][2].ToString();
                            spantxtImpressionNotes.InnerHtml = dtPatientNotes.Rows[0][1].ToString();
                            spantxtInstructionNotes.InnerHtml = dtPatientNotes.Rows[0][3].ToString();
                            spantxtPhysicalNotes.InnerHtml = dtPatientNotes.Rows[0][0].ToString();
                            spantxtRecommendationNotes.InnerHtml = dtPatientNotes.Rows[0][2].ToString();
                        }
                    }
                    // enter the data into the fields

                    // Set the visibility of the header panels.
                    pnlAddEditHeader.Visible = true;
                    pnlViewHeader.Visible = false;
                }
                else
                {
                }
                ShowHideEditButtons();
			}
		} // Done... Tested

        #region DisplayNotes
        /// <summary>
        /// Displays the addiitonal notes to the page.
        /// </summary>
        /// <param name="allMedics">
        /// A list of all medics.
        /// </param>
        /// <param name="notes">
        /// A list of additional patient notes for this patient encounter.
        /// </param>
        /// <param name="userMedic">
        /// Medic who is using this program.
        /// </param>
        private void DisplayNotes(List<TrinityClassLibrary_BL.Medic> allMedics, List<TrinityClassLibrary_BL.AdditionalPatientNote> notes, TrinityClassLibrary_BL.Medic userMedic)
        {
            List<AdditionalNoteDisplay> notesForDisplay = new List<AdditionalNoteDisplay>();

            foreach (TrinityClassLibrary_BL.AdditionalPatientNote note in notes)
            {
                // Get the medic who created the note.
                TrinityClassLibrary_BL.Medic medic = allMedics.Find(delegate(TrinityClassLibrary_BL.Medic currentMedic)
                {
                    if (currentMedic.MedicID == note.CreatedByUserID) return true;
                    return false;
                });

                // Build the link text for the note.
                string link = note.DateCreated.ToShortDateString() + " " + note.DateCreated.ToShortTimeString() + " CT:";
                
                // Build the remainder of the note text.
                string noteText = " (" + CurrentMedicSecurityLevel.ToString() + ": " + medic.FirstName + " " + medic.LastName + ") " + note.Notes;

                // Create a new note to display.
                AdditionalNoteDisplay newDisplayNote = new AdditionalNoteDisplay(note.NoteID.ToString(), link, noteText, note.SecurityLevel , CurrentMedicSecurityLevel);
                notesForDisplay.Add(newDisplayNote);
            }

            rptNotes.DataSource = notesForDisplay;
            rptNotes.DataBind();

            if (CurrentMedicSecurityLevel == MedicSecurityLevel.Customer || CurrentMedicSecurityLevel==MedicSecurityLevel.NONE ) btnAddNote.Visible = false;

        } 
        #endregion

        #region FilterNotes
        /// <summary>
        /// Filter out additional notes that the user does not have rights to view.
        /// </summary>
        /// <param name="notes">
        /// All notes for the patient encounter.
        /// </param>
        /// <param name="currentUser">
        /// The current user of the patient encounter program.
        /// </param>
        /// <returns>
        /// A list of notes with the notes the user does not have rights to view removed.
        /// </returns>
        private List<TrinityClassLibrary_BL.AdditionalPatientNote> FilterNotes(List<TrinityClassLibrary_BL.AdditionalPatientNote> notes, TrinityClassLibrary_BL.Medic currentUser)
        {
            // Hide notes the user does not have rights to view.
            // No hiding needs to be done for administrators, because they have rights to view everything.
            switch (CurrentMedicSecurityLevel)
            {
                // Medics can only view notes that are marked for "All Users".
                case MedicSecurityLevel.Medic:
                    notes = notes.FindAll(delegate(TrinityClassLibrary_BL.AdditionalPatientNote currentNote)
                    {
                        if (currentNote.SecurityLevel != TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels.AllUsers) return false;
                        return true;
                    });
                    break;

                // Physicians can view all notes not makred as Admin Only.
                case MedicSecurityLevel.Physician:
                    notes = notes.FindAll(delegate(TrinityClassLibrary_BL.AdditionalPatientNote currentNote)
                    {
                        if (currentNote.SecurityLevel == TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels.AdminOnly) return false;
                        return true;
                    });
                    break;
                // Customers can only view notes that are marked for "All Users". 
                case MedicSecurityLevel.Customer :
                    notes = notes.FindAll(delegate(TrinityClassLibrary_BL.AdditionalPatientNote currentNote)
                    {
                        if (currentNote.SecurityLevel != TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels.AllUsers) return false;
                        return true;
                    });
                    break;
                // Handles users that may not have the role securable.
                case MedicSecurityLevel.NONE :
                    notes = notes.FindAll(delegate(TrinityClassLibrary_BL.AdditionalPatientNote currentNote)
                    {
                        if (currentNote.SecurityLevel != TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels.AllUsers) return false;
                        return true;
                    });
                    break;
            }
            return notes;
        } 
        #endregion

#endregion

        #region ShowHideEditButtons
        private void ShowHideEditButtons()
        {
            if (Session["mode"].ToString() == "edit")
            {
                this.button0.Visible = true;
                this.Button1.Visible = true;
                this.Button2.Visible = true;
                this.Button3.Visible = true;
            }
            else
            {
                this.button0.Visible = false;
                this.Button1.Visible = false;
                this.Button2.Visible = false;
                this.Button3.Visible = false;
            }
        }
        #endregion

        #region General Functions

        #region enterData()
        private void enterData()
        {
            // set all of the textarea's to readonly
            txtPhysicalNotes.Visible = false;
            txtImpressionNotes.Visible = false;
            txtRecommendationNotes.Visible = false;
            txtInstructionNotes.Visible = false;
        }
        
        #endregion

        #region LoadTips
        /// <summary>
        /// Adds the tool tip text to the page.
        /// </summary>
        /// <remarks>
        /// Brad Lewis -Created
        /// Latham -Modified 12/13/2007 Commented out all of Brad's code to replace with new code using a new table structure and classes.
        /// Brad's code has been preserved due to the short time before the release, just in case there are problems with the new code. After the
        /// release his commented code can be removed.
        /// </remarks>
        private void LoadTips()
        {
            int programID = Convert.ToInt32(ConfigurationManager.AppSettings["ProgramID"]);
            
            string pageName = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            // Get the tool tip text from data.
            Dictionary<string, TrinityClassLibrary_BL.ToolTip> tips = TrinityClassLibrary_DAL.ToolTipProvider.FetchDictionary(programID, pageName);

            // Add attributes to display the tool tip text.
            tipFollowUpNote.Attributes.Add("onMouseOver", "showTip(this, event, ' " + tips[tipFollowUpNote.ID].ToolTipText + " ');");
            tipInitialNote.Attributes.Add("onMouseOver", "showTip(this, event, ' " + tips[tipInitialNote.ID].ToolTipText + " ');");
            tipPhysicalNote.Attributes.Add("onMouseOver", "showTip(this, event, ' " + tips[tipPhysicalNote.ID].ToolTipText + " ');");
            tipRecommendationNote.Attributes.Add("onMouseOver", "showTip(this, event, ' " + tips[tipRecommendationNote.ID].ToolTipText + " ');");

            //SQLTips tipProvider = new SQLTips();
            //List<Tips> listTips = tipProvider.pullAllTips();

            //Tips oTips = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "PhysicalNoteTip"; });
            //Tips oTips2 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "InitialNoteTip"; });
            //Tips oTips3 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "RecommendNoteTip"; });
            //Tips oTips4 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "FollowUpNoteTip"; });

            //tip1.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips.TipText + " ');");
            //tip2.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips2.TipText + " ');");
            //tip3.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips3.TipText + " ');");
            //tip4.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips4.TipText + " ');");
        }
        #endregion

        protected void rptNotes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Checks viewstate to see if the current user is an Admin.
            if ( CurrentMedicSecurityLevel  == MedicSecurityLevel.Admin )
            {
                // Stores selected Notes ID and sets isEdit to true in Session for use in the AddNote page.
                int noteID = Convert.ToInt32(e.CommandArgument);
                Session["NoteID"] = noteID;
                Session["isEdit"] = true;
                // JavaScript to open the RadWindow.  For some reason it would not work in the OnClientClick event.
                ClientScript.RegisterStartupScript(GetType(), "RadWindow", "<script>window.radopen('AddNote.aspx','winNote')</script>");
            }
            else { ClientScript.RegisterStartupScript(GetType(), "SecurityCheck", "<script>alert('Only Admin users are able to edit additional notes.');</script>"); }
        }


        protected  void RebindNotes(object source, Telerik.WebControls.AjaxRequestEventArgs  e)
        {
            // Get all medic records from data.
            List<TrinityClassLibrary_BL.Medic> allMedics = TrinityClassLibrary_DAL.MedicProvider.FetchList();

            // Get all notes for this encounter that are not marked as deleted.
            List<TrinityClassLibrary_BL.AdditionalPatientNote> notes = TrinityClassLibrary_DAL.AdditionalPatientNoteProvider.FetchList( CurrentPatientEncounter.PatientID, false);

            // Get the user's medic information.
            TrinityClassLibrary_BL.Medic currentUser = allMedics.Find(delegate(TrinityClassLibrary_BL.Medic currentMedic)
            {
                if (currentMedic.MedicID == Convert.ToInt32(Session["MedicPK"])) return true;
                return false;
            });
            //ViewState["CurrentMedicSecurity"] = currentUser.SecurityLevel.Value.ToString();

            // Filters out notes the user does not have rights to view.
            notes = FilterNotes(notes, currentUser);

            // Displays the additional notes at the bottom of the screen.
            DisplayNotes(allMedics, notes, currentUser);

        }
#endregion

        #region Private Classes

        #region AdditionalNoteDisplay
        /// <summary>
        /// Private class created to display the notes to the user.
        /// </summary>
        private class AdditionalNoteDisplay
        {
            #region Constructor
            /// <summary>
            /// Complete constructor. Takes in arguments for all variables.
            /// </summary>
            /// <param name="noteID">
            /// Unique identifer of the note.
            /// </param>
            /// <param name="link">
            /// Hyperlink text to display for the note.
            /// </param>
            /// <param name="notes">
            /// Actual note for the encounter.
            /// </param>
            /// <param name="securityLevel">
            /// Security level of the user who created the note.
            /// </param>
            /// <param name="userSecurityLevel">
            /// Security level of the current user in the patient encounters program.
            /// </param>
            public AdditionalNoteDisplay(string noteID, string link, string notes, TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels? securityLevel,
                MedicSecurityLevel? userSecurityLevel)
            {
                _noteID = noteID;
                _link = link;
                _notes = notes;
                _securityLevel = securityLevel;
                _userSecurityLevel = userSecurityLevel;
            } 
            #endregion

            #region Private Variables
            
            private string _noteID; // Unique identifier of the note.
            private string _link;   // Note information that will display as a hyperlink.
            private string _notes;  // Remainder of note information, including the actual note text.
            TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels? _securityLevel;     // Security level of the user who created the note.
            MedicSecurityLevel? _userSecurityLevel; // Security level of the current user. 

            #endregion

            #region Public Properties

            public string NoteID
            {
                get
                {
                    return _noteID;
                }
            }

            public string Link
            {
                get
                {
                    return _link;
                }
            }

            public string Notes
            {
                get
                {
                    return _notes;
                }
            }

            /// <summary>
            /// The security image to display on the page. This is based on the security level of the user who created the note.
            /// </summary>
            public string SecurityImage
            {
                get
                {
                    switch (_securityLevel)
                    {
                        case TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels.AdminOnly :
                            return "~/Images/Icon_Admin_sm.gif";
                        case TrinityClassLibrary_BL.AdditionalPatientNote.SecurityLevels.AdminAndPhysiciansOnly :
                            return "~/Images/Icon_Physicians_sm.gif";
                        default:
                            return "~/Images/Icon_AllUsers_sm.gif";
                    }
                }
            }

            /// <summary>
            /// Is the security image visible? Security images are only displayed if the user is an administrator.
            /// </summary>
            public bool ImageVisible
            {
                get
                {
                    if (_userSecurityLevel == MedicSecurityLevel.Admin) return true;
                    return false;
                }
            } 

            #endregion
        }
        #endregion 


        #endregion
    }
}
