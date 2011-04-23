var
        s, l, maxi, maxj, k, dx, dy, i, j, rr: longint;
        p, x, y, r: array [1..100] of longint;
        drr: longint;
        n: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        k := 5;
        dx := 7 * k + 3;
        dy := 7 * k + 5;
        n := 0;
        randseed := 505050;
        maxi := (1000 - 2 * dx) div (2 * k);
        maxj := (1000 - 2 * dy) div (2 * k);
        for i := 1 to maxi do
                for j := 1 to maxj do
                        if (i - j) mod 8 = 0 then
                        begin
                        if (random((maxi * maxj) div 800) = 0) and (n < 100) then
                        begin
                                s := random(3);
                                for l := 1 to s do
                                begin
                                        if n = 100 then break;
                                        inc(n);
                                        x[n] := dx + 2 * k * i - k + random(3);
                                        y[n] := dy + 2 * k * j - k + random(3);
                                        r[n] := random(8 * k) + 1;
                                end;
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