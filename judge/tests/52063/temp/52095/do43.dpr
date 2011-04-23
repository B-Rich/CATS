var
        maxi, maxj, k, dx, dy, i, j, rr: longint;
        p, x, y, r: array [1..100] of longint;
        drr: longint;
        n: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        k := 15;
        dx := k + 3;
        dy := k + 5;
        n := 0;
        randseed := 4343;
        maxi := (1000 - 2 * dx) div (2 * k);
        maxj := (1000 - 2 * dy) div (2 * k);
        for i := 1 to maxi do
                for j := 1 to maxj do
                        if (i + j) mod 2 = 0 then
                        begin
                        if (random((maxi * maxj) div 200) = 0) and (n < 100) then
                        begin
                                inc(n);
                                x[n] := dx + 2 * k * i - k;
                                y[n] := dy + 2 * k * j - k;
                                r[n] := k + random(k);
                        end;
                end;

    writeln(n);
    for i := 1 to n do
    begin
        repeat
                j := random(n) + 1;
        until p[j] = 0;
        p[j] := i;
    end;

    for i := 1 to n do
        writeln(x[p[i]], ' ', y[p[i]], ' ', r[p[i]]);
        close(output);
end.