SET SERVEROUTPUT ON
   accept user_input char prompt 'Enter a string: '
declare
     str varchar(20);
     rev_str varchar(20);
     len number;

begin
     str := '&word';
     len:= length(str);

     for i in reverse 1..len loop
          rev_str := rev_str || substr(str,i,1);
     end loop;

     if rev_str = str then
          DBMS_OUTPUT.PUT_LINE(str ||' is a
     Palindrome');
     else
          DBMS_OUTPUT.PUT_LINE(str ||' is not a Palindrome');
     end if;
end;
/