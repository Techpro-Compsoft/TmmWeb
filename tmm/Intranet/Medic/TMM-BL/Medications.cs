using System;
using System.Collections.Generic;
using System.Text;

namespace TrinityBLO
{
    public class Medications
    {
        #region Properties
        private int _MedicationId;
        private int _PatientID;
        private string _MedicationDesc;
        private float _Dosage;
        private string _Measurement;
        
        #endregion

        #region MedicationId
        public int MedicationId
        {
            get { return _MedicationId; }
            set { _MedicationId = value; }
        }
        
        #endregion

        #region PatientID
        public int PatientID
        {
            get { return _PatientID; }
            set { _PatientID = value; }
        }
        
        #endregion

        #region MedicationDesc
        public string MedicationDesc
        {
            get { return _MedicationDesc; }
            set { _MedicationDesc = value; }
        }
        
        #endregion

        #region Dosage
        public float Dosage
        {
            get { return _Dosage; }
            set { _Dosage = value; }
        }
        
        #endregion

        #region Measurement
        public string Measurement
        {
            get { return _Measurement; }
            set { _Measurement = value; }
        }
        
        #endregion

        #region DosageAmount
        public string DosageAmount
        {
            get { return _Dosage + ' ' + _Measurement; }

        }
        
        #endregion

    }
}
