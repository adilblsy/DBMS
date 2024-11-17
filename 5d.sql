set serveroutput on

accept input number prompt 'enter a number:';

create table prime(num number);
create table composite(num number);

declare
n number:=&input;
count_p number:=0;
count_c number:=0;
is_prime number:=0;
numb number:=2;
limit number:=0;
i number:=0;

begin
    while count_p < n or count_c < n loop
        is_prime := 1;
        limit := trunc(sqrt(numb));
        for i in 2 .. limit loop
            if mod(numb,i) = 0 then
                is_prime := 0;
                exit;
            end if;
        end loop;
        
        if is_prime = 1 and count_p < n then
            insert into prime values(numb);
            count_p := count_p + 1;
        end if;
        
        if is_prime = 0 and count_c < n then
            insert into composite values(numb);
            count_c := count_c + 1;
        end if;
        
        numb := numb + 1;
    end loop;
end;
/

select * from prime;
select * from composite;

drop table prime;
drop table composite;

