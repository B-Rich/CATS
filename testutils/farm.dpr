uses math;

const MaxN=100;

var f:array [1..MaxN] of boolean;
    x1, y1, x2, y2:array [1..MaxN] of integer;
    i, j, n, x, y, xc, yc, rc, area:integer;
    nadoelo:boolean;

begin
  assign (input, 'farmer.in'); reset (input);
  assign (output, 'farmer.out'); rewrite (output);
  read (x, y, n);
  for i:=1 to n do begin
    read (xc, yc, rc);
    x1[i]:=xc-rc; x2[i]:=xc+rc;
    y1[i]:=yc-rc; y2[i]:=yc+rc;
  end;
  fillchar (f, sizeof (f), 1);
  repeat
    nadoelo:=true;
    for i:=1 to n do if f[i] then
      for j:=i+1 to n do if f[j] then
        if (x2[i]>=x1[j]) and (x2[j]>=x1[i]) and
           (y2[i]>=y1[j]) and (y2[j]>=y1[i]) then begin
          x1[i]:=min (x1[i], x1[j]); y1[i]:=min (y1[i], y1[j]);
          x2[i]:=max (x2[i], x2[j]); y2[i]:=max (y2[i], y2[j]);
          f[j]:=false; nadoelo:=false;
        end;
  until nadoelo;
  area:=x*y;
  for i:=1 to n do if f[i] then dec (area, (x2[i]-x1[i])*(y2[i]-y1[i]));
  writeln (area);
end.