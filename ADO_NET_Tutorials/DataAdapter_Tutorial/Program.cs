using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace DataAdapter_Tutorial
{
    internal class Program
    {
        static void Main(string[] args)
        {
            
        }

        /// <summary>
        /// The following example uses SqlCommand, SqlDataAdapter, and SqlConnection
        /// to select records from a database and populate a DataSet with the selected rows.
        /// The filled DataSet is then returned.
        /// To accomplish this, the method is passed an initialized DataSet, a connection string,
        /// and a query string that is a Transact-SQL SELECT statement.
        /// </summary>
        /// <param name="dataSet"></param>
        /// <param name="connectionString"></param>
        /// <param name="queryString"></param>
        /// <returns></returns>
        private static DataSet SelectRows(DataSet dataSet, 
            string connectionString, string queryString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataSet);
                return dataSet;
            }
        }
    }
}
