using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using java.io;
using edu.stanford.nlp.tagger.maxent;
using java.util;
using edu.stanford.nlp.ling;

public partial class CompareProduct : System.Web.UI.Page
{
    public string Model1 = HttpContext.Current.Server.MapPath(@"~\Bin\english-caseless-left3words-distsim.tagger");
    String posstring;
    string newString;
    private void TagReader(Reader reader)
    {
        var tagger = new MaxentTagger(Model1);
        //List obj = (List)MaxentTagger.tokenizeText(reader);
        foreach (ArrayList sentence in MaxentTagger.tokenizeText(reader).toArray())
        {
            var tSentence = tagger.tagSentence(sentence);
            System.Console.WriteLine(Sentence.listToString(tSentence, false));
            posstring = (Sentence.listToString(tSentence, false));
            newString = newString + posstring;
            //System.Console.WriteLine();
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillFirstddl();
            FillSecondddl();
        }
    }

    private void FillFirstddl()
    {
        SqlDataAdapter da = new SqlDataAdapter("select P_id,ProductName from Product", DBConnection.objConn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlFirst.DataSource = dt;
        ddlFirst.DataBind();
        ddlFirst.Items.Insert(0, new ListItem("<--Select-->", "0"));
    }
    private void FillSecondddl()
    {
        SqlDataAdapter da = new SqlDataAdapter("select P_id,ProductName from Product", DBConnection.objConn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlSecond.DataSource = dt;
        ddlSecond.DataBind();
        ddlSecond.Items.Insert(0, new ListItem("<--Select-->", "0"));
    }

    protected void ddlFirst_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmdTruncate = new SqlCommand("truncate table FirstProductValue", DBConnection.objConn);
        DBConnection.objConn.Open();
        cmdTruncate.ExecuteNonQuery();
        DBConnection.objConn.Close();
        string Feedb = "";
        SqlDataAdapter da = new SqlDataAdapter("select Feedback from Feedback where P_id=@P_id", DBConnection.objConn);
        da.SelectCommand.Parameters.AddWithValue("@P_id", ddlFirst.SelectedValue);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Feedb += " " + dt.Rows[i]["Feedback"].ToString();
            }
            GetSentimentScore(Feedb);
        }
        string QueryFirst = "insert into FirstProductValue  select ft.Feature,COUNT(PositivePolarity)as PositivePolarity from FO_Table ft join  Feature f on(ft.Feature=f.Feature)where value is not null group by ft.feature";
        SqlCommand cmdInsert = new SqlCommand(QueryFirst, DBConnection.objConn);
        DBConnection.objConn.Open();
        cmdInsert.ExecuteNonQuery();
        DBConnection.objConn.Close();

    }
    protected void ddlSecond_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmdTruncate = new SqlCommand("truncate table SecondProductValue", DBConnection.objConn);
        DBConnection.objConn.Open();
        cmdTruncate.ExecuteNonQuery();
        DBConnection.objConn.Close();
        string Feedb = "";
        SqlDataAdapter da = new SqlDataAdapter("select Feedback from Feedback where P_id=@P_id", DBConnection.objConn);
        da.SelectCommand.Parameters.AddWithValue("@P_id", ddlSecond.SelectedValue);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Feedb += " " + dt.Rows[i]["Feedback"].ToString();
            }
            GetSentimentScore(Feedb);
        }
        string QueryFirst = "insert into SecondProductValue  select ft.Feature,COUNT(PositivePolarity)as PositivePolarity from FO_Table ft join  Feature f on(ft.Feature=f.Feature)where value is not null group by ft.feature";
        SqlCommand cmdInsert = new SqlCommand(QueryFirst, DBConnection.objConn);
        DBConnection.objConn.Open();
        cmdInsert.ExecuteNonQuery();
        DBConnection.objConn.Close();
    }
    private void GetSentimentScore(string Feed)
    {
        string feed = Feed.Replace(@"'", "");

        TagReader(new StringReader(feed));
        truncatePreviousResult();
        string[] para = newString.Split('.');
        List<string> lstNN = new List<string>();
        List<string> lstJJ = new List<string>();
        List<string> lstRB = new List<string>();
        for (int i = 0; i < para.Length; i++)
        {
            string line = para[i];
            string[] word = line.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            for (int j = 0; j < word.Length; j++)
            {

                int startindex = word[j].IndexOf("/");
                if (startindex < 0) { startindex = 0; }
                int lastindex = word[j].Length;
                string NewPos = word[j].Remove(0, startindex);
                string NewWord = word[j].Substring(0, startindex);
                if (NewWord.Length > 12 || NewWord.Length < 2)
                {
                    continue;
                }
                switch (NewPos)
                {
                    case "/NN":
                        {
                            lstNN.Add(NewWord);
                            break;
                        }

                    case "/JJ":
                        {
                            lstJJ.Add(NewWord);
                            if (word.First() != word[j])
                            {
                                int Nextstartindex = word[j - 1].IndexOf("/");
                                if (Nextstartindex < 0) { Nextstartindex = 0; }
                                int Nextlastindex = word[j - 1].Length;
                                string backNewPos = word[j - 1].Remove(0, Nextstartindex);
                                string backNewWord = word[j - 1].Substring(0, Nextstartindex);
                                if (backNewPos == "/RB")
                                {
                                    lstRB.Add(backNewWord);
                                }
                                else
                                {
                                    // lstJJ.RemoveAt(lstJJ.Count - 1);
                                    lstRB.Add("very");
                                }
                            }
                            else
                            {
                                lstJJ.RemoveAt(lstJJ.Count - 1);
                            }

                            break;
                        }

                    default:
                        { break; }
                }
            }
            for (int jj = 0; lstJJ.Count < lstNN.Count; jj++)
            {
                if (lstNN.Count > lstJJ.Count && lstNN.Count > 0)
                {
                    lstNN.RemoveAt(lstNN.Count - 1);
                }
            }
            for (int nn = 0; lstNN.Count < lstJJ.Count; nn++)
            {
                if (lstJJ.Count > lstNN.Count && lstJJ.Count > 0)
                {
                    lstJJ.RemoveAt(lstJJ.Count - 1);
                }
            }

            for (int k = 0; k < lstNN.Count; k++)
            {
                // int n= lstJJ.Count;

                double JJScore = 1;
                double RBscore = 1;
                SqlDataAdapter da = new SqlDataAdapter("insert into FO_Table(Feature) values('" + lstNN[k] + "')", DBConnection.objConn);
                DBConnection.objConn.Open();
                da.SelectCommand.ExecuteNonQuery();
                DBConnection.objConn.Close();

                string query = "select MAX(PosScore)as PosScore, MAX(NegScore)as NegScore from dbo.SentiWordNet where SynsetTerms='" + lstJJ[k] + "';select MAX(PosScore)as PosScore, MAX(NegScore)as NegScore from dbo.SentiWordNet where SynsetTerms='" + lstRB[k] + "'";
                SqlDataAdapter da1 = new SqlDataAdapter(query, DBConnection.objConn);
                DBConnection.objConn.Open();
                da1.SelectCommand.ExecuteNonQuery();
                DataSet ds = new DataSet();
                da1.Fill(ds);
                DBConnection.objConn.Close();
                if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["PosScore"] != DBNull.Value || ds.Tables[0].Rows[0]["NegScore"] != DBNull.Value)
                {
                    double posvalue = Convert.ToDouble(ds.Tables[0].Rows[0]["PosScore"]);
                    double Negvalue = Convert.ToDouble(ds.Tables[0].Rows[0]["NegScore"]);

                    if (posvalue > Negvalue)
                    {
                        JJScore = posvalue;
                    }
                    else if (Negvalue > posvalue)
                    {
                        JJScore = -(Negvalue);
                    }
                    else
                    {
                        JJScore = 1;
                    }
                }
                if (ds.Tables[1].Rows.Count > 0 && ds.Tables[1].Rows[0]["PosScore"] != DBNull.Value || ds.Tables[1].Rows[0]["NegScore"] != DBNull.Value)
                {
                    double posvalue = Convert.ToDouble(ds.Tables[1].Rows[0]["PosScore"]);
                    double Negvalue = Convert.ToDouble(ds.Tables[1].Rows[0]["NegScore"]);

                    if (posvalue > Negvalue)
                    {
                        RBscore = posvalue;
                    }
                    else if (Negvalue > posvalue)
                    {
                        RBscore = -(Negvalue);
                    }
                    else
                    {
                        RBscore = 1;
                    }
                }

                double score = RBscore * JJScore;

                if (score > 0)
                {
                    string feature = lstNN[k];
                    string NewWord = lstJJ[k];
                    DBConnection.objConn.Open();
                    SqlDataAdapter da3 = new SqlDataAdapter(new SqlCommand("update FO_Table set PositivePolarity=" + 1 + ",value='" + NewWord + "' where Feature='" + feature + "'", DBConnection.objConn));
                    da3.SelectCommand.ExecuteNonQuery();
                    DBConnection.objConn.Close();
                }
                else if (score <= 0)
                {
                    string feature = lstNN[k];
                    string NewWord = lstJJ[k];
                    DBConnection.objConn.Open();
                    SqlDataAdapter da3 = new SqlDataAdapter("update FO_Table set NegativePolarity=" + 1 + ",value='" + NewWord + "' where feature='" + feature + "'", DBConnection.objConn);
                    da3.SelectCommand.ExecuteNonQuery();
                    DBConnection.objConn.Close();
                }
            }
            lstNN.Clear();
            lstJJ.Clear();
            lstRB.Clear();
        }
    }

    private void truncatePreviousResult()
    {
        SqlCommand cmdTruncate = new SqlCommand("truncate table FO_Table", DBConnection.objConn);
        DBConnection.objConn.Open();
        cmdTruncate.ExecuteNonQuery();
        DBConnection.objConn.Close();
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 10 Feature,SUM(t.FirstProduct)as FirstProduct,SUM(t.SecondProduct) as SecondProduct from (select distinct f.Feature,f.PositivePolarity as FirstProduct,s.PositivePolarity as SecondProduct from FirstProductValue f join SecondProductValue s on(f.Feature=s.Feature))t group by Feature order by FirstProduct desc", DBConnection.objConn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        foreach (DataRow row in dt.Rows)
        {
            Chart1.Series["FirstProduct"].Points.AddXY(row["Feature"].ToString(), Convert.ToInt32(row["FirstProduct"]));
            Chart1.Series["SecondProduct"].Points.AddXY(row["Feature"].ToString(), Convert.ToInt32(row["SecondProduct"]));
        }
        Chart1.Series["FirstProduct"].IsValueShownAsLabel = true;
        Chart1.Series["SecondProduct"].IsValueShownAsLabel = true;
        Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 1;
        Chart1.ChartAreas["ChartArea1"].AxisY.Title = "Positive Reviews";
        //Chart1.Series["Series1"].IsVisibleInLegend = true;
        //Chart1.Series["Series2"].IsVisibleInLegend = true;

    }
}