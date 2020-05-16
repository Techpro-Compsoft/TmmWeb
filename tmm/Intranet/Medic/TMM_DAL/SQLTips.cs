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
    public class SQLTips
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

        #region pullAllTips()
        public List<Tips> pullAllTips()
        {
            clsUtility.Connection = getConnectionString();
            List<Tips> lTips = new List<Tips>();
            SqlDataReader sqlDR = clsUtility.ExecuteSP_DataReader("pullAllTips",null);
            try
            {
                while (sqlDR.Read())
                {
                    Tips tmpTips = new Tips();
                    tmpTips.TipID = Int32.Parse(sqlDR["ExplanationID"].ToString());
                    tmpTips.Description = sqlDR["Description"].ToString();
                    tmpTips.TipText = sqlDR["Text"].ToString();
                    lTips.Add(tmpTips);
                }
            }
            finally
            {
                sqlDR.Close();
            }
            return lTips;
        }
        
        #endregion

    }
}
