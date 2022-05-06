using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;

namespace First_Tutorial_ConsoleApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            
            (new Program()).DisplayData();
        }

        private void DisplayData()
        {
            string connectionString =
                "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";

            string queryString =
                    "SELECT ProductID, UnitPrice, ProductName " +
                    "FROM dbo.Products " +
                    "WHERE UnitPrice > @pricePoint " +
                    "ORDER BY UnitPrice DESC";
            int parameterValue = 5;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@pricePoint", parameterValue);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"\t{reader[0]}\t{reader[1]}\t{reader[2]}");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //static void Main(string[] args)
        //{
        //    //string connectionString = 
        //    //    "Data Source=(local);Initial Catalog=Northwind;Integrated Security=true";
        //    string connectionString = 
        //        "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";

        //    // Provide the query string with a parameter placeholder
        //    string queryString =
        //        "SELECT ProductID, UnitPrice, ProductName "
        //        + "FROM dbo.Products " 
        //        + "WHERE UnitPrice > @pricePoint " 
        //        + "ORDER BY UnitPrice DESC";

        //    // Specify the parameter value
        //    int parameterValue = 5;

        //    // Create and open the connection in a using block.
        //    // This ensures that all resources will be closed and disposed
        //    // when the code exits.
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        // Create the Command and Parameter objects
        //        SqlCommand command = new SqlCommand(queryString, connection);
        //        command.Parameters.AddWithValue("@pricePoint", parameterValue);

        //        // Open the connection in a try/catch block.
        //        // Create and execute the DataReader, writing the result set
        //        // to the console window.
        //        try
        //        {
        //            connection.Open();
        //            SqlDataReader reader = command.ExecuteReader();
        //            while (reader.Read())
        //            {
        //                Console.WriteLine($"\t{reader[0]}\t{reader[1]}\t{reader[2]}");
        //                //Console.WriteLine("\t{0}\t{1}\t{2}", reader[0], reader[1], reader[2]);
        //            }
        //            reader.Close();
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine(ex.Message);
        //        }
        //    }


        //}
    }
}
