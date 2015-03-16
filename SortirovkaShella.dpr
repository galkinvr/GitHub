program Shell;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  MassivIzStaMillionov = array [1..100000000] of integer   ;

procedure ShellSort(var a: MassivIzStaMillionov; n:integer);
var
i, j, k, m: integer;
x: integer;
T: word;
h: array of LongWord;

begin
T := 1;
SetLength(h, T + 1);
h[1] := 1;
while h[T] < N div 2 do
begin
T := T + 1;
SetLength(h, T + 1);
h[T] := h[T - 1] * 3 + 1;
end;
T := T - 1;
SetLength(h, T + 1);
for m := T downto 1 do
begin
k := h[m];
for i := k + 1 to N do
begin
x := a[i];
j := i - k;
while (j > k) and (x < a[j]) do
begin
a[j + k] := a[j];
j := j - k;
end;
if (j > k) or (x >= a[j]) then
a[j + k] := x
else
begin
a[j + k] := a[j];
a[j] := x;
end;
end;
end;
end;

var
  IshodnyjMassiv: MassivIzStaMillionov;
  n, i: Integer;
  file1, file2: TextFile;
  Vremja: TDateTime;
  Chasy, Minuty, Secundy, MilliSecundy: word;
  SummaVremeni: double;

begin
    AssignFile(file1, ParamStr(1));
    Reset(file1);
    AssignFile(file2, ParamStr(2));
    Rewrite(file2);
    read(file1, n);
    for i:= 1 to n do
      read(file1, IshodnyjMassiv[i]);
      Vremja:= Now;
      ShellSort(IshodnyjMassiv, n);
      Vremja:= Now-Vremja;
      DecodeTime(Vremja, Chasy, Minuty, Secundy, MilliSecundy);
      SummaVremeni:= MilliSecundy/1000 + Secundy + 60*Minuty + 3600*Chasy;
      writeln(file2, n);
      for i:= 1 to n-1 do
      write(file2, IshodnyjMassiv[i], ' ');
      writeln(file2, IshodnyjMassiv[n]);
    Write(file2, 'Øåëëà.');
    writeln(file2);
    Writeln(file2, floattostr(SummaVremeni));
    Writeln(file2);
    CloseFile(file1);
    CloseFile(file2);
end.
