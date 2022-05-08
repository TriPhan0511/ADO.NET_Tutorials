using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataAdapter_Tutorial_WindowsFormsApp
{
    public partial class DataSet_Tutorial_2_Form : Form
    {
        public DataSet_Tutorial_2_Form()
        {
            InitializeComponent();
        }

        private DataSet dataSet;
        private void DataSet_Tutorial_2_Form_Load(object sender, EventArgs e)
        {
            dataSet = MakeDataSet();
        }

        // Create a DataSet
        private DataSet MakeDataSet()
        {
            // Create a DataTable instance
            DataTable table = new DataTable();

            // Create two DataColumn instances
            // and add them to the table's collection of columns
            DataColumn idColumn = new DataColumn("ID", typeof(Int32));
            idColumn.AutoIncrement = true;
            idColumn.AutoIncrementSeed = 1;
            table.Columns.Add(idColumn);
            DataColumn nameColumn = new DataColumn("Name", typeof(String));
            nameColumn.DefaultValue = "Name";
            table.Columns.Add(nameColumn);

            // Add three rows to the table's collection of rows
            DataRow[] rows = new DataRow[3];
            for (int i = 0; i < rows.Length; i++)
            {
                rows[i] = table.NewRow();
            }
            rows[0]["Name"] = "Alex Ferguson";
            rows[1]["Name"] = "Arsene Wenger";
            rows[2]["Name"] = "Guardiola";
            for (int i = 0; i < rows.Length; i++)
            {
                table.Rows.Add(rows[i]);
            }

            // Create a DataSet instance
            DataSet dataSet = new DataSet();

            // Add the table to the dataSet's collection of tables
            dataSet.Tables.Add(table);

            // Return the dataSet
            return dataSet;
        }

        private void showButton_Click(object sender, EventArgs e)
        {
            // Use column's name
            //idTextBox.Text = dataSet.Tables[0].Rows[0]["id"].ToString();
            //nameTextBox.Text = dataSet.Tables[0].Rows[0]["name"].ToString();

            // Use column's index
            idTextBox.Text = dataSet.Tables[0].Rows[0][0].ToString();
            nameTextBox.Text = dataSet.Tables[0].Rows[0][1].ToString();
        }
    }
}
