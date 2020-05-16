<%@ Control Language="vb" AutoEventWireup="false" Codebehind="progressbar.ascx.vb" Inherits="JobSheet.progressbar" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cc1" Namespace="ProgressIndicator" Assembly="ProgressIndicator" %>
<P>
	<cc1:ProgressIndicator id="ProgressIndicator5" runat="server" BoookEndStartActive="images/img_Start_o.gif"
		BoookEndFinishActive="images/img_End_o.gif" StandardDisplay="images/btn_Step1.gif,Images/btn_Step2.gif,images/btn_Step3.gif"
		SelectedDisplay="images/btn_Step1_o.gif,Images/btn_Step2_o.gif,images/btn_Step3_o.gif" UnavailableDisplay="images/btn_Step1_d.gif,Images/btn_Step2_d.gif,images/btn_Step3_d.gif"
		LinkURLs="locationinfo.aspx,locationsup.aspx,contractingcompany.aspx" Height="48px" CurrentStep="1"
		LastAvailableStep="1" BoookEndFinish="images/img_End.gif" BoookEndStart="images/img_Start.gif"></cc1:ProgressIndicator></P>
