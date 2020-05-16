using System;
using System.Data.SqlClient;
using System.Web;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Logs use of program to IntranetLog
	/// </summary>
	public class LogVisit
	{
		private InfiniEdge.SQL clsUtility;
		private InfiniEdge.Encryption enc = new InfiniEdge.Encryption();
		private System.Collections.Specialized.NameValueCollection Config  = System.Configuration.ConfigurationManager.AppSettings;

		public LogVisit()
		{
			// initialize the utility class with the encrypted connection string
			switch(Environment.MachineName)
			{
				case "InfiniEdge-Corp":
				case "HTX5Y21":
				case "GRQG441":
				case "917GY61":
				case "INFINIEDGE-DEV":
					clsUtility = new InfiniEdge.SQL(enc.SimpleCrypt(Config["infiniConn"]));
					break;
				default:
					clsUtility = new InfiniEdge.SQL(enc.SimpleCrypt(Config["remoteConn"]));
					break;
			}
		}

		public void LogUse(int MedicID, int ProgramID)
		{
			string sIPAddress;
		
			sIPAddress = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
			if(sIPAddress == null)
			{ 
				sIPAddress = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
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
	}
}
