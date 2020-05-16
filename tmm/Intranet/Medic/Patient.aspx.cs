using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;
using TrinityBLO;
using System.Collections.Generic;
using System.Linq;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for Patient.
	/// </summary>
	public partial class PatientInfo : TMMPage
	{       

        #region protected values

		private InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
        //DataUtility clsData = new DataUtility();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();

        #endregion 
		
        #region Page Load
        /// <summary>
        /// Page load.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <history>
        /// Latham 11/30/2007 Added code to control the visibility of the new new headers that are replacing the old header.
        /// </history>
		protected override void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            Int32 uTypeID = 0;
            using (TMMModel.TMM_DEPLOYEntities oEntities = new TMMModel.TMM_DEPLOYEntities())
            {

                uTypeID = (from u_i in oEntities.UserInfo
                           where u_i.UserSecurity.Username == User.Identity.Name
                           select u_i.UserType.ID).First();
            }
            //If the user is a customer...
            if (uTypeID == Convert.ToInt32(TMMModel.UserType.Types.Customer))
            {
                //set the search page to be the customer home page.
                this.litSearchLink.Text = "<a href='CustomerHome.aspx' class='WhiteMedLnk'>Search</a>";
                this.litSearchLink2.Text = "<a href='CustomerHome.aspx' class='WhiteMedLnk'>Search</a>";
            }
            else
            {
                //set the search page to be the defaultsearch popup.
                this.litSearchLink.Text = "<a href='javascript:openWin();' class='WhiteMedLnk'>Search</a>";
                this.litSearchLink2.Text = "<a href='javascript:openWin();' class='WhiteMedLnk'>Search</a>";
            }
        

            string strEncounterStatus = null;
            string queryPatientID = null;
            if (Request.QueryString["PatientID"] != null)
            {
                // Gets the Patients ID from the PatientNotes page in Service Locator App.
                Session["SearchComplete"] = true;
                queryPatientID = Request.QueryString["PatientID"].ToString();
                Session["PatientID"] = queryPatientID;
                Session.Remove("efPatient");
            }

            System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo("en-us");
            ci.NumberFormat.NumberDecimalDigits = 0;
            ci.NumberFormat.NumberDecimalSeparator = " ";
            ci.NumberFormat.NumberGroupSeparator = "";
            txtAge.Culture = ci;
			EncodeControls();

            TrinityClassLibrary_BL.Patient patient = null;
            TrinityClassLibrary_BL.Rig patientRig = null;

            // Get the patient information from data if it is available.
            if (Session["Patient"] != null)
            {
                patient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
                patientRig = (TrinityClassLibrary_BL.Rig)Session["PatientRig"];

                // Display the patient information to the screen.
                if (patientRig != null) litPatientData.Text = patientRig.Name + ": ";
                litPatientData.Text += patient.LastName + ", " + patient.FirstName + " (" + Convert.ToDateTime(patient.EncounterDate).ToShortDateString() + ")";
            }

			// on change event to the birthdate field to calculate the age
			txtBirthdate.Attributes.Add("onBlur", "calcAge(this.form.elements['txtBirthdate'].value);");

			// get the authenticated username and put it in a session variable
			User authUser = new User(HttpContext.Current.User.Identity.Name);
			string tmpUser = authUser.ReturnUser();

			if (!IsPostBack)
			{
                DataTool dbTool = new DataTool();
                DataTable medicInfo = dbTool.getMedicInfo(tmpUser);
                LoadTips();
				if (medicInfo.Rows.Count > 0)
				{
					Session["MedicID"] = medicInfo.Rows[0]["UserName"].ToString();

					// Storing the Medic's ID here to fix the search page
					// Lancelot 7/7/04
                    Session["MedicPK"] = medicInfo.Rows[0]["MedicID"].ToString();

					// 7/23/2004 Scott
					// if the medic is in the table, but is not assigned to a rig they are considered an admin user
					// this user can see encounters for all rigs
                    if (Convert.IsDBNull(medicInfo.Rows[0]["RigID"]))
					{
						Session["RigID"] = "0";
					}
					else
					{
                        Session["RigID"] = medicInfo.Rows[0]["RigID"].ToString();
					}

					//Logging program use to IntranetLog
					//Latham 05/20/2005
					dbTool.LogUse(System.Convert.ToInt32(Session["MedicPK"]), 5);

                    
				    DataTable dtIncompletes = new DataTable();
					// incomplete sql, if the user has a 0 for their rigid then they can see all encounters
                    Int32 uTypeID2 = 0;
                    using (TMMModel.TMM_DEPLOYEntities oEntities = new TMMModel.TMM_DEPLOYEntities())
                    {
                        uTypeID2 = (from u_i in oEntities.UserInfo
                                   where u_i.UserSecurity.Username == User.Identity.Name
                                   select u_i.UserType.ID).First();
                    }
                    //Check to see if the user is an office user.
                    if (uTypeID2 == Convert.ToInt32(TMMModel.UserType.Types.Office))
                        dtIncompletes = dbTool.getAllIncomplete();
                    else
                        dtIncompletes = dbTool.getRigIncomplete(Session["MedicPK"].ToString());

					// load the drop downlists
                    DataTable dtRigs = dbTool.getRigIDs();
                    //DataTable dtEmployers = dbTool.getEmpolyerIDs();
                    DataTable dtCompanies = dbTool.getCompanyIDs();
                    DataTable dtRigIDs = new DataTable();

                    List<Patients> listPatients = dbTool.getIncompletes() ;
                    cboIncomplete.DataSource = listPatients;
                    Patients p = new Patients();
                    //cboIncomplete.DataTextField; 

					initDropDown_BL(cboIncomplete, dtIncompletes , 1);
					initDropDown_BL(cboRigID, dtRigs , 1);
					//initDropDown_BL(cboEmployer, dtEmployers , 1);
                    populateEmployers();

					initDropDown_BL(cboDrillFor, dtCompanies , 1);

                    if (!string.IsNullOrEmpty(queryPatientID))
                    { 
                        patient = (TrinityClassLibrary_DAL.PatientProvider.Fetch(Convert.ToInt32(queryPatientID)));
                        Session["Patient"] = patient;
                        Session.Remove("efPatient"); 
                        if (patient.RigID.HasValue)
                        {
                            patientRig = TrinityClassLibrary_DAL.RigProvider.Fetch(patient.RigID.Value);
                            Session["PatientRig"] = patientRig;
                        }
                        else
                        {
                            patientRig = null;
                            Session["PatientRig"] = null;
                        }

                        // Display the patient information to the screen.
                        if (patientRig != null) litPatientData.Text = patientRig.Name + ": ";
                        litPatientData.Text += patient.LastName + ", " + patient.FirstName + " (" + Convert.ToDateTime(patient.EncounterDate).ToShortDateString() + ")";
                        
                        // Open the encounter in view or edit mode depending on the encounter status.
                        switch(patient.EncounterStatus)
                        {
                            case "C":   // (C)omplete.
                            case "D":   // (D)iscussion case.
                            case "P":   // (P)ending review.
                            case "R":   // (R)eviewed By Company.
                                strEncounterStatus = "view";
                                break;
                            case "I":   // (I)ncomplete.
                            default:
                                strEncounterStatus = "edit";
                                break;
                        }
                        if (strEncounterStatus == "view") { Session["mode"] = "view"; }
                        else { Session["mode"] = "edit"; }
                    }

					// if there are no incomplete encounters for this rig then do not show this section
					if(cboIncomplete.Items.Count < 2)
						spIncomplete.Visible = false;

					// Shortcut because Lance is a lazy bastard and hates typing all this
					// crap out every time.
					if (Environment.MachineName == "HTX5Y21")
						FillOutControls();
				}
				else
				{
					// redirect to custom error page and send a parameter user=unauthorized
					// display a custom error telling them they have to be assigned to a rig to enter the application
					Response.Redirect("CustError.aspx?user=unauthorized");
				}

			}

            if (Session["Patient"] != null && Convert.ToBoolean(Session["SearchComplete"]))
            {
                if (Session["mode"] != null && Session["mode"].ToString() == "view")
                {
                    cboIncomplete.SelectedIndex = 0;

                    // add the javascript initSpan function to the onload of the body
                    bodyMain.Attributes.Add("onLoad", "initSpan()");

                    // disable the input boxes and show the data from the database
                    enterData();
                    SQLPatient sqlPatient = new SQLPatient();
                    DataTool dbTool = new DataTool();

                    if (patient == null) patient = (TrinityClassLibrary_BL.Patient)Session["Patient"];

                    //TODO: This code may only be grabbing information we already have stored in this variable. We should examine this if
                    //time permits.
                    DataTable dT = dbTool.getPatientInfo(patient.PatientID);
                    Patients Patient = new Patients();
                    sqlPatient.LoadObject(Patient, dT);
                    LoadControls_BL(Patient, Page.Form);

                    // disable the asp.net button
                    btnReset.Visible = false;
                    btnContinue.Visible = false;

                    pnlAddEditHeader.Visible = false;
                    pnlViewHeader.Visible = true;
                }
                else
                {
                    // Control the visibility of the headers to display the add/edit header.
                    pnlViewHeader.Visible = false;
                    pnlAddEditHeader.Visible = true;
                    btnReset.Visible = true;
                    btnContinue.Visible = true;

                    //TODO: This code may only be grabbing information we already have stored in this variable. We should examine this if
                    //time permits.
                    LaunchEditMode(patient.PatientID);
                }

                Session["SearchComplete"] = false;
            }
		}

        #endregion

        #region Private Methods

        #region LoadControls(DataTable tblResults)
        private void LoadControls(DataTable tblResults)
        {
            if (tblResults != null)
            {
                if (tblResults.Rows.Count > 0)
                {
                    spantxtHireDate.InnerText = tblResults.Rows[0][0].ToString();
                    spantxtEncounterDate.InnerText = tblResults.Rows[0][1].ToString();
                    spantxtEncounterTime.InnerText = tblResults.Rows[0][2].ToString();
                    spantxtFirstName.InnerText = tblResults.Rows[0][3].ToString();
                    spantxtLastName.InnerText = tblResults.Rows[0][4].ToString();
                    spantxtMInitial.InnerText = tblResults.Rows[0][5].ToString();
                    spantxtHomePhone.InnerText = tblResults.Rows[0][6].ToString();
                    spantxtAddress.InnerText = tblResults.Rows[0][7].ToString();
                    spantxtCity.InnerText = tblResults.Rows[0][8].ToString();
                    spantxtState.InnerText = tblResults.Rows[0][9].ToString();
                    spantxtZip.InnerText = tblResults.Rows[0][10].ToString();
                    spantxtBirthdate.InnerText = tblResults.Rows[0][11].ToString();
                    spantxtAge.InnerText = tblResults.Rows[0][12].ToString();
                    spantxtSSN.InnerText = tblResults.Rows[0][13].ToString();
                    spancboRigID.InnerText = tblResults.Rows[0][14].ToString();
                    spancboEmployer.InnerText = tblResults.Rows[0][15].ToString();
                    spantxtLocation.InnerText = tblResults.Rows[0][16].ToString();
                    spantxtCountry.InnerText = tblResults.Rows[0][17].ToString();
                    spancboDrillFor.InnerText = tblResults.Rows[0][18].ToString();
                    txtEmployerPhone.InnerText = tblResults.Rows[0][19].ToString();
                    txtEmployerPhoneExt.InnerText = tblResults.Rows[0][20].ToString();
                    txtEmployerEmail.InnerText = tblResults.Rows[0][21].ToString();
                    txtEmployerAddress.InnerText = tblResults.Rows[0][22].ToString();
                    txtEmployerZip.InnerText = tblResults.Rows[0][23].ToString();
                    txtEmployerCity.InnerText = tblResults.Rows[0][24].ToString();
                    txtEmployerState.InnerText = tblResults.Rows[0][25].ToString();
                    spanrdoSex.InnerText = tblResults.Rows[0][26].ToString();
                    spantxtJobTitle.InnerText = tblResults.Rows[0][27].ToString();
                }
            }
            else
            {
                Response.Redirect("CustError.aspx");
            }

        }

        #endregion

        #region LoadControls_BL(Patients pInfo, Control c)
        private void LoadControls_BL(Patients pInfo, Control c)
        {
            if (pInfo != null)
            {
                Type type = pInfo.GetType();
                foreach (Control ctl in c.Controls)
                {
                    if (ctl.ID == null) continue;
                    if (ctl.ID.Contains("span"))
                    {
                        string pName = ctl.ID.Substring(7, ctl.ID.Length - 7);
                        PropertyInfo pi = type.GetProperty(pName);
                        ((System.Web.UI.HtmlControls.HtmlGenericControl)ctl).InnerText = (string)pi.GetValue(pInfo, null).ToString();
                        if (ctl.ID.Contains("spancbo"))
                        {
                            string cName = ctl.ID.Substring(4, ctl.ID.Length - 4);
                            DropDownList ddlCtl = (DropDownList)c.FindControl(cName);
                            ddlCtl.SelectedValue = pi.GetValue(pInfo, null).ToString();
                            ((System.Web.UI.HtmlControls.HtmlGenericControl)ctl).InnerText = ddlCtl.SelectedItem.Text;

                        }
                    }
                    if (ctl.HasControls())
                    {
                        LoadControls_BL(pInfo, ctl);
                        LoadControlsIncomplete_BL(pInfo, ctl);
                    }
                }
                txtEmployerPhone.InnerText = pInfo.EmployerPhone;
                txtEmployerPhoneExt.InnerText = pInfo.EmployerPhoneExt;
                txtEmployerEmail.InnerText = pInfo.EmployerEmail;
                txtEmployerAddress.InnerText = pInfo.EmployerAddress;
                txtEmployerZip.InnerText = pInfo.EmployerZip;
                txtEmployerCity.InnerText = pInfo.EmployerCity;
                txtEmployerState.InnerText = pInfo.EmployerState;
                txtEmployerCountry.InnerText = pInfo.EmployerCountry;
            }
            else
            {
                Response.Redirect("CustError.aspx");
            }
        }

        #endregion

        #region LoadControlsIncomplete(DataTable tblResults)
        private void LoadControlsIncomplete(DataTable tblResults)
        {
            if (tblResults != null)
            {
                if (tblResults.Rows.Count > 0)
                {
                    txtHireDate.Text = tblResults.Rows[0][0].ToString();
                    txtEncounterDate.Text = tblResults.Rows[0][1].ToString();
                    txtEncounterTime.Text = tblResults.Rows[0][2].ToString();
                    txtFirstName.Text = tblResults.Rows[0][3].ToString();
                    txtLastName.Text = tblResults.Rows[0][4].ToString();
                    txtMInitial.Text = tblResults.Rows[0][5].ToString();
                    txtHomePhone.Text = tblResults.Rows[0][6].ToString();
                    txtAddress.Text = tblResults.Rows[0][7].ToString();
                    txtCity.Text = tblResults.Rows[0][8].ToString();
                    txtState.Text = tblResults.Rows[0][9].ToString();
                    txtZip.Text = tblResults.Rows[0][10].ToString();
                    txtBirthdate.Text = tblResults.Rows[0][11].ToString();
                    txtAge.Text = tblResults.Rows[0][12].ToString();
                    txtSSN.Text = tblResults.Rows[0][13].ToString();
                    txtLocation.Text = tblResults.Rows[0][16].ToString();
                    txtCountry.Text = tblResults.Rows[0][17].ToString();
                    txtEmployerPhone.InnerText = tblResults.Rows[0][19].ToString();
                    txtEmployerPhoneExt.InnerText = tblResults.Rows[0][20].ToString();
                    txtEmployerEmail.InnerText = tblResults.Rows[0][21].ToString();
                    txtEmployerAddress.InnerText = tblResults.Rows[0][22].ToString();
                    txtEmployerZip.InnerText = tblResults.Rows[0][23].ToString();
                    txtEmployerCity.InnerText = tblResults.Rows[0][24].ToString();
                    txtEmployerState.InnerText = tblResults.Rows[0][25].ToString();
                    txtJobTitle.Text = tblResults.Rows[0][27].ToString();

                    if (tblResults.Rows[0][28].ToString() != "")
                    {
                        cboRigID.SelectedValue = tblResults.Rows[0][28].ToString();
                    }

                    if (tblResults.Rows[0][26].ToString() != "")
                    {
                        cboEmployer.SelectedValue = tblResults.Rows[0][29].ToString();
                    }

                    if (tblResults.Rows[0][30].ToString() != "")
                    {
                        cboDrillFor.SelectedValue = tblResults.Rows[0][30].ToString();
                    }

                    if (tblResults.Rows[0][26].ToString() != "")
                    {
                        if((tblResults.Rows[0][26].ToString() == "M") || (tblResults.Rows[0][26].ToString() == "F")) rdoSex.SelectedValue = tblResults.Rows[0][26].ToString();
                    }
                }
            }

        } //Obsolete

        #endregion

        #region LoadControlsIncomplete_BL(Patients pInfo, Control c)
        private void LoadControlsIncomplete_BL(Patients pInfo, Control c)
        {
            if (pInfo != null)
            {
                Type type = pInfo.GetType();
                foreach (Control ctl in c.Controls)
                {
                    if (ctl.GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                    {
                        string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                        PropertyInfo pi = type.GetProperty(pName);
                        ((TextBox)ctl).Text = (string)pi.GetValue(pInfo, null);
                    }

                    if (ctl.GetType().ToString() == "Telerik.WebControls.RadNumericTextBox")
                    {
                        string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                        PropertyInfo pi = type.GetProperty(pName);
                        ((Telerik.WebControls.RadNumericTextBox)ctl).Text = (string)pi.GetValue(pInfo, null);
                    }

                    if (ctl.GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                    {
                        string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                        PropertyInfo pi = type.GetProperty(pName);
                        if (pi != null)
                            ((DropDownList)ctl).SelectedValue = pi.GetValue(pInfo, null).ToString();
                    }

                    if (ctl.GetType().ToString() == "System.Web.UI.WebControls.RadioButtonList")
                    {
                        string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                        PropertyInfo pi = type.GetProperty(pName);

                        ListItem selectedRadioButton = ((RadioButtonList)ctl).Items.FindByValue((string)pi.GetValue(pInfo, null).ToString());
                        if (selectedRadioButton != null) ((RadioButtonList)ctl).SelectedValue = (string)pi.GetValue(pInfo, null).ToString();
                    }
                    if (ctl.HasControls())
                    {
                        LoadControlsIncomplete_BL(pInfo, ctl);
                    }
                }
            }
            txtEmployerPhone.InnerText = pInfo.EmployerPhone;
            txtEmployerPhoneExt.InnerText = pInfo.EmployerPhoneExt;
            txtEmployerEmail.InnerText = pInfo.EmployerEmail;
            txtEmployerAddress.InnerText = pInfo.EmployerAddress;
            txtEmployerZip.InnerText = pInfo.EmployerZip;
            txtEmployerCity.InnerText = pInfo.EmployerCity;
            txtEmployerState.InnerText = pInfo.EmployerState;

        } // Done... Tested...

        #endregion

        #region LoadData(int intPatientID, bool Complete)
        private void LoadData(int intPatientID, bool Complete)
        {
            DataTable tblResults;

            if (AppMode)
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
            else
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

            string strProc;

            strProc = "wsGetPatientByID";
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", intPatientID));

            tblResults = clsUtility.ExecuteSP_DataTable(strProc, parameters);

            if (Complete == true)
            {
                LoadControls(tblResults);
            }
            else
            {
                LoadControlsIncomplete(tblResults);
            }
        } // Obsolete...

        #endregion

        #region LoadTips
        /// <summary>
        /// Fills out the toool tip text for the page from data.
        /// </summary>
        /// <remarks>
        /// Created by Brad Lewis on an unknown date.
        /// Latham -Modified 12/13/2007 to use a new database structure and class system. This completely replaced Brad's code, however his code
        /// was left in place just in case we had problems completing this section of code prior to release. His code is al commented out.
        /// </remarks>
        private void LoadTips()
        {
            int programID = Convert.ToInt32(ConfigurationManager.AppSettings["ProgramID"]);
            string pageName = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            // Get the tool tip text from data.
            Dictionary<string, TrinityClassLibrary_BL.ToolTip> tips = TrinityClassLibrary_DAL.ToolTipProvider.FetchDictionary(programID, pageName);

            // Add attributes to display the tool tip text.
            tipBirthDate.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipBirthDate.ID].ToolTipText + " ');");
            tipEncounterDate.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipEncounterDate.ID].ToolTipText + " ');");
            tipHireDate.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipHireDate.ID].ToolTipText + " ');");
            tipHomePhone.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipHomePhone.ID].ToolTipText + " ');");
            tipSsnPassport.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipSsnPassport.ID].ToolTipText + " ');");

            //SQLTips tipProvider = new SQLTips();
            //List<Tips> listTips = tipProvider.pullAllTips();

            //Tips oTips = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "EncounterDate"; });
            //Tips oTips2 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "HireDate"; });
            //Tips oTips3 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "HomePhone"; });
            //Tips oTips4 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "BirthDate"; });
            //Tips oTips5 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "SSN-Passport"; });

            //tip1.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips.TipText + " ');");
            //tip2.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips2.TipText + " ');");
            //tip3.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips3.TipText + " ');");
            //tip4.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips4.TipText + " ');");
            //tip5.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips5.TipText + " ');");
        }
        #endregion

        #region initDropDown(DropDownList dpID, string sql, int showSelect)
        private void initDropDown(DropDownList dpID, string sql, int showSelect)
        {
            if (AppMode)
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
            else
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

            SqlDataReader rsCombo = clsUtility.GetDataReader(sql);

            // if the showSelect flag is 1 then show the [Select] option, otherwise enter a blank option
            if (showSelect > 0)
            {
                // add a null option to each drop down list
                dpID.Items.Add(new ListItem("[Select]", "-1"));
            }
            else
            {
                dpID.Items.Add(new ListItem("", ""));
            }

            // get all of the values and text from the data reader
            while (rsCombo.Read())
            {
                string val1 = rsCombo[0].ToString();
                string val2 = rsCombo[1].ToString();
                dpID.Items.Add(new ListItem(val2, val1));
            }

            // close the reader
            rsCombo.Close();
        }

        #endregion

        #region initDropDown_BL(DropDownList dpID, DataTable dropdownTable, int showSelect)
        private void initDropDown_BL(DropDownList dpID, DataTable dropdownTable, int showSelect)
        {
            // if the showSelect flag is 1 then show the [Select] option, otherwise enter a blank option
            if (showSelect > 0)
            {
                // add a null option to each drop down list
                dpID.Items.Add(new ListItem("[Select]", "-1"));
            }
            else
            {
                dpID.Items.Add(new ListItem("", ""));
            }

            // get all of the values and text from the data reader
            foreach (DataRow dR in dropdownTable.Rows)
            {
                string val1 = dR[0].ToString();
                string val2 = dR[1].ToString();
                dpID.Items.Add(new ListItem(val2, val1));
            }

        } // Done... Tested...

        #endregion

        #region LaunchEditMode
        /// <summary>
        /// Puts the page in edit mode, allowing the patient encounter to be modified.
        /// </summary>
        /// <param name="patientID">
        /// Unique identifier of the patient.
        /// </param>
        /// <remarks>
        /// Latham 11/30/2007: Created from code already in the program. Refactored code 
        /// out of cboIncomplete_SelectedIndexChanged so it would be reusuable.
        /// </remarks>
        private void LaunchEditMode(int patientID)
        {
            // Make sure all the text fields are visible
            makeVisible();

            // add the javascript initSpan function to the onload of the body
            bodyMain.Attributes.Add("onLoad", "showTipLinks()");

            btnContinue.Visible = true;

            Patients Patient = new Patients();
            SQLPatient sqlPatient = new SQLPatient();
            sqlPatient.getPatient(patientID, Patient);
            LoadControlsIncomplete_BL(Patient, Page.Form);

            pnlViewHeader.Visible = false;
            pnlAddEditHeader.Visible = true;
        }
        #endregion

        #region EncodeControls
        private void EncodeControls()
        {
            txtHireDate.Text = HttpUtility.HtmlEncode(txtHireDate.Text);
            txtEncounterDate.Text = HttpUtility.HtmlEncode(txtEncounterDate.Text);
            txtEncounterTime.Text = HttpUtility.HtmlEncode(txtEncounterTime.Text);
            txtFirstName.Text = HttpUtility.HtmlEncode(txtFirstName.Text);
            txtLastName.Text = HttpUtility.HtmlEncode(txtLastName.Text);
            txtMInitial.Text = HttpUtility.HtmlEncode(txtMInitial.Text);
            txtHomePhone.Text = HttpUtility.HtmlEncode(txtHomePhone.Text);
            txtAddress.Text = HttpUtility.HtmlEncode(txtAddress.Text);
            txtCity.Text = HttpUtility.HtmlEncode(txtCity.Text);
            txtState.Text = HttpUtility.HtmlEncode(txtState.Text);
            txtZip.Text = HttpUtility.HtmlEncode(txtZip.Text);
            txtBirthdate.Text = HttpUtility.HtmlEncode(txtBirthdate.Text);
            txtAge.Text = HttpUtility.HtmlEncode(txtAge.Text);
            txtSSN.Text = HttpUtility.HtmlEncode(txtSSN.Text);
            txtLocation.Text = HttpUtility.HtmlEncode(txtLocation.Text);
            txtCountry.Text = HttpUtility.HtmlEncode(txtCountry.Text);
            txtJobTitle.Text = HttpUtility.HtmlEncode(txtJobTitle.Text);
        }

        #endregion

        #region FillOutControls
        private void FillOutControls()
        {
            this.txtFirstName.Text = "Burt";
            this.txtLastName.Text = "Reynolds";
            this.txtBirthdate.Text = "2/24/80";
            this.txtAge.Text = "24";
            this.cboRigID.SelectedIndex = 1;
            this.cboEmployer.SelectedIndex = 1;
            this.txtLocation.Text = "Asscrack, LA";
            this.cboDrillFor.SelectedIndex = 1;
        }

        #endregion

        #region makeVisible
        private void makeVisible()
        {
            txtHireDate.Visible = true;
            spantxtHireDate.Visible = false;

            txtEncounterDate.Visible = true;
            spantxtEncounterDate.Visible = false;

            txtEncounterTime.Visible = true;
            spantxtEncounterTime.Visible = false;

            txtFirstName.Visible = true;
            spantxtFirstName.Visible = false;

            txtLastName.Visible = true;
            spantxtLastName.Visible = false;

            txtMInitial.Visible = true;
            spantxtMInitial.Visible = false;

            txtHomePhone.Visible = true;
            spantxtHomePhone.Visible = false;

            txtAddress.Visible = true;
            spantxtAddress.Visible = false;

            txtCity.Visible = true;
            spantxtCity.Visible = false;

            txtState.Visible = true;
            spantxtState.Visible = false;

            txtZip.Visible = true;
            spantxtZip.Visible = false;

            txtCountry.Visible = true;
            spantxtCountry.Visible = false;

            txtBirthdate.Visible = true;
            spantxtBirthdate.Visible = false;

            txtAge.Visible = true;
            spantxtAge.Visible = false;

            txtSSN.Visible = true;
            spantxtSSN.Visible = false;

            cboRigID.Visible = true;
            spancboRigID.Visible = false;

            cboEmployer.Visible = true;
            spancboEmployer.Visible = false;

            txtLocation.Visible = true;
            spantxtLocation.Visible = false;

            cboDrillFor.Visible = true;
            spancboDrillFor.Visible = false;

            txtJobTitle.Visible = true;
            spantxtJobTitle.Visible = false;

            rdoSex.Visible = true;
            spanrdoSex.Visible = false;
        }

        #endregion

        #region enterData
        private void enterData()
        {
            txtHireDate.Visible = false;
            spantxtHireDate.Visible = true;

            txtEncounterDate.Visible = false;
            spantxtEncounterDate.Visible = true;

            txtEncounterTime.Visible = false;
            spantxtEncounterTime.Visible = true;

            txtFirstName.Visible = false;
            spantxtFirstName.Visible = true;

            txtLastName.Visible = false;
            spantxtLastName.Visible = true;

            txtMInitial.Visible = false;
            spantxtMInitial.Visible = true;

            txtHomePhone.Visible = false;
            spantxtHomePhone.Visible = true;

            txtAddress.Visible = false;
            spantxtAddress.Visible = true;

            txtCity.Visible = false;
            spantxtCity.Visible = true;

            txtState.Visible = false;
            spantxtState.Visible = true;

            txtZip.Visible = false;
            spantxtZip.Visible = true;

            txtCountry.Visible = false;
            spantxtCountry.Visible = true;

            txtBirthdate.Visible = false;
            spantxtBirthdate.Visible = true;

            txtAge.Visible = false;
            spantxtAge.Visible = true;

            txtSSN.Visible = false;
            spantxtSSN.Visible = true;

            cboRigID.Visible = false;
            spancboRigID.Visible = true;

            cboEmployer.Visible = false;
            spancboEmployer.Visible = true;

            txtLocation.Visible = false;
            spantxtLocation.Visible = true;

            cboDrillFor.Visible = false;
            spancboDrillFor.Visible = true;

            txtJobTitle.Visible = false;
            spantxtJobTitle.Visible = true;

            rdoSex.Visible = false;
            spanrdoSex.Visible = true;
        }

        #endregion

        #region ClearEmployer
        private void ClearEmployer()
        {
            txtEmployerPhone.InnerText = "";
            txtEmployerPhoneExt.InnerText = "";
            txtEmployerEmail.InnerText = "";
            txtEmployerAddress.InnerText = "";
            txtEmployerCity.InnerText = "";
            txtEmployerState.InnerText = "";
            txtEmployerZip.InnerText = "";
        }

        #endregion

        #region ClearControls
        private void ClearControls()
        {
            txtHireDate.Text = "";
            txtEncounterDate.Text = "";
            txtEncounterTime.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtMInitial.Text = "";
            txtHomePhone.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZip.Text = "";
            txtBirthdate.Text = "";
            txtAge.Text = "";
            txtSSN.Text = "";
            txtLocation.Text = "";
            txtCountry.Text = "";
            txtEmployerPhone.InnerText = "";
            txtEmployerPhoneExt.InnerText = "";
            txtEmployerEmail.InnerText = "";
            txtEmployerAddress.InnerText = "";
            txtEmployerZip.InnerText = "";
            txtEmployerCity.InnerText = "";
            txtEmployerState.InnerText = "";
            txtJobTitle.Text = "";
            cboRigID.SelectedIndex = 0;
            cboEmployer.SelectedIndex = 0;
            cboDrillFor.SelectedIndex = 0;
        }

        #endregion

        #region populateEmployers
        private void populateEmployers()
        {
            this.cboEmployer.Items.Add(new ListItem("[Select]", "-1"));
            using (TMMModel.TMM_DEPLOYEntities ef = new TMMModel.TMM_DEPLOYEntities())
            {
                var employers = (from cust in ef.Customer
                                 orderby cust.Name 
                                 select cust);
                foreach (TMMModel.Customer cust in employers)
                {
                    cboEmployer.Items.Add(new ListItem(cust.Name, cust.ID.ToString()));
                }                
            }
        }
        #endregion

        #endregion

        #region Page Controls

        #region cboCity_SelectedIndexChanged
        private void cboCity_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //if (AppMode)
            //    clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
            //else
            //    clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

            //string strSQL = "SELECT State as Abbrev, State FROM States INNER JOIN Cities ON States.State = Cities.StateID WHERE Cities.CityID = '" + txtCity.Text + "';";	
            //SqlDataReader rState = clsUtility.GetDataReader(strSQL);
            DataTool dbTool = new DataTool();
            DataTable dtState = dbTool.getStateAbbrev(Int32.Parse(txtCity.Text));
            // select the correct state
            if (dtState.Rows.Count > 0)
            {
                txtState.Text = dtState.Rows[0]["Abbrev"].ToString();

            }
        }
        
        #endregion

        #region cboEmployer_SelectedIndexChanged
        protected void cboEmployer_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (cboEmployer.SelectedIndex > 0)
            {
                //StringBuilder strSQL = new StringBuilder();

                //if (AppMode)
                //    clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
                //else
                //    clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

                //strSQL.AppendFormat("SELECT EmployerPhone, EmployerPhoneExt, EmployerEmail, EmployerAddress, Cities.CityName, States.State, EmployerZip ");
                //strSQL.AppendFormat("FROM Employer INNER JOIN ");
                //strSQL.AppendFormat("  Cities ON Employer.EmployerCityID = Cities.CityID INNER JOIN ");
                //strSQL.AppendFormat("  States ON Cities.StateID = States.State ");
                //strSQL.AppendFormat("WHERE Employer.EmployerID = " + cboEmployer.SelectedValue + ";");

                int employerID = Int32.Parse(cboEmployer.SelectedValue);

                using (TMMModel.TMM_DEPLOYEntities ef = new TMMModel.TMM_DEPLOYEntities())
                {
                    var employer = (from cust in ef.Customer
                                    where cust.ID == employerID
                                    select cust).FirstOrDefault();
                    ef.Phones.Include("PhoneType");
                    employer.Phones.Load();

                    foreach (TMMModel.Phones phone in employer.Phones)
                    {
                        phone.PhoneTypeReference.Load();
                    }
                    
                    txtEmployerPhone.InnerText = (from p in employer.Phones
                                                  where p.Customer == employer && p.PhoneType.ID   == (int) PhoneTypeEnum.Main 
                                                  select p.PhoneNumber).FirstOrDefault ();
                    txtEmployerPhoneExt.InnerText = (from p in employer.Phones
                                                     where p.Customer == employer && p.PhoneType.ID  == (int) PhoneTypeEnum.Main
                                                     select p.PhoneExt).FirstOrDefault ();
                    txtEmployerEmail.InnerText = employer.Email ;
                    txtEmployerAddress.InnerText = employer.Addr1 + ", " + employer.Addr2 ;
                    txtEmployerCity.InnerText = employer.City ;
                    txtEmployerState.InnerText = employer.State ;
                    txtEmployerZip.InnerText = employer.PostalCode ;
                    txtEmployerCountry.InnerText = employer.Country;

                }


                //DataTool dbTool = new DataTool();
                //DataTable dtEmployer = dbTool.getEmployerInfo(Int32.Parse(cboEmployer.SelectedValue));
                //if (dtEmployer.Rows.Count > 0)
                //{
                //    foreach (DataRow drEmployer in dtEmployer.Rows)
                //    {
                //        txtEmployerPhone.InnerText = Convert.ToString(drEmployer[0].ToString());
                //        txtEmployerPhoneExt.InnerText = Convert.ToString(drEmployer[1].ToString());
                //        txtEmployerEmail.InnerText = Convert.ToString(drEmployer[2].ToString());
                //        txtEmployerAddress.InnerText = Convert.ToString(drEmployer[3].ToString());
                //        txtEmployerCity.InnerText = Convert.ToString(drEmployer[4].ToString());
                //        txtEmployerState.InnerText = Convert.ToString(drEmployer[5].ToString());
                //        txtEmployerZip.InnerText = Convert.ToString(drEmployer[6].ToString());
                //    }
                //}
                //SqlDataReader rEmployerData = clsUtility.GetDataReader(strSQL.ToString());
                //if(rEmployerData.HasRows)
                //{
                //    while(rEmployerData.Read())
                //    {
                //        txtEmployerPhone.InnerText = Convert.ToString(rEmployerData[0]);
                //        txtEmployerPhoneExt.InnerText = Convert.ToString(rEmployerData[1]);
                //        txtEmployerEmail.InnerText = Convert.ToString(rEmployerData[2]);
                //        txtEmployerAddress.InnerText = Convert.ToString(rEmployerData[3]);
                //        txtEmployerCity.InnerText = Convert.ToString(rEmployerData[4]);
                //        txtEmployerState.InnerText = Convert.ToString(rEmployerData[5]);
                //        txtEmployerZip.InnerText = Convert.ToString(rEmployerData[6]);
                //    }
                //}
                //rEmployerData.Close();
            }
            else
            {
                ClearEmployer();
            }

        }
        
        #endregion

        #region cboIncomplete_SelectedIndexChanged
        protected void cboIncomplete_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (cboIncomplete.SelectedIndex > 0 && Session["MedicPK"] != null)
            {
                Session["mode"] = "edit";
                
                TrinityClassLibrary_BL.Patient patient = TrinityClassLibrary_DAL.PatientProvider.Fetch(Convert.ToInt32(cboIncomplete.SelectedValue));
                Session["Patient"] = patient;
                Session.Remove("efPatient");

                TrinityClassLibrary_BL.Rig rig = TrinityClassLibrary_DAL.RigProvider.Fetch(Convert.ToInt32(patient.RigID));
                Session["PatientRig"] = rig;

                LaunchEditMode(Int32.Parse(cboIncomplete.SelectedValue.ToString()));

                // Display the patient information to the screen.
                if (rig != null) litPatientData.Text = rig.Name + ": ";
                litPatientData.Text += patient.LastName + ", " + patient.FirstName + " (" + Convert.ToDateTime(patient.EncounterDate).ToShortDateString() + ")";
            }
            else
            {
                if (cboIncomplete.SelectedIndex == 0)
                {
                    ClearControls();
                    return;
                }
                else
                {
                    Response.Redirect("SessionTimedOut.aspx");
                }
            }
        }
        #endregion

        #region btnContinue_Click
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <remarks>
        /// Latham 12/4/2007 Removed code to check the value in the combo box, because this is already placed into session when the
        /// combo box item is selected.
        /// </remarks>
        protected void btnContinue_Click(object sender, System.EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                if (Session["Patient"] == null)
                {
                    Session["Patient"] = new TrinityClassLibrary_BL.Patient();
                    Session.Remove("efPatient");
                }

                EncodeControls();
                Patients newPatient = new Patients();
                //Loop through all the page controls and loading into the Object
                savePatient(newPatient, Page.Form);
                Session["NewPatient"] = newPatient;
                Server.Transfer("save.Patient.aspx", true);
            }
        }
        
        #endregion

        #region savePatient(Patients tmpPat, Control c)
        private void savePatient(Patients tmpPat, Control c)
        {
            Type type = tmpPat.GetType();
            foreach (Control ctl in c.Controls)
            {
                switch (ctl.GetType().ToString())
                {
                    case "System.Web.UI.WebControls.TextBox":
                        if (((TextBox)ctl).Text.Length > 0)
                        {
                            string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                            PropertyInfo pi = type.GetProperty(pName);
                            string input = HttpUtility.HtmlEncode(((TextBox)ctl).Text.Replace("'", "''"));
                            pi.SetValue(tmpPat, input, null);
                        }
                        continue;

                    case "System.Web.UI.WebControls.DropDownList":
                        if (((DropDownList)ctl).SelectedIndex > -1)
                        {
                            string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                            PropertyInfo pi = type.GetProperty(pName);
                            string input = HttpUtility.HtmlEncode(((DropDownList)ctl).SelectedValue);
                            if (pi != null)
                                pi.SetValue(tmpPat, Int32.Parse(input), null);
                        }
                        continue;

                    case "System.Web.UI.WebControls.RadioButtonList":
                        if (((RadioButtonList)ctl).SelectedIndex > -1)
                        {
                            string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                            PropertyInfo pi = type.GetProperty(pName);
                            string input = HttpUtility.HtmlEncode(((RadioButtonList)ctl).SelectedValue);
                            pi.SetValue(tmpPat, input, null);
                        }
                        continue;
                }
                if (ctl.HasControls())
                {
                    savePatient(tmpPat, ctl);
                }
            }
            //return tmpPats;
        }
        
        #endregion

        #region btnEdit_ServerClick
        protected void btnEdit_ServerClick(object sender, System.EventArgs e)
        {
            Response.Redirect("medical.aspx");
        }
        
        #endregion

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearControls();
            ClearEmployer();

            cboIncomplete.SelectedIndex = 0;
            litPatientData.Text = string.Empty;

            if(Session["PatientID"] != null) Session.Remove("PatientID");
            if(Session["Patient"] != null) Session.Remove("Patient");
            if (Session["efPatient"] != null) Session.Remove("efPatient");

        }

        #endregion
	}
}
