Imports TrinityHelp.Help
Partial Class NavigationMenu
    Inherits System.Web.UI.UserControl

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

#Region " Class_Variables "
    Protected clsUtility As InfiniEdge.SQL
    Protected clsEncrypt As New InfiniEdge.Encryption
    Protected Config As New System.Collections.Specialized.NameValueCollection(ConfigurationSettings.AppSettings)
#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '  clsUtility = New InfiniEdge.SQL(Application("ConnectionString").ToString())
        'Put user code to initialize the page here
        '  Me.CreateMenu()
    End Sub

    ' creates the navigation menu.
    Private Sub CreateMenu()
        Dim trMenu As TableRow = New TableRow
        Dim tcMenu As TableCell = New TableCell

        Dim lnkPatient As HyperLink = New HyperLink
        lnkPatient.CssClass = "MenuLnk"
        lnkPatient.NavigateUrl = "/Intranet/"
        lnkPatient.Text = "Home"

        Dim lblPipe As Label = New Label
        lblPipe.Text = "&nbsp;|&nbsp;"

        tcMenu.Controls.Add(lnkPatient)
        tcMenu.Controls.Add(lblPipe)

        Dim lnkEnc As HyperLink = New HyperLink
        lnkEnc.CssClass = "MenuLnk"
        lnkEnc.Text = "Patient Encounter"
        lnkEnc.NavigateUrl = "/Intranet/Medic"

        Dim lblPipeEnc As Label = New Label
        lblPipeEnc.Text = "&nbsp;|&nbsp;"

        tcMenu.Controls.Add(lnkEnc)
        tcMenu.Controls.Add(lblPipeEnc)

        Dim lnkPrint As HyperLink = New HyperLink
        lnkPrint.CssClass = "MenuLnk"
        lnkPrint.Text = "Generate Test"
        lnkPrint.NavigateUrl = "/Intranet/PatientTest/"

        Dim lblPipePrint As Label = New Label
        lblPipePrint.Text = "&nbsp;|&nbsp;"

        tcMenu.Controls.Add(lnkPrint)
        tcMenu.Controls.Add(lblPipePrint)

        Dim lnkQuickRef As HyperLink = New HyperLink
        lnkQuickRef.CssClass = "MenuLnk"
        lnkQuickRef.Text = "Quick Reference"
        lnkQuickRef.NavigateUrl = "/Intranet/QuickReference/"

        Dim lblPipe3 As Label = New Label
        lblPipe3.Text = "&nbsp;|&nbsp;"

        tcMenu.Controls.Add(lnkQuickRef)
        tcMenu.Controls.Add(lblPipe3)

        Dim lnkMyAcct As HyperLink = New HyperLink
        lnkMyAcct.CssClass = "MenuLnk"
        lnkMyAcct.Text = "My Account"
        lnkMyAcct.NavigateUrl = "/Intranet/MyAccount/"

        lblPipe = New Label
        lblPipe.Text = "&nbsp;|&nbsp;"

        tcMenu.Controls.Add(lnkMyAcct)
        tcMenu.Controls.Add(lblPipe)

        Dim blnIsAdmin As String
        Dim strAdminSQL As String
        Dim strUserName As String
        strUserName = HttpContext.Current.User.Identity.Name
        Dim intUserNamePos As Integer = InStr(strUserName, "\")
        Dim intUserNameLength As Integer = strUserName.Length
        strUserName = Right(strUserName, intUserNameLength - intUserNamePos)

        strAdminSQL = "SELECT dbo.Medic.OvertimeRpt FROM dbo.Medic WHERE dbo.Medic.UserName = '" + strUserName + "'"
        blnIsAdmin = clsUtility.GetSingleValue(strAdminSQL)
        If blnIsAdmin = "" Or IsDBNull(blnIsAdmin) Then blnIsAdmin = "False"

        blnIsAdmin = System.Convert.ToBoolean(blnIsAdmin)

        If blnIsAdmin Then
            Dim lblPipe4 As Label = New Label
            lblPipe4.Text = "&nbsp;|&nbsp;"

            Dim lnkAdmin As HyperLink = New HyperLink
            lnkAdmin.CssClass = "MenuLnk"
            lnkAdmin.Text = "Overtime Reports"
            lnkAdmin.NavigateUrl = "/Intranet/MyAccount/searchovertime.aspx"
            tcMenu.Controls.Add(lnkAdmin)
            tcMenu.Controls.Add(lblPipe4)
        End If

        Dim lnkJobSheet As HyperLink = New HyperLink
        lnkJobSheet.CssClass = "MenuLnk"
        lnkJobSheet.Text = "Job Sheet"
        lnkJobSheet.NavigateUrl = "/Intranet/Jobsheet/"

        lblPipe = New Label
        lblPipe.Text = "&nbsp;|&nbsp;"

        tcMenu.Controls.Add(lnkJobSheet)
        tcMenu.Controls.Add(lblPipe)

        Dim strJSAdminSQL As String
        Dim blnIsJSAdmin As String
        strJSAdminSQL = "SELECT dbo.Medic.JobSheetAdmin FROM dbo.Medic WHERE dbo.Medic.UserName = '" + strUserName + "'"
        blnIsJSAdmin = clsUtility.GetSingleValue(strJSAdminSQL)
        If blnIsJSAdmin = "" Or IsDBNull(blnIsAdmin) Then blnIsJSAdmin = "False"
        blnIsJSAdmin = System.Convert.ToBoolean(blnIsJSAdmin)

        If blnIsJSAdmin Then
            Dim lblPipe7 As Label = New Label
            lblPipe7.Text = "&nbsp;|&nbsp;"

            Dim lnkJSAdmin As HyperLink = New HyperLink
            lnkJSAdmin.CssClass = "MenuLnk"
            lnkJSAdmin.Text = "Job Sheet Admin"
            lnkJSAdmin.NavigateUrl = "/Intranet/JobSheet/adminhome.aspx"
            tcMenu.Controls.Add(lnkJSAdmin)
            tcMenu.Controls.Add(lblPipe7)
        End If

        Dim lnkServiceLocator As HyperLink = New HyperLink
        lnkServiceLocator.CssClass = "MenuLnk"
        lnkServiceLocator.Text = "Service Locator"
        lnkServiceLocator.NavigateUrl = "/Intranet/ServiceLocator/"

        tcMenu.Controls.Add(lnkServiceLocator)

        trMenu.Cells.Add(tcMenu)
        tblMenu.Rows.Add(trMenu)

    End Sub

End Class
