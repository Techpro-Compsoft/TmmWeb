/****
btnSearch_ClientClick(...)
Handles the client click of btnSearch
Currently used on Admin/ServicesSearch.aspx
****/
function btnSearch_ClientClick(sender, e) 
{
    Page_ClientValidate('');

    if (RadiusIsValid() == false || Page_IsValid == false)
        return false;

    // input valid
    return true;
}


/****
RadiusIsValid(txtRadius)
Determines if the radius is valid
Currently used on Admin/ServicesSearch.aspx
(This could have been done with a range validator, but the functionality of this page should mimic the ServiceLocator page.)
****/
function RadiusIsValid() 
{
    var txtRadius = document.getElementById(GetRadiusTextboxClientID());
    
    // input should be numeric
    if (isNaN(txtRadius.value) == true)
        return false;
        
    
    var minValue = 10;
    var maxValue = 1000;
        
    // value is numeric...check that it falls in the correct range
    if (txtRadius.value < minValue || txtRadius.value > maxValue) 
    {
        // input invalid...alert user
        alert('The radius must be a number between 10 and 1000.');
    
        return false;
    }


    // input valid
    return true;
}


/****
btnSaveService_ClientClick(...)
Handles the client click event of btnSaveService
Currently used on Admin/ServiceInfo.aspx
****/
function btnSaveService_ClientClick(sender, e) 
{
    var retVal = false;
    
    // fire the ServiceInfo ValidationGroup
    Page_ClientValidate('ServiceInfo');
    retVal = Page_IsValid;
    
    // fire the LatitudeLongitude ValidationGroup
    Page_ClientValidate('LatitudeLongitude');

    // save the Page_IsValid flag only if the current retVal is false...this will keep a false value from being overwritten
    if (retVal == true)
        retVal = Page_IsValid;


    // now that the Page_IsValid flag has been obtained, fire all of the validators
    // This is done this way because the Page_ClientValidate(...) functions only display the most recently validated group.
    //      Firing the validators individually will ensure that all of the validators are displayed
    var i = 0;
    for (i = 0; i < Page_Validators.length; i++) 
    {
        ValidatorValidate(Page_Validators[i]);
    }

    return retVal;
}


/****
btnAddImage_ClientClick(...)
Handles the client click of btnAddImage
Currently used on Admin/ServiceInfo.aspx
****/
function btnAddImage_ClientClick(sender, e) 
{
    ShowUploadControl(true);

    return false;
}


/****
btnCancelUpload_ClientClick(...)
Handles the client click of btnCancelUpload
Currently used on Admin/ServiceInfo.aspx
****/
function btnCancelUpload_ClientClick(sender, e) 
{
    ShowUploadControl(false);

    // clear the file input
    ClearFileInputs(GetUploadClientID());

    // clear the text fields
    document.getElementById(GetImageNameTextboxClientID()).value = '';
    document.getElementById(GetImageDescriptionTextboxClientID()).value = '';

    return true;
}


/****
btnDelete_ClientClick(...)
Handles the client click of btnEdit (grid button)
Currently used on Admin/ServiceInfo.aspx
****/
function btnDelete_ClientClick(sender, e) 
{
    // prompt the user for delete
    var retVal = confirm('Are you sure you want to remove this image from the service\'s image list?');

    return retVal; 
}


/****
ShowUploadControl(showControl)
Shows/hides the upload control
Currently used on Admin/ServiceInfo.aspx
****/
function ShowUploadControl(showControl) 
{
    var trUpload = document.getElementById(GetUploadRowClientID());
    var trAddImage = document.getElementById(GetAddImageRowClientID());

    if (trUpload && trAddImage) 
    {
        if (showControl == true) 
        {
            trAddImage.style.display = 'none';
            trUpload.style.display = 'inline';
        }
        else 
        {
            trAddImage.style.display = 'inline';
            trUpload.style.display = 'none';
        }
    }
}


/****
btnSaveImage_ClientClick(...)
Handles the ClientClick event for btnSaveImage
Currently used on Admin/ServiceInfo.aspx
****/
function btnSaveImage_ClientClick(sender, e) 
{
    // make sure the client validators fire 
    //// (the validators do not fire correctly if the user has selected a country other than U.S.  This is probably due to the AJAX panel)
    Page_ClientValidate('ImageUpload');

    // initialize the return value
    var retVal = Page_IsValid;

    var spnImageError = document.getElementById('spnImageError');
    
    // reset the error message
    spnImageError.innerHTML = '';
    spnImageError.style.display = 'none';

    // get the upload client id
    var uploadClientId = GetUploadClientID()

    // validate the uploaded file types and set the retVal (only do validation if the input field is enabled)
    if (UploadEnabled(uploadClientId) == true) 
    {
        if (ImageIsUploaded(uploadClientId) == false) 
        {
            spnImageError.innerHTML = '* Required'
            retVal = false;
        }

        // the file type is validated in ValidateFileType (the OnClientFileSelected event function)
    }

    // show the error message, if needed
    if (retVal == false) 
    {
        spnImageError.style.display = 'block';
        ClearFileInputs(uploadClientId);
    }

    return retVal;
}


/****
HandleInvalidFileTypeError()
This function is called by the OnClientFileSelected event's function ValidateFileType
Currently used on Admin/ServiceInfo.aspx
****/
function HandleInvalidFileTypeError() 
{
    var spnImageError = document.getElementById('spnImageError');
    
    spnImageError.style.display = 'block';
    spnImageError.innerHTML = '* The image uploaded should be either a JPG or a GIF file.'
}


