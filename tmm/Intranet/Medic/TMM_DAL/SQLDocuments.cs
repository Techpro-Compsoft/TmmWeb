using System;
using System.Collections.Generic;
using System.Text;
using TrinityBLO;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Reflection;
using System.Configuration;

namespace TrinityMedicalManagement
{
    public class SQLDocuments
    {
        bool AppMode = false;
        InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();

        #region getConnectionString()
        private string getConnectionString()
        {
            InfiniEdge.Encryption enc = new InfiniEdge.Encryption();
            if (AppMode)
                return enc.SimpleCrypt(ConfigurationManager.AppSettings["remoteConn"]);
            else
                return enc.SimpleCrypt(ConfigurationManager.AppSettings["infiniConn"]);
        }
        
        #endregion

        #region getDocumentsByPatient(int PatientID)
        public List<Documents> getDocumentsByPatient(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            List<Documents> lDocuments = new List<Documents>();

            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            SqlDataReader sqlDr = clsUtility.ExecuteSP_DataReader("getDocumentsByPatientID", parameters);
            try
            {
                while (sqlDr.Read())
                {
                    Documents tmpDoc = new Documents();
                    tmpDoc.DocumentID = Int32.Parse(sqlDr["DocumentID"].ToString());
                    tmpDoc.DocumentLink = sqlDr["DocumentLink"].ToString();
                    tmpDoc.DocumentType = sqlDr["DocumentType"].ToString();
                    lDocuments.Add(tmpDoc);
                }
            }
            finally
            {
                sqlDr.Close();
            }
            return lDocuments;
        }
        
        #endregion

    }
}
