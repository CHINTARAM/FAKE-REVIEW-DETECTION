using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_ManageUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand objCmd = new SqlCommand("select User_id,(First_name+' '+ Last_name)as Name, Phone, Email, Status from Muser");
            objCmd.Connection = DBConnection.objConn;
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = objCmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[4].Text == "False")
            {
                e.Row.Cells[4].Text = "Blocked";
                e.Row.Cells[4].ForeColor = System.Drawing.Color.Black;
                e.Row.Cells[4].Font.Bold = true;
                e.Row.Cells[4].BackColor = System.Drawing.Color.Red;
            }
            else
            {
                e.Row.Cells[4].Text = "UnBlocked";
                e.Row.Cells[4].ForeColor = System.Drawing.Color.Black;
                e.Row.Cells[4].Font.Bold = true;
                e.Row.Cells[4].BackColor = System.Drawing.Color.Green;
            }
        }
    }
}