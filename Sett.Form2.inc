procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form2));
        self.comboBox1 := new System.Windows.Forms.ComboBox();
        self.comboBox2 := new System.Windows.Forms.ComboBox();
        self.button1 := new System.Windows.Forms.Button();
        self.label1 := new System.Windows.Forms.Label();
        self.label2 := new System.Windows.Forms.Label();
        self.checkBox1 := new System.Windows.Forms.CheckBox();
        self.button2 := new System.Windows.Forms.Button();
        self.timer1 := new System.Windows.Forms.Timer(self.components);
        self.checkBox2 := new System.Windows.Forms.CheckBox();
        self.comboBox3 := new System.Windows.Forms.ComboBox();
        self.label3 := new System.Windows.Forms.Label();
        self.checkBox3 := new System.Windows.Forms.CheckBox();
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
        self.button1.Size := new System.Drawing.Size(115, 35);
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
        self.button2.Location := new System.Drawing.Point(222, 204);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(75, 33);
        self.button2.TabIndex := 7;
        self.button2.Text := 'Готово';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // timer1
        // 
        self.timer1.Enabled := true;
        self.timer1.Tick += timer1_Tick;
        // 
        // checkBox2
        // 
        self.checkBox2.Checked := true;
        self.checkBox2.CheckState := System.Windows.Forms.CheckState.Checked;
        self.checkBox2.Location := new System.Drawing.Point(12, 174);
        self.checkBox2.Name := 'checkBox2';
        self.checkBox2.Size := new System.Drawing.Size(195, 24);
        self.checkBox2.TabIndex := 8;
        self.checkBox2.Text := 'Включить подсказки';
        self.checkBox2.UseVisualStyleBackColor := true;
        // 
        // comboBox3
        // 
        self.comboBox3.FormattingEnabled := true;
        self.comboBox3.Items.AddRange(new System.Object[10]('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'));
        self.comboBox3.Location := new System.Drawing.Point(114, 204);
        self.comboBox3.Name := 'comboBox3';
        self.comboBox3.Size := new System.Drawing.Size(93, 31);
        self.comboBox3.TabIndex := 9;
        self.comboBox3.Text := '5';
        // 
        // label3
        // 
        self.label3.Location := new System.Drawing.Point(12, 207);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(96, 28);
        self.label3.TabIndex := 10;
        self.label3.Text := 'Задержка';
        // 
        // checkBox3
        // 
        self.checkBox3.Location := new System.Drawing.Point(222, 128);
        self.checkBox3.Name := 'checkBox3';
        self.checkBox3.Size := new System.Drawing.Size(75, 24);
        self.checkBox3.TabIndex := 11;
        self.checkBox3.Text := 'Авто';
        self.checkBox3.UseVisualStyleBackColor := true;
        // 
        // Form2
        // 
        self.ClientSize := new System.Drawing.Size(309, 245);
        self.Controls.Add(self.checkBox3);
        self.Controls.Add(self.label3);
        self.Controls.Add(self.comboBox3);
        self.Controls.Add(self.checkBox2);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.checkBox1);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.comboBox2);
        self.Controls.Add(self.comboBox1);
        self.Font := new System.Drawing.Font('Moire', 14.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(0)));
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.MaximumSize := new System.Drawing.Size(325, 284);
        self.MinimumSize := new System.Drawing.Size(325, 284);
        self.Name := 'Form2';
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := 'Цифренатор - Настройки';
        self.FormClosing += Form2_FormClosing;
        self.ResumeLayout(false);
    end;
