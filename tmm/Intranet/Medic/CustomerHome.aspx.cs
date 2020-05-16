using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using TrinityBLO;
using System.Reflection;
using System.Linq;

namespace TrinityMedicalManagement
{
    public partial class CustomerHome : TMMPage 
    {
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
            //this.grdResults.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.grdResults_PageIndexChanged);

        }

        #endregion

        #region Protected


        //InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
        protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();

        #endregion

        #region Private Classes

        #region EncounterResults
        /// <summary>
        /// Created to hold the results of what will be displayed in the encounter search results box. Originally created as a struct but
        /// would not work correctly with the telerik control.
        /// </summary>
        private class EncounterResults
        {
            #region Constructor
            public EncounterResults(int patientID, string patientName, DateTime encounterDate, string ssn, string patientAddress,
                        string homePhone, string rig, string status)
            {
                _patientID = patientID;
                _patientName = patientName;
                _encounterDate = encounterDate;
                _ssn = ssn;
                _patientAddress = patientAddress;
                _homePhone = homePhone;
                _rig = rig;
                _status = status;
            }
            #endregion

            #region Private Variables
            private int _patientID;
            private string _patientName;
            private DateTime _encounterDate;
            private string _ssn;
            private string _patientAddress;
            private string _homePhone;
            private string _rig;
            private string _status;
            #endregion

            #region Public Properties
            public int PatientID
            {
                get
                {
                    return _patientID;
                }
            }

            public string PatientName
            {
                get
                {
                    return _patientName;
                }
            }

            public DateTime EncounterDate
            {
                get
                {
                    return _encounterDate;
                }
            }

            public string SSN
            {
                get
                {
                    return _ssn;
                }
            }

            public string PatientAddress
            {
                get
                {
                    return _patientAddress;
                }
            }

            public string HomePhone
            {
                get
                {
                    return _homePhone;
                }
            }

            public string Rig
            {
                get
                {
                    return _rig;
                }
            }

            public string Status
            {
                get
                {
                    return _status;
                }
            }
            #endregion
        }
        #endregion

        #region NoteResults
        /// <summary>
        /// Used to fill the notes grid and allow for easy sorting through the telerik control.
        /// </summary>
        private class NoteResults
        {
            #region Class Variables

            private int _tempNoteID;
            private string _patientName;
            private string _rig;
            private string _createdBy;
            private DateTime _dateCreated;
            private string _notes;

            #endregion

            #region Public Properties

            public int TempNoteID
            {
                get
                {
                    return _tempNoteID;
                }
            }

            public string PatientName
            {
                get
                {
                    return _patientName;
                }
            }

            public string Rig
            {
                get
                {
                    return _rig;
                }
            }

            public string CreatedBy
            {
                get
                {
                    return _createdBy;
                }
            }

            public DateTime DateCreated
            {
                get
                {
                    return _dateCreated;
                }
            }

            public string Notes
            {
                get
                {
                    return _notes;
                }
            }

            #endregion

            #region Constructors
            public NoteResults(int tempNoteID, string patientName, string rig, string createdBy, DateTime dateCreated, string notes)
            {
                _tempNoteID = tempNoteID;
                _patientName = patientName;
                _rig = rig;
                _createdBy = createdBy;
                _dateCreated = dateCreated;
                _notes = notes;
            }
            #endregion

        }
        #endregion

        #endregion

        #region Page Events

        #region Page Load

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            rdpEncounterEndDate.DateInput.Attributes.Add("onclick", "TogglePopup('" + rdpEncounterEndDate.ClientID + "')");
            rdpEncounterStartDate.DateInput.Attributes.Add("onclick", "TogglePopup('" + rdpEncounterStartDate.ClientID + "')");

            Int32 uTypeID = 0;
            using (TMMModel.TMM_DEPLOYEntities oEntities = new TMMModel.TMM_DEPLOYEntities())
            {
                 uTypeID = (from u_i in oEntities.UserInfo
                                 where u_i.UserSecurity.Username == User.Identity.Name
                                 select u_i.UserType.ID).First();
             }
            //if the usertype is not customer, redirect the user.
            if (uTypeID != Convert.ToInt32(TMMModel.UserType.Types.Customer))
            {
                Response.Redirect("/Login.aspx");
            }
        

            DataTool dbTool = new DataTool();

            //Page.Focus();

            DataTable dtRigs = dbTool.getRigIDs();

