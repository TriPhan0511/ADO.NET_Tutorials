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

namespace Testing_WindowsFormsApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string connectionString = GetConnectionString();
            string queryString = "SELECT CustomerID, ContactName FROM dbo.Customers";

            DataSet dataSet = new DataSet();
            SelectRows(dataSet, connectionString, queryString, "customersTable");
            dataGridView1.DataSource = dataSet.Tables["customersTable"];
        }

        private void SelectRows(DataSet dataSet,
            string connectionString, string queryString, string tableName)

        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                adapter.Fill(dataSet, tableName);
            }
        }

        private string GetConnectionString()
        {
            return "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
        }
    }
}
