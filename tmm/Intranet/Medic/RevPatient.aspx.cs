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


namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for Patient.
	/// </summary>
	public partial class Patient_Info : TMMPage
	{

#region protected values


		private InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
        //DataUtility clsData = new DataUtility();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();
		#endregion 
		
#region Page Load



		protected override void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);

			EncodeControls();
			// check if the query string has any values, if so set the session variables accordingly
			if(cboIncomplete.SelectedValue.Length < 1 && Convert.ToBoolean(Request.QueryString.Count))
			{ 
				if(Request.QueryString["pKey"] != null)
					Session["PatientID"] = Request.QueryString["pKey"].ToString();
				if(Request.QueryString["mode"] != null)
					Session["mode"] = Request.QueryString["mode"].ToString();
			}

			// on change event to the birthdate field to calculate the age
			txtBirthdate.Attributes.Add("onBlur", "calcAge(this.form.elements['txtBirthdate'].value);");
			lblSSN.ToolTip = "Social Security #: 123-45-6789\nPassport #: 12345678";
			txtSSN.ToolTip = "Social Security #: 123-45-6789\nPassport #: 12345678";

			// get the authenticated username and put it in a session variable
			User authUser = new User(HttpContext.Current.User.Identity.Name);
			string tmpUser = authUser.ReturnUser();

			if (!IsPostBack)
			{
                DataTool dbTool = new DataTool();
                DataTable medicInfo = dbTool.getMedicInfo(tmpUser);
			
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
                    if (Session["RigID"].ToString() == "0")
                        dtIncompletes = dbTool.getAllIncomplete();
                    else
                        dtIncompletes = dbTool.getRigIncomplete(Session["MedicPK"].ToString());

					// load the drop downlists
                    DataTable dtRigs = dbTool.getRigIDs();
                    DataTable dtEmployers = dbTool.getEmpolyerIDs();
                    DataTable dtCompanies = dbTool.getCompanyIDs();
                    DataTable dtRigIDs = new DataTable();

					initDropDown_BL(cboIncomplete, dtIncompletes , 1);
					initDropDown_BL(cboRigID, dtRigs , 1);
					initDropDown_BL(cboEmployer, dtEmployers , 1);
					initDropDown_BL(cboDrillFor, dtCompanies , 1);

					// if there are no incomplete encounters for this rig then do not show this section
					if(cboIncomplete.Items.Count < 2)
						spIncomplete.Visible = false;

					// hide the edit button
					btnEdit.Visible = false;
				
					if(Session["mode"] != null && Session["mode"].ToString() == "view")
					{
						// if there is no patient key in the querystring then set the form to add mode
						if(Request.QueryString["pKey"] != null)
						{
							// add the javascript initSpan function to the onload of the body
							bodyMain.Attributes.Add("onLoad", "initSpan()");

							// disable the input boxes and show the data from the database
							enterData();

							LoadData(Convert.ToInt32(Request.QueryString["pKey"]), true);

							// disable the asp.net button
							btnReset.Visible = false;
							btnContinue.Visible = false;
							btnEdit.Visible = true;
							btnEdit.Attributes.Add("onClick", "location.href='Medical.aspx';");
						}
					}

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
			
			if (System.Convert.ToBoolean(Session["SearchComplete"]) == true)
			{
				if(Session["mode"] != null && Session["mode"].ToString() == "view")
				{
					// if there is no patient key in the querystring then set the form to add mode
					if(Session["PatientID"] != null)
					{
						// add the javascript initSpan function to the onload of the body
						bodyMain.Attributes.Add("onLoad", "initSpan()");

						// disable the input boxes and show the data from the database
						enterData();
                        SQLPatient sqlPatient= new SQLPatient();
                        DataTool dbTool = new DataTool();
                        DataTable dT = dbTool.getPatientInfo(Int32.Parse(Session["PatientID"].ToString()));
                        Patients Patient = new Patients();
                        sqlPatient.LoadObject(Patient, dT);
                        LoadControls_BL(Patient);

						// disable the asp.net button
						btnReset.Visible = false;
						btnContinue.Visible = false;
						btnEdit.Visible = true;
						btnEdit.Attributes.Add("onClick", "location.href='Medical.aspx';");
					}
				}
			}
			Session["SearchComplete"] = false;
		}


