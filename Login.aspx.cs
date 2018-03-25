using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msg"] == "block")
        {
            Session.Abandon();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Messege", "alert('You are not trustworthy. Your account is temporary Blocked.')", true);
        }
        if (!IsPostBack)
        {
            UpdateUser();
        }
    }
    protected void UpdateUser()
    {
        SqlCommand cmdUpdate = new SqlCommand("update Muser set Status=1 where Status=0 and DATEDIFF(d,BlockDate,getdate())>10", DBConnection.objConn);
        DBConnection.objConn.Open();
        cmdUpdate.ExecuteNonQuery();
        DBConnection.objConn.Close();
    }
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        
        try
        {
            SqlCommand objCmd = new SqlCommand("select User_id,(First_name+' '+Last_name)as Name,UserTrusrtDegree,BlockList from Muser where Username=@Username and Password=@Password and status='True'");
            objCmd.Connection = DBConnection.objConn;
            objCmd.CommandType = CommandType.Text;
            objCmd.Parameters.Add("@Username", SqlDbType.VarChar, 100).Value = txtUsername.Text;
            objCmd.Parameters.Add("@Password", SqlDbType.VarChar, 100).Value = txtPassword.Text;
            SqlDataReader dr;
            DBConnection.objConn.Open();
            dr = objCmd.ExecuteReader();
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    Session["User_id"] = dr["User_id"].ToString();
                    Session["Name"] = dr["Name"].ToString();
                    Session["BlockList"] = dr["BlockList"].ToString();
                   // GlobalValue gv = new GlobalValue();
                    GlobalValue._UserTrustDegree = Convert.ToDouble(dr["UserTrusrtDegree"].ToString());
                    //Response.Write(gv._UserTrustDegree);
                   // Session["UserTrusrtDegree"] = dr["UserTrusrtDegree"].ToString();
                }
            }
            DBConnection.objConn.Close();
            if (Session["User_id"] != null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblShow.Text = "Invalid Username And Password";
            }
        }
        finally
        { }
    }
}