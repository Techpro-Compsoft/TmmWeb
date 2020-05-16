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
	/// Summary description for ServerVariables.
	/// </summary>
	public partial class ServerVariables : TMMPage
	{
		protected override void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);

			foreach (string key in Request.ServerVariables)
			{

				Response.Write("<b>" + key + ":</b> " + Request.ServerVariables.Get(key) + "<br>");
			}
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
