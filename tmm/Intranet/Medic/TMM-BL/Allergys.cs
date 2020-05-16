using System;

namespace TrinityBLO
{
    public class Allergys
    {
        #region Properties
        private int _AllergyID;
        private string _AllergyName;
        
        #endregion

        #region AllergyName
        public string AllergyName
        {
            get { return _AllergyName; }
            set { _AllergyName = value; }
        }
        
        #endregion        

        #region AllergyID
        public int AllergyID
        {
            get { return _AllergyID; }
            set { _AllergyID = value; }
        }
        
        #endregion

    }
}
