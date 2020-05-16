using System;
using System.Collections.Generic;
using System.Text;
using TrinityBLO;

namespace TrinityMedicalManagement
{
    public class SQLMedicNotes
    {
        DataTool dbTool = new DataTool();

        #region updateMedicNotes(MedicNotes mNote, string EncounterStatus)
        public void updateMedicNotes(MedicNotes mNote, string EncounterStatus)
        {
            dbTool.updateNote(EncounterStatus, mNote);
        }
        
        #endregion

        #region newMedicNote(MedicNotes mNote, string EncounterStatus)
        public void newMedicNote(MedicNotes mNote, string EncounterStatus)
        {
            dbTool.newNote(EncounterStatus, mNote);
        }
        
        #endregion

    }
}
