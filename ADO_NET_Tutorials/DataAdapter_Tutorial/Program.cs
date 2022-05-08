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
            DataSet dataSet = new DataSet();
            string connectionString = GetConnectionString();
            string queryString = "SELECT CategoryID, CategoryName FROM dbo.Categories ";
            //dataSet = SelectRows_0(dataSet, connectionString, queryString);
            SelectRows(dataSet, connectionString, queryString, "categoriesTable");

            // Print out each cell in a row
            //Console.WriteLine($"{dataSet.Tables[0].Rows[0][0]}");
            //Console.WriteLine($"{dataSet.Tables[0].Rows[0][1]}");

            // Print out a table
            DataTable table = dataSet.Tables["categoriesTable"];
            for (int i = 0; i < table.Rows.Count; i++)
            {
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    Console.Write($"{table.Rows[i][j]}\t");
                }
                Console.WriteLine();
            }

        }

        private static void SelectRows(DataSet dataSet, 
            string connectionString, string queryString, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataSet, tableName);
            }
        }



        // LINK: https://docs.microsoft.com/en-us/dotnet/api/system.data.sqlclient.sqldataadapter?view=dotnet-plat-ext-6.0
        // The following example uses SqlCommand, SqlDataAdapter, and SqlConnection
        // to select records from a database and populate a DataSet with the selected rows.
        // The filled DataSet is then returned.
        // To accomplish this, the method is passed an initialized DataSet, a connection string,
        // and a query string that is a Transact-SQL SELECT statement.
        private static DataSet SelectRows_0(DataSet dataSet, 
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

        // Get a connection string
        private static string GetConnectionString()
        {
            return "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
        }
    }
}
