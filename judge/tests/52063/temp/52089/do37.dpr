var
        k, dx, dy, i, j, rr: longint;
        x, y, r: array [1..100] of longint;
        drr: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        writeln(92);
        k := 13;
        dx := 7;
        dy := 14;
        for i := 1 to 25 do
                for j := 1 to 25 do
                        if ((i + j) mod 2 = 1) and ((i <= 2) or (j <= 2) or (i >= 24) or (j >= 24)) then
                                writeln(dx + 2 * k * i - k, ' ', dy + 2 * k * j - k, ' ', k);
        close(output);
end.