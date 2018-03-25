using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
    public static SqlConnection objConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
    public DBConnection()
    {

    }
}
public static class GlobalValue
{
    public static double _feedtrustworth;

    public static double _appreciation;

    public static double _UserTrustDegree;

}