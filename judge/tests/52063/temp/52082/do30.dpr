var
        dx, dy, i, j, rr: longint;
        x, y, r: array [1..100] of longint;
        drr: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        rr := 1;
        dx := 20;
        dy := 20;
        drr := 1;
        j := 0;
        while (j < 99) and (dx + 4 * rr < 1000) and (dy + 4 * rr < 1000) do
        begin
                inc(j);
                x[j] := dx + rr;
                y[j] := dy + 3 * rr;
                r[j] := rr;
                inc(j);
                x[j] := dx + 3 * rr;
                y[j] := dy + rr;
                r[j] := rr;

                dx := dx + 4 * rr;
                dy := dy + 4 * rr;
                rr := rr + drr;
        end;
        writeln(j);
        for i := 1 to j do
        begin
                writeln(1000 - x[i], ' ', y[i], ' ', r[i]);
        end;
        close(output);
end.