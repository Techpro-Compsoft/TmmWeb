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
using System.Collections.Generic;
using System.Configuration;
using System.Reflection;
using TrinityBLO;
using System.Text.RegularExpressions;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for Medical.
	/// </summary>
	public partial class Medical : TMMPage
	{

#region Protected

		protected System.Web.UI.WebControls.CheckBox CheckBox2;
		protected System.Web.UI.WebControls.CheckBox CheckBox3;
		protected System.Web.UI.WebControls.CheckBox CHECKBOX5;
		protected System.Web.UI.WebControls.CheckBox CHECKBOX4;
		protected System.Web.UI.HtmlControls.HtmlTableCell TD1;
		protected System.Web.UI.HtmlControls.HtmlTableCell TD2;

		InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();
#endregion
		
#region Page Load
        
		protected override void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);

            Session["SearchComplete"] = true;

			// make sure the session is valid
			if(Session["MedicPK"] == null)
			{
				Response.Redirect("SessionTimedOut.aspx");
			}
			if(!IsPostBack)
			{
				DataUtility clsData = new DataUtility();
                DataTool dbTool = new DataTool();
                LoadTips();
                btnMedAdd.Attributes.Add("onClick", "btnMedAdd_click");
                cboMedic.Items.Add(new ListItem("[Select]", "-1"));

                foreach (TMMModel.UserInfo ui in GetAllMedics())
                {
                    cboMedic.Items.Add(new ListItem(ui.LastName + ", " + ui.FirstName , ui.ID.ToString()));
                }
                //Fills in Medication and VitalSigns Table
                setupGrid();

                // Get the patient information from data.
                // We are getting the session and rig information from data again because the save may have been for a new patient record
                // and if so the patient in session will be incorrect because it does not contain the correct primary key. This can be
                // corrected later if this application is every moved to using a single method of data access.
                TrinityClassLibrary_BL.Patient patient = TrinityClassLibrary_DAL.PatientProvider.Fetch(Convert.ToInt32(Session["PatientID"]));
                Session.Remove("efPatient");
                
                // Get the patient's rig information from data.
                TrinityClassLibrary_BL.Rig rig = null;
                if (patient.RigID.HasValue) rig = TrinityClassLibrary_DAL.RigProvider.Fetch(patient.RigID.Value);
                Session["PatientRig"] = rig;
                
                // Display the patient information to the screen.
                if (rig != null) litPatientData.Text = rig.Name + ": ";
                litPatientData.Text += patient.LastName + ", " + patient.FirstName + " (" + Convert.ToDateTime(patient.EncounterDate).ToShortDateString() + ")";

                if (Session["mode"] != null)
                {
                    if (Session["mode"].ToString() == "view")
                    {
                        btnReset.Visible = false;
                        btnContinue.Visible = false;

                        bodyMain.Attributes.Add("onLoad", "initSpan()");

                        enterData();
                        SQLMedicalInfo sqlMedicalInfo = new SQLMedicalInfo();
                        MedicalInfo mInfo = new MedicalInfo();
                        sqlMedicalInfo.getMedicalInfo(Int32.Parse(Session["PatientID"].ToString()),mInfo );
                        clsData.doIncompletes_BL(mInfo, Page);

                        pnlAddEditHeader.Visible = false;
                        pnlViewHeader.Visible = true;
                        pnlMeds.Visible = false;
                        pnlVitals.Visible = false;
                    }
                    else if (Session["mode"].ToString() == "edit")
                    {
                        SQLMedicalInfo sqlMedicalInfo = new SQLMedicalInfo();
                        MedicalInfo mInfo = new MedicalInfo();
                        sqlMedicalInfo.getMedicalInfo(Int32.Parse(Session["PatientID"].ToString()),mInfo );

                        clsData.doIncompletes_BL(mInfo, Page);

                        pnlAddEditHeader.Visible = true;
                        pnlViewHeader.Visible = false;
                        pnlMeds.Visible = true;
                        pnlVitals.Visible = true;
                    }
                }
                else
                {
                    btnMedAdd.Attributes.Add("onClick", "btnMedAdd_click");

                    //initDropDown_BL(cboMedic, dbTool.getAllMedics(), 1);
                    setupGrid();
                    SQLMedicalInfo sqlMedicalInfo = new SQLMedicalInfo();
                    MedicalInfo mInfo = new MedicalInfo();
                    sqlMedicalInfo.getMedicalInfo(Int32.Parse(Session["PatientID"].ToString()),mInfo);
                    clsData.doIncompletes_BL(mInfo, Page);
                    pnlMeds.Visible = true;
                    pnlVitals.Visible = true;
                    
                }
			}
            //Build Allergy Table
			initTable_BL();
            //Fills in Medication and VitalSigns Table
			// Shortcut because Lance is a lazy bastard and hates typing all this
			// crap out every time.
			if (Environment.MachineName == "HTX5Y21")
				FillOutControls();
		}


