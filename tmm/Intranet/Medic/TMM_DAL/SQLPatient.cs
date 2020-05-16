using System;
using System.Collections.Generic;
using System.Text;
using TrinityBLO;
using System.Data;


namespace TrinityMedicalManagement
{
    public class SQLPatient
    {
        DataTool dbTool = new DataTool();

        #region newPatient(Patients pInfo)
        public int newPatient(Patients pInfo)
        {
            return dbTool.insertNewPatient(pInfo);
        }
        
        #endregion

        #region updatePatient(Patients pInfo, int PatientID)
        public int updatePatient(Patients pInfo, int PatientID)
        {
            return dbTool.updatePatient(pInfo, PatientID);
        }
        
        #endregion

        #region LoadObject(Patients pInfo, DataTable PatientTable)
        public void LoadObject(Patients pInfo, DataTable PatientTable)
        {
            pInfo.HireDate = PatientTable.Rows[0][0].ToString();
            pInfo.EncounterDate = PatientTable.Rows[0][1].ToString();
            pInfo.EncounterTime = PatientTable.Rows[0][2].ToString();
            pInfo.FirstName = PatientTable.Rows[0][3].ToString();
            pInfo.LastName = PatientTable.Rows[0][4].ToString();
            pInfo.MInitial = PatientTable.Rows[0][5].ToString();
            pInfo.HomePhone = PatientTable.Rows[0][6].ToString();
            pInfo.Address = PatientTable.Rows[0][7].ToString();
            pInfo.City = PatientTable.Rows[0][8].ToString();
            pInfo.State = PatientTable.Rows[0][9].ToString();
            pInfo.Zip = PatientTable.Rows[0][10].ToString();
            pInfo.Birthdate = PatientTable.Rows[0][11].ToString();
            pInfo.Age = PatientTable.Rows[0][12].ToString();
            pInfo.SSN = PatientTable.Rows[0][13].ToString();
            pInfo.Location = PatientTable.Rows[0][16].ToString();
            pInfo.Country = PatientTable.Rows[0][17].ToString();
            pInfo.JobTitle = PatientTable.Rows[0][27].ToString();
            if (PatientTable.Rows[0][28].GetType().ToString() != "System.DBNull")
                pInfo.RigID = Int32.Parse(PatientTable.Rows[0][28].ToString());
            else pInfo.RigID = -1;
            if (PatientTable.Rows[0][29].GetType().ToString() != "System.DBNull")
                pInfo.Employer = Int32.Parse(PatientTable.Rows[0][29].ToString());
            else pInfo.Employer = -1;
            if (PatientTable.Rows[0][30].ToString() == "")
                pInfo.DrillFor = -1;
            else pInfo.DrillFor = Int32.Parse(PatientTable.Rows[0][30].ToString());
            pInfo.Sex = PatientTable.Rows[0][26].ToString();
            pInfo.EmployerPhone = PatientTable.Rows[0][19].ToString();
            pInfo.EmployerPhoneExt = PatientTable.Rows[0][20].ToString();
            pInfo.EmployerEmail = PatientTable.Rows[0][21].ToString();
            pInfo.EmployerAddress = PatientTable.Rows[0][22].ToString();
            pInfo.EmployerZip = PatientTable.Rows[0][23].ToString();
            pInfo.EmployerCity = PatientTable.Rows[0][24].ToString();
            pInfo.EmployerState = PatientTable.Rows[0][25].ToString();
            pInfo.EmployerCountry = PatientTable.Rows[0]["EmployerCountry"].ToString(); 
        }
        
        #endregion

        #region getPatient(int PatientID, Patients pInfo)
        public void getPatient(int PatientID, Patients pInfo)
        {
            LoadObject(pInfo, dbTool.getPatientInfo(PatientID));
        }
        
        #endregion

    }
}
