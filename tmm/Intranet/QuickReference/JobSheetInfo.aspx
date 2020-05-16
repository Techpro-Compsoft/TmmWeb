<%@ Page Language="vb" AutoEventWireup="false" Inherits="ServiceLocator.JobSheetInfo" CodeBehind="ServiceLocator.JobSheetInfo.aspx.vb" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Job Sheet</title>
    
    <style>
    
        td
        {
            padding-left: 8px;
            padding-right: 8px;
            padding-top: 2px;
            padding-bottom: 2px;
        
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center;">
    <div style="width:900px; font-family:Arial;">
    
        <table width="100%">
            <tr>
                <td><img src="Images/Trinity_Letterhead_900.jpg" alt="Job Sheet Info" /></td>
            </tr>
            <tr>
                <td style="height:10px;"></td>
            </tr>
            <tr>
                <td align="left">Rig Name:&nbsp;<asp:Literal ID="litRigName" runat="server"></asp:Literal></td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Rig Information</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Project Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litProjectNumber" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Rig Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigPhone" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                <td style="border-right:black solid 1px;"><asp:Literal ID="litAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td>Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Facility Type:</td>
                <td style="border-right:black solid 1px;"><asp:Literal ID="litFacilityType" runat="server"></asp:Literal>&nbsp;</td>
                <td>Block:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBlock" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Latitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litLatitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Longitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litLongitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Medic 1</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litMedic1Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Email:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litMedic1Email" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Home Phone:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litMedic1HomePhone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Cell Phone:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litMedic1CellPhone" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        

        <br />

        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Medic 2</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litMedic2Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Email:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litMedic2HomePhone" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Home Phone:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litMedic2CellPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Cell Phone:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litMedic2Email" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
   
       
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Offshore Installation Manager 1</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litOIM1Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litOIM1Address" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Phone Number:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litOIM1Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litOIM1CityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
   
        <br />

        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Offshore Installation Manager 2</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litOIM2Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litOIM2Address" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Phone Number:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litOIM2Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litOIM2CityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>

        <br />
   
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Location Manager</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litLocMgrName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litLocMgrAddress" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Phone Number:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litLocMgrPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litLocMgrCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />  
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">RigComp</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litRigCompName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigCompAddress" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litRigCompPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigCompCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Fax Number:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litFax" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">&nbsp;</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">&nbsp;</td>                
            </tr>
        </table>
        
        <br />  
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Employer</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:literal ID="litEmpName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEmpAddress" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEmpPhoneNumber" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEmpCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEmpAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEmpFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Contact Name:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEmpContactName" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">&nbsp;</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">CompMan1</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litCompMan1Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litCompMan1Address" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Phone Number:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litCompMan1Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litCompMan1CityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />

        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">CompMan2</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litCompMan2Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litCompMan2Address" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Phone Number:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litCompMan2Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litCompMan2CityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Heliport</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litHeliName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litHeliAddress" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Contact Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litHeliContactName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litHeliCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litHeliPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litHeliFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litHeliLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litHeliLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Boat</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBoatName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Address:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBoatAddress" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Contact Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBoatContactName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State, Zip:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBoatCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBoatPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBoatFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litBoatLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litBoatLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">EvacNmc</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcDistance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcTime" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcCity" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcState" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacNmcLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litEvacNmcLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">EvacMC1</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1Distance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1Time" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1City" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1State" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1Fax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacMC1Longitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litEvacMC1Latitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">EvacMC2</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2Distance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2Time" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2City" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2State" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2Fax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacMC2Longitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litEvacMC2Latitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">EvacCG</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGDistance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGTime" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGCity" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGtate" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacCGLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litEvacCGLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Ambulance</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbDistance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbTime" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbCity" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbState" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litAmbLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litAmbLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Trauma Center 1</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1Distance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1Time" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1CityState" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Radio Frequency:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1RadFreq" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1Fax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litTrauma1Longitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litTrauma1Latitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Trauma Center 2</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2Name" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2Distance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2Time" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2CityState" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2Phone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Radio Frequency:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2RadFreq" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2Fax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litTrauma2Longitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litTrauma2Latitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Burn Center</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnDistance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnTime" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnCityState" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Radio Frequency:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnRadFreq" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litBurnLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litBurnLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
        
        <br />
        
        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
            <tr>
                <td colspan="4" width="100%" style="border:black solid 1px;">Clinic</td>
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicName" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Distance:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicDistance" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Time:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicTime" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">City, State:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicCityState" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Radio Frequency:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicRadFreq" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone Number:</td>
                <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                <td width="15%">Fax Number:</td>
                <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicFax" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
            <tr>
                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Longitude:</td>
                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litClinicLongitude" runat="server"></asp:Literal>&nbsp;</td>
                <td style="border-bottom:black solid 1px;">Latitude:</td>
                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litClinicLatitude" runat="server"></asp:Literal>&nbsp;</td>                
            </tr>
        </table>
         </div>
    </form>
</body>
</html>
