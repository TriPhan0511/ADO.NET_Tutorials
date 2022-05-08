namespace Controls_Tutorials_2_WindowsFormsApp
{
    partial class MenuStrip_Tutorial_Form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.openANewFormToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openANewFormToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.closeThisFormToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openANewFormToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(800, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // openANewFormToolStripMenuItem
            // 
            this.openANewFormToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openANewFormToolStripMenuItem1,
            this.closeThisFormToolStripMenuItem});
            this.openANewFormToolStripMenuItem.Name = "openANewFormToolStripMenuItem";
            this.openANewFormToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.openANewFormToolStripMenuItem.Text = "File";
            // 
            // openANewFormToolStripMenuItem1
            // 
            this.openANewFormToolStripMenuItem1.Name = "openANewFormToolStripMenuItem1";
            this.openANewFormToolStripMenuItem1.Size = new System.Drawing.Size(180, 22);
            this.openANewFormToolStripMenuItem1.Text = "Open a new form";
            this.openANewFormToolStripMenuItem1.Click += new System.EventHandler(this.openANewFormToolStripMenuItem1_Click);
            // 
            // closeThisFormToolStripMenuItem
            // 
            this.closeThisFormToolStripMenuItem.Name = "closeThisFormToolStripMenuItem";
            this.closeThisFormToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.closeThisFormToolStripMenuItem.Text = "Close this form";
            this.closeThisFormToolStripMenuItem.Click += new System.EventHandler(this.closeThisFormToolStripMenuItem_Click);
            // 
            // MenuStrip_Tutorial_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MenuStrip_Tutorial_Form";
            this.Text = "Form1";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem openANewFormToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem openANewFormToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem closeThisFormToolStripMenuItem;
    }
}

