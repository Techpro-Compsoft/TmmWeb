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
    public class MedicalInfo
    {

        #region Properties
        private string _ConsultDate;
        private string _ConsultTime;
        private int _Medic;
        private string _Transport;
        private string _Complaint;
        private string _Witness;
        private string _Results;
        private string _DepartDate;
        private string _DepartTime;
        private string _Hospital;
        private string _ArrivalDate;
        private string _ArrivalTime;
        private string _PatientHistory;
        private string _PABATTime;
        private int _MedicalConsult;
        private string _PatientStatus;
        private string _PatientOutcome;
        
        #endregion

        #region LoadObject(DataTable MedicalTable)
        public void LoadObject(DataTable MedicalTable)
        {
            if (MedicalTable.Rows.Count > 0)
            {
                Type type = this.GetType();
                foreach (DataColumn dC in MedicalTable.Columns)
                {
                    PropertyInfo pi = type.GetProperty(dC.ColumnName);
                    switch (pi.PropertyType.ToString())
                    {
                        case "System.Int32":
                            if (MedicalTable.Rows[0][dC.ColumnName].GetType().ToString() == "System.DBNull")
                                pi.SetValue(this, 0, null);
                            else
                                pi.SetValue(this, Int32.Parse(MedicalTable.Rows[0][dC.ColumnName].ToString()), null);
                            break;
                        case "System.String":
                            pi.SetValue(this, MedicalTable.Rows[0][dC.ColumnName].ToString(), null);
                            break;
                    }
                }
            }
        }
        
        #endregion

        #region ConsultDate
        public string ConsultDate
        {
            get { return _ConsultDate; }
            set { _ConsultDate = value; }
        }
        
        #endregion

        #region ConsultTime
        public string ConsultTime
        {
            get { return _ConsultTime; }
            set { _ConsultTime = value; }
        }
        
        #endregion

        #region Medic
        public int Medic
        {
            get { return _Medic; }
            set { _Medic = value; }
        }
        
        #endregion

        #region Transport
        public string Transport
        {
            get { return _Transport; }
            set { _Transport = value; }
        }
        
        #endregion

        #region Complaint
        public string Complaint
        {
            get { return _Complaint; }
            set { _Complaint = value; }
        }
        
        #endregion

        #region Witness
        public string Witness
        {
            get { return _Witness; }
            set { _Witness = value; }
        }
        
        #endregion

        #region Results
        public string Results
        {
            get { return _Results; }
            set { _Results = value; }
        }
        
        #endregion

        #region DepartDate
        public string DepartDate
        {
            get { return _DepartDate; }
            set { _DepartDate = value; }
        }
        
        #endregion

        #region DepartTime
        public string DepartTime
        {
            get { return _DepartTime; }
            set { _DepartTime = value; }
        }
        
        #endregion

        #region Hospital
        public string Hospital
        {
            get { return _Hospital; }
            set { _Hospital = value; }
        }
        
        #endregion

        #region ArrivalDate
        public string ArrivalDate
        {
            get { return _ArrivalDate; }
            set { _ArrivalDate = value; }
        }
        
        #endregion

        #region ArrivalTime
        public string ArrivalTime
        {
            get { return _ArrivalTime; }
            set { _ArrivalTime = value; }
        }
        
        #endregion

        #region PatientHistory
        public string PatientHistory
        {
            get { return _PatientHistory; }
            set { _PatientHistory = value; }
        }
        
        #endregion

        #region PABATTime
        public string PABATTime
        {
            get { return _PABATTime; }
            set { _PABATTime = value; }
        }
        
        #endregion

        #region MedicalConsult
        public int MedicalConsult
        {
            get { return _MedicalConsult; }
            set { _MedicalConsult = value; }
        }
        
        #endregion

        #region PatientStatus
        public string PatientStatus
        {
            get { return _PatientStatus; }
            set { _PatientStatus = value; }
        }
        
        #endregion

        #region PatientOutcome
        public string PatientOutcome
        {
            get { return _PatientOutcome; }
            set { _PatientOutcome = value; }
        }
        
        #endregion

    }
}
