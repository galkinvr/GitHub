program Programma;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  P = 1000000;

type
  arr = array [1..P] of Integer;

procedure VyborIteracii(n:integer; var b:arr);
 var   i, j, h, ind, min:integer;
 begin
  for i:= 1 to n-1 do
      begin
        ind:= i;
        min:= b[i];
          for j:=i+1 to n do
          if b[j]<min then
          begin
          min:= b[j];
          ind:= j;
          end;
          if ind<>i then
          begin
            b[ind]:= b[i];
            b[i]:= min;
            for h:= 1 to n do
            begin
            Write(b[h], ' ');
            end;
            writeln;
            Writeln;
          end;
      end;
 end;

procedure VyborBezIteracij(n:integer; var b:arr);
 var   i, j, min, ind:integer;
 begin
   for i:= 1 to n-1 do
      begin
        min:= b[i];
        ind:= i;
          for j:=i+1 to n do
          if b[j]<min then
          begin
          min:= b[j];
          ind:= j;
          end;
          if ind<>i then
          begin
            b[ind]:= b[i];
            b[i]:= min;
          end;
      end;
 end;

var
  mas: arr;
  n, i: Integer;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
  name1, name2: string[80];
  otvet: Char;

begin
    Write('Please, enter the name of input file: ');
    Readln(name1);
    AssignFile(f1,name1);
    {$I-}
    Reset(f1);
    {$I+};
    If ioresult=2 then
    begin
    Writeln('Sorry, but you file not found...');
    readln;
    end
    else
    begin
      write('And now enter the name of output file: ');
      readln(name2);
      AssignFile(f2, name2);
      Rewrite(f2);
      read(f1, n);
      for i:= 1 to n do
      read(f1, mas[i]);
      write('Do you want to see all iterations of sorting? Your decision: ');
      Readln(otvet);
      Writeln;
    end;
      if otvet='y' then
      begin
      Writeln('Iterations: ');
      Writeln;
      Time:= Now;
      VyborIteracii(n, mas);
      Time:= Now-Time;
      Writeln('Sorting is over and all iterations have displayed.');
      end;
      if otvet='n' then
      begin
      time:= Now;
      VyborBezIteracij(n, mas);
      Time:= Now-time;
      Writeln('Sorting is over.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[n]);
    Write(f2, 'Âûáîð.');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln(f2);
    CloseFile(f1);
    CloseFile(f2);
    Readln;
end.
