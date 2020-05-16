/************************************/
/*  CompareDates(date1, date2)      */
/*  Compares two Date objects       */
/*  Returns 1 if date1 > date2,     */
/*          -1 if date1 < date2,    */
/*          0 if date1 == date2     */
/*  Author: Terry Guarisco, Jr.     */
/************************************/
function CompareDates(date1, date2)
{
    // check the year
    if ((date1.getFullYear() * 1) > (date2.getFullYear() * 1))
        return 1;   // date1 > date2
    
    else if ((date1.getFullYear() * 1) < (date2.getFullYear() * 1))
        return -1;  // date1 < date2
    
    
    // the years are equal...check the month
    if ((date1.getMonth() * 1) > (date2.getMonth() * 1))
        return 1;   // date1 > date2
        
    else if ((date1.getMonth() * 1) < (date2.getMonth() * 1))
        return -1;  // date1 < date2
    
    
    // the years and months are equal...check the day
    if ((date1.getDate() * 1) > (date2.getDate() * 1))
        return 1;   // date1 < date2
        
    else if ((date1.getDate() * 1) < (date2.getDate() * 1))
        return -1;  // date1 > date2
    
    // the dates are equal
    return 0;
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
function CheckTextBoxMaxLength(textbox, maxLength, showAlert)
{
    try
    {
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
        if (textbox.value.length > maxLength)
        {
            textbox.value = textbox.value.substr(0, maxLength);
        
            // alert user.  Try using the rad alert first
            if (window.radalert)
            {            
                // alert user only if the alert is not already displayed
                if (document.getElementById('RadWindowContentFrameAlert') == null)
                    radalert('Maximum number of characters has been reached.', '300px', '100px', 'ATTENTION');   
            }
            else
            {
                // rad alert not available.  use browser alert
                alert('Maximum number of characters has been reached.');                
            }
        }
    }
    catch (ex)
    {
        alert(ex);
    }
}


/************************************/
/*  StringIsNullOrEmpty(testString) */
/*  Determines if the provided      */
/*      string is null or empty     */
/*  Returns true if null or empty   */
/*          false otherwise         */
/*  Author: Terry Guarisco, Jr.     */
/************************************/
function StringIsNullOrEmpty(testString)
{
    return (testString == null || testString.length < 1);
}


/*
**  Returns the browser being used
*/
function GetBrowser() 
{
    var agt=navigator.userAgent.toLowerCase();
    
    if (agt.indexOf("opera") != -1) return 'Opera';
    
    if (agt.indexOf("staroffice") != -1) return 'Star Office';
    
    if (agt.indexOf("webtv") != -1) return 'WebTV';
    
    if (agt.indexOf("beonex") != -1) return 'Beonex';
    
    if (agt.indexOf("chimera") != -1) return 'Chimera';
    
    if (agt.indexOf("netpositive") != -1) return 'NetPositive';
    
    if (agt.indexOf("phoenix") != -1) return 'Phoenix';
    
    if (agt.indexOf("firefox") != -1) return 'Firefox';
    
    if (agt.indexOf("safari") != -1) return 'Safari';
    
    if (agt.indexOf("skipstone") != -1) return 'SkipStone';
    
    if (agt.indexOf("msie") != -1) return 'Internet Explorer';
    
    if (agt.indexOf("netscape") != -1) return 'Netscape';
    
    if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla';
        
    if (agt.indexOf('\/') != -1) 
    {
        if (agt.substr(0,agt.indexOf('\/')) != 'mozilla')
            return navigator.userAgent.substr(0,agt.indexOf('\/'));
        else 
            return 'Netscape';
    } 
    else if (agt.indexOf(' ') != -1)
        return navigator.userAgent.substr(0,agt.indexOf(' '));
    else 
        return navigator.userAgent;
}


/*
**  Returns the caret (cursor) position of the specified text field.
**  Return value range is 0-oField.length.
*/
function GetCaretPosition (oField) {

 // Initialize
 var iCaretPos = 0;

 // IE Support
 if (document.selection) { 

   // Set focus on the element
   oField.focus ();

   // To get cursor position, get empty selection range
   var oSel = document.selection.createRange ();

   // Move selection start to 0 position
   oSel.moveStart ('character', -oField.value.length);

   // The caret position is selection length
   iCaretPos = oSel.text.length;
 }

 // Firefox support
 else if (oField.selectionStart || oField.selectionStart == '0')
   iCaretPos = oField.selectionStart;

 // Return results
 return (iCaretPos);
}


/*
**  Sets the caret (cursor) position of the specified text field.
**  Valid positions are 0-oField.length.
*/
function SetCaretPosition (oField, iCaretPos) {

 // IE Support
 if (document.selection) { 

   // Set focus on the element
   oField.focus ();

   // Create empty selection range
   var oSel = document.selection.createRange ();

   // Move selection start and end to 0 position
   oSel.moveStart ('character', -oField.value.length);

   // Move selection start and end to desired position
   oSel.moveStart ('character', iCaretPos);
   oSel.moveEnd ('character', 0);
   oSel.select ();
 }

 // Firefox support
 else if (oField.selectionStart || oField.selectionStart == '0') {
   oField.selectionStart = iCaretPos;
   oField.selectionEnd = iCaretPos;
   oField.focus ();
 }
}


/****
RemoveHTML(textbox)
Removes the html from the provided textbox, if needed
****/
function RemoveHTML(textbox, evt) {
    if (textbox == null)
        return;

    var charCode = (evt.which) ? evt.which : evt.keyCode

    if (charCode == 190) // greater than (>)
        textbox.value = StripHTML(textbox.value);
}


/****
StripHTML(htmlString)
Strips the HTML and Javascript from the provided string
****/
function StripHTML(htmlString)
{
    // validate input
    if (StringIsNullOrEmpty(htmlString) == true)
        return htmlString;
        
    // input valid, strip characters
    return htmlString.replace(/(<([^>]+)>)/ig, '');
}


/****
String.prototype.trim
provides a trim method for the String object
****/
String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}


