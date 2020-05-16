using System;
using System.Collections.Generic;
using System.Text;

namespace TrinityBLO
{
    public class Tips
    {
        #region Properties
        private int _TipID;

        private string _Description;

        private string _TipText;
#endregion

        #region Description
        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }
        
        #endregion

        #region TipID
        public int TipID
        {
            get { return _TipID; }
            set { _TipID = value; }
        }
        
        #endregion

        #region TipText
        public string TipText
        {
            get { return _TipText; }
            set { _TipText = value; }
        }
        
        #endregion

    }
}
