using System;
using System.Collections;
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

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for save_Medical.
	/// </summary>
	public partial class save_Medical : TMMPage
	{
		InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();

#region Page Load

        #region Page_Load(object sender, System.EventArgs e)
        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            object skey = Session["PatientID"];

            // see if the user's session is still active
            if (Session["mode"] == null)
            {
                if (Session["PatientID"] == null)
                {
                    Response.Redirect("SessionTimedOut.aspx");
                }
            }

            //save the form data to the database
            saveData_BL();

            Response.Redirect("Notes.aspx");
        }
        
        #endregion

#endregion

#region Data Functions

        #region saveData_BL()
        private int saveData_BL()
        {
            int recCnt = 0;								// number of records affected
            DataTool dbTool = new DataTool();
            TrinityBLO.MedicalInfo mInfo = (TrinityBLO.MedicalInfo)Session["NewMedical"];
            dbTool.updateMedicalRecord(mInfo);
            Session.Remove("NewMedical");
            // whether or not field is a checkbox, -1 means no

            // create the update portion of the sql statement
            foreach (string strFieldObj in Request.Form)
            {
                if (strFieldObj.IndexOf("chkAllergy") != -1)
                {
                    // need to create the new values for the sql string that will update the Patient Allergy table
                    dbTool.newAllergy(Int32.Parse(Request.Form[strFieldObj].ToString()));

                }
            }

            return recCnt;
        } //Tested and working
        
        #endregion	

        #region saveAllergy(string strVals)
        private void saveAllergy(string strVals)
        {
            string strSQL2;

            char[] delimiters = new char[] { ',' };

            // delete any existing records first
            strSQL2 = "DELETE FROM PatientAllergy WHERE PatientID = " + Session["PatientID"].ToString() + ";";
            clsUtility.ExecuteSQL(strSQL2);

            foreach (string strAllergy in strVals.Split(delimiters))
            {
                strSQL2 = "INSERT INTO PatientAllergy(AllergyID, PatientID) VALUES(" + strAllergy + "," + Session["PatientID"] + ");";
                clsUtility.ExecuteSQL(strSQL2);
            }
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

	}
}
