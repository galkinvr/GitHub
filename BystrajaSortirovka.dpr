program BystrajaSortirovka;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  MassivIzStaMillionov=array [1..100000000] of integer;

procedure QuickSort(var a:MassivIzStaMillionov; n:integer);
procedure sort(L, R: integer);
var
i, j: integer;
w, x: integer;
begin
i := L;
j := R;
x := a[(L + R) div 2];
repeat
while a[i] < x do
i := i + 1;
while x < a[j] do
j := j - 1;
if i <= j then
begin
w := a[i];
a[i] := a[j];
a[j] := w;
i := i + 1;
j := j - 1;
end;
until i > j;
if L < j then
sort(L, j);
if i < R then
sort(i, R);
end;

begin
sort(1, N);
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
      QuickSort(IshodnyjMassiv, n);
      Vremja:= Now-Vremja;
      DecodeTime(Vremja, Chasy, Minuty, Secundy, MilliSecundy);
      SummaVremeni:= MilliSecundy/1000 + Secundy + 60*Minuty + 3600*Chasy;
      writeln(file2, n);
      for i:= 1 to n-1 do
      write(file2, IshodnyjMassiv[i], ' ');
      writeln(file2, IshodnyjMassiv[n]);
    Write(file2, 'Áûñòðàÿ.');
    writeln(file2);
    Writeln(file2, floattostr(SummaVremeni));
    Writeln(file2);
    CloseFile(file1);
    CloseFile(file2);
end.
