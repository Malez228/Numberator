procedure InitializeComponent;
    begin
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form1));
        self.SuspendLayout();
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(714, 542);
        self.Font := new System.Drawing.Font('Moire', 14.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(0)));
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.Name := 'Form1';
        self.Text := 'Цифренатор';
        self.Load += Form1_Load;
        self.ResumeLayout(false);
    end;
