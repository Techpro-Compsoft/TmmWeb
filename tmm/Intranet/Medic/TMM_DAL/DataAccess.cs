using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Reflection;

using TrinityBLO;


namespace TrinityMedicalManagement
{

    public class DataTool 
    {
        bool AppMode = false ;
        InfiniEdge.SQL clsUtility = new InfiniEdge.SQL();
        //Determines AppMode

        #region getConnectionString()
        public string getConnectionString()
        {
            InfiniEdge.Encryption enc = new InfiniEdge.Encryption();
            return enc.SimpleCrypt(ConfigurationManager.AppSettings[ConfigurationManager.AppSettings["DBConnectionToUse"]]);
        }
        
        #endregion

        #region updateMedicalRecord(MedicalInfo mInfo)
        public int updateMedicalRecord(MedicalInfo mInfo)
        {
            clsUtility.Connection = getConnectionString();
            Type type = mInfo.GetType();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            
            foreach (PropertyInfo pi in type.GetProperties())
            {
                // Database was not saving these 2 date fields correctly if they were null.
                // Added this statement to insert DBNulls instead.
                if (pi.Name == "DepartDate" || pi.Name == "ArrivalDate")
                {
                    if (pi.GetValue(mInfo, null) == null)
                    {
                        parameters.Add(new SqlParameter("@" + pi.Name, DBNull.Value));
                    }
                    else
                    {
                        parameters.Add(new SqlParameter("@" + pi.Name, pi.GetValue(mInfo, null).ToString()));
                    }
                }
                else
                {
                    if (pi.GetValue(mInfo, null) == null)
                        parameters.Add(new SqlParameter("@" + pi.Name, ""));
                    else
                        parameters.Add(new SqlParameter("@" + pi.Name, pi.GetValue(mInfo, null).ToString()));
                }
            }

            parameters.Add(new SqlParameter("@PatientID", Int32.Parse(HttpContext.Current.Session["PatientID"].ToString())));            
            // 'Gets the password for the user
            //Dim passwdOutput As New SqlParameter("@password", SqlDbType.VarChar, 35)
            //passwdOutput.Direction = ParameterDirection.Output
            //pParams.Add(passwdOutput)
            //oSQL.ExecuteSP("GetPasswordByUserName", pParams)
            //password = passwdOutput.Value.ToString()

            int pKey = clsUtility.ExecuteSP_RETURN_VALUE("InsertPatientMedical", parameters);

            return pKey;

        }
        
        #endregion

        #region getMedicalRecords(int PatientID)
        public DataTable getMedicalRecords(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            DataTable dT = clsUtility.ExecuteSP_DataTable("getMedicalInfoByPatientID", parameters);

            return dT;
        }
        
        #endregion

        #region getPatientNotes(string PatientID)
        public DataTable getPatientNotes(string PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@patientID", PatientID));

            DataTable dT = clsUtility.ExecuteSP_DataTable("getPatientNotes", parameters);
            return dT;
        }
        
        #endregion

        #region getNoteStatus(int PatientID)
        public int getNoteStatus(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            int NoteStatus = clsUtility.ExecuteSP_RETURN_VALUE("getPatientNotesCount", parameters );
            return NoteStatus;
            //getPatientNotesCount
        }
        
        #endregion

        #region updateNote(string EncounterStatus, MedicNotes mNotes)
        public void updateNote(string EncounterStatus, MedicNotes mNotes)
        {
            clsUtility.Connection = getConnectionString();Type type = mNotes.GetType();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            
            foreach (PropertyInfo pi in type.GetProperties())
            {
                if (pi.GetValue(mNotes, null) == null)
                    parameters.Add(new SqlParameter("@" + pi.Name, ""));
                else
                parameters.Add(new SqlParameter("@" + pi.Name, pi.GetValue(mNotes, null).ToString()));
            }

            parameters.Add(new SqlParameter("@EncounterStatus", EncounterStatus));
            parameters.Add(new SqlParameter("@patientID", Int32.Parse(HttpContext.Current.Session["PatientID"].ToString())));
            clsUtility.ExecuteSP("updateNotes", parameters);
        }
        
        #endregion

