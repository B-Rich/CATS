uses
        math;
var
        r: array [1..100] of longint;
        p: array [1..100] of longint;
        maxr, xsize, ysize, cx, cy, i, j, n: longint;
//        pc: array[1..1024*1024*20] of char;
begin   
//        fillchar(pc, sizeof(pc), 0);
        assign(output, 'farmer.in'); rewrite(output);
        randseed := 161616;

        xsize := 876;
        ysize := 985;
        writeln(xsize, ' ', ysize);
        n := 10;
        writeln(n);

        cx := 400;
        cy := 378;

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