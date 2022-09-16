create schema if not exists company_constraints;
use company_constraints;

select * from information_schema.table_constraints
	where constraint_schema = 'company_constraints';

create table employee(
	Fname varchar(15) not null,
	Minit char,
	Lname varchar(15) not null,
	Ssn char(9) not null,
	Bdate DATE,
	Address varchar(30),
	sex char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int not null,
    constraint chk_salary_employee check (Salary> 2000.0),
	constraint pk_employee primary key (Ssn)
);

alter table employee
	add constraint fk_employee
    foreign key(Super_Ssn) references employee(Ssn)
    on delete set null
    on update cascade;

alter table employee modify Dno int not null default 1;

use company;
create table departament(
	Dname varchar(15) not null,
	Dnumber int not null,
	Mgr_ssn char(9),
	Mgr_start_date date,
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
	constraint pk_dept primary key (Dnumber),
	constraint unique_name_dept unique (Dname),
	foreign key (Mgr_ssn) references employee(Ssn)
);

-- 'def', 'company_constraints', 'departament_ibfk_1', 'company_constraints', 'departament', 'FOREIGN KEY', 'YES'


alter table departament drop constraint departament_ibfk_1;
alter table departamnet 
	add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
    on update cascade;

create table dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
	constraint pk_dept_locations primary key (Dnumber, Dlocation),
	constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);

create table project(
	Pname varchar(15) not null,
	Pnumber int not null,
	Plocation varchar(15),
	Dnum int not null,
	primary key (Pnumber),
	constraint unique_project unique (Pname),
	constraint fk_project Foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) not null,
	Pno int not null,
	Hours decimal(3,1) not null,
	primary key (Essn, Pno),
	constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),
	constraint fk_project_works_on foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    Age int not null,
    constraint chk_age_dependent check (Age < 22),
    primary key (Essn, Dependent_name),
    constraint fk_dependent Foreign key (Essn) references employee(Ssn)
);

show tables;
desc departament;

select * from information_schema.table_constraints
	where constraint_schema = 'company_constraints';
    
    
show databases

insert into employee values ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-fondren-Houston-TX', 'm',30000,null,5);