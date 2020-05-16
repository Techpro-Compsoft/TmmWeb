using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Reflection;
using TrinityBLO;


namespace TrinityMedicalManagement
{
    public class SQLMedicalInfo
    {
        DataTool dbTool = new DataTool();

        #region LoadObject(DataTable MedicalTable, MedicalInfo mInfo)
        public void LoadObject(DataTable MedicalTable, MedicalInfo mInfo)
        {
            if (MedicalTable.Rows.Count > 0)
            {
                Type type = mInfo.GetType();
                foreach (DataColumn dC in MedicalTable.Columns)
                {
                    PropertyInfo pi = type.GetProperty(dC.ColumnName);
                    switch (pi.PropertyType.ToString())
                    {
                        case "System.Int32":
                            if (MedicalTable.Rows[0][dC.ColumnName].GetType().ToString() == "System.DBNull")
                                pi.SetValue(mInfo, 0, null);
                            else
                                pi.SetValue(mInfo, Int32.Parse(MedicalTable.Rows[0][dC.ColumnName].ToString()), null);
                            break;
                        case "System.String":
                            pi.SetValue(mInfo, MedicalTable.Rows[0][dC.ColumnName].ToString(), null);
                            break;
                    }
                }
            }
        }
        
        #endregion

        #region getMedicalInfo(int PatientID, MedicalInfo mInfo)
        public void getMedicalInfo(int PatientID, MedicalInfo mInfo)
        {
            LoadObject(dbTool.getMedicalRecords(PatientID), mInfo);
        }
        
        #endregion

        #region updateMedicalInfo(MedicalInfo mInfo)
        public int updateMedicalInfo(MedicalInfo mInfo)
        {
            return dbTool.updateMedicalRecord(mInfo);
        }
        
        #endregion

    }
}
