program PiramidalnajaSortirovka;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const Z = 100000000;

type
  MassivIzStaMillionov = array [1..Z] of Integer;

procedure HeapSort(var a: MassivIzStaMillionov;n:integer);
  procedure sift(L, R: integer);
  var
    i, j: integer;
    x: integer;
  begin
    i := L;
    j := 2 * i;
    x := a[i];
    if (j < R) and (a[j] < a[j + 1]) then
      j := j + 1;
    while (j <= R) and (x < a[j]) do
    begin
      a[i] := a[j];
      i := j;
      j := 2 * j;
      if (j < R) and (a[j] < a[j + 1]) then
        j := j + 1;
    end;
    a[i] := x;
  end;

var
  L, R: integer;
  x: integer;
begin
  L := (N div 2) + 1;
  R := N;
  while L > 1 do
  begin
    L := L - 1;
    sift(L, R);
  end;
  while R > 1 do
  begin
    x := a[1];
    a[1] := a[R];
    a[R] := x;
    R := R - 1;
    sift(L, R);
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
      HeapSort(IshodnyjMassiv, n);
      Vremja:= Now-Vremja;
      DecodeTime(Vremja, Chasy, Minuty, Secundy, MilliSecundy);
      SummaVremeni:= MilliSecundy/1000 + Secundy + 60*Minuty + 3600*Chasy;
      writeln(file2, n);
      for i:= 1 to n-1 do
      write(file2, IshodnyjMassiv[i], ' ');
      writeln(file2, IshodnyjMassiv[n]);
    Write(file2, 'Ïèðàìèäàëüíàÿ.');
    writeln(file2);
    Writeln(file2, floattostr(SummaVremeni));
    Writeln(file2);
    CloseFile(file1);
    CloseFile(file2);
end.
