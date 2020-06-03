using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

/// <summary>
/// DataFuction class for database connectivity
/// </summary>
public class DataFunction
{
    #region " global instances"
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter adpt;
    DataSet ds;
    DataTable dt;
    #endregion 


    public DataFunction()
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    }

    #region"Function for excuting insert update select delete operation"
    public int ExecuteQuery(string spname, SqlParameter[] param)

    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        
        }

        cmd = new SqlCommand(spname, con);
        cmd.CommandType = CommandType.StoredProcedure;

        AddParameter(cmd, param);

        int result = cmd.ExecuteNonQuery();
        con.Close();

        return result;
    
    }
    #endregion

    #region"function for adding parameter"
    public void AddParameter(SqlCommand cmd, SqlParameter[] param)
    {
        foreach (SqlParameter p in param)
        {
            if (p.Value == null)
            {
                p.Value = DBNull.Value;
            }
            cmd.Parameters.Add(p);     
        }
    
    }
    #endregion

    #region"fuction for select query"
    public DataSet FillDsParam(string spname, SqlParameter[] param)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        cmd = new SqlCommand(spname, con);
        cmd.CommandType = CommandType.StoredProcedure;

        AddParameter(cmd, param);
        adpt = new SqlDataAdapter(cmd);
        ds = new DataSet();
        adpt.Fill(ds);
        return ds;

    }
    #endregion


    public DataSet FillDsS(string query)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        cmd = new SqlCommand(query , con);
      
      
        adpt = new SqlDataAdapter(cmd);
        ds = new DataSet();
        adpt.Fill(ds);
        return ds;

    }

    public DataTable  FillDT(string query)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        cmd = new SqlCommand(query, con);


        adpt = new SqlDataAdapter(cmd);
        dt = new DataTable();
        adpt.Fill(dt);
        return dt;

    }





    #region"fuction for select query without parameter"
    public DataSet FillDs(string spname, SqlParameter[] param)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        cmd = new SqlCommand(spname, con);
        cmd.CommandText = spname;

        
        adpt = new SqlDataAdapter(cmd);
        ds = new DataSet();
        adpt.Fill(ds);
        return ds;

    }
    

    #endregion
}