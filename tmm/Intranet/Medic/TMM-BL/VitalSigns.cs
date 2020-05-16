using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Reflection;

namespace TrinityBLO
{
    public class VitalSigns
    {
        #region Properties
        private string _Time;
        private string _BP;
        private string _Pulse;
        private string _Resp;
        private string _Temp;
        private string _TruamaScore;
        private string _VitalSignID;
        
        #endregion

        #region Time
        public string Time
        {
            get { return _Time; }
            set { _Time = value; }
        }
        
        #endregion 
       
        #region BP
        public string BP
        {
            get { return _BP; }
            set { _BP = value; }
        }
        
        #endregion        

        #region Pulse
        public string Pulse
        {
            get { return _Pulse; }
            set { _Pulse = value; }
        }
        
        #endregion

        #region Resp
        public string Resp
        {
            get { return _Resp; }
            set { _Resp = value; }
        }
        
        #endregion        

        #region Temperature
        public string Temperature
        {
            get { return _Temp; }
            set { _Temp = value; }
        }
        
        #endregion        

        #region TraumaScore
        public string TraumaScore
        {
            get { return _TruamaScore; }
            set { _TruamaScore = value; }
        }
        
        #endregion

        #region VitalSignID
        public string VitalSignID
        {
            get { return _VitalSignID; }
            set { _VitalSignID = value; }
        }
        
        #endregion

        #region LoadObject(DataTable dtVitalSigns)
        public void LoadObject(DataTable dtVitalSigns)
        {
            if (dtVitalSigns.Rows.Count > 0)
            {
                Type type = this.GetType();
                foreach (DataColumn dC in dtVitalSigns.Columns)
                {
                    string dCName = dC.ColumnName.ToString();
                    dCName = dCName.Replace(" ", "");
                    dCName = dCName.Replace("/", "");
                    PropertyInfo pi = type.GetProperty(dCName);
                    switch (pi.PropertyType.ToString())
                    {
                        case "System.Int32":
                            if (dtVitalSigns.Rows[0][dC.ColumnName].GetType().ToString() == "System.DBNull")
                                pi.SetValue(this, 0, null);
                            else
                                pi.SetValue(this, Int32.Parse(dtVitalSigns.Rows[0][dC.ColumnName].ToString()), null);
                            break;
                        case "System.String":
                            pi.SetValue(this, dtVitalSigns.Rows[0][dC.ColumnName].ToString(), null);
                            break;
                    }
                }
            }
        }
        
        #endregion

    }

}
