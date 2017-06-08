unit Game;

interface

uses System, System.Drawing, System.Windows.Forms,kk;

var
  //����� ���� � �����, ������� ����� ������ � ������ ������
  time, c: integer;
  //��� ����������� -_-
  maxbutton := Wid * Hei;

type
  Form12 = class(Form)
    procedure Form1_Load(sender: Object; e: EventArgs);
    procedure timer1_Tick(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure Form12_FormClosed(sender: Object; e: FormClosedEventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure timer2_Tick(sender: Object; e: EventArgs);
    procedure timer3_Tick(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Game.Form12.resources}
    timer1: Timer;
    button1: Button;
    button2: Button;
    timer2: Timer;
    timer3: Timer;
    components: System.ComponentModel.IContainer;
    {$include Game.Form12.inc}
  {$endregion FormDesigner}
  public 
    constructor;
    begin
      InitializeComponent;
    end;
  end;


implementation

procedure Form12.Form1_Load(sender: Object; e: EventArgs);
var
  margin := 12;//������ �� ����
  cellSize := 70;//������ ������
  indent := 6;//������ ����� ��������
begin
  
  //�������� ������� ���������
  Timer2.Interval := Delay * 1000 + 1;
  
  //������������ ������ ���� ��� ��������� ������ ����
  self.Width := margin * 2 + cellSize * Wid + indent * (Wid + 1) + indent div 2;
  self.Height := margin * 3 + cellSize * (Hei + 1) + indent * (Hei + 3) + indent;
  self.MinimumSize := Self.Size;
  self.maximumSize := Self.Size;
  
  //������� ������ � RealTime
  for var i := 0 to Wid - 1 do
    for var j := 0 to Hei - 1 do
    begin
      var b: Button;
      b := new Button();
      b.Parent := self;
      b.Name := 'But' + i;
      b.Width := cellSize;
      b.Height := cellSize;
      b.Location := new Point(margin + cellSize * i + indent * (i), margin + cellSize * (j) + indent * j);
      b.TabStop := false;
      b.Click += button2_Click;
      Controls.Add(b);
    end;
  
  //������ ������ ������ �������, ����� ���������� �� ����� ������ � ������
  button1.Width := self.Width - Margin * 3 - indent div 2;
  button1.Height := cellSize;
  button1.Location := new Point(margin, self.Height - Margin - cellSize - cellSize div 2);
end;

procedure Form12.timer1_Tick(sender: Object; e: EventArgs);
begin
  //������ ��� ����������� �����
  inc(time);
  button1.Text := '������ ������: ' + time;
  
  //�������� �� �������
  //����� ���� ������� ��������� ������ � ������� ���������� ��� ��������,
  //�� �� ����� ��
  if c >= maxbutton + 1 then 
  begin
    timer1.Enabled := false;
    MessageBox.Show('������' + #10 + '������ ������: ' + time);
    
    //�� ���� ��� ������ ���� ������� �� ���� �������
    timer3.Enabled := false;
    timer2.Enabled := false;
    
    //���������� ���� ���������� � ������
    try
      var rec: PABCSystem.Text;
      Assign(rec, 'Records.txt');
      Append(rec);
      var localDate := DateTime.Now;
      if not Mix then Writeln(rec, localDate + ' ' + time + '���.' + ' ���� ' + Wid + 'x' + Hei) else
        Writeln(rec, localDate + ' ' + time + '���.' + ' ���� ' + Wid + 'x' + Hei + ' ����� ������������� �������');
      PABCSystem.Close(rec);
    except
      var rec: PABCSystem.Text;
      Assign(rec, 'Records.txt');
      ReWrite(rec);
      PABCSystem.Close(rec);
      Assign(rec, 'Records.txt');
      Append(rec);
      var localDate := DateTime.Now;
      if not Mix then Writeln(rec, localDate + ' ' + time + '���.' + ' ���� ' + Wid + 'x' + Hei) else
        Writeln(rec, localDate + ' ' + time + '���.' + ' ���� ' + Wid + 'x' + Hei + ' ����� ������������� �������');
      PABCSystem.Close(rec);
    end;
    
    //�� � ������ ������, ����� ����� ���� ��� ��������
    button1.Text := '������';    
    button1.Enabled := true;
  end;
end;

procedure NumGen(f: Form; isBegin: boolean);
var
  a: List<integer>;
begin
  a := new List<integer>;
  //���� �� �������� ��� ������ ������, ��
  if isBegin then
  begin
    //��� ������� � �� �������� ������ �������
    for var i := 1 to maxbutton do
      a.Add(i);
  end else
  begin
    //����� (����� �� �������� ��� �������������) �� ����� ����� � �������� ������
    foreach var con: Control in f.Controls do
      if (con.Name <> 'button1') and (con.Name <> 'button2') then
        if con.Enabled then
          a.Add(strtoint(con.Text));
  end;
  
  //������ �� �������
  foreach var con: Control in f.Controls do
    if con.Enabled then
      if (con.Name <> 'button1') and (con.Name <> 'button2') then
      begin
        //�������� �������
        var rnd := PABCSystem.Random(0, a.Count - 1);
        //������ ����� � �������
        con.Text := a[rnd] + '';
        con.ForeColor := Color.FromArgb(255, PABCSystem.Random(255), PABCSystem.Random(255), PABCSystem.Random(255));
        con.BackColor := Color.FromArgb(255, 225, 225, 225);
        //� ������� ���� ����� �� �������, ����� ������ �� �� ������
        a.RemoveAt(rnd);
      end;
end;

//������ ������
procedure Form12.button1_Click(sender: Object; e: EventArgs);
begin
  //������� ������ � ������� ��� ������ � �������� �� ����
  var a: List<integer>;
  a := new List<integer>;
  for var i := 1 to maxbutton do
    a.Add(i);
  
  //��������� ���������� ������
  c := 1;
  time := 0;
  timer1.Enabled := true;
  if kk.Help then timer2.Enabled := true;
  
  //� ��� � �� ����� ����������, ������� ����� ���� ������ �������
  //(��� ������ ��� ��������������)
  if Aut then timer3.Enabled := true;
  
  //������ �� �������
  foreach var con: Control in self.Controls do
    if (con.Name <> 'button1') and (con.Name <> 'button2') then
      //�� ����� ��������, ����� � ����������� ����� ��� ����� ���������
      con.Enabled := true;
  
  //������ ��������� ����� �� �������
  NumGen(self, true);
  //�������� ����� ����� ������� ��������
  button1.Enabled := false;
end;

procedure Form12.Form12_FormClosed(sender: Object; e: FormClosedEventArgs):=
Application.Exit();

//���������� ����������� ������
procedure Form12.button2_Click(sender: Object; e: EventArgs);
begin
  //������� ������ - ���� ����
  if timer1.Enabled then
  begin
    //�������� ���������, ���� �����
    if kk.Help then timer2.Enabled := false;
    
    //�������� ������, ������� ������ ���� ��
    var b: Button;
    b := (sender) as Button;
    //���� �� ���������� ����� ������ ��� �����, ��
    if c = strtoint(b.Text) then
      //���� ����� �� ����� ������������, ��
      if not Mix then
      begin
        //������ ��������� ������, ����������� ������ �����
        b.Enabled := false;
        inc(c);
        if kk.Help then timer2.Enabled := true;
        //�� � ����� ���� ��������, ���� �������� ����
        b.BackColor := Color.FromArgb(255, 250, 210, 1);
      end else
      begin
        //���� �� ��� ����� ������������, �� ������ �� �� �����
        b.Enabled := false;
        inc(c);      
        b.BackColor := Color.FromArgb(255, 250, 210, 1);
        //�� �������� 'false' �.�. �� ������������
        NumGen(self, false);
      end;
    if kk.Help then timer2.Enabled := true;
  end;
end;

//���� ���������
procedure Form12.timer2_Tick(sender: Object; e: EventArgs);
begin
  //��� ��������� ������
  foreach var con: Control in self.Controls do
    if con.Text = inttostr(c) then
    begin
      //������� ���� � ����������
      con.BackColor := Color.FromArgb(255, 113, 206, 235);
      timer2.Enabled := false;
    end;
end;

//������ ��� ��� ��������������...
procedure Form12.timer3_Tick(sender: Object; e: EventArgs);
begin
  if timer1.Enabled then
    foreach var con: Control in self.Controls do
      //��, �� ������ ��������� ����� � '����' �� ������
      if con.Text = inttostr(c) then
        button2_click(con, new EventArgs);
end;

end.
