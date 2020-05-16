	<!--
	
	// validate if a drop down list has at least one value
	function isSelected( frmObj, objName ){
		if( frmObj.selectedIndex < 1 ){
			alert("Please select a " + objName + ".");
			frmObj.focus();
			return false;
		}else{
			return true;
		}
	}

	// validate whether or not a radio or checkbox group has a least one option checked
	function ScanChecked (form, element)
	{
		for(x=0; x<form.elements.length; x++)
		{
			if(form.elements[x].name == element)
			{
				if(form.elements[x].checked) return true;
			}
		}
		return false;
	}
	
	function fldEmpty(str)
	{
		if(!String(str).length) return false; else return true;
	}
	
	function zipExp(str)
	{
		/*******************************************************************

			matches 5 or 9 digit zip codes.  if 9 then there has to be a -

		*******************************************************************/

		var zip5 = new RegExp(/^[0-9]{5}$/);
		var zip9 = new RegExp(/^[0-9]{5}[- /]?[0-9]{4}$/);
		var result = zip9.exec(str);
		
		if(result == null)
		{
			result = zip5.exec(str);
			if(result == null) return false; else return true;
		}else{
			return true;
		}
	}
	
	function emailExp(str)
	{
		var email = new RegExp(/^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$/);
		var result = email.exec(str);
		
		if(result == null) return false; else return true;
	}

	// flag tells whether function should validate for AM/PM, should only be used for times
	function datetimeExp(str, flag)
	{
		/**********************************************************************************

		pattern matches 
		
		12/25/2003|||08:03:31|||02/29/2004 12 AM

		DateTime Validator. This RE validates both dates and/or times patterns. Days in Feb. 
		are also validated for Leap years. Dates: in the US mm/dd/yyyy or m/d/yy format 
		between 1/1/1600 - 12/31/9999. Leading zeroes are optional. Date separators can be 
		either matching dashes(-), slashes(/) or periods(.) Times: in the hh:MM:ss AM/PM 12 
		hour format (12:00 AM - 11:59:59 PM) or hh:MM:ss military time format 
		(00:00:00 - 23:59:59). The 12 hour time format: 1) may have a leading zero for the 
		hour. 2) Minutes and seconds are optional for the 12 hour format 3) AM or PM is 
		required and case sensitive. Military time 1) must have a leading zero for all 
		hours less than 10. 2) Minutes are manditory. 3) seconds are optional. Datetimes: 
		combination of the above formats. A date first then a time separated by a space. 
		ex) mm/dd/yyyy hh:MM:ss This RE is an extension of my Date validator already in 
		this library, so the same rules for leap year apply. All 4 digit year and all two 
		digit years except 00, which might not be a leap year. I'll also post the time 
		validator separately.

		**********************************************************************************/
		var date = new RegExp(/^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/);
		var result = date.exec(str);

		if(flag && result != null)
		{
			var tmpStr = String(str).toUpperCase();
			if(String(tmpStr).indexOf("PM") != -1 || String(tmpStr).indexOf("AM") != -1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else if(result == null)
		{
			return false; 
		}
		else
		{
			return true;
		}
	}
	
	function regMilTime(val)
	{
		var bGo = true;

		if(String(val.value).substring(0,String(val.value).length) != "0000")
		{
			/****************************** PATTERN DEFINITION *********************************/
			/* 1st class - digit one should be a 0 or 1, digit two should be a number from 0-9 */
			/* 2nd class - digit one should be a 2, digit two should be a number from 0-3		   */
			/* For 1st/2nd class digit three should be a number from 0-5, digit four should be */
			/* a number from 0-9																															 */
			/* 3rd class - entire value can only be 2400.  there can be no other combination   */
			/* of values with 24, 2400 is the only acceptable value (2400 is midnight)				 */
			/***********************************************************************************/
			var phone = new RegExp(/^(?:(?:[0-1](?:[?:0-5]|[?:0-9])|([?:2][?:0-3]))[?:0-5][?:0-9]|2400)/);
			var fldVal = val.value;
			var result = phone.exec(fldVal);
		
			if(result == null){ bGo = false; }
		}
		else
		{
			bGo = false;
		}
		
		if(!bGo){ return false; } else { return true; }
	}	

	function phoneExp(str)
	{
		/***********************************************************************
		
				expression matches 123-456-7890 or 123.456.7890

		***********************************************************************/
		var phone = new RegExp(/^(\d{3}[- \.])\d{3}[- \.]\d{4}$/);
		var result = phone.exec(str);

		if(result == null) return false; else return true;
	}
	
	function ssnExp(str)
	{
		var ssn = new RegExp(/^\d{3}-\d{2}-\d{4}$/);
		var result = ssn.exec(str);
		
		if(result == null) return false; else return true;
	}

	-->