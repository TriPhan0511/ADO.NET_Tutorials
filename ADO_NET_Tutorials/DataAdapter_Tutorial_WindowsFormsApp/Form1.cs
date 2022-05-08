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

        // 3. 
        //private void Form1_Load(object sender, EventArgs e)
        //{
        //    // Create a DataTable instance named employeeTable
        //    DataTable employeeTable = new DataTable();
        //    DataColumn employeeIDColumn = new DataColumn("ID", typeof(Int32));
        //    DataColumn employeeNameColumn = new DataColumn("Name", typeof(String));
        //    DataColumn employeeCityColumn = new DataColumn("City", typeof(string));
        //    employeeTable.Columns.Add(employeeIDColumn);
        //    employeeTable.Columns.Add(employeeNameColumn);
        //    employeeTable.Columns.Add(employeeCityColumn);
        //    employeeTable.Rows.Add(1, "Alex", "Manchester");
        //    employeeTable.Rows.Add(2, "Peter", "New York");
        //    employeeTable.Rows.Add(3, "Hillary", "Melbourne");

        //    // Create a DataTable instance named teacherTable
        //    DataTable teacherTable = new DataTable();
        //    DataColumn teacherIDColumn = new DataColumn("ID", typeof (String));
        //    DataColumn teacherNameColumn = new DataColumn("Name", typeof (String));
        //    DataColumn subjectColumn = new DataColumn("Subject", typeof (String));
        //    teacherTable.Columns.Add(teacherIDColumn);
        //    teacherTable.Columns.Add(teacherNameColumn);
        //    teacherTable.Columns.Add(subjectColumn);
        //    teacherTable.Rows.Add(4, "David Teacher", "London");

        //    // Create a DataSet instance and add all DataTable instances to the DataSet instance
        //    DataSet dataSet = new DataSet();
        //    dataSet.Tables.Add(employeeTable);

        //    dataGridView1.DataSource = dataSet;
        //}
        //// ------------------------------------------------------------------------------------------------

        private void Form1_Load(object sender, EventArgs e)
        {
            // Use the MakeNamesTable method to create a new table
            DataTable table = MakeNamesTable();

            // Use NewRow method to create a DataRow
            DataRow row = table.NewRow();

            row["fname"] = "John";
            row["lname"] = "Smith";
            table.Rows.Add(row);

            DataRow row2 = table.NewRow();
            row2["fname"] = "Alex";
            row2["lname"] = "Ferguson";
            table.Rows.Add(row2);

            //foreach (DataColumn column in table.Columns)
            //{
            //    Console.WriteLine(column.ColumnName);
            //}

            dataGridView1.DataSource = table;
        }

        // 2.2 Fill the DataSet with records from a DataTable
        // ID field is auto increment
        private DataTable MakeNamesTable()
        {
            // Create a new DataTable titled "Names"
            DataTable namesTable = new DataTable("Names");

            // Add three DataColumn objects to the table
            DataColumn idColumn = new DataColumn();
            idColumn.DataType = Type.GetType("System.Int32");
            idColumn.ColumnName = "ID";
            idColumn.AutoIncrement = true;
            namesTable.Columns.Add(idColumn);

            DataColumn fnameColumn = new DataColumn();
            fnameColumn.DataType = Type.GetType("System.String");
            fnameColumn.ColumnName = "fName";
            fnameColumn.DefaultValue = "Fname";
            namesTable.Columns.Add(fnameColumn);

            DataColumn lnameColumn = new DataColumn();
            lnameColumn.DataType = Type.GetType("System.String");
            lnameColumn.ColumnName = "lname";
            lnameColumn.DefaultValue = "Lname";
            namesTable.Columns.Add(lnameColumn);

            // Create an array for DataColumn objects
            // and set PrimaryKey to that array
            DataColumn[] keys = new DataColumn[1];
            keys[0] = idColumn;
            namesTable.PrimaryKey = keys;

            // Return the new DataTable
            return namesTable;
        }

        //// 2. Fill the DataSet with records from a DataTable
        //private void Form1_Load(object sender, EventArgs e)
        //{
        //    // Create a DataTable instance
        //    DataTable dataTable = new DataTable();

        //    // Create three DataColumn instances
        //    DataColumn idColumn = new DataColumn("ID", typeof(Int32));
        //    DataColumn nameColumn = new DataColumn("Name", typeof(String));
        //    DataColumn cityColumn = new DataColumn("City", typeof(String));

        //    // Add three columns to the dataTable's collection of columns
        //    dataTable.Columns.Add(idColumn);
        //    dataTable.Columns.Add(nameColumn);
        //    dataTable.Columns.Add(cityColumn);

        //    // Create a row using specifed values and add it to the dataTable's collection of rows
        //    dataTable.Rows.Add(1, "Alex Ferguson", "Manchester");
        //    dataTable.Rows.Add(2, "Peter Pan", "New York");
        //    dataTable.Rows.Add(3, "Hillary Duff", "San Diego");

        //    // Set data for dataGridView's DataSource
        //    dataGridView1.DataSource = dataTable;
        //}
        //// ------------------------------------------------------------------------------------------------

        // 1. Fill the DataSet with records from the SqlDataAdapter
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
