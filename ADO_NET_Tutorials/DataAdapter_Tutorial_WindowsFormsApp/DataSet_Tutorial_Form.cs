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
    public partial class DataSet_Tutorial_Form : Form
    {
        public DataSet_Tutorial_Form()
        {
            InitializeComponent();
        }

        private void DataSet_Tutorial_Form_Load(object sender, EventArgs e)
        {
            string connectionString = GetConnectionString();
            string queryString = "SELECT CategoryID, CategoryName FROM dbo.Categories";
            DataSet dataSet = new DataSet();
            SelectRows(dataSet, connectionString, queryString, "categoriesTable");

            dataGridView1.DataSource = dataSet.Tables["categoriesTable"];
        }

        // Fill a DataSet with data from a database
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

        // Get connection string
        private string GetConnectionString()
        {
            return "Data Source=.;Initial Catalog=Northwind;Integrated Security=True";
        }

        
    }
}
