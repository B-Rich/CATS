var
        dx, dy, i, r: longint;
begin
        assign(output, 'farmer.in'); rewrite(output);
        writeln('1000 1000');
        writeln(16);
        r := 1;
        dx := 100;
        dy := 54;
        for i := 1 to 8 do
        begin
                writeln(dx + r, ' ', dy + 3 * r, ' ', r);
                writeln(dx + 3 * r, ' ', dy + r, ' ', r);
                r := r * 2;
        end;
        close(output);
end.