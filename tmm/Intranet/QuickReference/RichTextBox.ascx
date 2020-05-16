<%@ Register TagPrefix="cc2" Namespace="EnhancedTextBox" Assembly="EnhancedTextBox" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="RichTextBox.ascx.vb" Inherits="QuickReference.RichTextBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<SPAN ID="spanBG" STYLE="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: black 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; BORDER-LEFT: black 1px solid; WIDTH: 150px; PADDING-TOP: 5px; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: silver">
	<CC2:RICHTEXTBOX ID="rcTextBox" RUNAT="server" DEFAULTHTML="Default Text" WIDTH="725px" HEIGHT="400px"></CC2:RICHTEXTBOX><BR>
</SPAN>
<SCRIPT LANGUAGE="javascript">
	/***********************************************
	This script can be called in the parent window's
	onload window.  If the user navigated off the 
	parent page the data in the editable iframe was
	lost.  This script will repopulate the data if 
	the user chooses to click on their browser back 
	button.	
	************************************************/
	function loadHTML(frm)
	{
		var objFrame = document.frames[0];			// the editable iframe object

		//alert(frm.txtSrc.value);
		//return false; 
		
		// the hidden field that holds the value of the iframe
		if(frm.txtSrc.value.length > 0)
		{
			//objFrame.document.body.innerHTML = unescape(frm.txtSrc.value);
			objFrame.document.body.innerHTML = frm.txtSrc.value;
		}
	}	
</SCRIPT>
