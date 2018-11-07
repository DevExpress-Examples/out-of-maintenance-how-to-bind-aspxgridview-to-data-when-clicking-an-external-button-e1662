<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxGridView"
	TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to bind ASPxGridView to data when clicking an external button</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="true"
				OnLoad="ASPxGridView_Load" 
				OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect">
			</dxwgv:ASPxGridView>
			<table>
				<tr>
					<td>
						<dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" SelectedIndex="-1" ToolTip="ASPxGridView's data source" 
							ValueType="System.String">
							<Items>
								<dxe:ListEditItem Text="Categories" Value="AccessDataSource1" />
								<dxe:ListEditItem Text="Products" Value="AccessDataSource2" />
								<dxe:ListEditItem Text="Customers" Value="AccessDataSource3"/>
							</Items>
						</dxe:ASPxComboBox>
					</td>
					<td>
						<dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Bind ASPxGridView to selected data source"
							OnClick="ASPxButton1_Click">
						</dxe:ASPxButton>
					</td>
				</tr>
			</table>
			<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
				SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
			</asp:AccessDataSource>
		</div>
		<asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel] FROM [Products]">
		</asp:AccessDataSource>
		<asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [CompanyName], [CustomerID], [ContactTitle], [Address], [ContactName], [City], [Region], [PostalCode], [Country] FROM [Customers]">
		</asp:AccessDataSource>
	</form>
</body>
</html>
