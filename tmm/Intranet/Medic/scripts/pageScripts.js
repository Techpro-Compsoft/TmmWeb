
            function handleEnter (field, event) {
                var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
                if (keyCode == 13) {
                    var i = document.getElementById("btnSearch2");
                    i.click();
                    return false;
                } 
                else
                return true;
            }      
            
            function clearText () {
                var txtFname = document.getElementById('<%= txtFName.ClientID  %>');
                var txtLname = document.getElementById('<%= txtLName.ClientID  %>');
                var TEXTBOX1 = document.getElementById('<%= TEXTBOX1.ClientID  %>');
                txtFname.value = "";
                txtLname.value = "";
                TEXTBOX1.value = "";
            }
            
            function setCancel () {
                var Cancelbtn = document.getElementById("btnCancel");
                Cancelbtn.click();
            }
            
			function showTip(spanObj, evnt, msg)
			{		
				spanObj.innerHTML = msg;
				spanObj.className = "cssTip";
			}
			
			function hideTip(spanObj)
			{
				spanObj.innerHTML = "?";
				spanObj.className = "showTip";
			}
		
			function openWin()
			{
				var details = new String();
				details = "height=550,width=800,menubar=no,resizable=no,scrollbars=yes,status=no,toolbar=no";
				var thisPage = window.open("search.aspx", "search", details);
			}
			
			function initSpan()
			{
				var obj;
				var frm = document.forms[0];				
				var stags = document.getElementsByTagName("span");
				var spanID = new String();
				
				for( i=0; i<stags.length; i++ ){
					spanID = stags[i].id;
					if(spanID != "")
					{
						if(String(spanID).indexOf("span") != -1)
							document.getElementById(spanID).style.display = "inline";
						else if(String(stags[i].className) == "showTip")
						{
							stags[i].style.display = "none";
						}
					}
				}				
			}
			
			// function will make the help tips appear			
			function showTipLinks()
			{
				var frm = document.forms[0];				
				var stags = document.getElementsByTagName("span");
				var spanID = new String();
				
				for( i=0; i<stags.length; i++ ){
					spanID = stags[i].id;
					if(spanID != "")
					{
						if(String(spanID).indexOf("span") == -1)
							stags[i].style.display = "inline";
					}
				}				
			}
				
						
			function valForm(frm)
			{	
				
				var msg = new String();
					
				// validate the date
				if(fldEmpty(frm.txtEncounterDate.value))
				{
					if(!datetimeExp(frm.txtEncounterDate.value,0))
					{
						msg = "The date you entered is not valid.";
						showMsg(msg, frm.txtEncounterDate);
						return false;
					}
				}
				else
				{
					msg = "Please enter the encounter date.";
					showMsg(msg, frm.txtEncounterDate);
					return false;
				}
				
				// validate the time
				if(fldEmpty(frm.txtEncounterTime.value))
				{
					if(!regMilTime(frm.txtEncounterTime))
					{
						msg = "The time you entered is either incorrect or not formatted in military time. ex. 0930";
						showMsg(msg, frm.txtEncounterTime);
						return false;
					}
				}
				else
				{
					msg = "Please enter the encounter time.";
					showMsg(msg, frm.txtEncounterTime);
					return false;
				}
			
				// validate the first name field			
				if(!fldEmpty(frm.txtFirstName.value))
				{
					msg = "Please enter the patient's first name.";
					showMsg(msg, frm.txtFirstName);
					return false;
				}

				// validate the last name field			
				if(!fldEmpty(frm.txtLastName.value))
				{
					msg = "Please enter the patient's last name.";
					showMsg(msg, frm.txtLastName);
					return false;
				}
											
				// validate the rig drop down
				if(!isSelected(frm.cboRigID, "rig")){	return false; }
				
				// validate the employer drop down
				if(!isSelected(frm.cboEmployer, "employer")){	return false;	}
			
				// validate the location
				if(!fldEmpty(frm.txtLocation.value))
				{
					msg = "Please enter location of the rig";
					showMsg(msg, frm.txtLocation);
					return false;
				}
				
				// validate the drilling for drop down
				if(!isSelected(frm.cboDrillFor, "drilling for value"))
				{
					return false;
				}
								
				// these are optional validations.  if the user has entered a value in the field then 
				// they will be validated.
				if(!valOptional(frm))
				{
					return false;
				}
			}
			
			function valOptional(frm)
			{
				// if there is a value then validate it

				// validate the birth date field
				if(fldEmpty(frm.txtBirthdate.value))
				{
					if(!datetimeExp(frm.txtBirthdate.value,0))
					{
						msg = "The birth date you entered is not valid.";
						showMsg(msg, frm.txtBirthdate);
						return false;
					}
				}

				// validate the age
				if(fldEmpty(frm.txtAge.value))
				{
					if(isNaN(frm.txtAge.value)){
						msg = "Please enter a numeric value.";
						showMsg(msg, frm.txtAge);
						return false;
					}
										
					// age must > 18
					if(frm.txtAge.value < 18)
					{
						msg = "The person must be 18 or older.  Please enter a valid age.";
						showMsg(msg, frm.txtAge);
						return false;
					}
					
					// age must be < 100
					if(frm.txtAge.value > 100)
					{
						msg = "The age you entered is invalid.  Please enter the patient's age.";
						showMsg(msg, frm.txtAge);
						return false;
					}					
				}

/*
				// validate the ssn field
				if(fldEmpty(frm.txtSSN.value))
				{
					// passport numbers are only 8 digits long, with no dashes
					if(String(frm.txtSSN.value).length > 8)
					{
						if(!ssnExp(frm.txtSSN.value,0))
						{
							msg = "Please enter a valid social security number, hyphens are to be included (ie. 123-45-6789).";
							showMsg(msg, frm.txtSSN);
							return false;
						}
					}
					else if(String(frm.txtSSN.value).length == 8)
					{
						if(isNaN(frm.txtSSN.value))
						{
							msg = "Please enter a valid passport number.  This value can only be numbers, with no dashes (ie. 12345678).";
							showMsg(msg, frm.txtSSN);
							return false;
						}
					}
					else
					{
						msg = "The SSN/passport value you entered is not valid.";
						showMsg(msg, frm.txtSSN);
						return false;
					}
				}
*/				

				// validate the hire date
				if(fldEmpty(frm.txtHireDate.value))
				{
					if(!datetimeExp(frm.txtHireDate.value,0))
					{
						msg = "The hire date you entered is not valid.";
						showMsg(msg, frm.txtHireDate);
						return false;
					}
				}
				
				// validate home phone number
				if(fldEmpty(frm.txtHomePhone.value))
				{
					if(!phoneExp(frm.txtHomePhone.value))
					{
						msg = "Please enter a valid phone number.  ex.225-123-4567";
						showMsg(msg, frm.txtHomePhone);
						return false;
					}
				}
	
/*
	There are too many countries in this application to validate the various zip code formats			
				// validate zip code
				if(fldEmpty(frm.txtZip.value))
				{
					if(!zipExp(frm.txtZip.value))
					{
						msg = "Please enter a valid zip code that is 5 or 9 digits long.\nIf the value is 9 digits be sure to include the hyphen.";
						showMsg(msg, frm.txtZip);
						return false;
					}				
				}
*/
												
				// if none of these failed then return true
				return true;		
			}
			
			function showMsg(msg, frmObj)
			{
				alert(msg);
				setFocus(frmObj);
			}
			
			function setFocus(frmObj)
			{
				if(frmObj.type == "select-one" || frmObj.type == "text" || frmObj.type == "textarea")
				{
					frmObj.focus();
					frmObj.select();
				}
			}
			
			function calcAge(strDate)
			{
				var dtBDate = new Date(strDate);
				var dtNow = new Date();
				var age;

				var dblDateDiff = dtNow.getFullYear() - dtBDate.getFullYear();
				var dblMthDiff = dtNow.getMonth() - dtBDate.getMonth();

				if(document.forms[0].txtBirthdate.value != "")
				{
					if(dtBDate.getMonth() > dtNow.getMonth())
						age = dblDateDiff - 1;
					else
						age = dblDateDiff;
							
					document.forms[0].txtAge.value = age;
				}
			}
		
			function popWindow(txtObj, strHdr)
			{			
				var frm = document.forms[0];
				var strDetails = "height=430,width=570,status=no,toolbar=no,menubar=no,directories=no";
				var myWin = window.open("editTxt.aspx?fieldname=" + txtObj + "&hdr=" + strHdr, "editNotes", strDetails);				
			}	
		
		    function ShowHideDiv(originDiv,targetDiv)
		    {
		        var oDiv = document.getElementById(originDiv);
		        var tDiv = document.getElementById(targetDiv);
		        
                oDiv.style.display = "none";
                tDiv.style.display = "block";
            }

            //This function is used to validate the upload Document form
            function ValidateUploadForm(sender) {
                var ddlDocType = document.getElementById('ddlDocType');
                var txtReferenceDate = document.getElementById('rdpEncounterStartDate_dateInput_text');
                var uplDoc = document.getElementById('uplNewDocumentfile0');
                var txtDocType = document.getElementById('txtDocumentType');
                var spnDocSelectError = document.getElementById('spnDocSelectError');
                var spnDateError = document.getElementById('spnDateError');
                var spnDocTypeError = document.getElementById('spnDocTypeError');
                var validForm = true;

                if (ddlDocType.value == "Select Document Type") {
                    alert("Please select a document type from the list.");
                    validForm =  false;
                } else {
                    if (ddlDocType.value == "AddType") {
                        if (txtDocType.value == "") {
                            spnDocTypeError.style.cssText = "display:inline; color:Red;"
                            validForm = false;
                        } else {
                            spnDocTypeError.style.cssText = "display:none; color:Red;"
                        }
                    }
                }
                var dateValid = /((0?[13578]|10|12)(-|\/)((0?[0-9])|([12])([0-9]?)|(3[01]?))(-|\/)((\d{4})|(\d{2}))|(0?[2469]|11)(-|\/)((0?[0-9])|([12])([0-9]?)|(3[0]?))(-|\/)((\d{4}|\d{2})))/.test(txtReferenceDate.value);
                if (!dateValid) {
                    spnDateError.style.cssText = "display:inline; color:Red;"
                    validForm = false;
                } else {
                    spnDateError.style.cssText = "display:none; color:Red;"
                }

                if (uplDoc.value == "") {
                    alert("Please browse your computer and choose a document to upload.");
                    validForm = false;
                }
                

                return validForm;
            }

            /****
            IncreaseFileInputWidth(radUpload, args)
            This function modifies the size of the <input type="file" ... /> control on the page.
            Currently used on Admin/AddService.aspx
            ****/
            function increasingFileInputWidth(radUpload, args) {
                //If the Checkboxes in RadUpload are not visible, change the index to 0
                var cell = args.Row.cells[1];
                var inputs = document.getElementsByTagName('INPUT');
                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].type == "file") {
                        //Set the size property according to your preference
                        inputs[i].size = 33;
                    }
                }
            }


            /************************************************************/
            /*  CheckTextBoxMaxLength(testString, maxLength, showAlert) */
            /*  Determines if the provided textbox value's length       */
            /*      is shorter than the specified maxLength,            */
            /*      trims the textbox's value to the specified          */
            /*      maxLength, and alerts the user, if needed.          */
            /*      the string to the maxLength                         */
            /*  Author: Terry Guarisco, Jr.                             */
            /************************************************************/
            function CheckTextBoxMaxLength(textbox, maxLength, showAlert) {
                try {
                    // validate textbox
                    if (textbox == null)
                        throw 'The provided textbox is null.';

                    // validate maxLength
                    if (maxLength == null || maxLength < 0)
                        throw 'maxLength is required and cannot be less than zero.';

                    // initialize showAlert, if needed
                    if (showAlert == null)
                        showAlert = false;


                    // check max length
                    if (textbox.value.length > maxLength) {
                        textbox.value = textbox.value.substr(0, maxLength);

                        // alert user.  Try using the  browser alert
                        alert('Maximum number of characters has been reached.');
                        return false;
                    }
                    
                }
                catch (ex) {
                    alert(ex);
                }
            }

            /****
            MaxLengthPaste(field)
            This function checks to see if the value being paste into the textarea exceeds the maxlength.
            ****/
            function MaxLengthPaste(field) {
                var valid = true;
                
                if ((field.value.length + window.clipboardData.getData("Text").length) >= 500) {
                    valid = false;
                }
                
                var AdminCount = document.getElementById('lblAdminCharCount');
                var PhysicianCount = document.getElementById('lblPhysicianCharCount');
                var MedicCount = document.getElementById('lblMedicCharCount');
                var EditCount = document.getElementById('lblEditCharCount');

                if (AdminCount) {
                    AdminCount.innerHTML = "Message Length: " + field.value.length;
                    AdminCount.style.color = 'Black';
                }

                if (PhysicianCount) {
                    PhysicianCount.innerHTML = "Message Length: " + field.value.length;
                    PhysicianCount.style.color = 'Black';
                }

                if (MedicCount) {
                    MedicCount.innerHTML = "Message Length: " + field.value.length;
                    MedicCount.style.color = 'Black';
                }

                if (EditCount) {
                    EditCount.innerHTML = "Message Length: " + field.value.length;
                    EditCount.style.color = 'Black';
                }
                
                event.returnValue = valid;
            }

            /****
            MaxPasteLength(field, maxLength)
            This function checks to see if the value being paste into the textarea exceeds the maxlength.
            ****/
            function MaxPasteLength(field, maxLength) {
                event.returnValue = false;

                if ((field.value.length + window.clipboardData.getData("Text").length) > maxLength) {
                    return false;
                }
                event.returnValue = true;
            }