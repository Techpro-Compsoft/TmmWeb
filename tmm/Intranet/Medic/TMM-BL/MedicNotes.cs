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
    public class MedicNotes
    {

        #region Properties
        private string _PhysicalNotes;
        private string _ImpressionNotes;
        private string _RecommendationNotes;
        private string _InstructionNotes;
        
        #endregion

        #region PhysicalNotes
        public string PhysicalNotes
        {
            get { return _PhysicalNotes; }
            set { _PhysicalNotes = value; }
        }
        
        #endregion

        #region ImpressionNotes
        public string ImpressionNotes
        {
            get { return _ImpressionNotes; }
            set { _ImpressionNotes = value; }
        }
        
        #endregion

        #region RecommendationNotes
        public string RecommendationNotes
        {
            get { return _RecommendationNotes; }
            set { _RecommendationNotes = value; }
        }
        
        #endregion

        #region InstructionNotes
        public string InstructionNotes
        {
            get { return _InstructionNotes; }
            set { _InstructionNotes = value; }
        }
        
        #endregion

    }
}