#endregion

#region General Functions

        #region LoadTips
        /// <summary>
        /// Fills out the tool tip text for the page.
        /// </summary>
        /// <remarks>
        /// Brad Lewis -Created on Date Unknown
        /// Latham -Modified 12/13/2007 Commented out all of Brad's code to use new table structure and classes. Preserved Brad's code in case
        /// there are problems with this code and we need to roll back prior to the release. Once this code is in production Brad's code can
        /// be removed.
        /// Upon testing, I had a string initial result. The span tags where the tips come from were populated with the same data as the field
        /// they were next to, instead of simply showing a question mark (?). When I researched the problem, I found that the code used to
        /// populate the page stripped the first three characters off of the control name, and of the control name then matched a string it
        /// had data for, the item was populated with the text. The problem occured because I named the tip spans with the exact same name as the
        /// controls when you removed the first three letters of both. To get around this I added the number one (1) to the end of each span id.
        /// </remarks>
        private void LoadTips()
        {
            int programID = Convert.ToInt32(ConfigurationManager.AppSettings["ProgramID"]);
            string pageName = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            // Get the tool tip text from data.
            Dictionary<string, TrinityClassLibrary_BL.ToolTip> tips = TrinityClassLibrary_DAL.ToolTipProvider.FetchDictionary(programID, pageName);

            // Add attributes to display the tool tip text.
            tipArrivalDate1.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipArrivalDate1.ID].ToolTipText + " ');");
            tipArrivalTime1.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipArrivalTime1.ID].ToolTipText + " ');");
            tipConsultDate1.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipConsultDate1.ID].ToolTipText + " ');");
            tipConsultTime1.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipConsultTime1.ID].ToolTipText + " ');");
            tipDepartureDate1.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipDepartureDate1.ID].ToolTipText + " ');");
            tipDepartureTime1.Attributes.Add("onmouseover", "showTip(this, event, ' " + tips[tipDepartureTime1.ID].ToolTipText + " ');");

            //SQLTips tipProvider = new SQLTips();
            //List<Tips> listTips = tipProvider.pullAllTips();

            //Tips oTips = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "ConsultDate"; });
            //Tips oTips2 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "ConsultTime"; });
            //Tips oTips3 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "DepartureDate"; });
            //Tips oTips4 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "DepartureTime"; });
            //Tips oTips5 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "ArrivalDate"; });
            //Tips oTips6 = listTips.Find(delegate(Tips tmpTip) { return tmpTip.Description == "ArrivalTime"; });

            //tip1.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips.TipText + " ');");
            //tip2.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips2.TipText + " ');");
            //tip3.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips3.TipText + " ');");
            //tip4.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips4.TipText + " ');");
            //tip5.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips5.TipText + " ');");
            //tip6.Attributes.Add("onmouseover", "showTip(this, event, ' " + oTips6.TipText + " ');");

        }
        #endregion

        #region initTable_BL()
        private void initTable_BL()
        {

            DataTool dbTool = new DataTool();
            DataTable dtAllergy = dbTool.getAllergy(Int32.Parse(Session["PatientID"].ToString()));
            int rCnt = dtAllergy.Rows.Count;
            for (int j = 0; j < rCnt; j++)
            {
                TableRow r = new TableRow();
                for (int i = 0; i < 4; i++)
                {
                    if (j == rCnt) break;
                    DataRow drAllergy = dtAllergy.Rows[j];
                    TableCell c = new TableCell();

                    if (c.HasControls()) c.Controls.Clear();
                    HtmlInputCheckBox chk = new HtmlInputCheckBox();
                    chk.Value = drAllergy["AllergyID"].ToString();
                    chk.ID = "chkAllergy" + drAllergy["AllergyID"].ToString();

                    if (Session["mode"] != null)
                    {
                        if (Session["mode"].ToString() == "view") chk.Disabled = true;
                        if (!Convert.IsDBNull(drAllergy["PAllergy"]))
                            chk.Checked = true;
                        else
                            chk.Checked = false;
                    }

                    c.Controls.Add(chk);
                    c.Width = System.Web.UI.WebControls.Unit.Percentage(25);
                    c.Controls.Add(new LiteralControl("&nbsp;" + drAllergy["AllergyName"].ToString()));
                    r.Cells.Add(c);
                    j++;
                }
                tblAll.Rows.Add(r);
            }

        }
        
        #endregion

        #region setupGrid()
        private void setupGrid()
        {

            DataTool dbTool = new DataTool();
            DataTable dtMedications = dbTool.getMedications(Int32.Parse(Session["PatientID"].ToString()));
            initGrid_BL(dgMeds, dtMedications, "MedicationID");
            //List<Medications> lMedications = new List<Medications>();
            //SQLMedications sqlMedication = new SQLMedications();
            //dgMeds.DataSource = sqlMedication.getAllMedications(Int32.Parse(Session["PatientID"].ToString()));
            //dgMeds.DataBind();
            DataTable dtVitals = dbTool.getVitals(Int32.Parse(Session["PatientID"].ToString()));
            initGrid_BL(dgVitals, dtVitals, "VitalSignID");

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

        #region enterData()
        private void enterData()
        {
            txtConsultDate.Visible = false;
            txtConsultTime.Visible = false;
            chkMedicalConsult.Visible = false;
            cboMedic.Visible = false;
            txtTransport.Visible = false;
            txtDepartDate.Visible = false;
            txtDepartTime.Visible = false;
            txtHospital.Visible = false;
            txtArrivalDate.Visible = false;
            txtArrivalTime.Visible = false;
            txtComplaint.Visible = false;
            txtPatientHistory.Visible = false;
            txtWitness.Visible = false;
            txtPABATTime.Visible = false;
            txtResults.Visible = false;
        }
        
        #endregion

        #region FillOutControls()
        private void FillOutControls()
        {
            this.txtConsultDate.Text = DateTime.Now.ToShortDateString();
            this.txtConsultTime.Text = "1040";
            this.txtComplaint.Text = "Hemorroids";
            this.txtPatientHistory.Text = "Stuff";
        }
        
        #endregion

#endregion

#region User Controls

#region Button Events

        #region btnMedAdd_Click(object sender, System.EventArgs e)
        protected void btnMedAdd_Click(object sender, System.EventArgs e)
        {
            if (Session["PatientID"] != null)
            {
                Page.Validate("Medications");
                if (Page.IsValid)
                {
                    DataTool dbTool = new DataTool();

                    dbTool.NewMedication(Int32.Parse(Session["PatientID"].ToString()), Medication.Text.ToString().Replace("'", "''"), float.Parse(Dosage.Text), DosageDrop.SelectedValue);
                    // refresh the lists
                    setupGrid();
                    Medication.Text = "";
                    Dosage.Text = "";
                    DosageDrop.SelectedIndex = -1;
                }
                else
                {
                    ValidationSummary1.ValidationGroup = "Medications";
                    setupGrid();
                }
            }
            else
            {
                Server.Transfer("SessionTimedOut.aspx");
            }
        } // Done... Tested
        
        #endregion

        #region btnContinue_Click(object sender, System.EventArgs e)
        protected void btnContinue_Click(object sender, System.EventArgs e)
        {
            Page.Validate("PageSubmit");
            if (Page.IsValid)
            {
                MedicalInfo newMedical = new MedicalInfo();
                Type type = newMedical.GetType();

                foreach (Control ctl in Page.Form.Controls)
                {
                    string pName;

                    if (ctl.ID != null)
                        pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                    else
                        continue;
                    switch (ctl.GetType().ToString())
                    {
                        case "System.Web.UI.WebControls.TextBox":
                            if (((TextBox)ctl).Text.Length > 0 && type.GetProperty(pName) != null)
                            {
                                PropertyInfo pi = type.GetProperty(pName);
                                string input = HttpUtility.HtmlEncode(((TextBox)ctl).Text.Replace("'", "''"));
                                pi.SetValue(newMedical, input, null);
                            }
                            continue;

                        case "System.Web.UI.WebControls.DropDownList":
                            if (((DropDownList)ctl).SelectedIndex > -1 && type.GetProperty(pName) != null)
                            {
                                PropertyInfo pi = type.GetProperty(pName);
                                string input = HttpUtility.HtmlEncode(((DropDownList)ctl).SelectedValue);
                                pi.SetValue(newMedical, Int32.Parse(input), null);
                            }
                            continue;

                        case "System.Web.UI.WebControls.RadioButtonList":
                            if (((RadioButtonList)ctl).SelectedIndex > -1 && type.GetProperty(pName) != null)
                            {
                                PropertyInfo pi = type.GetProperty(pName);
                                string input = HttpUtility.HtmlEncode(((RadioButtonList)ctl).SelectedValue);
                                pi.SetValue(newMedical, input, null);
                            }
                            continue;
                    }

                }
                Session["newMedical"] = newMedical;
                Server.Transfer("save.Medical.aspx");
            }
            else
            {
                ValidationSummary1.ValidationGroup = "PageSubmit";
                setupGrid();
            }
        }
        
        #endregion

        #region btnVitalAdd_Click(object sender, System.EventArgs e)
        protected void btnVitalAdd_Click(object sender, System.EventArgs e)
        {
            if (Session["PatientID"] != null)
            {
                Page.Validate("Vitals");
                if (Page.IsValid)
                {
                    DataTool dbTool = new DataTool();

                    dbTool.newVitals(Int32.Parse(Session["PatientID"].ToString()), Time.Text, BloodPressure.Text.ToString().Replace("'", "''"), Pulse.Text.ToString().Replace("'", "''"), Resp.Text.ToString().Replace("'", "''"), Temp.Text.ToString().Replace("'", "''"), TraumaScore.Text.ToString().Replace("'", "''"));

                    // refresh the lists
                    setupGrid();
                }
                else
                {
                    ValidationSummary1.ValidationGroup = "Vitals";
                    setupGrid();
                }
            }
            else
            {
                Server.Transfer("SessionTimedOut.aspx");
            }
        } // Done...Tested
        
        #endregion

#endregion

#region Datagrid Events

        #region initGrid(DataGrid dgGrid, string strSQL, string pKey)
        private void initGrid(DataGrid dgGrid, string strSQL, string pKey)
        {
            if (AppMode)
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
            else
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

            SqlDataReader rData = clsUtility.GetDataReader(strSQL);

            // set the grid's visible property to false to initialize the control
            dgGrid.Visible = false;

            int i;
            if (rData.HasRows)
            {
                dgGrid.Visible = true;
                for (i = 0; i < rData.FieldCount; i++)
                {
                    BoundColumn objBC = new BoundColumn();
                    objBC.DataField = rData.GetName(i).ToString();
                    objBC.HeaderText = rData.GetName(i).ToString();

                    // use this function to make the primary key of the table hidden
                    if (rData.GetName(i).ToString() == pKey)
                    {
                        objBC.Visible = false;
                    }
                    dgGrid.Columns.Add(objBC);
                }
                dgGrid.DataSource = rData;
                dgGrid.DataBind();
                rData.Close();
            }
            else
            {
                if (pKey == "MedicationID") MedHdr.Visible = false;
                if (pKey == "VitalSignID") VitalHdr.Visible = false;
            }

            // if in view mode then remove the Action column
            if (Session["mode"] != null && Session["mode"].ToString() == "view")
            {
                dgGrid.Columns[0].Visible = false; ;
            }

            // cleanup
            rData.Close();
        }
        
        #endregion     

        #region initGrid_BL(DataGrid dgGrid, DataTable dtGrid, string pKey)
        private void initGrid_BL(DataGrid dgGrid, DataTable dtGrid, string pKey)
        {

            // set the grid's visible property to false to initialize the control
            dgGrid.Visible = false;

            int i;

            if (dtGrid.Rows.Count > 0)
            {
                dgGrid.Visible = true;

                for (i = 0; i < dtGrid.Columns.Count; i++)
                {
                    BoundColumn objBC = new BoundColumn();

                    objBC.DataField = dtGrid.Columns[i].ColumnName;
                    objBC.HeaderText = dtGrid.Columns[i].ColumnName;

                    // use this function to make the primary key of the table hidden
                    if (dtGrid.Columns[i].ColumnName == pKey)
                    {
                        objBC.Visible = false;
                    }
                    dgGrid.Columns.Add(objBC);
                }
                dgGrid.DataSource = dtGrid;
                dgGrid.DataBind();

            }
            else
            {
                if (pKey == "MedicationID") MedHdr.Visible = false;
                if (pKey == "VitalSignID") VitalHdr.Visible = false;
            }

            // if in view mode then remove the Action column
            if (Session["mode"] != null && Session["mode"].ToString() == "view")
            {
                dgGrid.Columns[0].Visible = false; ;
            }

            // cleanup

        }
        
        #endregion

        #region dgMeds_Delete(object sender, DataGridCommandEventArgs e)
        public void dgMeds_Delete(object sender, DataGridCommandEventArgs e)
        {
            DataTool dbTool = new DataTool();

            string SelectedRowID = dgMeds.DataKeys[e.Item.ItemIndex].ToString();

            dbTool.deleteMedication(Int32.Parse(Session["PatientID"].ToString()), Int32.Parse(SelectedRowID));
            //string strSQL = "DELETE FROM PatientMedication WHERE MedicationID = " + SelectedRowID + " AND PatientID = " + Session["PatientID"] + ";";
            //clsUtility.ExecuteSQL(strSQL);

            // refresh the lists
            setupGrid();
        } //Done...  Tested
        
        #endregion

        #region dgVitals_Delete(object sender, DataGridCommandEventArgs e)
        public void dgVitals_Delete(object sender, DataGridCommandEventArgs e)
        {
            DataTool dbTool = new DataTool();

            string SelectedRowID = dgVitals.DataKeys[e.Item.ItemIndex].ToString();
            //Response.Write("<script>alert('" + SelectedRowID + "');</script>");
            dbTool.deleteVitals(Int32.Parse(Session["PatientID"].ToString()), Int32.Parse(SelectedRowID.ToString()));

            //string strSQL = "DELETE FROM PatientVitalSigns WHERE VitalSignID = " + SelectedRowID + " AND PatientID = " + Session["PatientID"] + ";";
            //clsUtility.ExecuteSQL(strSQL);

            // refresh the lists
            setupGrid();
        } //Done... Tested
        
        #endregion

#endregion

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

        protected void cvDosage_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "")
            {
                int result;
                args.IsValid = int.TryParse(args.Value.ToString(), out result);
                if (!args.IsValid) { this.cvDosage.ErrorMessage = "You must enter a numeric value for dosage."; }
            }
            else { args.IsValid = false; this.cvDosage.ErrorMessage = "You must enter a dosage."; }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.Session.RemoveAll();
            this.txtArrivalDate.Text = null;
            this.txtArrivalTime.Text = null;
            this.txtComplaint.Text = null;
            this.txtConsultDate.Text = null;
            this.txtConsultTime.Text = null;
            this.txtDepartDate.Text = null;
            this.txtDepartTime.Text = null;
            this.txtHospital.Text = null;
            this.txtPABATTime.Text = null;
            this.txtPatientHistory.Text = null;
            this.txtResults.Text = null;
            this.txtTransport.Text = null;
            this.txtWitness.Text = null;
            Response.Redirect("~/Patient.aspx");
        }
    }
}
