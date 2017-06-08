procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form12));
        self.timer1 := new System.Windows.Forms.Timer(self.components);
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        self.timer2 := new System.Windows.Forms.Timer(self.components);
        self.timer3 := new System.Windows.Forms.Timer(self.components);
        self.SuspendLayout();
        // 
        // timer1
        // 
        self.timer1.Interval := 1000;
        self.timer1.Tick += timer1_Tick;
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(12, 12);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(110, 29);
        self.button1.TabIndex := 0;
        self.button1.Text := 'Начать';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.Location := new System.Drawing.Point(12, 47);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(110, 29);
        self.button2.TabIndex := 1;
        self.button2.Text := 'button2';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Visible := false;
        self.button2.Click += button2_Click;
        // 
        // timer2
        // 
        self.timer2.Interval := 5000;
        self.timer2.Tick += timer2_Tick;
        // 
        // timer3
        // 
        self.timer3.Interval := 200;
        self.timer3.Tick += timer3_Tick;
        // 
        // Form12
        // 
        self.ClientSize := new System.Drawing.Size(306, 244);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.button1);
        self.Font := new System.Drawing.Font('Moire', 14.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(0)));
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.Name := 'Form12';
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := 'Цифренатор';
        self.FormClosed += Form12_FormClosed;
        self.Load += Form1_Load;
        self.ResumeLayout(false);
    end;
