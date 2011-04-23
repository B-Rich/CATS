uses
        math;
var
        r: array [1..100] of longint;
        p: array [1..100] of longint;
        maxr, xsize, ysize, cx, cy, i, j, n: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        randseed := 181818;     

        xsize := 888;
        ysize := 789;
        cx := 543;
        cy := 425;

        n := 74;


        writeln(xsize, ' ', ysize);
        writeln(n);


        maxr := min(min(cx, xsize - cx), min(cy, ysize - cy));

        r[1] := 1;
        for i := 2 to n do
        begin
                r[i] := r[i - 1] + random((maxr - r[i - 1]) div (n - i + 1) - 1) + 1;
        end;

        for i := n downto 1 do
        begin
                writeln(cx, ' ', cy, ' ', r[i]);

                if i = 1 then break;

                case random(4) of
                        0: cx := cx - (r[i] - r[i - 1]);
                        1: cx := cx + (r[i] - r[i - 1]);
                        2: cy := cy - (r[i] - r[i - 1]);
                        3: cy := cy + (r[i] - r[i - 1]);
                end;
        end;
        close(output);
end.