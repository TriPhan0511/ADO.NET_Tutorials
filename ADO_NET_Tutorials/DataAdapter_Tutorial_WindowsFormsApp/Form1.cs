using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data;
using System.Data.SqlClient;

namespace DataAdapter_Tutorial_WindowsFormsApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //private void Form1_Load(object sender, EventArgs e)
        //{
        //    string connectionString =
        //        "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
        //    string queryString =
        //        "SELECT CategoryID, CategoryName FROM dbo.Categories ";
        //    // Create a SqlConnection instance
        //    SqlConnection connection = new SqlConnection(connectionString);
        //    // Create a SqlDataAdapter instance
        //    SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
        //    // Create a DataSet instance
        //    DataSet dataSet = new DataSet();
        //    // Fill the dataSet with records returned by SELECT statement written in SqlDataAdapter
        //    //adapter.Fill(dataSet);
        //    adapter.Fill(dataSet, "categories");

        //    // Bind the data source of the dataGridView1
        //    dataGridView1.DataSource = dataSet.Tables["categories"];
        //}

        private void Form1_Load(object sender, EventArgs e)
        {
            // Declare a connection string
            string connectionString = GetConnectionString();
            // Declare a query string (SELECT statement)                
            string queryString =
                "SELECT CategoryID, CategoryName FROM dbo.Categories ";

            // Initialize a DataSet instance
            DataSet dataSet = new DataSet();
            // Fill the data to the dataSet
            // Way 1: Do not use a table name
            //SelectRows(dataSet, connectionString, queryString);
            // Way 2: Use a table name
            SelectRows2(dataSet, connectionString, queryString, "categories");

            // Bind data to the dataGridView's data source
            // Way 1: Do not use a table name
            //dataGridView1.DataSource = dataSet.Tables[0];
            // Way 2: Use a table name
            dataGridView1.DataSource = dataSet.Tables["categories"];

            //string queryString2 =
            //    "SELECT CustomerID, ContactName FROM dbo.Customers";
            //SelectRows2(dataSet, connectionString, queryString2, "customers");
            ////dataGridView1.DataSource = dataSet.Tables[0];
            //dataGridView1.DataSource = dataSet.Tables["customers"];
        }

        // Use this method we can retrieve a connection string 
        // from a configuration file instead of storing it in the code.
        private string GetConnectionString()
        {
            return "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
        }

        // Fill data to a DataSet and set name for table in the DataSet
        private DataSet SelectRows2(DataSet dataSet,
            string connectionString, string queryString, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataSet, tableName);
            }

            return dataSet;
        }

        // Fill data to a DataSet
        private DataSet SelectRows(DataSet dataSet,
            string connectionString, string queryString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataSet); 
            }

            return dataSet;
        }
    }
}
