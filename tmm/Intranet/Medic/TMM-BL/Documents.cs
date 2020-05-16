using System;
using System.Collections.Generic;
using System.Text;

namespace TrinityBLO
{
    public class Documents
    {
        #region  Properties
        
        private int _DocumentID;

        private int _ServiceID = 0;

        private string _DocumentLink;

        private string _DocumentType;

        private int _LocationType;
        #endregion

        #region DocumentType
        public string DocumentType
        {
            get { return _DocumentType; }
            set { _DocumentType = value; }
        }
        #endregion

        #region LocationType
        public int LocationType
        {
            get { return _LocationType; }
            set { _LocationType = value; }
        } 
        #endregion

        #region DocumentID
        public int DocumentID
        {
            get { return _DocumentID; }
            set { _DocumentID = value; }
        }
        
        #endregion

        #region DocumentLink
        public string DocumentLink
        {
            get { return _DocumentLink; }
            set { _DocumentLink = value; }
        }
 
	#endregion
    }
}
