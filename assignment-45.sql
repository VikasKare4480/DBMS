create database db4;
use db4;

create table borrower (roll_no int, name char (10), dateofissue date,nameofbook char(10), status char(10));

drop table borrower;
create table fine (roll_no int, date date, amt int);
desc borrower;
insert into borrower values(101,"abc1","2017-03-10","toc","x");
insert into borrower values(103,"abc2","2017-03-11","cns","x");
insert into borrower values(104,"abc3","2017-03-12","dbms","x");

delimiter //
create procedure calculatefine (in roll_no int, in nameofbook char(10))
begin
declare currentdate date;
declare noofdays int;
declare flag int;
declare fineamt int;
declare doi date;
set flag=0;
set currentdate=curdate();
select dateofissue into doi from borrower where borrower.roll_no=roll_no and
borrower.nameofbook=nameofbook;
select datediff(currentdate, doi) into noofdays;
select noofdays;
if noofdays>=15 and noofdays<=30 then set fineamt=(5*noofdays);
set flag=1;
else if noofdays>30 then set fineamt=(10*noofdays);
set flag=2;
end if;
end if;
if flag=1 then insert into fine values (roll_no,currentdate, fineamt);
else if flag=2 then insert into fine values (roll_no,currentdate, fineamt);
end if;
end if;
update borrower set borrower.status='r' where borrower.nameofbook=nameofbook;
end;

drop procedure calculatefine;
call calculatefine(103,"cns");

call calculatefine(104,"dbms");
call calculatefine(104,"dbms");


