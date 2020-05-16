using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TMMModel;


namespace TrinityMedicalManagement
{
    public partial class SelectUser : TMMPage 
    {

        #region Page_Load
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!Page.IsPostBack)
            {
                BindData();
            }
        }
        #endregion


        #region BindData
        private void BindData()
        {
            radCompanyUsers.DataSource = GetNotifyUsers(CurrentPatientEncounter.RigID.Value);
            radCompanyUsers.DataBind();
        }

        #endregion


        #region radCompanyUsers_ItemDataBound
        protected void radCompanyUsers_ItemDataBound(object sender, Telerik.WebControls.GridItemEventArgs e)
        {

            if (e.Item.DataItem != null)
            {
                UserInfo dItem = (UserInfo) e.Item.DataItem ;
                Telerik.WebControls.GridItem item = e.Item;
                
                //Sets the users name
                Literal litUser = item.FindControl("litUsername") as Literal ;
                if (litUser != null) {
                    litUser.Text = dItem.FirstName + " " + dItem.LastName;
                }
                //Sets the users emailaddress
                Literal litEmail = item.FindControl("litEmail") as Literal;
                if (litEmail != null)
                {
                    litEmail.Text = dItem.Email;
                }

            }
        }
        #endregion


        #region btnOK_Click
        protected void btnOK_Click (object sender, EventArgs e)
        {
            
            Dictionary<string, string> cEmails = new Dictionary<string,string>();
            //Loops through all users listed on the page.
            foreach (Telerik.WebControls.GridItem rItem in radCompanyUsers.Items )
            {
                System.Web.UI.WebControls.CheckBox chkUser = rItem.FindControl("chkUser") as CheckBox ;
                
                if (chkUser != null)
                {
                    if (chkUser.Checked ) 
                    {
                        Literal litUser = rItem.FindControl("litUsername") as Literal;
                        Literal litEmail = rItem.FindControl("litEmail") as Literal;

                        if (litUser != null && litEmail != null)
                        {
                            //Add the selected user to the dictionary list.
                            cEmails.Add(litEmail.Text , litUser.Text);
                        }
                        
                    }
                }
            }

            CustomerEmails = cEmails;
            //Closes the window
            Response.Write("<script>var oWindow = null; if (window.radWindow) oWindow = window.radWindow; else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; oWindow.Close();</script>");
        }
        #endregion 

    }
}
