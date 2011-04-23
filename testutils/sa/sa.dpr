var
    a, b: integer;
begin
    Assign(input, 'input.txt');
    Reset(input);
    Assign(output, 'output.txt');
    Reset(output);
    Read(a, b);
    Write(a + b);
end.