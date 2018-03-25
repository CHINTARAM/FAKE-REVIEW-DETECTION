using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Cart : System.Web.UI.Page
{
    public DataSet objDs = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select c.cId, c.P_id,p.ProductName,p.Price from cart c join Product p on(c.P_id=p.P_id) where c.User_id=@uId;select SUM(p.Price)as TotalSum from cart c join Product p on(c.P_id=p.P_id) where c.User_id=@uId", DBConnection.objConn));
            da.SelectCommand.Parameters.AddWithValue("@uId", Session["User_id"]);
            objDs = new DataSet();
            da.Fill(objDs);
            if (objDs.Tables[1].Rows.Count > 0)
            {
                if (objDs.Tables[1].Rows[0]["TotalSum"] == DBNull.Value)
                    lblTotal.Text = "0";
                else
                    lblTotal.Text = objDs.Tables[1].Rows[0]["TotalSum"].ToString();
            }
        }
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select cId, User_id, P_id from dbo.cart where User_id=@User_id", DBConnection.objConn);
        cmd.Parameters.AddWithValue("@User_id", Session["User_id"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Guid gid = new Guid();

            foreach (DataRow row in dt.Rows)
            {
                SqlCommand cmdInsert = new SqlCommand("insert into [Transaction](sId, p_id, uId, tdate)values(@sId, @p_id, @uId, @tdate)", DBConnection.objConn);
                cmdInsert.Parameters.AddWithValue("@sId", gid);
                cmdInsert.Parameters.AddWithValue("@p_id", row["P_id"]);
                cmdInsert.Parameters.AddWithValue("@uId", row["User_id"]);
                cmdInsert.Parameters.AddWithValue("@tdate", DateTime.Now);
                DBConnection.objConn.Open();
                cmdInsert.ExecuteNonQuery();
                DBConnection.objConn.Close();
            }
            SqlCommand cmdDelete = new SqlCommand("delete from cart where User_id=@User_id", DBConnection.objConn);
            cmdDelete.Parameters.AddWithValue("@User_id", Session["User_id"]);
            DBConnection.objConn.Open();
            cmdDelete.ExecuteNonQuery();
            DBConnection.objConn.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", "alert('Transaction Done Successfully')", true);
        }

    }
}