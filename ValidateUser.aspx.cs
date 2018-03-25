using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ValidateUser : System.Web.UI.Page
{
    int p_id;
    private static int i = 0;
    double UserTrusrtDegree;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.QueryString["msg"] == "ok")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('please give us your opinion about the following feedbacks before validating the information you gave below')", true);
            }
            i = 0;
            p_id = Convert.ToInt32(Request.QueryString["P_id"]);
            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select top(5) * from KnowledgeBase where p_id=@p_id order by newId()", DBConnection.objConn));
            da.SelectCommand.Parameters.AddWithValue("@P_id", p_id);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ViewState["Feed"] = dt;
            txtFeedback.Text = dt.Rows[i]["Feedback"].ToString();
            HiddenField1.Value = dt.Rows[i]["feedtrustworth"].ToString();

        }
    }
    protected void btnLike_Click(object sender, ImageClickEventArgs e)
    {
        // GlobalValue gv = new GlobalValue();
        if (0 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 1.5)
        {
            UserTrusrtDegree = 0.25;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (1.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 2.5)
        {
            UserTrusrtDegree = 0.5;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (2.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 3.5)
        {
            UserTrusrtDegree = 0.75;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (3.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 5)
        {
            UserTrusrtDegree = 1;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if ((-1.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 0))
        {
            UserTrusrtDegree = -0.25;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (-2.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= -1.5)
        {
            UserTrusrtDegree = -0.5;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (-3.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= -2.5)
        {
            UserTrusrtDegree = -0.75;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (-5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= -3.5)
        {
            UserTrusrtDegree = -1;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }

        i += 1;
        if (i < 5)
        {
            DataTable dt = (DataTable)(ViewState["Feed"]);
            txtFeedback.Text = string.Empty;
            HiddenField1.Value = null;
            txtFeedback.Text = dt.Rows[i]["Feedback"].ToString();
            HiddenField1.Value = dt.Rows[i]["feedtrustworth"].ToString();
        }
        else
        {
            //if (GlobalValue._UserTrustDegree > 5)
            //{
            //    UserTrusrtDegree = 5;
            //}
            //if (GlobalValue._UserTrustDegree < -5)
            //{
            //    UserTrusrtDegree = -5;
            //}
            btnFinish.Visible = true;
            btnDislike.Enabled = false;
            btnLike.Enabled = false;
        }
    }
    protected void btnDislike_Click(object sender, ImageClickEventArgs e)
    {
        //GlobalValue gv = new GlobalValue();
        if (-1.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 0)
        {
            UserTrusrtDegree = 0.25;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (-2.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= -1.5)
        {
            UserTrusrtDegree = 0.5;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (-3.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= -2.5)
        {
            UserTrusrtDegree = 0.75;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (-5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= -3.5)
        {
            UserTrusrtDegree = 1;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (0 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 1.5)
        {
            UserTrusrtDegree = -0.25;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (1.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 2.5)
        {
            UserTrusrtDegree = -0.5;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (2.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 3.5)
        {
            UserTrusrtDegree = -0.75;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }
        else if (3.5 < Convert.ToDouble(HiddenField1.Value) && Convert.ToDouble(HiddenField1.Value) <= 5)
        {
            UserTrusrtDegree = -1;
            GlobalValue._UserTrustDegree += UserTrusrtDegree;
        }

        i += 1;
        if (i < 5)
        {
            DataTable dt = (DataTable)(ViewState["Feed"]);
            txtFeedback.Text = string.Empty;
            HiddenField1.Value = null;
            txtFeedback.Text = dt.Rows[i]["Feedback"].ToString();
            HiddenField1.Value = dt.Rows[i]["feedtrustworth"].ToString();
            // Response.Write(gv._UserTrustDegree);
        }
        else
        {
            //if (GlobalValue._UserTrustDegree > 5)
            //{
            //    UserTrusrtDegree = 5;
            //}
            //if (GlobalValue._UserTrustDegree < -5)
            //{
            //    UserTrusrtDegree = -5;
            //}
            btnFinish.Visible = true;
            btnDislike.Enabled = false;
            btnLike.Enabled = false;
        }

    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        double X = 0, Y = 0, a = 0, b = 0;
        p_id = Convert.ToInt32(Request.QueryString["P_id"]);
        SqlCommand cmdX = new SqlCommand("select SUM(Rating)as SumX from dbo.KnowledgeBase where P_id=@p_id");
        cmdX.CommandType = CommandType.Text;
        cmdX.Connection = DBConnection.objConn;
        cmdX.Parameters.AddWithValue("@P_id", p_id);
        DBConnection.objConn.Open();
        X = Convert.ToDouble(cmdX.ExecuteScalar());
        DBConnection.objConn.Close();

        Y = GlobalValue._appreciation;

        SqlCommand cmdA = new SqlCommand("select SUM(UserTrusrtDegree)as SumA from dbo.Muser");
        cmdA.Connection = DBConnection.objConn;
        cmdA.CommandType = CommandType.Text;
        // cmdA.Parameters.AddWithValue("@P_id", p_id);
        DBConnection.objConn.Open();
        a = Convert.ToDouble(cmdA.ExecuteScalar());
        DBConnection.objConn.Close();

        b = GlobalValue._UserTrustDegree;
        if (b > 5)
            b = 5;
        else  if (b < -5)
            b = -5;

        double Result = (X + b * Y) / (a + b);
        if (Session["BlockList"].ToString() == "True")
        {
            b = GlobalValue._UserTrustDegree - 2;
        }
        if (GlobalValue._UserTrustDegree > 0)
        {
            SqlCommand cmdUpdateUser = new SqlCommand("update Muser set UserTrusrtDegree=@Trust where User_id=@User_id");
            cmdUpdateUser.Connection = DBConnection.objConn;
            cmdUpdateUser.CommandType = CommandType.Text;
            cmdUpdateUser.Parameters.AddWithValue("@User_id", Session["User_id"]);
            cmdUpdateUser.Parameters.AddWithValue("@Trust", b);
            DBConnection.objConn.Open();
            int val = cmdUpdateUser.ExecuteNonQuery();
            DBConnection.objConn.Close();

            SqlCommand cmdAddKnowledge = new SqlCommand("insert into dbo.KnowledgeBase(User_id, P_id, Rating, Feedback, Date, feedtrustworth) select User_id, P_id, Rating, Feedback, date, feedtrustworth from dbo.TempData");
            cmdAddKnowledge.Connection = DBConnection.objConn;
            cmdAddKnowledge.CommandType = CommandType.Text;
            DBConnection.objConn.Open();
            cmdAddKnowledge.ExecuteNonQuery();
            DBConnection.objConn.Close();

            SqlCommand cmdAddFeedback = new SqlCommand("insert into dbo.Feedback(User_id, P_id, Rating, Feedback, Date, feedtrustworth) select User_id, P_id, Rating, Feedback, date, feedtrustworth from dbo.TempData");
            cmdAddFeedback.Connection = DBConnection.objConn;
            cmdAddFeedback.CommandType = CommandType.Text;
            DBConnection.objConn.Open();
            cmdAddFeedback.ExecuteNonQuery();
            DBConnection.objConn.Close();
            //New Opinion mining logic

            //
            Response.Redirect("ProductDetails.aspx?Result=" + Result + "&p_id=" + p_id + "&msg=add");
            // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('Your Feedback is Submited Successfully')", true);
        }
        else
        {
            SqlCommand cmdUpdateUser = new SqlCommand("update Muser set UserTrusrtDegree=@Trust,Status=@Status,BlockDate=@BlockDate,BlockList=@BlockList where User_id=@User_id");
            cmdUpdateUser.Connection = DBConnection.objConn;
            cmdUpdateUser.CommandType = CommandType.Text;
            cmdUpdateUser.Parameters.AddWithValue("@User_id", Session["User_id"]);
            cmdUpdateUser.Parameters.AddWithValue("@Trust", b);
            cmdUpdateUser.Parameters.AddWithValue("@Status", false);
            cmdUpdateUser.Parameters.AddWithValue("@BlockDate", DateTime.Now);
            cmdUpdateUser.Parameters.AddWithValue("@BlockList", true);
            DBConnection.objConn.Open();
            int val = cmdUpdateUser.ExecuteNonQuery();
            DBConnection.objConn.Close();

            SqlCommand cmdAddKnowledge = new SqlCommand("insert into dbo.KnowledgeBase(User_id, P_id, Rating, Feedback, Date, feedtrustworth) select User_id, P_id, Rating, Feedback, date, feedtrustworth from dbo.TempData");
            cmdAddKnowledge.Connection = DBConnection.objConn;
            cmdAddKnowledge.CommandType = CommandType.Text;
            DBConnection.objConn.Open();
            cmdAddKnowledge.ExecuteNonQuery();
            DBConnection.objConn.Close();
            Response.Redirect("ProductDetails.aspx?p_id=" + p_id + "&msg=notadd");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('Your Feedback is Not Submited')", true);
        }
    }
}