#endregion

#region Data Functions

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

        private void LoadControls_BL(Patients pInfo)
        {
            if (pInfo != null)
            {
                Type type = pInfo.GetType();
                foreach (Control ctl in Page.Form.Controls)
                {
                    if (ctl.ID == null) continue;
                    if (ctl.ID.Contains("span"))
                    {
                        string pName = ctl.ID.Substring(7, ctl.ID.Length - 7);
                        PropertyInfo pi = type.GetProperty(pName);
                        ((System.Web.UI.HtmlControls.HtmlGenericControl)ctl).InnerText = (string)pi.GetValue(pInfo, null).ToString();
                    }
                }
                txtEmployerPhone.InnerText = pInfo.EmployerPhone ;
                txtEmployerPhoneExt.InnerText = pInfo.EmployerPhoneExt;
                txtEmployerEmail.InnerText = pInfo.EmployerEmail ;
                txtEmployerAddress.InnerText = pInfo.EmployerAddress ;
                txtEmployerZip.InnerText = pInfo.EmployerZip ;
                txtEmployerCity.InnerText = pInfo.EmployerCity ;
                txtEmployerState.InnerText = pInfo.EmployerState ;
            }
            else
            {
                Response.Redirect("CustError.aspx");
            }
        }

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
						rdoSex.SelectedValue = tblResults.Rows[0][26].ToString();
					}
				}
			}

		} //Obsolete

        private void LoadControlsIncomplete_BL(Patients pInfo)
        {
            if (pInfo != null)
            {
                Type type = pInfo.GetType();
                foreach (Control ctl in Page.Form.Controls )
                {
                        if (ctl.GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                        {
                            string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                            PropertyInfo pi = type.GetProperty(pName);
                            ((TextBox)ctl).Text = (string)pi.GetValue(pInfo, null);
                        }

                        if (ctl.GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                        {
                            string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                            PropertyInfo pi = type.GetProperty(pName);
                            ((DropDownList)ctl).SelectedValue = pi.GetValue(pInfo,null).ToString();
                        }

                        if (ctl.GetType().ToString() == "System.Web.UI.WebControls.RadioButtonList")
                        {
                            string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                            PropertyInfo pi = type.GetProperty(pName);
                            ((RadioButtonList)ctl).SelectedValue = (string)pi.GetValue(pInfo, null).ToString();
                        }

                    }
                    txtEmployerPhone.InnerText = pInfo.EmployerPhone;
                    txtEmployerPhoneExt.InnerText = pInfo.EmployerPhoneExt;
                    txtEmployerEmail.InnerText = pInfo.EmployerEmail;
                    txtEmployerAddress.InnerText = pInfo.EmployerAddress;
                    txtEmployerZip.InnerText = pInfo.EmployerZip;
                    txtEmployerCity.InnerText = pInfo.EmployerCity;
                    txtEmployerState.InnerText = pInfo.EmployerState;
                }

            } // Done... Tested...
    
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

#region User Controls

#region Combo Box Events and Functions
	
		private void initDropDown(DropDownList dpID, string sql, int showSelect)
		{
			if (AppMode)
				clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
			else
				clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

			SqlDataReader rsCombo = clsUtility.GetDataReader(sql);

			// if the showSelect flag is 1 then show the [Select] option, otherwise enter a blank option
			if( showSelect > 0 )
			{
				// add a null option to each drop down list
				dpID.Items.Add(new ListItem("[Select]", "-1"));
			}
			else
			{
				dpID.Items.Add(new ListItem("", ""));
			}

			// get all of the values and text from the data reader
			while( rsCombo.Read() )
			{
				string val1 = rsCombo[0].ToString();
				string val2 = rsCombo[1].ToString();
				dpID.Items.Add(new ListItem(val2,val1));
			}

			// close the reader
			rsCombo.Close();
		}

        private void initDropDown_BL(DropDownList dpID, DataTable dropdownTable , int showSelect)
		{
			// if the showSelect flag is 1 then show the [Select] option, otherwise enter a blank option
			if( showSelect > 0 )
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
				dpID.Items.Add(new ListItem(val2,val1));
			}

		} // Done... Tested...

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
			if( dtState.Rows.Count > 0 )
			{
				txtState.Text = dtState.Rows[0]["Abbrev"].ToString();
                
			}
		}


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

                DataTool dbTool = new DataTool();
                DataTable dtEmployer = dbTool.getEmployerInfo(Int32.Parse(cboEmployer.SelectedValue));
                if (dtEmployer.Rows.Count > 0)
                {
                    foreach (DataRow drEmployer in dtEmployer.Rows)
                    {
                        txtEmployerPhone.InnerText = Convert.ToString(drEmployer[0].ToString());
                        txtEmployerPhoneExt.InnerText = Convert.ToString(drEmployer[1].ToString());
                        txtEmployerEmail.InnerText = Convert.ToString(drEmployer[2].ToString());
                        txtEmployerAddress.InnerText = Convert.ToString(drEmployer[3].ToString());
                        txtEmployerCity.InnerText = Convert.ToString(drEmployer[4].ToString());
                        txtEmployerState.InnerText = Convert.ToString(drEmployer[5].ToString());
                        txtEmployerZip.InnerText = Convert.ToString(drEmployer[6].ToString());
                    }
                }
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
                else
                {
                    ClearEmployer();
                }
                //rEmployerData.Close();
			}
			else
			{
				ClearEmployer();
			}
			
		}


		protected void cboIncomplete_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			if(cboIncomplete.SelectedIndex > 0 && Session["MedicPK"] != null)
			{
				//DataTable tblResults;

				// make sure all the text fields are visible
				makeVisible();

				// add the javascript initSpan function to the onload of the body
				bodyMain.Attributes.Add("onLoad", "showTipLinks()");

				Session["mode"] = "edit";
				Session["PatientID"] = cboIncomplete.SelectedValue.ToString();

                Patients Patient = new Patients();
                SQLPatient sqlPatient = new SQLPatient();
                sqlPatient.getPatient(Int32.Parse(cboIncomplete.SelectedValue.ToString()), Patient);
                LoadControlsIncomplete_BL(Patient);

				btnContinue.Visible = true;
				btnEdit.Visible = false;
				btnEdit.Attributes.Add("onClick", "location.href='Medical.aspx';");
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

#region Button Events

		protected void btnContinue_Click(object sender, System.EventArgs e)
		{
            Page.Validate();
            if (Page.IsValid)
            {
                EncodeControls();
                Patients newPatient = new Patients();
                Type type = newPatient.GetType();
                //Loop through all the page controls and loading into the Object
                foreach (Control ctl in Page.Form.Controls)
                {
                    switch (ctl.GetType().ToString())
                    {
                        case "System.Web.UI.WebControls.TextBox":
                            if (((TextBox)ctl).Text.Length > 0)
                            {
                                string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                                PropertyInfo pi = type.GetProperty(pName);
                                string input = HttpUtility.HtmlEncode(((TextBox)ctl).Text.Replace("'", "''"));
                                pi.SetValue(newPatient, input, null);
                            }
                            continue;

                        case "System.Web.UI.WebControls.DropDownList":
                            if (((DropDownList)ctl).SelectedIndex > -1)
                            {
                                string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                                PropertyInfo pi = type.GetProperty(pName);
                                string input = HttpUtility.HtmlEncode(((DropDownList)ctl).SelectedValue);
                                pi.SetValue(newPatient, Int32.Parse(input), null);
                            }
                            continue;

                        case "System.Web.UI.WebControls.RadioButtonList":
                            if (((RadioButtonList)ctl).SelectedIndex > -1)
                            {
                                string pName = ctl.ID.Substring(3, ctl.ID.Length - 3);
                                PropertyInfo pi = type.GetProperty(pName);
                                string input = HttpUtility.HtmlEncode(((RadioButtonList)ctl).SelectedValue);
                                pi.SetValue(newPatient, input, null);
                            }
                            continue;
                    }

                }
                Session["NewPatient"] = newPatient;

                Server.Transfer("save.Patient.aspx", true);
            }
		}


		protected void btnEdit_ServerClick(object sender, System.EventArgs e)
		{
			Response.Redirect("medical.aspx");
		}

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

#region General Functions

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

        protected void cboDrillFor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



	}
}
