using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            btnOK.Enabled = false;
        }
    }
    protected void btnOK_Click(object sender, ImageClickEventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select username from Muser where username=@name", DBConnection.objConn));
        da.SelectCommand.Parameters.AddWithValue("@name", txtUsername.Text);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "Alert('Username Already Exist')", false);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into Muser (Username, Password, First_name, Last_name, Address, Phone, Email, Status,UserTrusrtDegree) values(@Username, @Password, @First_name, @Last_name, @Address, @Phone, @Email, @Status,@UserTrusrtDegree)");
            cmd.Connection = DBConnection.objConn;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@Username", SqlDbType.VarChar, 100).Value = txtUsername.Text;
            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = txtPassword.Text;
            cmd.Parameters.Add("@First_name", SqlDbType.VarChar, 100).Value = txtFirst.Text;
            cmd.Parameters.Add("@Last_name", SqlDbType.VarChar, 100).Value = txtLast.Text;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar, 1000).Value = txtAddress.Text;
            cmd.Parameters.Add("@Phone", SqlDbType.VarChar, 10).Value = txtPhone.Text;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = txtEmail.Text;
            cmd.Parameters.Add("@Status", SqlDbType.Bit, 20).Value = "True";
            cmd.Parameters.Add("@UserTrusrtDegree", SqlDbType.Float).Value = 0;
            DBConnection.objConn.Open();
            int Result = cmd.ExecuteNonQuery();
            DBConnection.objConn.Close();
            if (Result == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "Alert('Your Account Create Successfully')", true);
                Response.Redirect("Login.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "Alert('Something Wrong')", true);
            }
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            btnOK.Enabled = true;
        }
        else if (CheckBox1.Checked == false)
        {
            btnOK.Enabled = false;
        }
    }
}