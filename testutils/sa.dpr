var
    a, b: integer;
begin
    Assign(input, 'input.txt');
    Reset(input);
    Assign(output, 'output.txt');
    Rewrite(output);
    Read(a, b);
    Write(a + b);
    Halt(0);
end.