/****
String.prototype.trim
provides a left trim method for the String object
****/
String.prototype.ltrim = function() {
	return this.replace(/^\s+/,"");
}


/****
String.prototype.trim
provides a right trim method for the String object
****/
String.prototype.rtrim = function() {
	return this.replace(/\s+$/,"");
}


/****
MaxLength(field)
This function checks to see if the characters entered by the user exceeds the max length, then imposes
a Max Length on the textarea.
****/
function MaxLength(field)
{
    if(field.value.length >= 500) 
    {
        return false;
    }
}  


/****
MaxLengthPaste(field, maxLength)
This function checks to see if the value being paste into the textarea exceeds the maxlength.
****/
function MaxLengthPaste(field, maxLength)
{
    event.returnValue = false;
    
    if((field.value.length + window.clipboardData.getData("Text").length) > maxLength) 
    {
        return false;
    }
    event.returnValue = true;
}


/****
TextMaxLength(obj, maxLength, evt)
determines if the max length has been reached
****/
function TextMaxLength(obj, maxLength, evt)
{
    var charCode = (evt.which) ? evt.which : evt.keyCode
    var max = maxLength - 1;
    var text = obj.value;
    
    if(text.length > max)
    {
        // 8 is backspace, 9 is horizontal tab, 127 is delete
        var ignoreKeys = [8, 9, 127];
        for(i = 0; i<ignoreKeys.length; i++)
        {
            if(charCode==ignoreKeys[i])
                return true;
        }
        return false;
    }
    else
        return true;
} 


/****
FixTextarea(obj)
This function sets the textbox's value to the max length substring
****/
function FixTextarea(textbox, maxLength)
{
    if (textbox.value.length > maxLength)
        textbox.value = textbox.value.substring(0, maxLength - 1);
}


/****
ClearFileInputs()
uploadControlClientID (Required) : the ClientID of the telerik upload control
This function clears the upload file inputs
****/
function ClearFileInputs(uploadControlClientID) 
{
    // validate input    
    if (StringIsNullOrEmpty(uploadControlClientID) == true)
        throw 'The uploadControlClientID provided is null or empty.';

    // get the upload control.  
    var uploadControl = GetRadUpload(uploadControlClientID);

    // validate upload control
    if (uploadControl == null || uploadControl == 'undefined')
        throw 'The upload control with the provided client ID was not found.';
        
    // get the input count
    var fileInputCount = uploadControl.GetFileInputs().length;

    if (fileInputCount > 0) 
    {
        for (var i = 0; i < fileInputCount; i++) 
        {
            uploadControl.ClearFileInputAt(i);
        }
    }
    
}


