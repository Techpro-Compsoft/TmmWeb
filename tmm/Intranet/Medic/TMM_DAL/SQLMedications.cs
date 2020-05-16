using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text;
using TrinityBLO;


namespace TrinityMedicalManagement
{
    public class SQLMedications
    {
        DataTool dbTool = new DataTool();
        InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();

        #region getAllMedications(int patientID)
        public List<Medications> getAllMedications(int patientID)
        {
            clsUtility.Connection = dbTool.getConnectionString();

            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", patientID));

            List<Medications> tmpMeds = new List<Medications>();
            SqlDataReader sqlDR = clsUtility.ExecuteSP_DataReader("getMedication", parameters);
            try
            {
                while (sqlDR.Read())
                {

                    Medications tmpM = new Medications();
                    tmpM.Dosage = Single.Parse(sqlDR["Dosage"].ToString());
                    tmpM.Measurement = sqlDR["Measurement"].ToString();
                    tmpM.MedicationDesc = sqlDR["Medication Name"].ToString();
                    tmpM.MedicationId = Int32.Parse(sqlDR["MedicationId"].ToString());
                    tmpM.PatientID = Int32.Parse(sqlDR["PatientID"].ToString());
                    tmpMeds.Add(tmpM);
                }
                return tmpMeds;
            }
            finally
            {
                sqlDR.Close();
            }
        }
        
        #endregion

    }
}
