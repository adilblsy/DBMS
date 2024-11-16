SET SERVEROUTPUT ON
   accept user_input number prompt 'Enter a number'
declare
n number:=&user_input;
a number:=0;
b number:=1;
i number:=0;
fib number;

begin
	if n>=1 then
		dbms_output.put_line(a);
	end if;
	if n>=2 then
		dbms_output.put_line(b);
	end if;
	if n>=2 then
		for i in 3 .. n loop
			fib:=a+b;
			dbms_output.put_line(fib);
			a:=b;
			b:=fib;
		end loop;
	end if;
end;
/