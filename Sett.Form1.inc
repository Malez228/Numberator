procedure InitializeComponent;
    begin
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form1));
        self.comboBox1 := new System.Windows.Forms.ComboBox();
        self.comboBox2 := new System.Windows.Forms.ComboBox();
        self.button1 := new System.Windows.Forms.Button();
        self.label1 := new System.Windows.Forms.Label();
        self.label2 := new System.Windows.Forms.Label();
        self.checkBox1 := new System.Windows.Forms.CheckBox();
        self.button2 := new System.Windows.Forms.Button();
        self.SuspendLayout();
        // 
        // comboBox1
        // 
        self.comboBox1.FormattingEnabled := true;
        self.comboBox1.Items.AddRange(new System.Object[7]('4', '5', '6', '7', '8', '9', '10'));
        self.comboBox1.Location := new System.Drawing.Point(128, 12);
        self.comboBox1.Name := 'comboBox1';
        self.comboBox1.Size := new System.Drawing.Size(79, 31);
        self.comboBox1.TabIndex := 1;
        self.comboBox1.Text := '5';
        // 
        // comboBox2
        // 
        self.comboBox2.FormattingEnabled := true;
        self.comboBox2.Items.AddRange(new System.Object[7]('4', '5', '6', '7', '8', '9', '10'));
        self.comboBox2.Location := new System.Drawing.Point(128, 76);
        self.comboBox2.Name := 'comboBox2';
        self.comboBox2.Size := new System.Drawing.Size(79, 31);
        self.comboBox2.TabIndex := 2;
        self.comboBox2.Text := '5';
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(13, 42);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(109, 35);
        self.button1.TabIndex := 3;
        self.button1.Text := 'Одинаковые';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(13, 15);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(100, 23);
        self.label1.TabIndex := 4;
        self.label1.Text := 'Ширина';
        // 
        // label2
        // 
        self.label2.Location := new System.Drawing.Point(13, 80);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(100, 23);
        self.label2.TabIndex := 5;
        self.label2.Text := 'Высота';
        // 
        // checkBox1
        // 
        self.checkBox1.Location := new System.Drawing.Point(12, 113);
        self.checkBox1.Name := 'checkBox1';
        self.checkBox1.Size := new System.Drawing.Size(211, 55);
        self.checkBox1.TabIndex := 6;
        self.checkBox1.Text := 'Изменять местоположение кнопок';
        self.checkBox1.UseVisualStyleBackColor := true;
        // 
        // button2
        // 
        self.button2.Location := new System.Drawing.Point(222, 175);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(75, 33);
        self.button2.TabIndex := 7;
        self.button2.Text := 'Готово';
        self.button2.UseVisualStyleBackColor := true;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(309, 220);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.checkBox1);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.comboBox2);
        self.Controls.Add(self.comboBox1);
        self.Font := new System.Drawing.Font('Moire', 14.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(0)));
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.Name := 'Form1';
        self.Text := 'Цифренатор - Настройки';
        self.ResumeLayout(false);
    end;
