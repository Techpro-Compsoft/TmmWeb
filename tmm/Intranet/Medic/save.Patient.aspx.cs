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

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for save_Patient.
	/// </summary>
	public partial class save_Patient : TMMPage
	{


#region Page Load

		protected override void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);

			int recCnt = 0;
           
            TrinityClassLibrary_BL.Patient patient = (TrinityClassLibrary_BL.Patient)Session["Patient"];
            Session["PatientID"] = patient.PatientID;
            
			if(Session["MedicPK"] != null)
			{
				// make sure the incomplete drop down was visible on the screen and that the incomplete value is > 0 in length
                //DropDownList cboInc = (DropDownList)  ("cboIncomplete");
                if ( patient.PatientID.ToString() != "-1") 
             //if (Request.Form["cboIncomplete"] != "-1" && Request.Form["cboIncomplete"].Length > 0)
                {
                    recCnt = updateRecord_BL();
                }
                else
                {
                     recCnt = saveData_BL();												
               }

				if( recCnt > 0 ){	Response.Redirect("Medical.aspx"); }
			}
			else
			{
                
				Response.Redirect("SessionTimedOut.aspx");
			}
		}


#endregion

#region Data Functions

        #region saveData_BL()
        private int saveData_BL()
        {
            SQLPatient sqlP = new SQLPatient();
            TrinityBLO.Patients pInfo = new TrinityBLO.Patients();
            pInfo = (TrinityBLO.Patients)Session["NewPatient"];
            Session.Remove("NewPatient");
            Session["PatientID"] = sqlP.newPatient(pInfo);
            return 1;
        }
        
        #endregion

        #region updateRecord_BL()
        private int updateRecord_BL()
        {
            SQLPatient sqlP = new SQLPatient();
            TrinityBLO.Patients pInfo = new TrinityBLO.Patients();
            pInfo = (TrinityBLO.Patients)Session["NewPatient"];
            Session.Remove("NewPatient");
            sqlP.updatePatient(pInfo, Int32.Parse(Session["PatientID"].ToString()));
            return 1;
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
