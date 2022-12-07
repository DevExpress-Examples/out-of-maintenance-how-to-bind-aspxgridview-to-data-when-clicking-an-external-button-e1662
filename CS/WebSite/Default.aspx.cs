using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page 
{
    string ActiveDataSourceIdSessionKey = "ActiveDataSourceId";
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void ASPxGridView_Load(object sender, EventArgs e) {
        (sender as ASPxGridView).AutoGenerateColumns = true;
        (sender as ASPxGridView).DataBind();
    }
    protected void ASPxButton1_Click(object sender, EventArgs e) {
        if (ASPxComboBox1.SelectedIndex == -1) return;
        Session[ActiveDataSourceIdSessionKey] = ASPxComboBox1.SelectedItem.Value;
        ASPxGridView1.Columns.Clear();
        ASPxGridView1.DataBind();
    }
    protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e) {
        if (Session[ActiveDataSourceIdSessionKey] == null) return;
        (sender as ASPxGridView).DataSourceID = Session[ActiveDataSourceIdSessionKey].ToString();
    }
}
