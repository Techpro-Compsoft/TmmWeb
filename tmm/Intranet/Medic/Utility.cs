using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mail;

namespace TrinityMedicalManagement
{
	/// <summary>
	/// Summary description for Utility.
	/// </summary>
	public class Utility
	{
		public SqlConnection oConn;

		public Utility()
		{
			//oConn = new SqlConnection("server=INFINIEDGE-CORP;uid=tmm;pwd=tmm;database=TMM");
			switch(Environment.MachineName)
			{
				case "InfiniEdge-Corp":
				case "HTX5Y21":
				case "GRQG441":
				case "917GY61":
					oConn = new SqlConnection(ConfigurationSettings.AppSettings["infiniConn"]);
					break;
				default:
					oConn = new SqlConnection(ConfigurationSettings.AppSettings["remoteConn"]);
					break;
			}
		}

		public SqlDataReader GetReader(string strSQL)
		{			
			try
			{
				SqlCommand oCmd = new SqlCommand(strSQL,oConn);
				oConn.Open();

				SqlDataReader oDR;
				oDR = oCmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

				return oDR;
			}
			catch(Exception ex)
			{
				
			}
			
		}

		public int exeCommand(string strSQL)
		{
			int intAffected;

			SqlCommand oCmd = new SqlCommand(strSQL,oConn);
			oConn.Open();
			intAffected = oCmd.ExecuteNonQuery();
			oConn.Close();

			return intAffected;
		}

		public string returnSingleVal(string strSQL)
		{
			string strVal = "";

			try
			{
				SqlDataReader oDR;
				SqlCommand oCmd = new SqlCommand(strSQL,oConn);
				oConn.Open();

				oDR = oCmd.ExecuteReader();
				if(oDR.Read())
				{
					strVal = Convert.ToString(oDR[0]);
				}
				oDR.Close();
			}
			finally
			{
				oConn.Close();
			}
			return strVal;
		}

//		public void SendEmail(string body)
//		{
//			if(Environment.MachineName == "GRQG441" || Environment.MachineName == "HTX5Y21")
//			{
//				// if testing on InfiniEdge machines use the sql stored procedure instead
//				RunEmailStoredProcedure(body);
//			}
//			else
//			{				 
//				try
//				{
//					string Recipient = "project3410@infiniedge.com, scott@infiniedge.com, latham@infiniedge.com";
//					string Sender = "tech.support@trinitymedicalmanagement.com";
//					string Subject = "Error Message of Trinity Medical Management Page"; 
//					string Server = "192.168.2.2";
//
//					// Trinity Configuration
//					MailMessage msg = new MailMessage();
//			    
//					// create the email
//					msg.To=Recipient;
//					msg.From = Sender;
//					msg.Subject = Subject;
//					msg.Body = body;
//					msg.BodyFormat = MailFormat.Text;
//
//					SmtpMail.SmtpServer = Server;
//
//					// send the email
//					SmtpMail.Send(msg);
//				}
//				catch (Exception ex)
//				{
//					System.Diagnostics.EventLog evLog = new System.Diagnostics.EventLog("Application",".","TrinityMedicalManagement");
//					evLog.WriteEntry(ex.ToString(),System.Diagnostics.EventLogEntryType.Error);
//					evLog.Close();
//				}
//			}
//		}

		public void RunEmailStoredProcedure(string body)
		{
			string mailTo;
			DataTable table = new DataTable();
			SqlCommand command;

			if(Environment.MachineName!="GRQG441" && Environment.MachineName!="HTX5Y21")
			{
				mailTo="project3410@infiniedge.com,scott@infiniedge.com";
				table  = new DataTable();
				command = new SqlCommand("sp_send_cdosysmail", oConn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add("@From", SqlDbType.VarChar).Value = "tech.support@trinitymedicalmanagement.com";
				command.Parameters.Add("@To", SqlDbType.VarChar).Value = mailTo;
				command.Parameters.Add("@Subject", SqlDbType.VarChar).Value = "Error Message of Trinity Medical Management Page";
				command.Parameters.Add("@Body", SqlDbType.VarChar).Value = body;
				SqlDataAdapter DA = new SqlDataAdapter(command);
				DA.Fill(table);
			}
			else if(Environment.MachineName!="HTX5Y21")	// Scott's machine test
			{
				mailTo="scott@infiniedge.com";
				table  = new DataTable();
				command = new SqlCommand("sp_send_cdosysmail", oConn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add("@From", SqlDbType.VarChar).Value = "tech.support@trinitymedicalmanagement.com";
				command.Parameters.Add("@To", SqlDbType.VarChar).Value = mailTo;
				command.Parameters.Add("@Subject", SqlDbType.VarChar).Value = "[Testing] Error Message of Trinity Medical Management Page";
				command.Parameters.Add("@Body", SqlDbType.VarChar).Value = body;
				SqlDataAdapter DA = new SqlDataAdapter(command);
				DA.Fill(table);
			}
			else
			{
				mailTo="scott@infiniedge.com";
				table  = new DataTable();
				command = new SqlCommand("sp_send_cdosysmail", oConn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add("@From", SqlDbType.VarChar).Value = "tech.support@trinitymedicalmanagement.com";
				command.Parameters.Add("@To", SqlDbType.VarChar).Value = mailTo;
				command.Parameters.Add("@Subject", SqlDbType.VarChar).Value = "[Testing] Error Message of Trinity Medical Management Page";
				command.Parameters.Add("@Body", SqlDbType.VarChar).Value = body;
				SqlDataAdapter DA = new SqlDataAdapter(command);
				DA.Fill(table);
			}
		}

		public string getMilitaryTime(DateTime dtTime)
		{
			string strHr = "";
			string strMin = "";
			string strTime = "";
			DateTime dtFactor = Convert.ToDateTime("12:00 PM");

			TimeSpan tsTmp = dtTime.Subtract(dtFactor);										// determine if am or pm
			if(tsTmp.Hours > -1 && tsTmp.Minutes > 59)
			{
				// the difference is greater so it's past 12:00 in the afternoon, add 12 to the hour to get the military hour
				strHr = Convert.ToString(dtTime.Hour + 12);
			}
			else
			{
				strHr = Convert.ToString(dtTime.Hour);
			}

			// hours < 10 need to have a 0 placed in front of them
			if(dtTime.Hour < 10)
			{
				strHr = "0" + Convert.ToString(dtTime.Hour);
			}

			strMin = Convert.ToString(dtTime.Minute);
			strTime = strHr + strMin;
			return strTime;
		}
	}
}
