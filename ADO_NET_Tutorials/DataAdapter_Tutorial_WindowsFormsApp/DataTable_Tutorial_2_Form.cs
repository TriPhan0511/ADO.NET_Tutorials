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
    public partial class DataTable_Tutorial_2_Form : Form
    {
        public DataTable_Tutorial_2_Form()
        {
            InitializeComponent();
        }

        private void DataTable_Tutorial_2_Form_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = MakeNamesTable();
        }

        private DataTable MakeNamesTable()
        {
            // Create a DataTable instance
            DataTable table = new DataTable();

            // Create two DataColumn instances
            // and add them to the table's collection of columns
            DataColumn idColumn = new DataColumn();
            idColumn.DataType = typeof(Int32);
            idColumn.ColumnName = "ID";
            idColumn.AutoIncrementSeed = 1;
            idColumn.AutoIncrement = true;
            table.Columns.Add(idColumn);

            //// Way 1:
            //DataColumn nameColumn = new DataColumn();
            //nameColumn.DataType = typeof(String);
            //nameColumn.ColumnName = "Name";

            // Way 2:
            DataColumn nameColumn = new DataColumn("Name", typeof(String));
            table.Columns.Add(nameColumn);

            // Create an array for DataColumn objects
            // and set table's PrimaryKey to this array
            DataColumn[] keys = new DataColumn[1];
            keys[0] = idColumn;
            table.PrimaryKey = keys;

            // Add one row to the table's collection of rows
            DataRow row = table.NewRow();
            //row["Name"] = "David Beckham"; // use the column's name
            row[1] = "Rose Mary"; // use the column's index
            table.Rows.Add(row);

            //// Add five rows to the table's collection of rows
            //DataRow[] rows = new DataRow[5];
            //for (int i = 0; i < rows.Length; i++)
            //{
            //    rows[i] = table.NewRow();
            //}
            //rows[0]["Name"] = "Owen";
            //rows[1]["Name"] = "Chris";
            //rows[2]["Name"] = "David";
            //rows[3]["Name"] = "Hillary";
            //rows[4]["Name"] = "Rose";
            //for (int i = 0; i < rows.Length; i++)
            //{
            //    table.Rows.Add(rows[i]);
            //}

            // Return the table
            return table;
        }
    }
}
