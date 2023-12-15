program z1;
uses Crt;
const norm=White; select=LightRed; N=3;
var i,a,z,b,punkt,x,y:int64; ch:char;menuarr:array[1..N] of string; 
function Fbig(x:real):real;
begin
   Fbig:=(1/2)*power(x,4)-(2/3)*power(x,3)-power(x,2)+4*x
end;
function f(x:real):real;
begin
  f:=2*power(x,3)+(-2)*power(x,2)+(-2)*x+4;
end;
function metod_trap(z,a,b:int64):real;
var hz,x,h:real; i:int64;
begin
  h:=(b-a)/z;
  x:=a;
  for i:=1 to z-1 do
    begin
    hz+=f(x);
    x+=h;
    end;
  metod_trap:=(h/2)*(f(a)+f(b-h))+h*hz;  
end;

Procedure punkt1;
begin
ClrScr;
      Write('Кол-во отрезков ');
      read(z);
      Write('Начало ');
      read(a);
      Write('Конец ');
      readln(b);
      writeln('Результат: ',metod_trap(z,a,b));
Write('Назад');
readln;
end;

Procedure punkt2;
begin
ClrScr;

      if z=0 then Writeln('Пределы интегрирования неопределенны')
      else
        begin
    writeln('Oценка абсолютной погрешности...');
    sleep(500);
    writeln('Подождите. Вычисляем...');
    sleep(1000);
    writeln('Абсолютная погрешность ',abs(Fbig(b)-Fbig(a))-metod_trap(z,a,b));
        end;
Write('Назад');
readln;
end;

procedure Menu;
var i:int64;
begin
ClrScr;
for i:=1 to N do
  begin
  GoToXY(x,y+i-1);
  write(menuarr[i])
  end;
 TextColor(select);
GoToXY(x,y+punkt-1);
write(menuarr[punkt]);
TextColor(norm);
end;



begin
  menuarr[1]:='Вычислить по методу трапеций';
  menuarr[2]:='Посмотреть погрешность';
  menuarr[3]:='Выход';
  punkt:=1; x:=5; y:=1;
  TextColor(norm);
  Menu;
repeat
  ch:=ReadKey;
  if ch=#0 then begin
    ch:=ReadKey;
    case ch of
      '(':{ стрелка вниз }
        if punkt<N then begin
        GoToXY(x,y+punkt-1); write(menuarr[punkt]);
        punkt:=punkt+1;
        TextColor(select);
        GoToXY(x,y+punkt-1); write(menuarr[punkt]);
        TextColor(norm);
      end;
      '&':{ стрелка вверх }
         if punkt>1 then begin
        GoToXY(x,y+punkt-1); write(menuarr[punkt]);
        punkt:=punkt-1;
        TextColor(select);
        GoToXY(x,y+punkt-1); write(menuarr[punkt]);
        TextColor(norm);
      end;

    end;
  end
  else
      if ch=#13 then begin { нажата клавиша <Enter> }
        case punkt of
          1:punkt1;
          2:punkt2;
          3:ch:=#27;{ выход }
        end;
        Menu;
      end;
until ch=#27;{ 27 - код <Esc> }
end.