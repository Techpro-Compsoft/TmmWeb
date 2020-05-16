using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data;
using System.Reflection;
using TrinityBLO;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for DataUtility.
	/// </summary>
	
	public class DataUtility : TMMPage
	{
        
		InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();

		public DataUtility()
		{
			if (Convert.ToBoolean(Convert.ToInt16(ConfigurationManager.AppSettings["appmode"])))
				clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
			else
				clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);
		}

        public void doIncompletes_BL(MedicalInfo mInfo, Control c)
        {
            foreach (Control ctrl in c.Controls)
            {
                if (ctrl.GetType().ToString() == "System.Web.UI.WebControls.RadioButtonList" || ctrl.GetType().ToString() == "System.Web.UI.WebControls.TextBox" || ctrl.GetType().ToString() == "System.Web.UI.WebControls.DropDownList" || ctrl.GetType().ToString() == "System.Web.UI.HtmlControls.HtmlGenericControl")
                {
                    // get the id, don't retrieve the first three letters
                    string strID = ctrl.ID.Substring(3);

                    Type type = mInfo.GetType();
                    PropertyInfo pi = type.GetProperty(strID);
                    if (pi != null)
                    {
                        if (pi.GetValue(mInfo, null) != null)
                        {
                        string strValue = pi.GetValue(mInfo, null).ToString();
                        
                            switch (ctrl.GetType().ToString())
                            {
                                case "System.Web.UI.WebControls.RadioButtonList":
                                    RadioButtonList rdoList = (RadioButtonList)ctrl;
                                    if (rdoList.Visible)
                                    {
                                        if (strValue.Equals("0"))
                                            rdoList.SelectedIndex = Convert.ToInt32(strValue.Trim());
                                        else if (strValue.Equals("1"))
                                            rdoList.SelectedIndex = Convert.ToInt32(strValue.Trim());
                                    }
                                    else
                                    {
                                        HtmlGenericControl spanTxt = (HtmlGenericControl)c.FindControl("span" + ctrl.ID);
                                        spanTxt.InnerHtml = strValue.Trim();
                                    }
                                    break;
                                case "System.Web.UI.WebControls.TextBox":
                                    TextBox txtField = (TextBox)ctrl;
                                    if (txtField.Visible)
                                        txtField.Text = strValue.Trim();
                                    else
                                    {
                                        HtmlGenericControl spanTxt = (HtmlGenericControl)c.FindControl("span" + ctrl.ID);
                                        spanTxt.InnerHtml = strValue.Trim();
                                    }
                                    break;
                                case "System.Web.UI.WebControls.DropDownList":
                                    DropDownList cboField = (DropDownList)ctrl;
                                    if (cboField.Visible)
                                        cboField.SelectedValue  = strValue.Trim();
                                    else
                                    {
                                        HtmlGenericControl spanTxt = (HtmlGenericControl)c.FindControl("span" + ctrl.ID);
                                        cboField.SelectedValue = strValue.Trim();
                                        spanTxt.InnerHtml = cboField.SelectedItem.Text;
                                    }
                                    break;
                                case "System.Web.UI.HtmlControls.HtmlGenericControl":
                                    if (ctrl.Visible)
                                    {
                                        HtmlGenericControl spanTxt = (HtmlGenericControl)c.FindControl(ctrl.ID);
                                        spanTxt.InnerHtml = strValue.Trim();
                                    }
                                    break;
                            }
                        strValue = null;
                        }
                    }
                }
                if (ctrl.HasControls())
                {
                    doIncompletes_BL(mInfo , ctrl);
                }
            }
        }	
        
		// make sure the first three characters are removed from the control id before sending it to this function
		

	}
}
