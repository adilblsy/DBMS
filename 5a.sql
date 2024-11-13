SET SERVEROUTPUT ON
	accept user_input number prompt 'Enter a number'
declare
n number:=&user_input;
result number:=0;
digit number:=0;
no_digit number;
temp number;

begin
temp:=n;
while temp > 0 LOOP
	temp:=trunc(temp/10);
	no_digit:=no_digit+1;
end loop;

temp:=n;

while temp > 0 LOOP
	digit:=mod(temp,10);
	result:=result+power(digit,no_digit);
	temp:=trunc(temp/10);
end loop;
DBMS_OUTPUT.PUT_LINE(result);
if result = n then
	DBMS_OUTPUT.PUT_LINE(n||'is a narcissistic number');
else
	DBMS_OUTPUT.PUT_LINE(n||'n is not a narcissistic number');
end if;
end;
/