/****
IncreaseFileInputWidth(radUpload, args)
This function modifies the size of the <input type="file" ... /> control on the page.
****/
function IncreaseFileInputWidth(radUpload, args) 
{
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


/****
ValidateFileType(radUpload, args)
This OnClientFileSelected event function determines if the selected file is valid AND clears the inputs
ALSO, the user is alerted if a function named HandleInvalidFileTypeError(), is defined
****/
function ValidateFileType(radUpload, args) 
{
    // validate extension(s)
    if (radUpload.ValidateExtensions() == false) 
    {
        // extension(s) invalid...clear the file input(s)
        var fileInputs = radUpload.GetFileInputs();
        for (var i = 0; i < fileInputs.length; i++) 
        {
            if (fileInputs[i].id == args.FileInputField.id) 
            {
                radUpload.ClearFileInputAt(i);
                break;
            }
        }

        // handle the error if the function is available
        if (typeof HandleInvalidFileTypeError == 'function')
            HandleInvalidFileTypeError();
    }
}


/************************************/
//  GetRadUploadByClientID(uploadControlClientID)
//  Gets the radUpload control
//  uploadControlClientID (Required) : the ClientID of the telerik upload control
//  Returns the radUpload control if found, throws an exception otherwise
//  Author: Terry Guarisco, Jr.     
/************************************/
function GetRadUploadByClientID(uploadControlClientID) 
{
    // validate input    
    if (StringIsNullOrEmpty(uploadControlClientID) == true)
        throw 'The uploadControlClientID provided is null or empty.';

    // get the upload control.  
    var uploadControl = GetRadUpload(uploadControlClientID);

    // validate upload control
    if (uploadControl == null || uploadControl == 'undefined')
        throw 'The upload control with the provided client ID was not found.';

    return uploadControl;
}


/************************************/
//  ImageIsUploaded(uploadControlClientID)
//  Determines if an image was uploaded or not
//  uploadControlClientID (Required) : the ClientID of the telerik upload control
//  Returns true if a file was chosen to be uploaded, false otherwise
//  Author: Terry Guarisco, Jr.     
/************************************/
function ImageIsUploaded(uploadControlClientID) 
{
    // get the control
    var uploadControl = GetRadUploadByClientID(uploadControlClientID);

    // determine if at least one image was uploaded
    for (var i = 0; i < uploadControl.GetFileInputs().length; i++) 
    {
        if (uploadControl.GetFileInputs()[i].value != '')
            return true;
    }

    // no image was uploaded
    return false;
}


/****
UploadEnabled(uploadControlClientID)
uploadControlClientID: the ClientID of the telerik upload control
Determines if the upload control is enabled
Author: Terry Guarisco, Jr.
****/
function UploadEnabled(uploadControlClientID) 
{
    var uploadControl = GetRadUploadByClientID(uploadControlClientID);

    for (var i = 0; i < uploadControl.GetFileInputs().length; i++) 
    {
        if (uploadControl.GetFileInputs()[i].disabled == false)
            return true;
    }

    return false;
}


// DEPRECATED...USE THE ValidateFileType FUNCTION AS THE OnClientFileSelected EVENT OF THE UPLOAD CONTROL
/************************************/
//  ValidateFileTypes(uploadControlClientID)
//  Validates the file type of the file being uploaded (for the telerik upload control).
//  uploadControlClientID (Required) : the ClientID of the telerik upload control
//  Returns true if the uploaded file's type is valid or no file was uploaded      
//  Author: Terry Guarisco, Jr.     
/************************************/
//function ValidateFileTypes(uploadControlClientID) 
//{
//    // get the control
//    var uploadControl = GetRadUploadByClientID(uploadControlClientID);

//    var validFileType = false;

//    // validate the extensions 
//    validFileType = uploadControl.ValidateExtensions()

//    // reset the control, if needed
//    if (validFileType == false) 
//        ClearFileInputs(uploadControlClientID);

//    return validFileType;
//}



/*************************************/
// IsNumericInput_KeyPress(sender, e)
// Determines if the key pressed is numeric
// returns true if the key pressed is numeric, false otherwise
/*************************************/
function IsNumericInput_KeyPress(sender, e) 
{
    var charCode = (e.which) ? e.which : e.keyCode
    var text = '';

    if (e.type == 'paste' && window.clipboardData.getData("Text") != null)
        text = window.clipboardData.getData("Text")
    else if (e.type == 'keypress')
        text = sender.value;

    // 8 is backspace, 9 is horizontal tab, 127 is delete
    // 48 -> 57 is 0 -> 9, respectivelyz
    var ignoreKeys = [8, 9, 127, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57];
    for (i = 0; i < ignoreKeys.length; i++) 
    {
        if (charCode == ignoreKeys[i])
            return true;
    }
    return false;
}


/*************************************/
// IsNumericInput_Paste(sender, e)
// Determines if the data being pasted is numeric
// returns true if the data being pasted is numeric, false otherwise
// Author: Terry Guarisco, Jr.
/*************************************/
function IsNumericInput_Paste(sender, e) 
{
    var text = window.clipboardData.getData("Text");
        
    if (text == null)
        return false;

    return !isNaN(text);
}


/*************************************/
// FixNumericInput(sender, e, maxValue)
// maxValue : the maximum value for the field
// Disallows the user from entering data greater or less than the maxValue or minValue, respectively
// Author: Terry Guarisco, Jr.
/*************************************/
function FixNumericInput(sender, e, maxValue) 
{
    // correct the text, if needed    
    if (isNaN(sender.value))
        sender.value = minValue.toString();

    // if input value is greater than the maximum value, reset input to max value
    if ((sender.value * 1) > maxValue)
        sender.value = maxValue.toString();
}


/*******************************************/
// DateStringIsValidDate(testDateString)
// testDateString : the string to test for the existence of a valid date
// Returns true if the provided string is a valid date, false otherwise
// Author: Terry Guarisco, Jr.
// To Improve: This function could be improved drastically by using a regular expression.  This function can currently be incorrect in special cases.
/*******************************************/
function DateStringIsValidDate(testDateString) 
{
    // make sure a string was provided
    if (StringIsNullOrEmpty(testDateString) == true)
        return false;

    // remove any dashes, slashes, and non-numeric charecters and test the length
    return (testDateString.replace('-', '').replace('-', '').replace('/', '').replace('/', '').replace(/^\s+|\s+$/g, '').length > 0);
}