using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ViewUser : System.Web.UI.Page
{
    int User_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        User_id = Convert.ToInt32(Request.QueryString["User_id"]);
        if (!IsPostBack)
        {
            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select  First_name, Last_name, Address, Phone, Email, Status from Muser where User_id=@User_id", DBConnection.objConn));
            da.SelectCommand.Parameters.AddWithValue("@User_id",User_id);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtFirst.Text = dt.Rows[0]["First_name"].ToString();
                txtLast.Text = dt.Rows[0]["Last_name"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    DropDownList1.SelectedIndex = 1;
                }
                else
                {
                    DropDownList1.SelectedIndex = 2;
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        User_id = Convert.ToInt32(Request.QueryString["User_id"]);
        SqlDataAdapter da=new SqlDataAdapter(new SqlCommand("Update Muser set First_name=@Fname,Last_name=@Lname,Address=@Address,Phone=@Phone,Email=@Email,Status=@Status where User_id=@User_id",DBConnection.objConn));
        da.SelectCommand.Parameters.AddWithValue("@Fname", txtFirst.Text);
        da.SelectCommand.Parameters.AddWithValue("@Lname", txtLast.Text);
        da.SelectCommand.Parameters.AddWithValue("@Address", txtAddress.Text);
        da.SelectCommand.Parameters.AddWithValue("@Phone", txtPhone.Text);
        da.SelectCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
        da.SelectCommand.Parameters.AddWithValue("@Status", DropDownList1.SelectedValue);
        da.SelectCommand.Parameters.AddWithValue("@User_id", User_id);
        int result= da.SelectCommand.ExecuteNonQuery();
        if (result == 1)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "Alert('User Update Successfully')", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "Alert('Something Wrong')", true);
        }
    }
}