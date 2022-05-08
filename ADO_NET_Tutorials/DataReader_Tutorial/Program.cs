using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;


namespace DataReader_Tutorial
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connectionString =
                "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);

            //// Retrieve data using a DataReader
            //HasRows(connection);

            //// Retrieve multiple result sets using NextResult
            //RetrieveMultipleResults(connection);

            //// Getting schema information from the DataReader
            //GetSchemaInfo(connection);  

            // Another example
            ReadOrderData(connection);
        }

        private static void ReadOrderData(SqlConnection connection)
        {
            using (connection)
            {
                string queryString =
                    "SELECT OrderID, CustomerID FROM dbo.Orders";
                SqlCommand command = new SqlCommand(queryString, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Call Read before accesing data.
                    while (reader.Read())
                    {
                        ReadSingleRow((IDataRecord)reader);
                    }

                    // Call Close when done reading.
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        private static void ReadSingleRow(IDataRecord dataRecord)
        {
            Console.WriteLine($"\t{dataRecord[0]}\t{dataRecord[1]}");
        }

        // Getting schema information from the DataReader
        static void GetSchemaInfo(SqlConnection connection)
        {
            using (connection)
            {
                string queryString =
                    "SELECT CategoryID, CategoryName FROM dbo.Categories;";
                SqlCommand command = new SqlCommand(queryString, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    DataTable schemaTable = reader.GetSchemaTable();

                    foreach (DataRow row in schemaTable.Rows)
                    {
                        foreach (DataColumn column in schemaTable.Columns)
                        {
                            Console.WriteLine($"{column.ColumnName} = {row[column]}");
                        }
                        Console.WriteLine();
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        /// <summary>
        /// Retrieve multiple result sets using NextResult
        /// 
        /// If the DataReader returns multiple result sets, call the NextResult method
        /// to iterate through the result sets sequentially.
        /// 
        /// The following example show the SqlDataReader processing the results of
        /// two SELECT statement using the ExecuteReader method.
        /// </summary>
        /// <param name="connection"></param>
        private static void RetrieveMultipleResults(SqlConnection connection)
        {
            string queryString =
                "SELECT CategoryID, CategoryName FROM dbo.Categories;" +
                "SELECT EmployeeID, LastName FROM dbo.Employees;";
            using (connection)
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.HasRows)
                    {
                        Console.WriteLine($"\t{reader.GetName(0)}\t{reader.GetName(1)}");
                        while (reader.Read())
                        {
                            Console.WriteLine($"\t{reader.GetInt32(0)}\t{reader.GetString(1)}");
                        }
                        reader.NextResult();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        // Retrieve data using a DataReader
        private static void HasRows(SqlConnection connection)
        {
            using (connection)
            {
                string queryString =
                    "SELECT CategoryID, CategoryName FROM dbo.Categories";
                SqlCommand command = new SqlCommand(queryString, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine($"\t{reader.GetInt32(0)}\t{reader.GetString(1)}");
                        }
                    }
                    else
                    {
                        Console.WriteLine("No rows found.");
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }
        
    }
}
