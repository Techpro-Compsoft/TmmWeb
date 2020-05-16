
    //This function checks to see if the characters entered by the user exceeds the max length, then imposes
    //a Max Length on the textarea.
    function maxLength(field)
    {
        if(field.value.length >= 50) 
        {
            return false;
        }
    }  
    
    //This function checks to see if the value being paste into the textarea exceeds the maxlength.
    function maxLengthPaste(field)
    {
        event.returnValue=false;
        if((field.value.length +  window.clipboardData.getData("Text").length) > 50) 
        {
            return false;
        }
        event.returnValue=true;
    }
    
    function textMaxLength(obj, maxLength, evt)
    {
        var charCode=(evt.which) ? evt.which : event.keyCode
        var max = maxLength - 0;
        var text = obj.value;
        if(text.length > max)
        {
            var ignoreKeys = [8,127];
            for(i=0;i<ignoreKeys.length;i++)
            {
                if(charCode==ignoreKeys[i])
                {
                    return true;
                }
            }
            return false;
        }
        else
        {
            return true;
        }
    } 
    
    function FixTextarea(obj)
    {
        if (obj.value.length > 50)
        {
            obj.value = obj.value.substring(0,50);
        }
    }