unit kk;
uses System.Drawing;
var
  Wid:=5;//Ширина поля
  Hei:=5;//Высота
  Mix:=false;//Премешивание?
  Help:=true;//Подсказки?
  Delay:=5;//Задержка подсказок
  Aut:=false;//Автопилот?
  
function ColorRnd():Color;
begin
  var Colors:= new List<Color>;
  Colors.Add(Color.FromArgb(255,100,64,15));
  Colors.Add(Color.FromArgb(255,121,85,61));
  Colors.Add(Color.FromArgb(255,108,104,116));
  Colors.Add(Color.FromArgb(255,76,88,102));
  Colors.Add(Color.FromArgb(255,71,74,81));
  Colors.Add(Color.FromArgb(255,71,42,63));
  Colors.Add(Color.FromArgb(255,173,0,95));
  Colors.Add(Color.FromArgb(255,66,16,97));
  Colors.Add(Color.FromArgb(255,50,18,102));
  Colors.Add(Color.FromArgb(255,102,0,53));
  Colors.Add(Color.FromArgb(255,18,10,143));
  Colors.Add(Color.FromArgb(255,139,0,255));
  Colors.Add(Color.FromArgb(255,123,104,238));
  Colors.Add(Color.FromArgb(255,28,211,162));
  Colors.Add(Color.FromArgb(255,255,77,0));
  Colors.Add(Color.FromArgb(255,255,46,46));
  Colors.Add(Color.FromArgb(255,165,38,10));
  Colors.Add(Color.FromArgb(255,227,36,23));
  Colors.Add(Color.FromArgb(255,247,82,22));
  Colors.Add(Color.FromArgb(255,237,32,77));
  Colors.Add(Color.FromArgb(255,255,36,131));
  Colors.Add(Color.FromArgb(255,255,0,204));
  Colors.Add(Color.FromArgb(255,205,0,205));
  Colors.Add(Color.FromArgb(255,51,51,255));
  Colors.Add(Color.FromArgb(255,0,140,240));
  Colors.Add(Color.FromArgb(255,66,94,23));
  Colors.Add(Color.FromArgb(255,0,143,0));
  Colors.Add(Color.FromArgb(255,255,202,90));
  Colors.Add(Color.FromArgb(255,250,183,0));
  Colors.Add(Color.FromArgb(255,255,36,0));
  Colors.Add(Color.FromArgb(255,95,230,32));
  Colors.Add(Color.FromArgb(255,60,170,60));
  Colors.Add(Color.FromArgb(255,18,47,170));
  Colors.Add(Color.FromArgb(255,20,118,255));
  Colors.Add(Color.FromArgb(255,0,140,240));
  
  Result:=Colors[Random(Colors.Count)];
end;

end.
