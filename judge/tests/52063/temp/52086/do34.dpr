var
        k, dx, dy, i, j, rr: longint;
        x, y, r: array [1..100] of longint;
        drr: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        writeln(100);
        k := 17;
        dx := 99;
        dy := 80;
        for i := 1 to 10 do
                for j := 1 to 20 do
                        if (i + j) mod 2 = 0 then
                                writeln(dx + 2 * k * i - k, ' ', dy + 2 * k * j - k, ' ', k);
        close(output);
end.