        #region newNote(string EncounterStatus, MedicNotes mNotes)
        public void newNote(string EncounterStatus, MedicNotes mNotes)
        {
            clsUtility.Connection = getConnectionString();
            Type type = mNotes.GetType();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            
            foreach (PropertyInfo pi in type.GetProperties())
            {
                if (pi.GetValue(mNotes, null) == null)
                    parameters.Add(new SqlParameter("@" + pi.Name, ""));
                else
                parameters.Add(new SqlParameter("@" + pi.Name, pi.GetValue(mNotes, null).ToString()));
            }

            parameters.Add(new SqlParameter("@EncounterStatus", EncounterStatus));
            parameters.Add(new SqlParameter("@patientID", Int32.Parse(HttpContext.Current.Session["PatientID"].ToString())));

            clsUtility.ExecuteSP("newNotes", parameters);
        }
        
        #endregion

        #region newAllergy(int AllergyID)
        public void newAllergy(int AllergyID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@AllergyID", AllergyID));
            parameters.Add(new SqlParameter("@PatientID", Int32.Parse(HttpContext.Current.Session["PatientID"].ToString())));

            clsUtility.ExecuteSP("InsertAllergy", parameters);
        }
        
        #endregion

        #region removeAllergy()
        public void removeAllergy()
        {
            clsUtility.Connection = getConnectionString();

        }
        
        #endregion

