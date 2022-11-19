create database db2;
use db2;

create table employee (employee_name char(25) primary key, street char(25), city char(20));
create table works (employee_name char(25), company_name char(25), salary double,FOREIGN KEY (company_name) REFERENCES employee(employee_name));
create table company (company_name char(25) , city char(20),FOREIGN KEY (company_name) REFERENCES employee(employee_name));
create table manages (employee_name char(25), manager_name char(20),FOREIGN KEY (manager_name) REFERENCES employee(employee_name));
drop table employee;
drop table company;
drop table manages;
drop table works;
desc company;
# foreign key(employee_name) reference employeee(employee_name);

insert into employee values("Amy Baker","Sixth Street","Pennsylvania");
insert into employee values("Daniff Hernandez","Oak Street","New York");
insert into employee values("Janet King","Elm Street","Illinois");
insert into employee values("Jayne Horton","Ceder Street","New York");
insert into employee values("Mia Brown","Park Street","Florida");
insert into employee values("Nan Singh","Nan Singh","Ohio");
insert into employee values("Renee Becker","View Street","Florida");
insert into employee values("Smith Leighann","Sixth Street","New York");
insert into employee values("William LaRotonda","Pine Street","Ohio");


insert into manages values("Amy Baker","Elisa Bramante");
insert into manages values("William LaRotonda","Michael Albert");
insert into manages values("Renee Becker","Elijiah Gray");
insert into manages values("Nan Singh","Amy Dunn");
insert into manages values("Janet King","Kelley Spirea");
insert into manages values("Mia Brown","David Stanley");
insert into manages values("David Stanley","John Harison");


insert into company values("AmerisourcBergen","Pennsylvania");
insert into company values("Discover Finances","Illinois");
insert into company values("NextEra energy","Florida");
insert into company values("Penske Automotive groups","New York");
insert into company values("PepsiCo","New York");
insert into company values("Progressive","Ohio");
insert into company values("US Foods","Illinois");


insert into works values("Amy Baker","AmerisourcBergen",120000);
insert into works values(" William LaRotonda","Progressiv",150000);
insert into works values(" Smith Leighann"," PepsiCo",120000);
insert into works values("Daniff Hernandez"," Penske Automotive groups",140000);
insert into works values("Janet King ","US Foods",205000 );
insert into works values("Nan Singh","Progressive", 105000 );
insert into works values("Amy Baker","AmerisourcBergen",255000);

# 1. Find the names of all employees who work for First Bank Corporation.

Select employee_name from works Where company_name="AmerisourcBergen" group by employee_name;

