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

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for CustError.
	/// </summary>
	public partial class CustError : TMMPage
	{
	
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			// determine which message to display

			string msg;

			// unauthorized user
			if(Request.QueryString["user"] == "unauthorized")
			{
				msg = "You are not authorized to use this application.  Please contact the administrator in order to gain access to the site.<br><br>";
				msg += "Phone Number: <br>";
				msg += "Email: <br>";
			}
			else
			{
				msg = "An unexpected error has occurred in the system. We're sorry for the ";
				msg += "inconvenience. The administrator has been sent an email with the details of the error.";
			}
			lblErr.Text = msg;
		}

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
