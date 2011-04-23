var
        k, dx, dy, i, j, rr: longint;
        x, y, r: array [1..100] of longint;
        drr: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        writeln(100);
        k := 49;
        dx := 2;
        dy := 1;
        randseed := 393939;
        for i := 1 to 10 do
                for j := 1 to 10 do
                        writeln(dx + 2 * k * i - k, ' ', dy + 2 * k * j - k, ' ', k - 3 + random(4));
        close(output);
end.