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
    public partial class MenuStrip_Tutorial_Form : Form
    {
        public MenuStrip_Tutorial_Form()
        {
            InitializeComponent();
        }

        private void closeThisFormToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void openANewFormToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
        }
    }
}
