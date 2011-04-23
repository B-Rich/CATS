uses
    SysUtils;

var
    a, b, c: integer;
    ans, out, inp: textfile;
begin
    Assign(ans, ParamStr(1)); 
    Assign(out, ParamStr(2)); 
    Assign(inp, ParamStr(3)); 
    Reset(ans);
    Reset(out);
    Reset(inp);
    Read(ans, c);
    Read(inp, a, b);
    if (c <> a + b) then begin
        WriteLn(Format('Input: %d %d. Answer: %d', [a, b, c]));
        halt(3);
    end;

    Read(out, c);
    if (c <> a + b) then begin
        WriteLn(Format('WA. Input: %d %d. Output: %d', [a, b, c]));
        halt(1);
    end;

    WriteLn('Ok');
    halt(0);
end.