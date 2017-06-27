unit Sett;

interface

uses System, System.Drawing, System.Windows.Forms,kk,game;

var
  cl := false;
  GStart := false;

type
  Form2 = class(Form)
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure timer1_Tick(sender: Object; e: EventArgs);
    procedure Form2_FormClosing(sender: Object; e: FormClosingEventArgs);
  {$region FormDesigner}
  private
    {$resource Sett.Form2.resources}
    comboBox1: ComboBox;
    comboBox2: ComboBox;
    button1: Button;
    label1: &Label;
    label2: &Label;
    checkBox1: CheckBox;
    timer1: Timer;
    components: System.ComponentModel.IContainer;
    checkBox2: CheckBox;
    comboBox3: ComboBox;
    label3: &Label;
    checkBox3: CheckBox;
    checkBox5: CheckBox;
    button2: Button;
    {$include Sett.Form2.inc}
  {$endregion FormDesigner}
  public 
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

procedure Form2.button1_Click(sender: Object; e: EventArgs):=
  ComboBox2.Text := ComboBox1.Text;

procedure Form2.button2_Click(sender: Object; e: EventArgs);
begin
  //Передаем наши параметры в основной код
  Wid := strtoint(ComboBox1.Text);
  Hei := strtoint(ComboBox2.Text);
  Mix := CheckBox1.Checked;
  kk.Help := CheckBox2.Checked;
  Delay := strtoint(ComboBox3.Text);
  Aut := CheckBox3.Checked;
  ButEnable:=CheckBox5.Checked;
  self.Hide();
  
  var f2:= new Form12;
  f2.Show();
  //Да начнется игра!
  GStart := true;
end;

procedure Form2.timer1_Tick(sender: Object; e: EventArgs);
begin
  if not cl then
  begin
    Label3.Enabled:=CheckBox2.Checked;
    ComboBox3.Enabled:=CheckBox2.Checked;
    ButEnable:=CheckBox5.Checked;
    Aut := CheckBox3.Checked;
    //Проверка на подлинность
    try
      Wid := strtoint(ComboBox1.Text);
      Hei := strtoint(ComboBox2.Text);
      Delay:=strtoint(ComboBox3.Text);
    except
      ComboBox1.Text := Wid + '';
      ComboBox2.Text := Hei + '';
      ComboBox3.Text := Delay + '';
      MessageBox.Show('Поля могут быть заполнены только цифрами');
    end;
  end;
end;

procedure Form2.Form2_FormClosing(sender: Object; e: FormClosingEventArgs);
begin
  //Передаем наши параметры в основной код
  Wid := strtoint(ComboBox1.Text);
  Hei := strtoint(ComboBox2.Text);
  Mix := CheckBox1.Checked;
  Delay:=strtoint(ComboBox3.Text);
  kk.Help:= CheckBox2.Checked;
  ButEnable:=CheckBox5.Checked;
  cl := true;
end;

end.
