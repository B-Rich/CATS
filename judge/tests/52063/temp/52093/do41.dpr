var
        maxi, maxj, k, dx, dy, i, j, rr: longint;
        p, x, y, r: array [1..100] of longint;
        drr: longint;
        n: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        k := 32;
        dx := 7;
        dy := 14;
        n := 0;
        randseed := 414141;
        maxi := (1000 - 2 * dx) div (2 * k);
        maxj := (1000 - 2 * dy) div (2 * k);
        for i := 1 to maxi do
                for j := 1 to maxj do
                        if (random((maxi * maxj) div 100) = 0) and (n < 100) then
                        begin
                                inc(n);
                                x[n] := dx + 2 * k * i - k;
                                y[n] := dy + 2 * k * j - k;
                                r[n] := k;
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