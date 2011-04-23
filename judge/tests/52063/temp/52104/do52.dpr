var i:integer;
begin
  assign(output, 'farmer.in'); rewrite(output);
  writeln ('1000 1000');
  writeln (100);
  writeln ('950 950 1');
  writeln ('948 948 1');
  for i:=1 to 49 do begin
    writeln ('951 ', 950-i*4, ' 1');
    writeln ('948 ', 948-i*4, ' 1');
  end; 
        close(output);
end.