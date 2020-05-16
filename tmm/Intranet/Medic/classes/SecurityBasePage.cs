using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TMMModel;

namespace TrinityMedicalManagement
{
    public class SecurityBasePage : System.Web.UI.Page
    {
        /// <summary>
        /// Redirects the user if they are not supposed to be able to access the page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Check to see if session exists.
                if (Session["SecurableRights"] == null) Response.Redirect(@"\Login.aspx");

                List<int> securableRights = (List<int>)Session["SecurableRights"];

                if(securableRights == null) Response.Redirect(@"\Login.aspx");

                // Stop the user if they are not a patient encounter user or an admin.
                if (!(from s in securableRights
                    select s).Contains(Convert.ToInt32(Securable.Securables.PatientEncounterApplication))
                    &&
                    !(from s in securableRights
                     select s).Contains(Convert.ToInt32(Securable.Securables.PatientEncounterAdmin)))
                {
                    Response.Redirect(@"\Login.aspx");
                }
            }
        }
    }
}
