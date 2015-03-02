program ProgrammaVstavka;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  P = 1000000;

type
  arr = array [1..P] of Integer;

procedure VstavkaIteracii(n:integer; var a:arr; z: boolean);
  var
  i, j, s, q: integer;
  begin
    for i:=2 to n do
      begin
        z:= False;
        q:=a[i];
        j:=i;
        while (j>1) and (q<a[j-1]) do
          begin
            a[j]:=a[j-1];
            j:=j-1;
            z:=True;
          end;
        a[j]:=q;
        if z=True then
        begin
          for s:= 1 to n do
          write(a[s], ' ');
          Writeln;
          Writeln;
        end;
      end;
  end;

procedure Vstavka(n:integer; var a:arr);
  var
  i, j, q: integer;
  begin
    for i:=2 to n do
      begin
        q:=a[i];
        j:=i;
        while (j>1) and (q<a[j-1]) do
          begin
            a[j]:=a[j-1];
            j:=j-1;
          end;
        a[j]:=q;
      end;
  end;

var
  mas: arr;
  h: boolean;
  n, i: Integer ;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
  name1, name2: string[80];
  otvet: Char;

begin
  begin
    write('Please, enter the name of input file: ');
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
      write('Please, enter the name of output file: ');
      readln(name2);
      AssignFile(f2, name2);
      Rewrite(f2);
      read(f1, n);
      for i:= 1 to n do
      read(f1, mas[i]);
      write('Do you want to see all iterations of sorting? Your decision: ');
      Readln(otvet);
      writeln;
    end;
      if otvet='y' then
      begin
      Writeln('Iterations: ');
      Writeln;
      Time:= Now;
      VstavkaIteracii(n, mas, h);
      time:=Now-Time;
      Writeln('Sorting is over and all iterations have displayed.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      if otvet='n' then
      begin
      time:= Now;
      Vstavka(n, mas);
      Time:= Now-time;
      Writeln('Sorting is over.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[n]);
    Write(f2, 'Âñòàâêà.');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln;
    CloseFile(f1);
    CloseFile(f2);
    Readln;
  { TODO -oUser -cConsole Main : Insert code here }
  end;
end.
