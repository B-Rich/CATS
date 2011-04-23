uses
        math;
var
        x, y, r: array [1..100] of longint;
        p: array [1..100] of longint;
        maxr, xsize, ysize, cx, cy, i, j, n: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        randseed := 202020;     

        xsize := 333;
        ysize := 20;

        n := 17;


        writeln(xsize, ' ', ysize);
        writeln(n);


        for i := 1 to n do
        begin
                r[i] := random(min(xsize div 2, ysize div 2)) + 1;
                x[i] := r[i] + random(xsize - 2 * r[i]);
                y[i] := r[i] + random(ysize - 2 * r[i]);
                writeln(x[i], ' ', y[i], ' ', r[i]);
        end;
        close(output);
end.