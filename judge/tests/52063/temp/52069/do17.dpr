uses
        math;
var
        r: array [1..100] of longint;
        p: array [1..100] of longint;
        maxr, xsize, ysize, cx, cy, i, j, n: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        randseed := 171717;

        xsize := 999;
        ysize := 997;
        writeln(xsize, ' ', ysize);
        n := 100;
        writeln(n);

        cx := 621;
        cy := 555;

        maxr := min(min(cx, xsize - cx), min(cy, ysize - cy));

        r[1] := 1;
        for i := 2 to n do
        begin
                r[i] := r[i - 1] + random((maxr - r[i - 1]) div (n - i + 1) - 1) + 1;
        end;
        for i := 1 to n do
        begin
                repeat
                        j := random(n) + 1;
                until p[j] = 0;
                p[j] := i;
        end;


        for i := 1 to n do
        begin
                writeln(cx, ' ', cy, ' ', r[p[i]]);
        end;
        close(output);
end.