set serveroutput on

accept input number prompt 'enter a number:';

create table square(num number);
create table cube(num number);

declare
n number:=&input;
i number:=1;

begin
    while i*i <= n loop
        if i*i <= n then
            insert into square values(i*i);
        end if;
        
        if i*i*i <= n then
            insert into cube values(i*i*i);
        end if;
        
        i := i + 1;
    end loop;
end;
/

select * from square;
select * from cube;

drop table square;
drop table cube;

