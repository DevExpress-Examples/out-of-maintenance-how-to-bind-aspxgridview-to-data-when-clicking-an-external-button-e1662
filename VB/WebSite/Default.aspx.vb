Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web

Public Partial Class _Default
	Inherits System.Web.UI.Page
	Private ActiveDataSourceIdSessionKey As String = "ActiveDataSourceId"
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxGridView_Load(ByVal sender As Object, ByVal e As EventArgs)
        TryCast(sender, ASPxGridView).AutoGenerateColumns = True
        TryCast(sender, ASPxGridView).DataBind()
	End Sub
	Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
		If ASPxComboBox1.SelectedIndex = -1 Then
		Return
		End If
		Session(ActiveDataSourceIdSessionKey) = ASPxComboBox1.SelectedItem.Value
		ASPxGridView1.Columns.Clear()
		ASPxGridView1.DataBind()
	End Sub
	Protected Sub ASPxGridView1_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		If Session(ActiveDataSourceIdSessionKey) Is Nothing Then
		Return
		End If
        TryCast(sender, ASPxGridView).DataSourceID = Session(ActiveDataSourceIdSessionKey).ToString()
	End Sub
End Class
