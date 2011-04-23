var
        dx, dy, i, r: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        writeln(14);
        r := 1;
        dx := 0;
        dy := 0;
        for i := 1 to 7 do
        begin
                writeln(dx + r, ' ', dy + 3 * r, ' ', r);
                writeln(dx + 3 * r, ' ', dy + r, ' ', r);
                dx := dx + 4 * r;
                dy := dy + 4 * r;
                r := r * 2;
        end;
        close(output);
end.