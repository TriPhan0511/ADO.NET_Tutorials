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

namespace CRUD_Tutorial_WindowsFormsApp
{
    public partial class Form1 : Form
    {
        // Declare an id variable used in Updating and Deleting 
        private int id = 0;

        public Form1()
        {
            InitializeComponent();
            DisplayData();
        }
        
        // Event handler for dataGridView's RowHeaderMouseClick event
        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString());
            string name = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            nameTextBox.Text = name;
            string state = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            stateTextBox.Text = state;
        }

        // Insert a new recorde to the database
        // Then update the DataGridView's data source.
        private void insertButton_Click(object sender, EventArgs e)
        {
            if (nameTextBox.Text != "" && stateTextBox.Text != "")
            {
                string connectionString = GetConnectionString();
                string queryString = "INSERT INTO dbo.person(person_name, person_state) VALUES (@name, @state)";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(queryString, connection);
                    command.Parameters.AddWithValue("@name", nameTextBox.Text);
                    command.Parameters.AddWithValue("@state", stateTextBox.Text);
                    command.ExecuteNonQuery();
                    DisplayData();
                    ClearData();
                    MessageBox.Show("A record was inserted successfully");
                }
            }
            else
            {
                MessageBox.Show("Provide information for inserting please!");
            }
        }

        // Update a record
        private void updateButton_Click(object sender, EventArgs e)
        {
            if (nameTextBox.Text != "" && stateTextBox.Text != "")
            {
                string connectionString = GetConnectionString();
                string queryString =
                    "UPDATE dbo.person SET person_name = @name, person_state = @state WHERE person_id = @id";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(queryString, connection);
                    command.Parameters.AddWithValue("@name", nameTextBox.Text);
                    command.Parameters.AddWithValue("@state", stateTextBox.Text);
                    command.Parameters.AddWithValue("@id", id.ToString());
                    command.ExecuteNonQuery();
                    DisplayData();
                    ClearData();
                    MessageBox.Show("A record was updated.");
                }
            }
            else
            {
                MessageBox.Show("Provide information for updating please!");
            }
            
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            if (id != 0)
            {
                string connectionString = GetConnectionString();
                string queryString = "DELETE FROM dbo.person WHERE person_id = @id";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(queryString, connection);
                    command.Parameters.AddWithValue("@id", id.ToString());
                    command.ExecuteNonQuery();
                    DisplayData();
                    ClearData();
                    MessageBox.Show("A record was deleted.");
                }
            }
            else
            {
                MessageBox.Show("Please select a record you want to delete.");
            }
            
        }

        

        // Display data on a the DataGridView
        private void DisplayData()
        {
            string connectionString = GetConnectionString();
            string queryString = "SELECT person_id, person_name, person_state FROM dbo.person";
            DataSet dataSet = SelectRows(connectionString, queryString, "personTable");
            dataGridView1.DataSource = dataSet.Tables["personTable"];
        }

        // Clear text boxes and set id = 0
        private void ClearData()
        {
            nameTextBox.Text = "";
            stateTextBox.Text = "";
            id = 0;
        }

        // Use SqlDataAdapter to get data from a database
        // Then use the Fill method of the SqlDataAdapter to fill data to a DataSet
        // Finally, return the filled DataSet.
        private static DataSet SelectRows(string connectionString,
            string queryString, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(queryString, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, tableName);
                return dataSet;
            }
        }

        // Get a connection string
        private string GetConnectionString()
        {
            return "Data Source=.;Initial Catalog=CRUD_IN_ADO_NET_DB;Integrated Security=True";
        }
    }
}
