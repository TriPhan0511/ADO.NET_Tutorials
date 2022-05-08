using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataAdapter_Tutorial_WindowsFormsApp
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new Form1());
            //Application.Run(new DataSet_Tutorial_Form());
            //Application.Run(new DataTable_Tutorial_Form());
            //Application.Run(new DataTable_Tutorial_2_Form());
            Application.Run(new DataSet_Tutorial_2_Form());
        }
    }
}
