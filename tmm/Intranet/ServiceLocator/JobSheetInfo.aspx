<%@ Page Language="vb" AutoEventWireup="false" Inherits="ServiceLocator.JobSheetInfo" CodeBehind="ServiceLocator.JobSheetInfo.aspx.vb" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Job Sheet</title>

</head>
<body>
    <form id="form1" runat="server" style="text-align:center;">
    <div style="width:900px; font-family:Arial;">
    
        <table width="100%">
            <tr>
                <td colspan="2"><img src="Images/Trinity_Letterhead_900.jpg" alt="Job Sheet Info" /></td>
            </tr>
            <tr>
                <td style="height:10px;" colspan="2"></td>
            </tr>
            <tr>
                <td align="left">Rig Name:&nbsp;<asp:Literal ID="litRigName" runat="server"></asp:Literal></td>
                <td align="right"><asp:Literal ID="litPrintDate" runat="server"></asp:Literal>&nbsp;<asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="SetPrintSrc(); return false;" /></td>
            </tr>
        </table>


        <table cellpadding="0" cellspacing="0" style="text-align:left; " width="100%">
            <tr>
                <td style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblLocationInformation">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdLocationInformation_ShowHide">
                                <span id="spnLocationInformation" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('LocationInformation')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">LOCATION INFORMATION</td>
                                    </tr>
                                    <tr id="trLocationInformation_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Rig Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Project Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litProjectName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litLatitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Project Number:</td>
                                                    <td style="border-right:black solid 1px;"><asp:Literal ID="litProjectNumber" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td>Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Facility Type:</td>
                                                    <td style="border-right:black solid 1px;"><asp:Literal ID="litFacilityType" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td>Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigPhone" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; ">Block:</td>
                                                    <td style="border-right:black solid 1px; "><asp:Literal ID="litBlock" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td>Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;  "><asp:Literal ID="litAltPhone" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">
                                                        &nbsp;</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litRigFax" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Trinity Personnel #1</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litMedic1Name" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Email:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litMedic1Email" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; ">Home Phone:</td>
                                                    <td style="border-right:black solid 1px;"><asp:Literal ID="litMedic1HomePhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td>Cell Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litMedic1CellPhone" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Work Schedule:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litMedic1WorkSchedule" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Trinity Personnel #2</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litMedic2Name" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Email:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litMedic2HomePhone" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; ">Home Phone:</td>
                                                    <td style="border-right:black solid 1px;"><asp:Literal ID="litMedic2CellPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td>Cell Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;  "><asp:Literal ID="litMedic2Email" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Work Schedule:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litMedic2WorkSchedule" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Offshore Installation Manager #1</td>
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
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Offshore Installation Manager #2</td>
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
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Rig Company</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litRigCompName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Corporate Contact:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigCompCorporateContact" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litRigCompPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Address:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litRigCompAddress" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Fax Number:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">City, State, Zip:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litRigCompCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>                            
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
      
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblContractingCompany">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdContractingCompany_ShowHide">
                                <span id="spnContractingCompany" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('ContractingCompany')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">CONTRACTING COMPANY</td>
                                 </tr>
                                    <tr id="trContractingCompany_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Employer</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:literal ID="litEmpName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Contact Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEmpContactName" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEmpPhoneNumber" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Address:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEmpAddress" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEmpAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">City, State, Zip:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEmpCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Fax Number:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEmpFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Company Man #1</td>
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
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Company Man #2</td>
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
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
       
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblHeliport">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdHeliport_ShowHide">
                                <span id="spnHeliport" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('Heliport')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">HELIPORT</td>
                                    </tr>
                                    <tr id="trHeliport_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litHeliName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Contact Person:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litHeliContactName" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litHeliPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Address:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litHeliAddress" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litHeliFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">City, State, Zip:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litHeliCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Latitude:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litHeliLatitude" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litHeliLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblBoatDock">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdBoatDock_ShowHide">
                                <span id="spnBoatDock" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('BoatDock')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">BOAT DOCK</td>
                                 </tr>
                                    <tr id="trBoatDock_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBoatName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Contact Person:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBoatContactName" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBoatPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Address:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBoatAddress" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBoatFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">City, State, Zip:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBoatCityStateZip" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Latitude:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litBoatLatitude" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litBoatLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
  
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblMedEvac1">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdMedEvac1_ShowHide">
                                <span id="spnMedEvac1" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('MedEvac1')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">MED-EVAC (NON-MEDICALLY CONFIGURED)</td>
                                 </tr>
                                    <tr id="trMedEvac1_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcDistance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcTime" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcLatitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacNmcFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacNmcLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacNmcCity" runat="server"></asp:Literal>,&nbsp;<asp:Literal ID="litEvacNmcState" runat="server"></asp:Literal></td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblMedEvac2">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdMedEvac2_ShowHide">
                                <span id="spnMedEvac2" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('MedEvac2')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">MED-EVAC (MEDICALLY CONFIGURED)</td>
                                 </tr>
                                    <tr id="trMedEvac2_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1Name" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1Distance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1Phone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1Time" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1Latitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC1Fax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC1Longitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacMC1City" runat="server"></asp:Literal>,&nbsp<asp:Literal ID="litEvacMC1State" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblMedEvac3">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdMedEvac3_ShowHide">
                                <span id="spnMedEvac3" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('MedEvac3')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">MED-EVAC (MEDICALLY CONFIGURED, ALTERNATIVE)</td>
                                 </tr>
                                    <tr id="trMedEvac3_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2Name" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2Distance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2Phone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2Time" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2Latitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacMC2Fax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacMC2Longitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State :</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacMC2City" runat="server"></asp:Literal>,&nbsp;<asp:Literal ID="litEvacMC2State" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblMedEvac4">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdMedEvac4_ShowHide">
                                <span id="spnMedEvac4" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('MedEvac4')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">MED-EVAC (US COAST GUARD)</td>
                                 </tr>
                                    <tr id="trMedEvac4_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGDistance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGTime" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGLatitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litEvacCGFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litEvacCGLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litEvacCGCity" runat="server"></asp:Literal>,&nbsp;<asp:Literal ID="litEvacCGtate" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblAmbulance">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdAmbulance_ShowHide">
                                <span id="spnAmbulance" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('Ambulance')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">AMBULANCE (CLOSEST TO DOCK)</td>
                                 </tr>
                                    <tr id="trAmbulance_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbDistance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbTime" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbLatitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litAmbFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litAmbLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litAmbCity" runat="server"></asp:Literal>,&nbsp;<asp:Literal ID="litAmbState" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">&nbsp;</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; ">
                                                        &nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
       
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblHospital1">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdHospital1_ShowHide">
                                <span id="spnHospital1" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('Hospital1')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">HOSPITAL (TRAUMA CENTER, CLOSEST)</td>
                                 </tr>
                                    <tr id="trHospital1_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1Name" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1Distance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1Phone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1Time" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1Latitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma1Fax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma1Longitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litTrauma1CityState" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Radio Frequency:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litTrauma1RadFreq" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblHospital2">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdHospital2_ShowHide">
                                <span id="spnHospital2" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('Hospital2')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">HOSPITAL (TRAUMA CENTER, CLOSEST ALTERNATIVE)</td>
                                 </tr>
                                    <tr id="trHospital2_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2Name" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2Distance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2Phone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2Time" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2AltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2Latitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litTrauma2Fax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litTrauma2Longitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litTrauma2CityState" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Radio Frequency:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litTrauma2RadFreq" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
   
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblHospital3">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdHospital3_ShowHide">
                                <span id="spnHospital3" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('Hospital3')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">HOSPITAL (BURN CENTER, CLOSEST)</td>
                                 </tr>
                                    <tr id="trHospital3_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnDistance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnTime" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnLatitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litBurnFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litBurnLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litBurnCityState" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Radio Frequency:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litBurnRadFreq" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>       
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
 
        <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
            <tr>
                <td  style="padding:0px;">
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblClinic">
                        <tr>
                            <td style="width:45px; vertical-align:top; text-align:center;" id="tdClinic_ShowHide">
                                <span id="spnClinic" style="text-decoration:underline; cursor:pointer;" onclick="ToggleTables('Clinic')">Hide</span>
                            </td>
                        
                            <td style="padding: 0px 0px 25px 0px;">
                                <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align:top; font-weight:bold;">CLINIC (CLOSEST)</td>
                                 </tr>
                                    <tr id="trClinic_Sub">
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                <tr>
                                                    <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicName" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Distance:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicDistance" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Time:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicTime" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Alternate Phone:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicAltPhone" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Latitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicLatitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                    <td width="25%" style="border-right:black solid 1px;"><asp:Literal ID="litClinicFax" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td width="15%">Longitude:</td>
                                                    <td width="25%" style="border-right:black solid 1px; "><asp:Literal ID="litClinicLongitude" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                                <tr>
                                                    <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">City, State:</td>
                                                    <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><asp:Literal ID="litClinicCityState" runat="server"></asp:Literal>&nbsp;</td>
                                                    <td style="border-bottom:black solid 1px;">Radio Frequency:</td>
                                                    <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><asp:Literal ID="litClinicRadFreq" runat="server"></asp:Literal>&nbsp;</td>                
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
         </div>
         <iframe id="HiddenPrintFrame" name="HiddenPrintFrame"  width="0" height="0" runat="server" onblur="HiddenPrintFrame.focus();">
			</iframe>
         
         <script type="text/javascript">

             //////////////////////////////////////////////////////////////////////
             //Hides or shows the table based on the link 
             //clicked on by the user
             //////////////////////////////////////////////////////////////////////
             function ToggleTables(tblName) {
                 
                 if (tblName == "LocationInformation") {
                     if (document.getElementById("spnLocationInformation").innerHTML == "Show") {
                         document.getElementById("trLocationInformation_Sub").style.display = "";
                         document.getElementById("spnLocationInformation").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trLocationInformation_Sub").style.display = "none";
                         document.getElementById("spnLocationInformation").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "ContractingCompany") {
                    if (document.getElementById("spnContractingCompany").innerHTML == "Show") {
                         document.getElementById("trContractingCompany_Sub").style.display = "";
                         document.getElementById("spnContractingCompany").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trContractingCompany_Sub").style.display = "none";
                         document.getElementById("spnContractingCompany").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "Heliport") {
                     if (document.getElementById("spnHeliport").innerHTML == "Show") {
                         document.getElementById("trHeliport_Sub").style.display = "";
                         document.getElementById("spnHeliport").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trHeliport_Sub").style.display = "none";
                         document.getElementById("spnHeliport").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "BoatDock") {
                     if (document.getElementById("spnBoatDock").innerHTML == "Show") {
                         document.getElementById("trBoatDock_Sub").style.display = "";
                         document.getElementById("spnBoatDock").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trBoatDock_Sub").style.display = "none";
                         document.getElementById("spnBoatDock").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "MedEvac1") {
                     if (document.getElementById("spnMedEvac1").innerHTML == "Show") {
                         document.getElementById("trMedEvac1_Sub").style.display = "";
                         document.getElementById("spnMedEvac1").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trMedEvac1_Sub").style.display = "none";
                         document.getElementById("spnMedEvac1").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "MedEvac2") {
                     if (document.getElementById("spnMedEvac2").innerHTML == "Show") {
                         document.getElementById("trMedEvac2_Sub").style.display = "";
                         document.getElementById("spnMedEvac2").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trMedEvac2_Sub").style.display = "none";
                         document.getElementById("spnMedEvac2").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "MedEvac3") {
                     if (document.getElementById("spnMedEvac3").innerHTML == "Show") {
                         document.getElementById("trMedEvac3_Sub").style.display = "";
                         document.getElementById("spnMedEvac3").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trMedEvac3_Sub").style.display = "none";
                         document.getElementById("spnMedEvac3").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "MedEvac4") {
                     if (document.getElementById("spnMedEvac4").innerHTML == "Show") {
                         document.getElementById("trMedEvac4_Sub").style.display = "";
                         document.getElementById("spnMedEvac4").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trMedEvac4_Sub").style.display = "none";
                         document.getElementById("spnMedEvac4").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "Ambulance") {
                     if (document.getElementById("spnAmbulance").innerHTML == "Show") {
                         document.getElementById("trAmbulance_Sub").style.display = "";
                         document.getElementById("spnAmbulance").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trAmbulance_Sub").style.display = "none";
                         document.getElementById("spnAmbulance").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "Hospital1") {
                    if (document.getElementById("spnHospital1").innerHTML == "Show") {
                        document.getElementById("trHospital1_Sub").style.display = "";
                        document.getElementById("spnHospital1").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trHospital1_Sub").style.display = "none";
                         document.getElementById("spnHospital1").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "Hospital2") {
                     if (document.getElementById("spnHospital2").innerHTML == "Show") {
                         document.getElementById("trHospital2_Sub").style.display = "";
                         document.getElementById("spnHospital2").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trHospital2_Sub").style.display = "none";
                         document.getElementById("spnHospital2").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "Hospital3") {
                     if (document.getElementById("spnHospital3").innerHTML == "Show") {
                         document.getElementById("trHospital3_Sub").style.display = "";
                         document.getElementById("spnHospital3").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trHospital3_Sub").style.display = "none";
                         document.getElementById("spnHospital3").innerHTML = "Show";
                     }
                 }
                 else if (tblName == "Clinic") {
                     if (document.getElementById("spnClinic").innerHTML == "Show") {
                         document.getElementById("trClinic_Sub").style.display = "";
                         document.getElementById("spnClinic").innerHTML = "Hide";
                     }
                     else {
                         document.getElementById("trClinic_Sub").style.display = "none";
                         document.getElementById("spnClinic").innerHTML = "Show";
                     }
                 }
             }

             //////////////////////////////////////////////////////////////////////
             //Create the query string and set the source of the hidden frame.
             //Use a delay to allow the frame to load without printing the page.
             //////////////////////////////////////////////////////////////////////
             function SetPrintSrc() {
                 var qstr = window.location.href + "&Print=1";

                 if (document.getElementById("spnLocationInformation").innerHTML == "Show") {
                     qstr = qstr + "&A=0";
                 }
                 if (document.getElementById("spnContractingCompany").innerHTML == "Show") {
                     qstr = qstr + "&B=0";
                 }
                 if (document.getElementById("spnHeliport").innerHTML == "Show") {
                     qstr = qstr + "&C=0";
                 }
                 if (document.getElementById("spnBoatDock").innerHTML == "Show") {
                     qstr = qstr + "&D=0";
                 }
                 if (document.getElementById("spnMedEvac1").innerHTML == "Show") {
                     qstr = qstr + "&E=0";
                 }
                 if (document.getElementById("spnMedEvac2").innerHTML == "Show") {
                     qstr = qstr + "&F=0";
                 }
                 if (document.getElementById("spnMedEvac3").innerHTML == "Show") {
                     qstr = qstr + "&G=0";
                 }
                 if (document.getElementById("spnMedEvac4").innerHTML == "Show") {
                     qstr = qstr + "&H=0";
                 }
                 if (document.getElementById("spnAmbulance").innerHTML == "Show") {
                     qstr = qstr + "&I=0";
                 }
                 if (document.getElementById("spnHospital1").innerHTML == "Show") {
                     qstr = qstr + "&J=0";
                 }
                 if (document.getElementById("spnHospital2").innerHTML == "Show") {
                     qstr = qstr + "&K=0";
                 }
                 if (document.getElementById("spnHospital3").innerHTML == "Show") {
                     qstr = qstr + "&L=0";
                 }
                 if (document.getElementById("spnClinic").innerHTML == "Show") {
                     qstr = qstr + "&M=0";
                 }

                 window.frames["HiddenPrintFrame"].location.href = qstr;

                 HiddenPrintFrame.focus();
                 //Delay the print dialog so that the page can load before it gets printed
                 setTimeout("HiddenPrintFrame.print(); ", 1000)
             }

             //////////////////////////////////////////////////////////////////////
             //Sets up the page on page load based on the query stirng.
             //This is used for the actual version of the page that gets printed
             //////////////////////////////////////////////////////////////////////
             function setShowHide() {

                 if (querySt("Print") == "1") {
                 
                     if (querySt("A") == "0") { document.getElementById("tblLocationInformation").style.display = "none"; }
                     if (querySt("B") == "0") { document.getElementById("tblContractingCompany").style.display = "none"; }
                     if (querySt("C") == "0") { document.getElementById("tblHeliport").style.display = "none"; }
                     if (querySt("D") == "0") { document.getElementById("tblBoatDock").style.display = "none"; }
                     if (querySt("E") == "0") { document.getElementById("tblMedEvac1").style.display = "none"; }
                     if (querySt("F") == "0") { document.getElementById("tblMedEvac2").style.display = "none"; }
                     if (querySt("G") == "0") { document.getElementById("tblMedEvac3").style.display = "none"; }
                     if (querySt("H") == "0") { document.getElementById("tblMedEvac4").style.display = "none"; }
                     if (querySt("I") == "0") { document.getElementById("tblAmbulance").style.display = "none"; }
                     if (querySt("J") == "0") { document.getElementById("tblHospital1").style.display = "none"; }
                     if (querySt("K") == "0") { document.getElementById("tblHospital2").style.display = "none"; }
                     if (querySt("L") == "0") { document.getElementById("tblHospital3").style.display = "none"; }
                     if (querySt("M") == "0") { document.getElementById("tblClinic").style.display = "none"; }

                     document.getElementById("tdLocationInformation_ShowHide").style.display = "none";
                     document.getElementById("tdContractingCompany_ShowHide").style.display = "none";
                     document.getElementById("tdHeliport_ShowHide").style.display = "none";
                     document.getElementById("tdBoatDock_ShowHide").style.display = "none";
                     document.getElementById("tdMedEvac1_ShowHide").style.display = "none";
                     document.getElementById("tdMedEvac2_ShowHide").style.display = "none";
                     document.getElementById("tdMedEvac3_ShowHide").style.display = "none";
                     document.getElementById("tdMedEvac4_ShowHide").style.display = "none";
                     document.getElementById("tdAmbulance_ShowHide").style.display = "none";
                     document.getElementById("tdHospital1_ShowHide").style.display = "none";
                     document.getElementById("tdHospital2_ShowHide").style.display = "none";
                     document.getElementById("tdHospital3_ShowHide").style.display = "none";
                     document.getElementById("tdClinic_ShowHide").style.display = "none";

                     document.getElementById('<% = btnPrint.ClientID %>').style.display = "none";

                     
                 }
             }

             //////////////////////////////////////////////////////////////////////
             //Get the querystring from the address bar
             //////////////////////////////////////////////////////////////////////
             function querySt(str) {
                 var addr = window.location.search.substring(1);
                 var arry = addr.split("&");
                 for (i = 0; i < arry.length; i++) {
                     var element = arry[i].split("=");
                     if (element[0] == str) {
                         return element[1];
                     }
                 }
             }


            //On load of the page, set the page up.
            setShowHide();
         
         </script>
    </form>
</body>
</html>
