namespace Controls_Tutorials_2_WindowsFormsApp
{
    partial class ListBox_Tutorial_Form
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
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.getItems = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(107, 62);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(208, 173);
            this.listBox1.TabIndex = 0;
            // 
            // getItems
            // 
            this.getItems.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.getItems.Location = new System.Drawing.Point(369, 62);
            this.getItems.Name = "getItems";
            this.getItems.Size = new System.Drawing.Size(227, 29);
            this.getItems.TabIndex = 1;
            this.getItems.Text = "Get Items From ListBox";
            this.getItems.UseVisualStyleBackColor = true;
            this.getItems.Click += new System.EventHandler(this.getItems_Click);
            // 
            // ListBox_Tutorial_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.getItems);
            this.Controls.Add(this.listBox1);
            this.Name = "ListBox_Tutorial_Form";
            this.Text = "ListBox_Tutorial_Form";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Button getItems;
    }
}