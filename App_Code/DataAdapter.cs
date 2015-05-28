using System;
using System.Data;
using System.Data.SqlClient;

public class DataAdapter : IDisposable
{
    private SqlConnection cacheConn;

    public DataAdapter()
    {
        this.cacheConn = new SqlConnection(Config.Instance().ConnectionString);
    }

    public DataAdapter(string connStr)
    {
        this.cacheConn = new SqlConnection(connStr);
    }
    #region IDisposable ≥…‘±

    public void Dispose()
    {
        try
        {
            if (cacheConn.State != ConnectionState.Closed)
                cacheConn.Close();
        }
        catch (Exception)
        {
        }
    }

    #endregion

    ~DataAdapter()
    {
        Dispose();
    }

    public void Close()
    {
        try
        {
            this.cacheConn.Close();
        }
        catch (Exception)
        {
        }
    }

    public DataSet ExcuteDataSet(string sqlString)
    {
        try
        {
            if (this.cacheConn.State != ConnectionState.Open)
                this.cacheConn.Open();
            SqlDataAdapter cacheDA = new SqlDataAdapter(sqlString, this.cacheConn);
            DataSet cacheDS = new DataSet("DS");
            cacheDA.Fill(cacheDS, "DSTable");
            cacheDA.Dispose();

            this.cacheConn.Close();
            return cacheDS;
        }
        catch (Exception)
        {
            this.Close();
            return null;
        }
    }

    public DataSet ExcuteDataSet(string sqlString, int topIndex, int SelectItemCount)
    {
        try
        {
            if (this.cacheConn.State != ConnectionState.Open)
                this.cacheConn.Open();
        }
        catch (Exception)
        {
            return null;
        }
        SqlDataAdapter cacheDA = new SqlDataAdapter(sqlString, this.cacheConn);
        DataSet cacheDS = new DataSet("DS");
        cacheDA.Fill(cacheDS, topIndex, SelectItemCount, "DSTable");
        cacheDA.Dispose();

        this.cacheConn.Close();
        return cacheDS;
    }

    public object ExecuteForResponse(string sqlString, int selIndex)
    {
        try
        {
            if (this.cacheConn.State != ConnectionState.Open)
                this.cacheConn.Open();
            using (DataTableReader cacheReader = this.ExecuteDTReader(sqlString))
            {
                while (cacheReader.Read())
                {
                    object e = cacheReader.GetValue(selIndex);
                    cacheReader.Close();
                    this.cacheConn.Close();
                    return e;
                }
                cacheReader.Close();
            }
        }
        catch (Exception)
        {
        }

        this.Close();
        return null;
    }

    public SqlDataReader ExecuteReader(string sqlString)
    {
        try
        {
            if (this.cacheConn.State != ConnectionState.Open)
                this.cacheConn.Open();
            SqlCommand cacheComm = new SqlCommand(sqlString, this.cacheConn);
            SqlDataReader cacheReader = cacheComm.ExecuteReader();
            cacheComm.Dispose();
            return cacheReader;
        }
        catch (Exception)
        {
            this.Close();
            return null;
        }
    }

    public DataTableReader ExecuteDTReader(string sqlString)
    {
        DataSet cacheDs = ExcuteDataSet(sqlString);
        if (cacheDs == null)
            return null;

        DataTableReader cacheReader = cacheDs.CreateDataReader();
        return cacheReader;
    }

    public int ExecuteSqlNoQuery(string sqlString)
    {
        try
        {
            if (this.cacheConn.State != ConnectionState.Open)
                this.cacheConn.Open();
            SqlCommand cacheComm = new SqlCommand(sqlString, this.cacheConn);
            int i = cacheComm.ExecuteNonQuery();
            cacheComm.Dispose();
            this.cacheConn.Close();
            return i;
        }
        catch (Exception)
        {
            this.Close();
            return 0;
        }
    }

    public int ExecuteProcedure(string ProcName, SqlParameter[] Params)
    {
        try
        {
            if (this.cacheConn.State != ConnectionState.Open)
                this.cacheConn.Open();
            SqlCommand cacheComm = new SqlCommand(ProcName, cacheConn);
            cacheComm.CommandType = CommandType.StoredProcedure;
            if (Params != null)
            {
                foreach (SqlParameter Para in Params)
                    cacheComm.Parameters.Add(Para);
            }

            int Result = cacheComm.ExecuteNonQuery();
            cacheComm.Dispose();
            this.cacheConn.Close();
            return Result;
        }
        catch (Exception)
        {
            this.Close();
            return -1;
        }
    }
    public static DataAdapter Instance()
    {
        return new DataAdapter();
    }
    public static DataAdapter Instance(string connStr)
    {
        return new DataAdapter(connStr);
    }


}