            if (!Page.IsPostBack)
            {
                this.rdpEncounterEndDate.SelectedDate = DateTime.Now.Date;
                this.rdpEncounterStartDate.SelectedDate = DateTime.Now.Date.AddDays(-30);

                //Load the drop down list.
                initDropDown_BL(ddlWorksites, dtRigs, 1);

                this.rgEncounterResults.Rebind();
            }
        }

        #endregion

        #region rgEncounterResults_NeedDataSource
        /// <summary>
        /// Fills the encounter results datagrid with the search results.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void rgEncounterResults_NeedDataSource(object source, Telerik.WebControls.GridNeedDataSourceEventArgs e)
        {

            // Get the medic information from session or data.
            //TrinityClassLibrary_BL.Medic medic = GetCurrentMedic();
            
            
            // Get all encounter status records from viewstate or data.
            List<TrinityClassLibrary_BL.EncounterStatus> allEncounterStatus = GetAllEncounterStatus();

            // Get all rigs from viewstate or data.
            List<TrinityClassLibrary_BL.Rig> allRigs = GetAllRigs();

            // Get all of the patient encounters that match the search criteria entered by the user.
            Int32? RigID = null;
            if (this.ddlWorksites.SelectedIndex > 0)
                RigID = Convert.ToInt32(this.ddlWorksites.SelectedItem.Value);
            
            List<TrinityClassLibrary_BL.Patient> patientEncounters = TrinityClassLibrary_DAL.PatientProvider.Search(RigID, txtFName.Text, txtLName.Text, null, null, null, null, null, null, null, null, null, null, null, null, null, this.txtSSN.Text.Trim());

            // Remove patient encounters that medics are not allowed to view.
            //patientEncounters = FilterPatientEncounters(medic, patientEncounters);

            // Add the information to a list to be used as the datasource for gird.
            List<EncounterResults> encounters = new List<EncounterResults>();

            //Get the customer id for the current user.
            Int32 CustID = GetCustomerID();

            //Get the list of rigs for the selected customer.
            List<TMMModel.Customer_Worksite> cwList = GetRigsForCustomer(CustID);

            foreach (TrinityClassLibrary_BL.Patient patient in patientEncounters)
            {
                //If the date pickers have been populated, filter the results by the selected dates.
                Boolean addEncounter = true;

                if (patient.EncounterDate.HasValue && this.rdpEncounterStartDate.SelectedDate.HasValue && addEncounter)
                {
                    addEncounter = (patient.EncounterDate.Value > this.rdpEncounterStartDate.SelectedDate.Value);
                }

                if (patient.EncounterDate.HasValue && this.rdpEncounterEndDate.SelectedDate.HasValue && addEncounter)
                {
                    addEncounter = (patient.EncounterDate.Value < this.rdpEncounterEndDate.SelectedDate.Value);
                }

                if (addEncounter)
                    addEncounter = (patient.RigID.HasValue && isRigAssignedToCustomer(cwList, patient.RigID.Value));

                //If the patient encounter date fallse within the selected range...
                if (addEncounter)
                {
                    

                    // Get the encounter status description.
                    string currentEncounterStatus = GetPatientEncounterStatus(allEncounterStatus, patient);

                    // Get the name of the patient's rig.
                    string currentRig = GetRig(allRigs, patient.RigID);

                    string name = BuildName(patient.FirstName, patient.LastName);

                    string address = BuildPatientAddress(patient);

                    // Create the entry for the list.
                    EncounterResults currentEncounter = new EncounterResults(patient.PatientID, name, Convert.ToDateTime(patient.EncounterDate),
                        patient.SSN, address, patient.HomePhone, currentRig, currentEncounterStatus);

                    encounters.Add(currentEncounter);
                }
            }

            ViewState["EncountersCount"] = encounters.Count;

            rgEncounterResults.DataSource = encounters;
        }
        #endregion

        #region btnSearch2_Click

        protected void btnSearch2_Click(object sender, System.EventArgs e)
        {
            rgEncounterResults.Rebind();

            rgEncounterResults.Visible = true;
            lblRecCnt.Visible = true;
            ClearSessions();
            lblRecCnt.Text = string.Empty;
            //lblRecCnt.Text += ViewState["EncountersCount"].ToString() + " Patient Encounters Found.";
            lblRecCnt.Text += "Patient Encounters on " + GetCustomerName(GetCustomerID()) + " worksites between " + this.rdpEncounterStartDate.SelectedDate.Value.ToShortDateString() + " and " + this.rdpEncounterEndDate.SelectedDate.Value.ToShortDateString();
        }

        #endregion

        #region btnClear_Click
        /// <summary>
        /// Clears the search textboxes and hides the search results.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <remarks>
        /// Latham 12/17/2007 Created.
        /// </remarks>
        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Clear the values in the search textboxes.
            txtFName.Text = String.Empty;
            txtLName.Text = string.Empty;
            txtSSN.Text = String.Empty;
            ddlWorksites.SelectedIndex = 0;
            this.rdpEncounterEndDate.SelectedDate = DateTime.Now.Date;
            this.rdpEncounterStartDate.SelectedDate = DateTime.Now.Date.AddDays(-30);


            // Hide the search results.
            rgEncounterResults.DataSource = null;
            lblRecCnt.Visible = false;
        }
        #endregion

        #region rgEncounterResults_ItemCommand

        protected void rgEncounterResults_ItemCommand(object source, Telerik.WebControls.GridCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string strPatientID;
                strPatientID = e.Item.Cells[2].Text;

                // Get the patient information from data.
                TrinityClassLibrary_BL.Patient patient = TrinityClassLibrary_DAL.PatientProvider.Fetch(Convert.ToInt32(strPatientID));
                Session["Patient"] = patient;

                // Open the encounter in view or edit mode depending on the encounter status.
                switch (patient.EncounterStatus)
                {
                    case "C":                       // Complete.
                    case "D":                       // Discussion case.
                    case "P":                       // Pending review.
                    case "R":                       // Reviewed By Company.
                        Session["mode"] = "view";
                        break;
                    case "I":                       // Incomplete.
                        Session["mode"] = "edit";
                        break;
                    default:
                        break;
                }

                //string strJS;

                // Lets the patient page know we are returning from a search.
                Session["SearchComplete"] = true;

                //TODO: Remove all references of the patientid session variable and replace with uses of the patient session variable.
                //This is being kept until other code is modified.
                Session["PatientID"] = strPatientID;

                // Get the patient's rig information and store it to session.
                TrinityClassLibrary_BL.Rig rig = TrinityClassLibrary_DAL.RigProvider.Fetch(Convert.ToInt32(patient.RigID));
                Session["PatientRig"] = rig;

                // Redirect the parent window to the patient.apsx page.
                //strJS = "<script language='JavaScript'>window.opener.document.forms[0].action='patient.aspx';</script>";
                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "changeURL", strJS);
                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "close", "<script language='JavaScript'>window.opener.document.forms[0].submit(); window.close();</script>");

                Response.Redirect("patient.aspx");
            }
        }

        #endregion

        #endregion

        #region Helper Methods

        #region BuildPatientName
        /// <summary>
        /// Builds a name. If no name information is available, the function returns "Not Available."
        /// </summary>
        /// <param name="firstName">
        /// First name.
        /// </param>
        /// <param name="lastName">
        /// Last name.
        /// </param>
        /// <returns>
        /// A name, last name first. Or "Not Avaialble" if no first or last name is stored in the database.
        /// </returns>
        private string BuildName(string firstName, string lastName)
        {
            string name = string.Empty;

            // Add the last name if one is avialable.
            if (!String.IsNullOrEmpty(lastName)) name += lastName;

            // Check to see if there is a first name.
            if (!String.IsNullOrEmpty(firstName))
            {
                if (String.IsNullOrEmpty(name))
                {
                    // Set the name to the first name if there is no last name.
                    name += firstName;
                }
                else
                {
                    // Add the first name to the last name.
                    name += ", " + firstName;
                }
            }

            // If there are no name values in data, set the name to this default.
            if (String.IsNullOrEmpty(name)) name = "Not Available";

            return name;
        }
        #endregion

        #region BuildPatientAddress
        /// <summary>
        /// Builds an address string from the many parts of the patient address.
        /// </summary>
        /// <param name="patient">
        /// Patient to build address information from.
        /// </param>
        /// <returns>
        /// The address as a string or "Not Available" if there is no address information.
        /// </returns>
        private string BuildPatientAddress(TrinityClassLibrary_BL.Patient patient)
        {
            string address = string.Empty;

            // Add the home address if it is available.
            if (!String.IsNullOrEmpty(patient.HomeAddress)) address += patient.HomeAddress;

            // Add the city if it is available.
            if (!String.IsNullOrEmpty(patient.HomeCity))
            {
                if (String.IsNullOrEmpty(address))
                {
                    address += patient.HomeCity;
                }
                else
                {
                    address += ", " + patient.HomeCity;
                }
            }

            // Add the state if it is available.
            if (!String.IsNullOrEmpty(patient.HomeState))
            {
                if (String.IsNullOrEmpty(address))
                {
                    address += patient.HomeState;
                }
                else
                {
                    address += ", " + patient.HomeState;
                }
            }

            // Add the zip code if it is available.
            if (!String.IsNullOrEmpty(patient.HomeZipCode))
            {
                if (String.IsNullOrEmpty(address))
                {
                    address += patient.HomeZipCode;
                }
                else
                {
                    if (String.IsNullOrEmpty(patient.HomeState))
                    {
                        address += " " + patient.HomeZipCode;
                    }
                    else
                    {
                        address += ", " + patient.HomeZipCode;
                    }
                }
            }

            // Set the address to "Not Available" if none of the address information was available.
            if (String.IsNullOrEmpty(address)) address += "Not Available";

            return address;
        }
        #endregion

        #region GetRig

        private string GetRig(List<TrinityClassLibrary_BL.Rig> allRigs, int? rigID)
        {
            string rigName = string.Empty;
            TrinityClassLibrary_BL.Rig rig = allRigs.Find(delegate(TrinityClassLibrary_BL.Rig currentRig)
            {
                if (currentRig.RigID == rigID) return true;
                return false;
            });

            if (rig != null) rigName = rig.Name;
            return rigName;
        }

        #endregion

        #region GetPatientEncounterStatus

        private string GetPatientEncounterStatus(List<TrinityClassLibrary_BL.EncounterStatus> allEncounterStatus, TrinityClassLibrary_BL.Patient patient)
        {
            string currentEncounterStatus = string.Empty;
            TrinityClassLibrary_BL.EncounterStatus status = allEncounterStatus.Find(delegate(TrinityClassLibrary_BL.EncounterStatus currentStatus)
            {
                if (patient.EncounterStatus == currentStatus.EncounterStatusID) return true;
                return false;
            });

            if (status != null) currentEncounterStatus = status.Description;
            return currentEncounterStatus;
        }

        #endregion

        #region FilterPatientEncounters
        /// <summary>
        /// Removes patient encounters the medic does not have rights to see. A medic can only see patient encounters where they were the medic
        /// and encounters on their current rig.
        /// </summary>
        /// <param name="medic">
        /// The medic's information.
        /// </param>
        /// <param name="patientEncounters">
        /// A list of patient encounters that have returned in the medic's search.
        /// </param>
        /// <returns>
        /// A list of patient encounters.
        /// </returns>
        private static List<TrinityClassLibrary_BL.Patient> FilterPatientEncounters(TrinityClassLibrary_BL.Medic medic, List<TrinityClassLibrary_BL.Patient> patientEncounters)
        {
            // If the user is a medic the results must be narrowed down to on patient encounters on their current rig or where they
            // are the medic for the encounter.
            if (medic.SecurityLevel == TrinityClassLibrary_BL.Medic.MedicSecurityLevel.Medic)
            {
                patientEncounters = patientEncounters.FindAll(delegate(TrinityClassLibrary_BL.Patient patient)
                {
                    if ((patient.RigID == medic.RigID) || (patient.MedicID == medic.MedicID))
                    {
                        return true;
                    }
                    return false;
                });
            }
            return patientEncounters;
        }
        #endregion

        #region GetAllRigs()
        /// <summary>
        /// Gets all rig information from viewstate or data.
        /// </summary>
        /// <returns>
        /// A list of all rigs.
        /// </returns>
        private List<TrinityClassLibrary_BL.Rig> GetAllRigs()
        {
            List<TrinityClassLibrary_BL.Rig> allRigs;
            if (ViewState["Rigs"] == null)
            {
                allRigs = TrinityClassLibrary_DAL.RigProvider.FetchList();
                ViewState["Rigs"] = allRigs;
            }
            else
            {
                allRigs = (List<TrinityClassLibrary_BL.Rig>)ViewState["Rigs"];
            }
            return allRigs;
        }
        #endregion

        #region GetAllEncounterStatus()
        /// <summary>
        /// Gets a list of all encounters status from viewstate or data.
        /// </summary>
        /// <returns>
        /// A list of encounter statuses.
        /// </returns>
        private List<TrinityClassLibrary_BL.EncounterStatus> GetAllEncounterStatus()
        {
            List<TrinityClassLibrary_BL.EncounterStatus> allEncounterStatus;
            if (ViewState["EncounterStatus"] == null)
            {
                allEncounterStatus = TrinityClassLibrary_DAL.EncounterStatusProvider.FetchList();
                ViewState["EncounterStatus"] = allEncounterStatus;
            }
            else
            {
                allEncounterStatus = (List<TrinityClassLibrary_BL.EncounterStatus>)ViewState["EncounterStatus"];
            }
            return allEncounterStatus;
        }
        #endregion

        #region TrinityClassLibrary_BL

        private TrinityClassLibrary_BL.Medic GetCurrentMedic()
        {
            TrinityClassLibrary_BL.Medic medic;
            if (Session["Medic"] == null)
            {
                medic = TrinityClassLibrary_DAL.MedicProvider.Fetch(Convert.ToInt32(Session["MedicPK"]));
                Session["Medic"] = medic;
            }
            else
            {
                medic = (TrinityClassLibrary_BL.Medic)Session["Medic"];
            }
            return medic;
            }

        #endregion

        #region initDropDown_BL
        private void initDropDown_BL(DropDownList dpID, DataTable dropdownTable, int showSelect)
        {
            // if the showSelect flag is 1 then show the [Select] option, otherwise enter a blank option
            if (showSelect > 0)
            {
                // add a null option to each drop down list
                dpID.Items.Add(new ListItem("All", "-1"));
            }
            else
            {
                dpID.Items.Add(new ListItem("", ""));
            }

            //Get the customer id for the current user.
            Int32 CustID = GetCustomerID();

            //Get the list of rigs for the selected customer.
            List<TMMModel.Customer_Worksite> cwList = GetRigsForCustomer(CustID);

            // get all of the values and text from the data reader
            foreach (DataRow dR in dropdownTable.Rows)
            {
                if (isRigAssignedToCustomer(cwList, Convert.ToInt32(dR[0].ToString())))
                {
                    string val1 = dR[0].ToString();
                    string val2 = dR[1].ToString();
                    dpID.Items.Add(new ListItem(val2, val1));
                }
            }

        } // Done... Tested...

        #endregion

        #region isRigAssignedToCustomer

        /// <summary>
        /// Returns true if the rig is assigned to the current customer.
        /// </summary>
        /// <param name="cwList"></param>
        /// <param name="RigID"></param>
        /// <returns></returns>
        private Boolean isRigAssignedToCustomer(List<TMMModel.Customer_Worksite> cwList, Int32 RigID)
        {

            foreach (TMMModel.Customer_Worksite cw in cwList)
            {
                if (cw.RigID == RigID)
                    return true;
            }
            return false;
        }

        #endregion

        #region GetRigsForCustomer

        /// <summary>
        /// Returns a list of worksites for a customer based on the customerid.
        /// </summary>
        /// <param name="CustomerID"></param>
        /// <returns></returns>
        private List<TMMModel.Customer_Worksite> GetRigsForCustomer(Int32 CustomerID)
        {
            List<TMMModel.Customer_Worksite> cList = new List<TMMModel.Customer_Worksite>();

            using (TMMModel.TMM_DEPLOYEntities oEntities = new TMMModel.TMM_DEPLOYEntities())
            {
                var customer_worksites = (from c_w in oEntities.Customer_Worksite
                                          where c_w.CustomerID == CustomerID && c_w.Active
                                          select c_w);
                cList.AddRange(customer_worksites);
            }
            return cList;

        }

        #endregion

        #region GetCustomerID

        /// <summary>
        /// Gets the Customer ID based on information retrieved from the login information.
        /// </summary>
        /// <returns></returns>
        private Int32 GetCustomerID()
        {

            using (TMMModel.TMM_DEPLOYEntities oEntities = new TMMModel.TMM_DEPLOYEntities())
            {
                //Use the username to get the user id.
                 Int32 UID = (from U_I in oEntities.UserSecurity
                              where U_I.Username == User.Identity.Name
                             select U_I).First().UserID;

                //Use the user id to get that user's customer id.
                 Int32 CustomerID = (from u_i in oEntities.UserInfo
                                     where u_i.ID == UID
                                     select u_i).First().CustomerID.Value;

                //return the customer id.
                 return CustomerID;
            }
        }

        #endregion

        #region GetCustomerName

        /// <summary>
        /// Gets the Customers name by the customer id.
        /// </summary>
        /// <param name="CustomerID"></param>
        /// <returns></returns>
        private string GetCustomerName(Int32 CustomerID)
        {
            using (TMMModel.TMM_DEPLOYEntities oEntities = new TMMModel.TMM_DEPLOYEntities())
            {
                return (from c in oEntities.Customer
                                where c.ID == CustomerID
                                select c).First().Name;
            }
        }

        #endregion

        #endregion


    }
}
