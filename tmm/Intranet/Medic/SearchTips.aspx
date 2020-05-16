<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchTips.aspx.cs" Inherits="TrinityMedicalManagement.SearchTips" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Search Tips</title>
    <LINK href="trinity.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="black">
    <form id="form1" runat="server">
    <div>
        <span class="WhiteText">
        <b>Do you need help finding the information you are looking for? Listed below are some fundamental tips and guidelines geared toward helping you find the specific information you want.</b>
        <br /><br />
        <b>First Name</b> – If you know some or all of the patient’s first name you are looking for, entering it will help to narrow down your search.
        <br /><br />
        <b>Last Name</b> – If you know some or all of the patient’s last name you are looking for, entering it will help to narrow down your search.
        <br /><br />
        <b>Worksite</b> – The default worksite selected is “All”. You do have the option to select a particular worksite if you know which worksite the patient was on when the encounter occurred.
        <br /><br />
        <b>SSN</b> – If you know some or all of the social security number of the patient you are looking for, entering it will help to narrow down your search.
        <br /><br />
        <b>Encounter Date Range</b> – This range will be defaulted to display thirty (30) days from the current date. You may choose to display a larger or smaller date range if necessary.
        <br /><br />
        </span>
    </div>
    </form>
</body>
</html>
