var i:integer;
begin
  assign(output, 'farmer.in'); rewrite(output);
  writeln ('1000 1000');
  writeln (100);
  for i:=49 downto 1 do begin
    writeln ('948 ', 948-i*4, ' 1');
    writeln ('951 ', 950-i*4, ' 1');
  end; 
  writeln ('948 948 1');
  writeln ('950 950 1');
        close(output);
end.