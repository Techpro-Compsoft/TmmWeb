<%
'   If Request.ServerVariables("SERVER_PORT")=80 Then
      Dim strSecureURL
      strSecureURL = "https://www.trinitymedicalmanagement.com/Intranet/index.html"
      'strSecureURL = strSecureURL & Request.ServerVariables("SERVER_NAME")
      'strSecureURL = strSecureURL & Request.ServerVariables("URL")     
      
      Response.Redirect strSecureURL
'   End If
%>

<html>

<head>
	<title>Trinity Medical Management Intranet Console</title>
	
	<link href="trinity.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0" bgcolor="#000000">

	<center>
		<table width="760" height="100%" cellpadding="0" cellspacing="0" border="0" class="SmallBorder">
			<tr height="151" valign="top">
				<td><img src="images/Grphc_TopBar.jpg" width="760" height="151"></td>
			</tr>
			<tr>
				<td valign="top">
					<table width="100%" class="MenuBar">
						<tr>
							<td>
								<a href="Medic/" class="MenuLnk">Patient Encounter</a> | <a href="PatientTest/" class="MenuLnk">
									Generate Test</a> | <a href="QuickReference/" class="MenuLnk">Quick Reference</a> | <a href="MyAccount/" class="MenuLnk">My Account</a> | <a href="Jobsheet/" class="MenuLnk">Job Sheet</a> | <a href="ServiceLocator/" class="MenuLnk">Service Locator</a>									
							<!---
								<input type="button" name="btnEncounter" onClick="location.href='Medic/';" value=" Patient Encounter " style="width:175px; background-color:#FFFFFF; color:#000000; border:1px solid #000000; font-weight:bold; font-size:12px;">&nbsp;
								<input type="button" name="btnTest" onClick="location.href='PatientTest/';" value=" Generate Test " style="width:175px; background-color:#FFFFFF; color:#000000; border:1px solid #000000; font-weight:bold; font-size:12px;">
							--->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr valign="bottom">
				<td><img src="images/Grphc_BotBar.jpg" width="760" height="31"></td>
			</tr>
		</table>
	</center>

</body>

</html>