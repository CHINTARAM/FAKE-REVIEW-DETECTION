using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text.RegularExpressions;
using java.io;
using edu.stanford.nlp.tagger.maxent;
using edu.stanford.nlp.ling;
using javac = com.sun.tools.javac.util;
using java.util;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;


public partial class ProductDetails : System.Web.UI.Page
{
    int P_id;
    public static string PName, Price;
    String posstring;
    string newString;
    public double feedtrustworth = 0;
    public double appreciation = 0;
    public List<string> Stopword = new List<string>();
    public List<string> Emoticon = new List<string>();
    //public const string Model =
    // @"E:\Project 2014-2015\Sentiment Analysis For Movies Review\Movie_Review_app\Bin\english-caseless-left3words-distsim.tagger";

    public string Model1 = HttpContext.Current.Server.MapPath(@"~\Bin\english-caseless-left3words-distsim.tagger");

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
            double lasRes = Convert.ToDouble(Request.QueryString["Result"]);
            lasRes = Math.Round(lasRes);
            if (Request.QueryString["msg"] == "add")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('Your Feedback is Submited Successfully & Your Trust Score of Product=" + lasRes + "')", true);
            }
            else if (Request.QueryString["msg"] == "notadd")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('Your Feedback is Not Submited & Your Trust Score is =" + GlobalValue._UserTrustDegree + "')", true);
            }
            else if (Request.QueryString["msg"] == "notbuy")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('you cant submit review of this product')", true);
            }
            else if (Request.QueryString["msg"] == "AlreadySubmit")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('you had already submited the review of this product')", true);
            }
            P_id = Convert.ToInt32(Request.QueryString["P_id"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select * from Product where P_id=@P_id", DBConnection.objConn));
            da.SelectCommand.Parameters.Add("@P_id", SqlDbType.Int, 10).Value = P_id;
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Image1.ImageUrl = dt.Rows[0]["photo"].ToString();
                PName = dt.Rows[0]["ProductName"].ToString();
                Price = dt.Rows[0]["Price"].ToString();
            }

            SqlDataAdapter da1 = new SqlDataAdapter(new SqlCommand("select (First_name+' '+Last_name)as Name,Email from Muser where User_id=@User_id", DBConnection.objConn));
            da1.SelectCommand.Parameters.AddWithValue("@User_id", Session["User_id"].ToString());
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                txtName.Text = dt1.Rows[0]["Name"].ToString();
                txtEmail.Text = dt1.Rows[0]["Email"].ToString();
            }

            SqlDataAdapter da2 = new SqlDataAdapter(new SqlCommand("select top(5) f.*,(u.First_name+' '+u.Last_name)as Name from Feedback f join Muser u on(f.User_id=u.User_id)where f.P_id=@p_id order by f_id desc", DBConnection.objConn));
            da2.SelectCommand.Parameters.AddWithValue("@P_id", P_id);
            DataTable dt3 = new DataTable();
            da2.Fill(dt3);
            RepterDetails.DataSource = dt3;
            RepterDetails.DataBind();
        }

        //SqlDataAdapter da1 = new SqlDataAdapter(new SqlCommand("select * from TempData", DBConnection.objConn));
        //DataTable dt1 = new DataTable();
        //da1.Fill(dt1);
        //TextBox3.Text = dt1.Rows[0]["Feedback"].ToString();
    }

    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "MyUpdate")
        {
            SqlDataAdapter daGetFeedback = new SqlDataAdapter("select Feedback from dbo.Feedback where F_id=@F_id", DBConnection.objConn);
            daGetFeedback.SelectCommand.Parameters.AddWithValue("@F_id", e.CommandArgument);
            DataTable dtGetFeedback = new DataTable();
            daGetFeedback.Fill(dtGetFeedback);
            if (dtGetFeedback.Rows.Count > 0)
            {
                GetSentimentScore(dtGetFeedback.Rows[0]["Feedback"].ToString());
            }
            //select Feature,COUNT(PositivePolarity)as PositivePolarity,COUNT(NegativePolarity)as NegativePolarity from FO_Table  where value is not null group by feature
            string Resultquery = "select ft.Feature,COUNT(PositivePolarity)as PositivePolarity,COUNT(NegativePolarity)as NegativePolarity from FO_Table ft join  Feature f on(ft.Feature=f.Feature) where value is not null group by ft.feature";

            SqlDataAdapter daResult = new SqlDataAdapter(Resultquery, DBConnection.objConn);
            DataTable dtResult = new DataTable();
            daResult.Fill(dtResult);
            GridView1.DataSource = dtResult;
            GridView1.DataBind();

            ModalPopupExtender1.Show();
        }
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

    protected void btnAddtocart_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into cart(User_id, P_id)values(@User_id, @P_id)", DBConnection.objConn);
        cmd.Parameters.AddWithValue("@User_id", Session["User_id"]);
        cmd.Parameters.AddWithValue("@P_id", Convert.ToInt32(Request.QueryString["P_id"].ToString()));
        DBConnection.objConn.Open();
        var res = cmd.ExecuteNonQuery();
        DBConnection.objConn.Close();
        if (res.ToString() == "1")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", "alert('Add successfully')", true);
        }
    }

    protected bool checkProduct()
    {
        SqlCommand cmd = new SqlCommand("select uId from [Transaction] where P_id=@p_id", DBConnection.objConn);
        cmd.Parameters.AddWithValue("@p_id", Request.QueryString["P_id"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }

    private bool CheckReviewAlready()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Feedback where User_id=@User_id and P_id=@P_id", DBConnection.objConn);
        da.SelectCommand.Parameters.AddWithValue("@User_id", Session["User_id"]);
        da.SelectCommand.Parameters.AddWithValue("@P_id", Convert.ToInt32(Request.QueryString["P_id"]));
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return false;
        else
            return true;

    }

    protected void btnScore_Click(object sender, EventArgs e)
    {
        string Feedb = "";
        SqlDataAdapter da = new SqlDataAdapter("select Feedback from Feedback where P_id=@P_id", DBConnection.objConn);
        da.SelectCommand.Parameters.AddWithValue("@P_id", Request.QueryString["p_id"]);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Feedb += " " + dt.Rows[i]["Feedback"].ToString();
            }
            GetSentimentScore(Feedb);
            string Resultquery = "select ft.Feature,COUNT(PositivePolarity)as PositivePolarity,COUNT(NegativePolarity)as NegativePolarity from FO_Table ft join  Feature f on(ft.Feature=f.Feature) where value is not null group by ft.feature";

            SqlDataAdapter daResult = new SqlDataAdapter(Resultquery, DBConnection.objConn);
            DataTable dtResult = new DataTable();
            daResult.Fill(dtResult);
            GridView1.DataSource = dtResult;
            GridView1.DataBind();

            ModalPopupExtender1.Show();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (checkProduct() == false)
        {
            Response.Redirect("ProductDetails.aspx?P_id=" + Request.QueryString["P_id"] + "&msg=notbuy");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", "alert(you can't submit review of this product)", true);
            // return;
        }
        if (CheckReviewAlready() == false)
        {
            // Response.Redirect("ProductDetails.aspx?P_id=" + Request.QueryString["P_id"] + "&msg=AlreadySubmit");
        }

        double VG = 0, AG = 0;
        P_id = Convert.ToInt32(Request.QueryString["P_id"]);
        string replacestr = Regex.Replace(txtFeedback.Text, "[^a-zA-Z0-9_]+", " ");
        TagReader(new StringReader(replacestr));
        // txtFeedback.Text = newString;

        string para = newString;
        List<string> lstRB = new List<string>();
        List<string> lstJJ = new List<string>();
        List<string> lstNextJJ = new List<string>();
        List<string> lstVBP = new List<string>();
        //int  AG = 0, EMO = 0, OI = 0;
        // double VG = 0, AG = 0, EMO = 0, OI = 0;
        string[] word = para.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < word.Length; i++)
        {

            int startindex = word[i].IndexOf("/");
            if (startindex < 0) { startindex = 0; }
            int lastindex = word[i].Length;
            string NewPos = word[i].Remove(0, startindex);
            string NewWord = word[i].Substring(0, startindex);
            switch (NewPos)
            {
                case "/VBP":
                    {
                        GetStopword();
                        int flag = 1;
                        for (int j = 0; j < Stopword.Count; j++)
                        {
                            if (NewWord == Stopword[j])
                            {
                                flag = 0;
                                break;
                            }
                        }
                        if (flag == 1)
                        {
                            lstVBP.Add((string)NewWord);
                        }
                        break;
                    }
                case "/JJ":
                    {
                        lstJJ.Add(NewWord);
                        if (word.First() != word[i])
                        {
                            int Nextstartindex = word[i - 1].IndexOf("/");
                            if (Nextstartindex < 0) { Nextstartindex = 0; }
                            int Nextlastindex = word[i - 1].Length;
                            string backNewPos = word[i - 1].Remove(0, Nextstartindex);
                            string backNewWord = word[i - 1].Substring(0, Nextstartindex);
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

                //case "/RB":
                //    {

                //        if (word.Length - 1 != i)
                //        {
                //            lstRB.Add((string)NewWord);
                //            int Nextstartindex = word[i + 1].IndexOf("/");
                //            if (Nextstartindex < 0) { Nextstartindex = 0; }
                //            int Nextlastindex = word[i + 1].Length;
                //            string NextNewPos = word[i + 1].Remove(0, Nextstartindex);
                //            string NextNewWord = word[i + 1].Substring(0, Nextstartindex);

                //            if (NextNewPos == "/JJ")
                //            {
                //                lstJJ.Add((string)NextNewWord);
                //                i = i + 1;
                //            }
                //            else
                //            {
                //                //lstRB.RemoveAt(lstRB.Count - 1);
                //                lstRB.Add("good");
                //            }
                //        }
                //        else
                //        {
                //        }
                //        break;
                //    }

                //case "/JJ":
                //    {
                //        lstNextJJ.Add((string)NewWord);
                //        break;
                //    }
                default:
                    { break; }
            }
        }

        for (int vbp = 0; vbp < lstVBP.Count; vbp++)
        {
            SqlDataAdapter daVBP = new SqlDataAdapter(new SqlCommand("select MAX(PosScore)as pos, MAX(NegScore)as Neg from dbo.SentiWordNet where SynsetTerms='" + lstVBP[vbp] + "'", DBConnection.objConn));
            DataTable dtVBP = new DataTable();
            daVBP.Fill(dtVBP);
            if (dtVBP.Rows.Count > 0 && dtVBP.Rows[0]["pos"] != DBNull.Value || dtVBP.Rows[0]["neg"] != DBNull.Value)
            {
                Double PosScore = Convert.ToDouble(dtVBP.Rows[0]["pos"].ToString());
                Double NegScore = Convert.ToDouble(dtVBP.Rows[0]["neg"].ToString());
                if (PosScore > NegScore)
                {
                    VG = VG + PosScore;
                }
                else
                {
                    VG = -(NegScore) + VG;
                }
                //VG Score Generate
                //VG = VG;
            }
            else
            {
                VG = 0 + VG;
            }
        }
        //FIND Score of Adjective Group
        Double RBscore = 0;
        Double JJScore = 0;
        for (int RB = 0; RB < lstRB.Count; RB++)
        {
            SqlDataAdapter daRB = new SqlDataAdapter(new SqlCommand("select MAX(PosScore)as pos, MAX(NegScore)as Neg from dbo.SentiWordNet where SynsetTerms='" + lstRB[RB] + "';select MAX(PosScore)as pos, MAX(NegScore)as Neg from dbo.SentiWordNet where SynsetTerms='" + lstJJ[RB] + "'", DBConnection.objConn));
            DataSet dsRB = new DataSet();
            daRB.Fill(dsRB);

            if (dsRB.Tables[0].Rows.Count > 0 && dsRB.Tables[0].Rows[0]["pos"] != DBNull.Value || dsRB.Tables[0].Rows[0]["neg"] != DBNull.Value)
            {

                Double PosScore = Convert.ToDouble(dsRB.Tables[0].Rows[0]["pos"].ToString());
                Double NegScore = Convert.ToDouble(dsRB.Tables[0].Rows[0]["neg"].ToString());
                if (PosScore > NegScore)
                {
                    RBscore = RBscore + PosScore;
                }
                else
                {
                    RBscore = -(NegScore) + RBscore;
                }
                // RBscore = RBscore + RBscore;
            }
            else
            {
                RBscore = 0 + RBscore;
            }
            if (dsRB.Tables[1].Rows.Count > 0 && dsRB.Tables[1].Rows[0]["pos"] != DBNull.Value || dsRB.Tables[1].Rows[0]["neg"] != DBNull.Value)
            {
                Double PosScore = Convert.ToDouble(dsRB.Tables[1].Rows[0]["pos"].ToString());
                Double NegScore = Convert.ToDouble(dsRB.Tables[1].Rows[0]["neg"].ToString());
                if (PosScore > NegScore)
                {
                    JJScore = JJScore + PosScore;
                }
                else
                {
                    JJScore = -(NegScore) + JJScore;
                }
                // JJScore = JJScore + JJScore;
            }
            else
            {
                JJScore = 0 + JJScore;
            }
        }

        AG = RBscore * JJScore;
        Double NextjjScore = 0;
        for (int nextjj = 0; nextjj < lstNextJJ.Count; nextjj++)
        {
            SqlDataAdapter daJJ = new SqlDataAdapter(new SqlCommand("select MAX(PosScore)as pos, MAX(NegScore)as Neg from dbo.SentiWordNet where SynsetTerms='" + lstNextJJ[nextjj] + "' ", DBConnection.objConn));
            DataTable dtJJ = new DataTable();
            daJJ.Fill(dtJJ);
            if (dtJJ.Rows.Count > 0 && dtJJ.Rows[0]["pos"] != DBNull.Value || dtJJ.Rows[0]["neg"] != DBNull.Value)
            {
                Double PosScore = Convert.ToDouble(dtJJ.Rows[0]["pos"].ToString());
                Double NegScore = Convert.ToDouble(dtJJ.Rows[0]["neg"].ToString());
                if (PosScore > NegScore)
                {
                    NextjjScore = PosScore + NextjjScore;
                }
                else
                    NextjjScore = -(NegScore) + NextjjScore;
            }
            // NextjjScore = +NextjjScore;
        }

        //AG Score Generate
        AG = AG + NextjjScore;

        VG = VG + AG;

        //Emoticons
        Emoticon.Clear();
        GetEmoticon();
        string[] lstFeedBack = txtFeedback.Text.Split(' ');
        double FinalEmoScore = 0;
        for (int em = 0; em < Emoticon.Count; em++)
        {
            if (lstFeedBack.Contains(Emoticon[em]))
            {
                SqlDataAdapter daGetEmoScore = new SqlDataAdapter("select Strength from Emoticons where Emoticon=@Emo", DBConnection.objConn);
                daGetEmoScore.SelectCommand.Parameters.AddWithValue("@Emo", Emoticon[em]);
                DBConnection.objConn.Open();
                var EmoScore = daGetEmoScore.SelectCommand.ExecuteScalar();
                DBConnection.objConn.Close();
                FinalEmoScore += Convert.ToDouble(EmoScore);
            }
        }

        VG = VG + FinalEmoScore;
        if (VG > 5)
            VG = 5.0;
        else if (VG < -5)
            VG = -5.0;
        feedtrustworth = VG;
        // GlobalValue GV = new GlobalValue();
        GlobalValue._feedtrustworth = feedtrustworth;
        // var re = SliderExtender1.
        appreciation = Convert.ToDouble(txtRating.Text);
        GlobalValue._appreciation = appreciation;

        if (feedtrustworth > 0 && appreciation > 0 || feedtrustworth < 0 && appreciation < 0)
        {
            truncateTemp();
            SqlCommand cmd = new SqlCommand("insert into TempData(User_id, P_id, Rating, Feedback, date, feedtrustworth) values (@User_id, @P_id, @Rating, @Feedback, @date, @feedtrustworth)");
            cmd.Connection = DBConnection.objConn;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@User_id", Session["User_id"].ToString());
            cmd.Parameters.AddWithValue("@P_id", Request.QueryString["P_id"].ToString());
            cmd.Parameters.AddWithValue("@Rating", appreciation);
            cmd.Parameters.AddWithValue("@Feedback", txtFeedback.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("@feedtrustworth", feedtrustworth);
            DBConnection.objConn.Open();
            int result = cmd.ExecuteNonQuery();
            DBConnection.objConn.Close();
            if (result == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertMessege", "alert('please give us your opinion about the following feedbacks before validating the information you gave below')", true);
                Response.Redirect("ValidateUser.aspx?p_id=" + P_id + "&msg=ok");
            }
        }
        else
        {
            SqlDataAdapter daBlock = new SqlDataAdapter(new SqlCommand("update Muser set Status='False',BlockDate=@BlockDate,BlockList=@BlockList where user_id=@user_id", DBConnection.objConn));
            daBlock.SelectCommand.Parameters.AddWithValue("@user_id", Session["User_id"].ToString());
            daBlock.SelectCommand.Parameters.AddWithValue("@BlockDate", DateTime.Now);
            daBlock.SelectCommand.Parameters.AddWithValue("@BlockList", true);
            DBConnection.objConn.Open();
            daBlock.SelectCommand.ExecuteNonQuery();
            DBConnection.objConn.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Messege", "alert('You are not trustworthy. Your account is temporary Blocked.')", true);
            Response.Redirect("Login.aspx?msg=block");
        }

    }

    protected void GetEmoticon()
    {
        SqlDataAdapter daGetEmo = new SqlDataAdapter(new SqlCommand("select Emoticon from Emoticons", DBConnection.objConn));
        DataTable dt = new DataTable();
        daGetEmo.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            Emoticon.Add((string)row[0]);
        }
    }
    protected void GetStopword()
    {
        SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("select Word from StopWord", DBConnection.objConn));
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            Stopword.Add((string)row[0]);
        }
    }
    protected void truncateTemp()
    {
        SqlDataAdapter da = new SqlDataAdapter(new SqlCommand("truncate table TempData", DBConnection.objConn));
        DataTable dt = new DataTable();
        da.Fill(dt);
    }
}