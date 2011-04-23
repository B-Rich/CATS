var
        k, dx, dy, i, j, rr: longint;
        x, y, r: array [1..100] of longint;
        drr: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        writeln(98);
        k := 31;
        dx := 2;
        dy := 1;
        randseed := 383838;
        for i := 1 to 14 do
                for j := 1 to 14 do
                        if (i + j) mod 2 = 0 then
                                writeln(dx + 2 * k * i - k, ' ', dy + 2 * k * j - k, ' ', random(k) + 1);
        close(output);
end.