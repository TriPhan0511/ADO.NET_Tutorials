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
    public partial class DataTable_Tutorial_Form : Form
    {
        public DataTable_Tutorial_Form()
        {
            InitializeComponent();
        }

        private void DataTable_Tutorial_Form_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = MakeNamesTable();
        }

        private DataTable MakeNamesTable()
        {
            // Create a DataTable instance
            DataTable table = new DataTable();

            // Create two DataColumn instances and add them to the table's collection of columns
            DataColumn idColumn = new DataColumn("ID", typeof(Int32));
            DataColumn nameColumn = new DataColumn("Name", typeof(String));
            table.Columns.Add(idColumn);
            table.Columns.Add(nameColumn);

            // Add three rows to the table's collection of rows
            table.Rows.Add(1, "Alex Fergunson");
            table.Rows.Add(2, "Peter Pan");
            table.Rows.Add(3, "Hillary Duff");

            // Return the table
            return table;
        }
    }
}