        #region getAllergy(int PatientID)
        public DataTable getAllergy(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));
            DataTable dT = clsUtility.ExecuteSP_DataTable("getPatientAllergys", parameters);
            return dT;
        }
        
        #endregion

        #region NewMedication(int PatientID, string MedicationDesc, float Dosage, string Measurement)
        public void NewMedication(int PatientID, string MedicationDesc, float Dosage, string Measurement)
        {

            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));
            parameters.Add(new SqlParameter("@MedicationDesc", MedicationDesc));
            parameters.Add(new SqlParameter("@Dosage", Dosage));
            parameters.Add(new SqlParameter("@Measurement", Measurement));
            clsUtility.ExecuteSP("newPatientMedication", parameters);
        }
        
        #endregion

        #region deleteMedication(int PatientID, int MedicationID)
        public void deleteMedication(int PatientID, int MedicationID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));
            parameters.Add(new SqlParameter("@MedicationID", MedicationID));

            clsUtility.ExecuteSP("deleteMedication", parameters);
        }
        
        #endregion

        #region getMedications(int PatientID)
        public DataTable getMedications(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            DataTable dT = clsUtility.ExecuteSP_DataTable("getMedication", parameters);

            return dT;
        }
        
        #endregion

        #region newVitals(int PatientID, string Time, string BP, string Pulse, string Resp, string Temp, string TraumaScore)
        public void newVitals(int PatientID, string Time, string BP, string Pulse, string Resp, string Temp, string TraumaScore)
        {
            clsUtility.Connection = getConnectionString();

            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));
            parameters.Add(new SqlParameter("@Time", Time));
            parameters.Add(new SqlParameter("@BP", BP));
            parameters.Add(new SqlParameter("@Pulse", Pulse));
            parameters.Add(new SqlParameter("@Resp", Resp));
            parameters.Add(new SqlParameter("@Temp", Temp));
            parameters.Add(new SqlParameter("@TraumaScore", TraumaScore));

            clsUtility.ExecuteSP("newPatientVital", parameters);
        }
        
        #endregion

        #region deleteVitals(int PatientID, int VitalID)
        public void deleteVitals(int PatientID, int VitalID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@VitalSignID", VitalID));
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            clsUtility.ExecuteSP("deleteVitals", parameters);
        }
        
        #endregion

        #region getVitals(int PatientID)
        public DataTable getVitals(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));
            DataTable dT = clsUtility.ExecuteSP_DataTable("getVitals", parameters);

            return dT;
        }
        
        #endregion

        #region insertNewPatient(Patients pInfo)

        public int insertNewPatient(Patients pInfo)
       
       {
            clsUtility.Connection = getConnectionString();
            Type type = pInfo.GetType();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            
            foreach (PropertyInfo pi in type.GetProperties())
            {
                if (pi.GetValue(pInfo, null) == null)
                    parameters.Add(new SqlParameter("@" + pi.Name, ""));
                else
                    parameters.Add(new SqlParameter("@" + pi.Name, pi.GetValue(pInfo, null).ToString()));
            }

            parameters.Add(new SqlParameter("@EncounterStatus", "I"));
            parameters.Add(new SqlParameter("@Medic", Int32.Parse(HttpContext.Current.Session["MedicPK"].ToString())));

            int pKey = clsUtility.ExecuteSP_RETURN_VALUE("newPatient", parameters);
            return pKey;
        }
        
        #endregion

        #region updatePatient(Patients pInfo, int PatientID)
        //Updates a patients entry
        public int updatePatient(Patients pInfo, int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            Type type = pInfo.GetType();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            
            foreach (PropertyInfo pi in type.GetProperties())
            {
                if (pi.GetValue(pInfo, null) == null)
                    parameters.Add(new SqlParameter("@" + pi.Name, ""));
                else
                    parameters.Add(new SqlParameter("@" + pi.Name, pi.GetValue(pInfo, null).ToString()));
            }

            parameters.Add(new SqlParameter("@EncounterStatus", "I"));
            parameters.Add(new SqlParameter("@Medic", Int32.Parse(HttpContext.Current.Session["MedicPK"].ToString())));
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            int pKey = clsUtility.ExecuteSP_RETURN_VALUE("UpdatePatient", parameters);

            return pKey;
        }
        
        #endregion

        #region getPatientInfo(int PatientID)
        //Pulls properties for Patients object
        public DataTable getPatientInfo(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            string strProc;

            strProc = "wsGetPatientByID";
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));

            DataTable tblResults = clsUtility.ExecuteSP_DataTable(strProc, parameters);
            return tblResults;
            //Patients pinfo = new Patients();
        }
        
        #endregion

        #region LogUse(int MedicID, int ProgramID)
        public void LogUse(int MedicID, int ProgramID)
        {
            string sIPAddress;
            clsUtility.Connection = getConnectionString();
            sIPAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (sIPAddress == null)
            {
                sIPAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            string sp;
            sp = "wsAddIntranetLog";

            SqlParameter Param1 = new SqlParameter("@MedicID", MedicID);
            SqlParameter Param2 = new SqlParameter("@ProgramID", ProgramID);
            SqlParameter Param3 = new SqlParameter("@IPAddress", sIPAddress);
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(Param1);
            parameters.Add(Param2);
            parameters.Add(Param3);

            clsUtility.ExecuteSP(sp, parameters);
        }
        
        #endregion

        #region performSearch(int MedicID, string FirstName, string LastName, string SSN)
        // Returns patients' name,address,ssn,phone#,rig,and encounterdate
        public DataTable performSearch(int MedicID, string FirstName, string LastName, string SSN)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@FirstName", FirstName));
            parameters.Add(new SqlParameter("@LastName", LastName));
            parameters.Add(new SqlParameter("@SSN", SSN));
            parameters.Add(new SqlParameter("@MedicID", MedicID));
 

            DataTable dT = clsUtility.ExecuteSP_DataTable("getPatientSearch", parameters);
            return dT;
        }
        
        #endregion

        #region getEmployerInfo(int EmployerID)
        //Pulls Employers Phone Num, address, email, city,state, and zip
        public DataTable getEmployerInfo(int EmployerID)
        {
            clsUtility.Connection = getConnectionString();
           InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@EmployerID", EmployerID));
            DataTable dT = clsUtility.ExecuteSP_DataTable("getEmployerInfo", parameters);
            return dT;
        }
        
        #endregion

        #region getRigIDs()
        //Pulls all rig names and IDs
        public DataTable getRigIDs()
        {
            clsUtility.Connection = getConnectionString();
            return clsUtility.ExecuteSP_DataTable("getAllRigs", null);
        }
        
        #endregion

        #region getRigIncomplete(string MedicID)
        //Pulls Patients name and ID for the Medics Rig with an incomplete status
        public DataTable getRigIncomplete(string MedicID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@MedicID", MedicID));
            DataTable dT = clsUtility.ExecuteSP_DataTable("getRigPatients", parameters);
            return dT;
        }
        
        #endregion        

        #region getAllIncomplete()
        public DataTable getAllIncomplete()
        {
            clsUtility.Connection = getConnectionString();
            return clsUtility.ExecuteSP_DataTable("getAllPatients", null);
        }
        
        #endregion

        #region getIncompletes()
        public List<Patients> getIncompletes()
        {
            clsUtility.Connection = getConnectionString();
            List<Patients> tmpList = new List<Patients>();
            SqlDataReader sqlDR = clsUtility.ExecuteSP_DataReader("getAllPatients", null);
            while (sqlDR.Read())
            {
                Patients tmpPatient = new Patients();
                Type type = tmpPatient.GetType();
                foreach (PropertyInfo pi in type.GetProperties())
                {
                    if (sqlDR["PatientName"].ToString() != "")
                    {
                        if (pi.Name == "FirstName")
                        {
                            char[] splitter = { ',' };
                            string[] pName = sqlDR["PatientName"].ToString().Split(splitter);
                            if (pName[1] != "")
                                pi.SetValue(tmpPatient, pName[1].ToString().Trim(), null);
                        }
                        else if (pi.Name == "LastName")
                        {
                            char[] splitter = { ',' };
                            string[] pName = sqlDR["PatientName"].ToString().Split(splitter);
                            if (pName[0] != "")
                                pi.SetValue(tmpPatient, pName[0].ToString().Trim(), null);
                        }
                    }
                }
                tmpList.Add(tmpPatient);
            }
            sqlDR.Close();
            return tmpList;
        }
        
        #endregion        

        #region getEmpolyerIDs()
        //Pulls all Employers and IDs
        public DataTable getEmpolyerIDs()
        {
            clsUtility.Connection = getConnectionString();
            return clsUtility.ExecuteSP_DataTable("getAllEmployers", null);
        }
        
        #endregion

        #region getCompanyIDs()
        //Pulls all companies and ID
        public DataTable getCompanyIDs()
        {
            clsUtility.Connection = getConnectionString();
            return clsUtility.ExecuteSP_DataTable("getAllCompanys", null);
        }
        
        #endregion

        #region getStateAbbrev(int CityID)
        //Pulls all States and their Abbreviations
        public DataTable getStateAbbrev(int CityID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@CityID", CityID));
            DataTable dT = clsUtility.ExecuteSP_DataTable("getStateAbbrev", parameters);
            return dT;
        }
        
        #endregion

        #region getAllMedics()
        //Gets all medics Names and Ids
        public DataTable getAllMedics()
        {
            clsUtility.Connection = getConnectionString();
            return clsUtility.ExecuteSP_DataTable("getAllMedics", null);
        }
        
        #endregion

        #region getMedicByPatient(int PatientID)
        //Gets the patients medic
        public int getMedicByPatient(int PatientID)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@PatientID", PatientID));
            int iReturn = clsUtility.ExecuteSP_RETURN_VALUE("getMedicbyPatient", parameters);
            return iReturn;
        }
        
        #endregion

        #region getMedicInfo(string Username)
        //Gets medics rig,username,and ID
        public DataTable getMedicInfo(string Username)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@Username", Username));
            DataTable dT = clsUtility.ExecuteSP_DataTable("getMedicbyUsername", parameters);
            return dT;
        }
        
        #endregion

        #region OvertimeAdmin(string username)
        public string OvertimeAdmin(string username)
        {

            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@Username", username));
            DataSet tmpDS = clsUtility.ExecuteSP_DataSet("isAdmin", parameters);
            string tempStr = tmpDS.Tables[0].Rows[0][0].ToString();
            return tempStr;
        }
        
        #endregion

        #region JobSheetAdmin(string username)
        public string JobSheetAdmin(string username)
        {
            clsUtility.Connection = getConnectionString();
            InfiniEdge.SqlParameterCollection parameters = new InfiniEdge.SqlParameterCollection();
            parameters.Add(new SqlParameter("@Username", username));
            DataSet tmpDS = clsUtility.ExecuteSP_DataSet("isJSAdmin", parameters);
            string tempStr = tmpDS.Tables[0].Rows[0][0].ToString();
            return tempStr;
        }
        
        #endregion

    }
}

