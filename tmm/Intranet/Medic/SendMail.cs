using System;
using System.Web.Mail;
using System.Configuration;
using System.Net.Mail;

public class SendMail
{
	public SendMail()
	{

	}

    //public void SendEmail(string body)
    //{
    //    try
    //    {
    //        string Recipient = "wade.facundus@infiniedge.com";
    //        string Sender = "tech.support@trinitymedicalmanagement.com";
    //        string Subject = "Error Message of Trinity Medical Management - Test Generation"; 
    //        string Server = "192.168.2.2";

    //        // Trinity Configuration
    //        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            			
    //        // create the email
    //        msg.To.Add(Recipient);
    //        msg.From = new System.Net.Mail.MailAddress(Sender);
    //        msg.Subject = Subject;
    //        msg.Body = body;
    //        msg.IsBodyHtml = false;

    //        System.Net.Mail.SmtpClient oSMTP = new System.Net.Mail.SmtpClient(Server);

    //        // send the email
    //        oSMTP.Send(msg);
    //    }
    //    catch (Exception ex)
    //    {
    //        System.Diagnostics.EventLog evLog = new System.Diagnostics.EventLog("Application",".","TrinityMedicalManagement");
    //        evLog.WriteEntry(ex.ToString(),System.Diagnostics.EventLogEntryType.Error);
    //        evLog.Close();
    //    }
    //}

    public void SendEmail(System.Net.Mail.MailMessage mailMsg)
    {
        try
        {
            string Server = ConfigurationManager.AppSettings["EmailServer"].ToString();
            System.Net.Mail.SmtpClient oSMTP = new System.Net.Mail.SmtpClient(Server);
            string Sender = ConfigurationManager.AppSettings["SupportEmail"].ToString();
            mailMsg.Sender = new MailAddress(Sender);
            mailMsg.From = new System.Net.Mail.MailAddress(Sender);
            // send the email
            oSMTP.Send(mailMsg);

        }
        catch (Exception ex)
        {
            //System.Diagnostics.EventLog evLog = new System.Diagnostics.EventLog("Application", ".", "TrinityMedicalManagement");
            //evLog.WriteEntry(ex.ToString(), System.Diagnostics.EventLogEntryType.Error);
            System.Net.Mail.MailMessage errMsg = new System.Net.Mail.MailMessage();
            System.Text.StringBuilder errMailMsg = new System.Text.StringBuilder();
            errMailMsg.Append(ex.ToString());
            errMailMsg.Append("<br>Sender:" + mailMsg.Sender.Address  );
            errMailMsg.Append("<br>To Address: " + mailMsg.To[0].Address);
            errMailMsg.Append("<br>From Address: " + mailMsg.From.Address);

            errMsg.Body = errMailMsg.ToString();
            errMsg.To.Add(ConfigurationManager.AppSettings["SendErrorEmailToAddress"].ToString());
            
            string Server = ConfigurationManager.AppSettings["EmailServer"].ToString();
            System.Net.Mail.SmtpClient oSMTP = new System.Net.Mail.SmtpClient(Server);
            string Sender = ConfigurationManager.AppSettings["SupportEmail"].ToString();

            errMsg.Subject = "Error Sending Document Upload Notification.";
            errMsg.From = new System.Net.Mail.MailAddress(Sender);
            // send the email
            oSMTP.Send(errMsg);

            //evLog.Close();

        }
    }
}
