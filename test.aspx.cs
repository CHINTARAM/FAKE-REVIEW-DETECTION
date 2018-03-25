using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class test : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
                
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("insert into Feedback( User_id, P_id, Rating, Date, Feedback, UserTrustDegree, feedtrustworth)values( @User_id, @P_id, @Rating, @Date, @Feedback, @UserTrustDegree, @feedtrustworth)", DBConnection.objConn));
        da.SelectCommand.Parameters.AddWithValue("@User_id", txtUserid.Text);
        da.SelectCommand.Parameters.AddWithValue("@P_id", txtPid.Text);
        da.SelectCommand.Parameters.AddWithValue("@Rating", txtRating.Text);
        da.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.Date);
        da.SelectCommand.Parameters.AddWithValue("@Feedback", txtAddress.Text);
        da.SelectCommand.Parameters.AddWithValue("@UserTrustDegree", txtUsertrustdegree.Text);
        da.SelectCommand.Parameters.AddWithValue("@feedtrustworth", txtFeedbackdegree.Text);
        DBConnection.objConn.Open();
        da.SelectCommand.ExecuteNonQuery();
        DBConnection.objConn.Close();
        Response.Redirect("test.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("insert into KnowledgeBase(P_id,Feedback,feedtrustworth)values(@P_id,@Feedback,@feedtrustworth)", DBConnection.objConn));
        //da.SelectCommand.Parameters.AddWithValue("@User_id", txtUserid.Text);
        da.SelectCommand.Parameters.AddWithValue("@P_id", txtPid.Text);
       // da.SelectCommand.Parameters.AddWithValue("@Rating", txtRating.Text);
       // da.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.Date);
        da.SelectCommand.Parameters.AddWithValue("@Feedback", txtAddress.Text);
       // da.SelectCommand.Parameters.AddWithValue("@UserTrustDegree", txtUsertrustdegree.Text);
        da.SelectCommand.Parameters.AddWithValue("@feedtrustworth", txtFeedbackdegree.Text);
        DBConnection.objConn.Open();
        da.SelectCommand.ExecuteNonQuery();
        DBConnection.objConn.Close();
        Response.Redirect("test.aspx");
    }
}