<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PrintPreview.aspx.vb" Inherits="JobSheet.PrintPreview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Job Sheet</title>

</head>
<body>
    <form id="form1" runat="server" style="text-align:center;">
    <div style="width:900px; font-family:Arial;">
    
        <table width="100%">
            <tr>
                <td colspan="2"><img src="../../Images/Trinity_Letterhead_900.jpg" alt="Job Sheet Info" /></td>
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
                        
                            <td style="padding: 0px 0px 25px 0px;">
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

        <span id="spnServices" runat="server">
            <asp:Repeater ID="rptServices" runat="server">
                <ItemTemplate>
                    <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%">
                        <tr>
                            <td  style="padding:0px;">
                                <table cellpadding="0" cellspacing="0" style="text-align:left;" width="100%" id="tblHeliport">
                                    <tr>
                                    
                                        <td style="padding: 0px 0px 25px 0px;">
                                            <table style="padding:0px; width:100%;" width="100%" cellspacing="0">
                                                <tr>
                                                    <td style="vertical-align:top; font-weight:bold;"><%#Eval("Specialty").ToString().ToUpper()%></td>
                                                </tr>
                                                <tr id="trHeliport_Sub">
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" width="100%" style="text-align:left;">
                                                            <tr>
                                                                <td colspan="4" width="100%" style="border:black solid 1px;">Information</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="15%" style="border-left:black solid 1px;  ">Company Name:</td>
                                                                <td width="25%" style="border-right:black solid 1px;"><%#Eval("Name")%>&nbsp;</td>
                                                                <td width="15%">Contact Person:</td>
                                                                <td width="25%" style="border-right:black solid 1px; "><%#Eval("ContactFirstName")%>&nbsp;<%#Eval("ContactLastName")%>&nbsp;</td>                
                                                            </tr>
                                                            <tr>
                                                                <td width="15%" style="border-left:black solid 1px;  ">Phone Number:</td>
                                                                <td width="25%" style="border-right:black solid 1px;"><%#Eval("PhoneNumber")%>&nbsp;</td>
                                                                <td width="15%">Address:</td>
                                                                <td width="25%" style="border-right:black solid 1px; "><%#Eval("Address")%>&nbsp;</td>                
                                                            </tr>
                                                            <tr>
                                                                <td width="15%" style="border-left:black solid 1px;  ">Fax Number:</td>
                                                                <td width="25%" style="border-right:black solid 1px;"><%#Eval("FaxNumber")%>&nbsp;</td>
                                                                <td width="15%">City, State, Zip:</td>
                                                                <td width="25%" style="border-right:black solid 1px; "><%#Eval("City")%>, <%#Eval("State")%>, <%#Eval("Zip")%>&nbsp;</td>                
                                                            </tr>
                                                            <tr>
                                                                <td width="15%" style="border-left:black solid 1px;  ">Latitude:</td>
                                                                <td width="25%" style="border-right:black solid 1px;"><%#Eval("Latitude")%>&nbsp;</td>
                                                                <td width="15%">Longitude:</td>
                                                                <td width="25%" style="border-right:black solid 1px; "><%#Eval("Longitude")%>&nbsp;</td>                
                                                            </tr>
                                                            <tr>
                                                                <td width="15%" style="border-left:black solid 1px; border-bottom:black solid 1px;  ">Distance:</td>
                                                                <td style="border-right:black solid 1px; border-bottom:black solid 1px;"><%#Eval("Distance")%>&nbsp;</td>
                                                                <td style="border-bottom:black solid 1px;">Radio Frequency:</td>
                                                                <td width="25%" style="border-right:black solid 1px; border-bottom:black solid 1px; "><%#Eval("RadioFrequency")%>&nbsp;</td>                
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
                </ItemTemplate>
            </asp:Repeater>           
        </span>        
      <div style="float:left">American Claims Services</div><br /><div style="float:left">PH. (985)764-4040</div>       
        </div>
        <iframe id="HiddenPrintFrame" name="HiddenPrintFrame"  width="0" height="0" runat="server" onblur="HiddenPrintFrame.focus();">
        </iframe>

         <script type="text/javascript">

             //////////////////////////////////////////////////////////////////////
             //Create the query string and set the source of the hidden frame.
             //Use a delay to allow the frame to load without printing the page.
             //////////////////////////////////////////////////////////////////////
             function SetPrintSrc() {
                 var qstr = window.location.href + "&Print=1";

                 /*if (document.getElementById("spnLocationInformation").innerHTML == "Show") {
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
                 }*/

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
