using System;
using System.Web.UI.WebControls;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for User.
	/// </summary>
	public class User
	{
		public string strUser;

		public User(string strAuthUser)
		{
			strUser = strAuthUser;
		}

	private void FormatUser()
	{
		// find the "\" and remove everything up to that point
		// the rest of the string is the username of the person logged in
		int xPos = strUser.IndexOf("\\");
		string strTmp = strUser;

		strUser = strTmp.Substring(xPos+1, strTmp.Length-(xPos+1));
	}

		public string ReturnUser()
		{
			FormatUser();
			return strUser;
		}
	}
}
