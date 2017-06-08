unit Game;

interface

uses System, System.Drawing, System.Windows.Forms,kk;

var
  //Время игры и цифра, которую нужно нажать в данный момент
  time, c: integer;
  //Без коментариев -_-
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
  margin := 12;//Отступ от края
  cellSize := 70;//Размер ячейки
  indent := 6;//Отступ между ячейками
begin
  
  //Интервал таймера подсказок
  Timer2.Interval := Delay * 1000 + 1;
  
  //Подстраиваем размер окна под выбранный размер поля
  self.Width := margin * 2 + cellSize * Wid + indent * (Wid + 1) + indent div 2;
  self.Height := margin * 3 + cellSize * (Hei + 1) + indent * (Hei + 3) + indent;
  self.MinimumSize := Self.Size;
  self.maximumSize := Self.Size;
  
  //Создаем кнопки в RealTime
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
  
  //Кнопку начать просто изменим, иначе обработчик не будет связан с формой
  button1.Width := self.Width - Margin * 3 - indent div 2;
  button1.Height := cellSize;
  button1.Location := new Point(margin, self.Height - Margin - cellSize - cellSize div 2);
end;

procedure Form12.timer1_Tick(sender: Object; e: EventArgs);
begin
  //Каждый тик увеличиваем время
  inc(time);
  button1.Text := 'Секунд прошло: ' + time;
  
  //Проверка на победку
  //Можно было сделать отдельный таймер с нулевым интервалом для проверки,
  //но хз нужно ли
  if c >= maxbutton + 1 then 
  begin
    timer1.Enabled := false;
    MessageBox.Show('Победа' + #10 + 'Секунд прошло: ' + time);
    
    //По сути тут должно буть условие но всем плевать
    timer3.Enabled := false;
    timer2.Enabled := false;
    
    //Записываем наши достижения в файлик
    try
      var rec: PABCSystem.Text;
      Assign(rec, 'Records.txt');
      Append(rec);
      var localDate := DateTime.Now;
      if not Mix then Writeln(rec, localDate + ' ' + time + 'сек.' + ' поле ' + Wid + 'x' + Hei) else
        Writeln(rec, localDate + ' ' + time + 'сек.' + ' поле ' + Wid + 'x' + Hei + ' режим перемешивания включен');
      PABCSystem.Close(rec);
    except
      var rec: PABCSystem.Text;
      Assign(rec, 'Records.txt');
      ReWrite(rec);
      PABCSystem.Close(rec);
      Assign(rec, 'Records.txt');
      Append(rec);
      var localDate := DateTime.Now;
      if not Mix then Writeln(rec, localDate + ' ' + time + 'сек.' + ' поле ' + Wid + 'x' + Hei) else
        Writeln(rec, localDate + ' ' + time + 'сек.' + ' поле ' + Wid + 'x' + Hei + ' режим перемешивания включен');
      PABCSystem.Close(rec);
    end;
    
    //Ну и вернем кнопку, чтобы можно было еще поиграть
    button1.Text := 'Начать';    
    button1.Enabled := true;
  end;
end;

procedure NumGen(f: Form; isBegin: boolean);
var
  a: List<integer>;
begin
  a := new List<integer>;
  //Если мы работаем для кнопки начать, то
  if isBegin then
  begin
    //Нам плевать и мы хреначим массив сначала
    for var i := 1 to maxbutton do
      a.Add(i);
  end else
  begin
    //Иначе (когда мы работаем для перемешивания) мы берем цифры с активных кнопок
    foreach var con: Control in f.Controls do
      if (con.Name <> 'button1') and (con.Name <> 'button2') then
        if con.Enabled then
          a.Add(strtoint(con.Text));
  end;
  
  //Бегаем по кнопкам
  foreach var con: Control in f.Controls do
    if con.Enabled then
      if (con.Name <> 'button1') and (con.Name <> 'button2') then
      begin
        //Рандомим циферку
        var rnd := PABCSystem.Random(0, a.Count - 1);
        //Делаем штуки с кнопкой
        con.Text := a[rnd] + '';
        con.ForeColor := Color.FromArgb(255, PABCSystem.Random(255), PABCSystem.Random(255), PABCSystem.Random(255));
        con.BackColor := Color.FromArgb(255, 225, 225, 225);
        //И удаляем нашу цифру из массива, чтобы больше ее не видеть
        a.RemoveAt(rnd);
      end;
end;

//Кнопка начать
procedure Form12.button1_Click(sender: Object; e: EventArgs);
begin
  //Создаем массив с цифрами для кнопок и заливаем их туда
  var a: List<integer>;
  a := new List<integer>;
  for var i := 1 to maxbutton do
    a.Add(i);
  
  //Обновляем переменные всякие
  c := 1;
  time := 0;
  timer1.Enabled := true;
  if kk.Help then timer2.Enabled := true;
  
  //А вот и та самая проверочка, которую нужно было раньше пихнуть
  //(Это таймер для автозаполнения)
  if Aut then timer3.Enabled := true;
  
  //Бегаем по кнопкам
  foreach var con: Control in self.Controls do
    if (con.Name <> 'button1') and (con.Name <> 'button2') then
      //Их нужно включить, иначе в последующих играх они будут неактивны
      con.Enabled := true;
  
  //Рисуем случайные цифры на кнопках
  NumGen(self, true);
  //Кнопочку после этого конечно выключим
  button1.Enabled := false;
end;

procedure Form12.Form12_FormClosed(sender: Object; e: FormClosedEventArgs):=
Application.Exit();

//Обработчик создаваемых кнопок
procedure Form12.button2_Click(sender: Object; e: EventArgs);
begin
  //Включен таймер - игра идет
  if timer1.Enabled then
  begin
    //Включаем подсказки, если нужно
    if kk.Help then timer2.Enabled := false;
    
    //Получаем кнопку, которая начала этот ад
    var b: Button;
    b := (sender) as Button;
    //Если ее содержимое равно нужной нам цифре, то
    if c = strtoint(b.Text) then
      //Если цифры не нужно перемешивать, то
      if not Mix then
      begin
        //Просто выключаем кнопку, увеличиваем нужную цифру
        b.Enabled := false;
        inc(c);
        if kk.Help then timer2.Enabled := true;
        //ну и можно цвет поменять, чтоб заметнее было
        b.BackColor := Color.FromArgb(255, 250, 210, 1);
      end else
      begin
        //Если же нам нужно перемешивать, то делаем то же самое
        b.Enabled := false;
        inc(c);      
        b.BackColor := Color.FromArgb(255, 250, 210, 1);
        //Но передаем 'false' т.к. мы перемешиваем
        NumGen(self, false);
      end;
    if kk.Help then timer2.Enabled := true;
  end;
end;

//Наши подсказки
procedure Form12.timer2_Tick(sender: Object; e: EventArgs);
begin
  //Все предельно просто
  foreach var con: Control in self.Controls do
    if con.Text = inttostr(c) then
    begin
      //Заменил цвет и выключился
      con.BackColor := Color.FromArgb(255, 113, 206, 235);
      timer2.Enabled := false;
    end;
end;

//Лучший бот для автозаполнения...
procedure Form12.timer3_Tick(sender: Object; e: EventArgs);
begin
  if timer1.Enabled then
    foreach var con: Control in self.Controls do
      //Да, он просто проверяет текст и 'жмет' на кнопку
      if con.Text = inttostr(c) then
        button2_click(con, new EventArgs);
end;

end.
