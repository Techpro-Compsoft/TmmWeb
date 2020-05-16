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
using System.Text;
using System.Configuration;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for save_Notes.
	/// </summary>
	public partial class save_Notes : TMMPage
	{
		InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();


#region Page Load

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session["mode"] == null)
            {
                if (Session["PatientID"] == null)
                {
                    Response.Redirect("SessionTimedOut.aspx");
                }
            }
            DataTool dbTool = new DataTool();

            int intCnt = dbTool.getNoteStatus(Int32.Parse(Session["PatientID"].ToString()));

            if (intCnt < 1)
                saveData_BL();
            else
                updateData_BL();

            Response.Redirect("Patient.aspx");
        }
        


#endregion

#region Data Functions


        #region saveData_BL()
        private void saveData_BL()
        {
            SQLMedicNotes sqlMN = new SQLMedicNotes();
            //string strStatus = "C"; // C is for complete.
            TrinityBLO.MedicNotes mNote = (TrinityBLO.MedicNotes)Session["newNotes"];
            sqlMN.newMedicNote(mNote, "C"); // C is for complete.
            // clear out the session variables
            Session.Remove("newNotes");
            Session.Remove("PatientID");
            Session.Remove("mode");
            Session.Remove("Patient");
        }
        
        #endregion

        #region updateData_BL()
        private void updateData_BL()
        {
            SQLMedicNotes sqlMN = new SQLMedicNotes();
            TrinityBLO.MedicNotes mNote = (TrinityBLO.MedicNotes)Session["newNotes"];
            sqlMN.updateMedicNotes(mNote, "C"); //C is for complete.
            // clear out the session variables
            Session.Remove("newNotes");
            Session.Remove("PatientID");
            Session.Remove("mode");
            Session.Remove("Patient");
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
