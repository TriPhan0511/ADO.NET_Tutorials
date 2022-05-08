using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;

namespace DataAdapter_Tutorial_WindowsFormsApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        // 1. Fill the DataSet with records from a DataTable
        private void Form1_Load(object sender, EventArgs e)
        {
            // Create a DataTable instance
            DataTable dataTable = new DataTable();

            // Create three DataColumn instances
            DataColumn idColumn = new DataColumn("ID", typeof(Int32));
            DataColumn nameColumn = new DataColumn("Name", typeof(String));
            DataColumn cityColumn = new DataColumn("City", typeof(String));

            // Add three columns to the dataTable's collection of columns
            dataTable.Columns.Add(idColumn);
            dataTable.Columns.Add(nameColumn);
            dataTable.Columns.Add(cityColumn);

            // Create a row using specifed values and add it to the dataTable's collection of rows
            dataTable.Rows.Add(1, "Alex Ferguson", "Manchester");
            dataTable.Rows.Add(2, "Peter Pan", "New York");
            dataTable.Rows.Add(3, "Hillary Duff", "San Diego");

            // Set data for dataGridView's DataSource
            dataGridView1.DataSource = dataTable;
        }
        // ------------------------------------------------------------------------------------------------

        // 2. Fill the DataSet with records from the SqlDataAdapter
        //private void Form1_Load(object sender, EventArgs e)
        //{
        //    // Declare a connection string
        //    string connectionString = GetConnectionString();
        //    // Declare a query string (SELECT statement)                
        //    string queryString =
        //        "SELECT CategoryID, CategoryName FROM dbo.Categories ";

        //    // Initialize a DataSet instance
        //    DataSet dataSet = new DataSet();
        //    // Fill the data to the dataSet
        //    // Way 1: Do not use a table name
        //    //SelectRows(dataSet, connectionString, queryString);
        //    // Way 2: Use a table name
        //    SelectRows(dataSet, connectionString, queryString, "categories");

        //    // Bind data to the dataGridView's data source
        //    // Way 1: Do not use a table name
        //    //dataGridView1.DataSource = dataSet.Tables[0];
        //    // Way 2: Use a table name
        //    dataGridView1.DataSource = dataSet.Tables["categories"];

        //    //string queryString2 =
        //    //    "SELECT CustomerID, ContactName FROM dbo.Customers";
        //    //SelectRows2(dataSet, connectionString, queryString2, "customers");
        //    ////dataGridView1.DataSource = dataSet.Tables[0];
        //    //dataGridView1.DataSource = dataSet.Tables["customers"];
        //}

        // Use this method we can retrieve a connection string 
        // from a configuration file instead of storing it in the code.
        private string GetConnectionString()
        {
            return "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
        }

        // Fill the DataSet with records from the SqlDataAdapter
        // and set name for table in the DataSet
        private DataSet SelectRows(DataSet dataSet,
            string connectionString, string queryString, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataSet, tableName);
                return dataSet;
            }
        }

        // Fill the DataSet with records from the SqlDataAdapter
        private DataSet SelectRows_1(DataSet dataSet,
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
