using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for DataForm.
	/// </summary>
	public class DataForm : TMMPage
	{        
		InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
		protected InfiniEdge.Encryption enc = new InfiniEdge.Encryption();

		public DataForm(Control c, string strSQL)
		{
			getFields(c, strSQL);
		}

        #region getFields(Control c, string strSQL)
        // need a method that will get the names of the textboxes, radio buttons, and drop down lists
        private void getFields(Control c, string strSQL)
        {
            if (AppMode)
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
            else
                clsUtility.Connection = enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);

            SqlDataReader rEncounter = clsUtility.GetDataReader(strSQL);

            while (rEncounter.Read())
            {
                for (int i = 0; i < rEncounter.FieldCount; i++)
                {
                    Control ctrl = getControl(c, rEncounter.GetName(i).ToString());
                    if (ctrl != null)
                    {
                        switch (ctrl.GetType().ToString())
                        {
                            case "System.Web.UI.WebControls.TextBox":
                                TextBox txtCtrl = new TextBox();
                                txtCtrl.Text = rEncounter.GetString(i);
                                break;
                            case "System.Web.UI.WebControls.DropDownList":
                                DropDownList cboCtrl = new DropDownList();
                                cboCtrl.SelectedIndex = rEncounter.GetInt16(i);
                                break;
                            case "System.Web.UI.WebControls.RadioButtonList":
                                RadioButtonList rdoCtrl = new RadioButtonList();
                                rdoCtrl.SelectedValue = rEncounter.GetString(i);
                                break;
                        }
                    }
                }
            }
            rEncounter.Close();
        }
        
        #endregion

        #region getControl(Control c, string strField)
        private Control getControl(Control c, string strField)
        {
            Control tmpCtrl = c.FindControl("txt" + strField);
            if (tmpCtrl == null)
            {
                tmpCtrl = c.FindControl("cbo" + strField);
                if (tmpCtrl == null)
                {
                    tmpCtrl = c.FindControl("rdo" + strField);
                    if (tmpCtrl == null)
                    {
                        return null;
                    }
                }
            }
            return tmpCtrl;
        }
        
        #endregion

	}
}
