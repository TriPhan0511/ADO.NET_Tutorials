using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Controls_Tutorials_2_WindowsFormsApp
{
    public partial class ListBox_Tutorial_Form : Form
    {
        public ListBox_Tutorial_Form()
        {
            InitializeComponent();

            //// Add items to the listBox1's Items
            //foreach (var item in MakeNamesList())
            //{
            //    listBox1.Items.Add(item);
            //}


            // Assign a List of strings to the listBox1's DataSource
            listBox1.DataSource = MakeNamesList();
        }

        private List<string> MakeNamesList()
        {
            List<string> list = new List<string>();
            list.Add("Alex Ferguson");
            list.Add("Brad Pitt");
            list.Add("Hillary Duff");
            list.Add("Rose Mary");
            list.Add("David Beckham");
            return list;
        }

        private void getItems_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            foreach (var item in listBox1.Items)
            {
                sb.AppendLine(item.ToString());
            }
            MessageBox.Show(sb.ToString());
        }
    }
}
