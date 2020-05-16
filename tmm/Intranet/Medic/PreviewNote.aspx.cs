using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TMMModel;


namespace TrinityMedicalManagement
{
    public partial class PreviewNote : TMMPage 
    {


    #region Page_Load
		protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            litPreview.Text = BuildPreviewText();
        }
 
	#endregion 


        #region BuildPreviewText
        private string BuildPreviewText()
        {
            string previewText = GetXMLText("AddNote", "PreviewBody");

            Dictionary<string, string> replaceText = new Dictionary<string, string>();
            replaceText.Add("[PatientEncounter]", CurrentPatientEncounter.PatientID.ToString());
            replaceText.Add("[EncounterDate]", CurrentPatientEncounter.EncounterDate.Value.ToShortDateString());

			UserInfo origMedic = null;

			if (CurrentPatientEncounter.Medic.HasValue)
			{
				origMedic = GetMedicByID(CurrentPatientEncounter.Medic.Value);
			}

			if (origMedic != null)
			{
				replaceText.Add("[TrinityUser]", origMedic.UserSecurity.Username);
			}
			else
			{
				replaceText.Add("[TrinityUser]", "[N/A]");
			}

            replaceText.Add("[PatientName]", CurrentPatientEncounter.FirstName + " " + CurrentPatientEncounter.LastName);
            replaceText.Add("[WorksiteName]", CurrentRig.Name);
            replaceText.Add("[PatientAddress]", CurrentPatientEncounter.Address);
            replaceText.Add("[PatientCity]", CurrentPatientEncounter.City);
            replaceText.Add("[PatientState]", CurrentPatientEncounter.State);
            replaceText.Add("[PatientZIP]", CurrentPatientEncounter.Zip);
            replaceText.Add("[PatientCountry]", CurrentPatientEncounter.Country);
            
            if (CurrentPatientEncounter.Birthdate.HasValue)
            {
                replaceText.Add("[PatientBirthdate]", CurrentPatientEncounter.Birthdate.Value.ToShortDateString());
            }
            else
            {
                replaceText.Add("[PatientBirthdate]", "[N/A]");
            }

            replaceText.Add("[PatientAge]", CurrentPatientEncounter.Age.ToString());
            replaceText.Add("[PatientSex]", CurrentPatientEncounter.Sex);
            replaceText.Add("[PatientChiefComplaint]", CurrentPatientEncounter.Complaint);

            if (CurrentPatientNotes != null)
            {
                replaceText.Add("[MedicImpression]", CurrentPatientNotes.ImpressionNotes);
            }
            else
            {
                replaceText.Add("[MedicImpression]", "[N/A]");
            }
            
            replaceText.Add("[PatientIllnessInjuryHistory]", CurrentPatientEncounter.PatientHistory);
            replaceText.Add("[Notes]", CurrentPatientEncounter.Notes);

            previewText = ReplaceText(replaceText, previewText);
            return previewText;
        }

        #endregion
    }
}
