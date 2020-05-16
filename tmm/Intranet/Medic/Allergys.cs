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

namespace TrinityMedicalManagement
{
    public class Allergys
    {
        private int _PatientID;
        public int PatientID
        {
            get { return _PatientID; }
            set { _PatientID = value; }
        }

        private int _AllergyID;
        public int AllergyID
        {
            get { return _AllergyID; }
            set { _AllergyID = value; }
        }



    }
}
