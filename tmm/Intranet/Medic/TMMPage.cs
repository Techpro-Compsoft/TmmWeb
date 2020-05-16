using System;
using System.Web;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using TrinityBLO;
using TMMModel;
using System.Linq;
using System.Xml.Linq;
using System.Xml;
using System.Xml.XPath;


namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for TMMPage.
	/// </summary>
	public class TMMPage : SecurityBasePage
	{
		protected bool AppMode;


		public TMMPage()
		{
			AppMode = Convert.ToBoolean(Convert.ToInt16(ConfigurationManager.AppSettings["appmode"]));

        }

        #region + Members

        private Patient _currentPatientEncounter;
        private PatientNotes _currentPatientNotes;
        private TrinityClassLibrary_BL.Rig _currentRig;
        private MedicSecurityLevel _currentMedicSecurityLevel;
        private List<int> _securableRights;
        private Dictionary<string, string> _customerEmails;

        #endregion

        #region + Properties

        #region CustomerEmails
        public Dictionary<string, string> CustomerEmails
        {
            get {
                Dictionary<string, string> cEmails = Session["efCustomerEmails"] as Dictionary<string, string>;
                if (_customerEmails == null || _customerEmails.Count == 0)
                {
                    if (cEmails != null)
                    {
                        _customerEmails = cEmails;
                    }
                    else
                    {
                        _customerEmails = new Dictionary<string, string>();
                    }
                }
                return _customerEmails;
            }
            set { 
                _customerEmails = value;
                Session["efCustomerEmails"] = value;
            }
        }

        
        #endregion

        #region SecurableRights
        public List<int> SecurableRights
        {
          get 
          { 
              List<int> securables =  Session["SecurableRights"] as List<int>;
              
              if (securables == null)
              {
                  securables = new List<int>();
                  
                  using (TMM_DEPLOYEntities ef =new TMM_DEPLOYEntities())
                  {
                      var sec = (from u_s in ef.User_Securable 
                              where u_s.UserID == currentUserInfo.ID  
                              select u_s.SecurableID);

                     securables.AddRange(sec);
                  }

                  Session["SecurableRights"] = securables ;
                  _securableRights = securables ;
              } else {
                  _securableRights = securables  ;
              }

              return _securableRights;
          }
        }

        #endregion

        #region CurrentPatientEncounter
        public Patient CurrentPatientEncounter
        {
            get
            {
                if (_currentPatientEncounter == null)
                {
                    Patient efPatient = Session["efPatient"] as Patient;
                    if (efPatient != null)
                    {
                        _currentPatientEncounter = efPatient;
                    }

                    // Get the patient information from session.
                    TrinityClassLibrary_BL.Patient p = (TrinityClassLibrary_BL.Patient)Session["Patient"];
                    
                    if (p != null && efPatient == null)
                    {
                        Patient pInfo = new Patient();
                        TMM_DEPLOYEntities tEntities = new TMM_DEPLOYEntities();

                        var q = (from c in tEntities.Patient
                                 where c.PatientID == p.PatientID
                                 select c).FirstOrDefault();
                        tEntities.Detach(q);
                        Session["efPatient"] = q;
                        _currentPatientEncounter = q;
                    }
                }

                return _currentPatientEncounter;
            }
        }
        #endregion

        #region CurrentPatientNotes
        public PatientNotes CurrentPatientNotes
        {
            get
            {
                PatientNotes efNotes = Session["PatientNote"] as PatientNotes;
                if (efNotes != null)
                {
                    _currentPatientNotes = efNotes;
                }

                if (efNotes == null)
                {
                    using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                    {
                        var q = (from pn in ef.PatientNotes
                                 where pn.PatientID == CurrentPatientEncounter.PatientID
                                 select pn).FirstOrDefault ();

                        Session["PatientNote"] = q;
                        _currentPatientNotes = q;
                    }

                }
                return _currentPatientNotes;
            }
        }
        #endregion

        #region Rig
        public TrinityClassLibrary_BL.Rig CurrentRig
        {
            get
            {

                if (_currentRig == null) {
                    TrinityClassLibrary_BL.Rig rig = Session["PatientRig"] as TrinityClassLibrary_BL.Rig ;

                    if (rig != null)
                    {
                        _currentRig = rig ;
                    } else {
                        if (!CurrentPatientEncounter.RigID.HasValue)
                            _currentRig = TrinityClassLibrary_DAL.RigProvider.Fetch(CurrentPatientEncounter.RigID.Value);
                    }
                }

                Session["PatientRig"] = _currentRig ;
                return _currentRig;
            }
        }
        // Get the patient's rig information from session.

        #endregion

        #region UploadLocation
        protected string UploadLocation
        {
            get { return ConfigurationManager.AppSettings["UploadLocation"]; }
        } 
        #endregion

        #region PatientEncounterLocation
        protected string PatientEncounterLocation
        {
            get { return ConfigurationManager.AppSettings["PatientEncounterLocation"]; }
        }
        #endregion

        #region currentUserInfo
        public  UserInfo currentUserInfo
        {
            get
            {
                if (Session["CurrentUserInfo"] == null)
                {
                    string  cUserName = HttpContext.Current.User.Identity.Name;
                    using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                    {
                        var q = (from cUser in ef.UserInfo  
                                where cUser.UserSecurity.Username == cUserName
                                 select cUser).FirstOrDefault();
                        
                        q.UserTypeReference.Load();
                        q.UserSecurityReference.Load();

                        Session["CurrentUserInfo"] = q;
                        
                        return q;
                    }
                }
                return (UserInfo)Session["CurrentUserInfo"];
            }

        }

        #endregion

        #region IsAdminUser
        /// <summary>
        /// Determines if the current user is an Admin
        /// </summary>
        /// <returns></returns>
        public bool IsAdminUser
        {
            get 
            {
                
                if (Session["PE_UserIsAdmin"] == null)
                {
                    using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
                    {
                        var q = (from c in ef.User_Securable 
                                 where c.UserID == currentUserInfo.ID &&
                                 c.SecurableID == (int) Securable.Securables.PatientEncounterAdmin &&
                                 c.Active ==true 
                                 select c);
                        if (q.Count() > 0)
                        {
                            Session["PE_UserIsAdmin"] = true;
                            return true;
                        }
                    }
                }
                else
                {
                    bool isAdmin = (bool)Session["PE_UserIsAdmin"];
                    return isAdmin;
                }
                
                Session["PE_UserIsAdmin"] = false ;
                return false;
            }
        }
        #endregion


        public MedicSecurityLevel CurrentMedicSecurityLevel
        {
            get 
            {
                if (_currentMedicSecurityLevel == MedicSecurityLevel.NONE )
                {
                    if (Session["CurrentMedicSecurityLevel"] != null)
                    {
                        MedicSecurityLevel medSecLevel = (MedicSecurityLevel)Session["CurrentMedicSecurityLevel"];
                        if (medSecLevel == MedicSecurityLevel.NONE)
                        {
                            _currentMedicSecurityLevel = GetMedicSecurityLevel();
                        }
                        else
                        {
                            _currentMedicSecurityLevel = medSecLevel;
                        }
                    }
                    else
                    {
                        _currentMedicSecurityLevel =  GetMedicSecurityLevel();
                        Session["CurrentMedicSecurityLevel"] = _currentMedicSecurityLevel;
                    }
                }
                return _currentMedicSecurityLevel; 
            }
            set 
            { 
                _currentMedicSecurityLevel = value;
                Session["CurrentMedicSecurityLevel"] = value;
            }
        }

        #endregion

        #region + Enums

        #region LocationType
        public enum LocationType : int 
        {
            Trinity = 0,
            Laptop = 1
        }
        #endregion


        #region MedicSecurityLevel
		public enum MedicSecurityLevel
        {
            NONE = 0,
            Medic = 1,
            Physician = 2,
            Admin = 3,
            Customer = 4
        } 
	    #endregion


#region PhoneTypeEnum 
        /// <summary>
        /// contains the phone types (this enum should reflect the values in the PhoneType table)
        /// </summary>
        public enum PhoneTypeEnum : int 
        {
            None = 0,
            Home = 1,
            Cell = 2,
            Other = 3,
            Fax = 4,
            Main = 5,
            Work = 6
        }

#endregion


        #endregion

        #region + Methods


        #region ClearSessions

        public void ClearSessions()
        {
            Session.Remove("PE_UserIsAdmin");
            Session.Remove("PatientRig");
            Session.Remove("PatientNote");
            Session.Remove("efPatient");
            CurrentMedicSecurityLevel = MedicSecurityLevel.NONE;
            CustomerEmails = null;
        }

        #endregion


        #region GetXMLText
        /// <summary>
        /// Gets text from a XML file
        /// </summary>
        /// <param name="pageName"></param>
        /// <param name="pageSection"></param>
        /// <returns></returns>
        public static string GetXMLText(string pageName, string pageSection)
        {
            string xPathExp = "/Pages/Page[@id='" + pageName + "']/Section[@id='" + pageSection + "']";

            XPathDocument doc = new XPathDocument(HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings.Get("XMLPath")));

            string xmlText = doc.CreateNavigator().SelectSingleNode(xPathExp).Value;

            return xmlText;
        }
        
        #endregion

        
        #region ReplaceText
        /// <summary>
        /// Replaces text in a string
        /// </summary>
        /// <param name="replaceVariables"></param>
        /// <param name="xmlText"></param>
        /// <returns></returns>
        public static string ReplaceText(Dictionary<string, string> replaceVariables, string xmlText)
        {
            foreach (KeyValuePair<string, string> rVar in replaceVariables)
            {
                xmlText = xmlText.Replace(rVar.Key, rVar.Value);
            }

            return xmlText;

        }

        #endregion

        
        #region GetMedicByID
        /// <summary>
        /// Gets a medics userinfo based on their ID
        /// </summary>
        /// <param name="medicID"></param>
        /// <returns></returns>
        public UserInfo GetMedicByID(int medicID) {
            using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
            {
                var q = (from medic in ef.UserInfo
                         where medic.ID == medicID
                         select medic);

                if (q.Count() < 0)
                {
                    q = (from medic in ef.UserInfo
                         where medic.OldMedicID == medicID
                         select medic);
                }

                UserInfo uInfo = q.FirstOrDefault();
                if (uInfo != null)
                {
                    uInfo.UserSecurityReference.Load();
                    uInfo.UserTypeReference.Load();
                }
                return uInfo;

            }
        }

        #endregion


        #region GetCompanyUsers
        /// <summary>
        /// Gets a list Company users with an email
        /// </summary>
        /// <param name="RigID"></param>
        /// <returns></returns>
        public List<UserInfo> GetCompanyUsers(int RigID)
        {
            List<UserInfo> cUsers = new List<UserInfo>();
            using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
            {
                var custID = (from d in ef.Customer_Worksite
                              where d.RigID == RigID
                              select d.CustomerID).FirstOrDefault();

                var uInfo = (from c in ef.UserInfo
                             where c.CustomerID.Value == custID &&
                             c.Email != null &&
                             c.Email != string.Empty

                             select c);

                cUsers.AddRange(uInfo);
            }

            return cUsers;
        }
        #endregion


        #region GetNotifyUsers
        /// <summary>
        /// Returns a list of users with the ReceiveDocumentNotification Securable for a customer
        /// </summary>
        /// <param name="RigID"></param>
        /// <returns></returns>
        public List<UserInfo> GetNotifyUsers(int RigID)
        {
            List<UserInfo> cUsers = new List<UserInfo>();
            using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
            {
                var custID = (from d in ef.Customer_Worksite
                              where d.RigID == RigID
                              select d.CustomerID).FirstOrDefault();

                var uInfo = (from c in ef.User_Securable.Include("UserInfo")
                             where c.SecurableID == (int)Securable.Securables.ReceiveAdditionalNoteNotification &&
                                  c.UserInfo.CustomerID.Value == custID &&
                                  c.UserInfo.Email != null &&
                                  c.UserInfo.Email != string.Empty
                                  select c.UserInfo);

                cUsers.AddRange(uInfo);
            }

            return cUsers;
        }
        #endregion


        #region GetMedicSecurityLevel
        /// <summary>
        /// Returns the current medics security level
        /// </summary>
        /// <returns></returns>
        public MedicSecurityLevel GetMedicSecurityLevel()
        {

            MedicSecurityLevel medicLevel = MedicSecurityLevel.NONE ;
            if (currentUserInfo.UserType.ID == (int)UserType.Types.Customer) medicLevel = MedicSecurityLevel.Customer ;
            if (currentUserInfo.UserType.ID == (int)UserType.Types.Medic) medicLevel = MedicSecurityLevel.Medic;
            if ((from c in SecurableRights
                 select c).Contains((int)Securable.Securables.NotesPhysician)) medicLevel = MedicSecurityLevel.Physician;
            if ((from c in SecurableRights
                 select c).Contains((int)Securable.Securables.PatientEncounterAdmin)) medicLevel = MedicSecurityLevel.Admin;
            
            return medicLevel;
        }

        #endregion


        #region GetAllMedics
        public List<UserInfo> GetAllMedics()
        {
            List<UserInfo> medics = new List<UserInfo>();

            using (TMM_DEPLOYEntities ef = new TMM_DEPLOYEntities())
            {
                var m = (from med in ef.UserInfo
                         where med.Active == true && med.UserType.ID == (int)UserType.Types.Medic &&
                         (med.FirstName != string.Empty && med.LastName != string.Empty) 
                         orderby med.LastName 
                         select med);
                medics.AddRange(m);
            }
            return medics;
        }
        #endregion

        #endregion
    }
}
