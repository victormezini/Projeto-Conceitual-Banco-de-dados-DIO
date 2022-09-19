-- Join - Join on - Cross join

Use company;

-- Join statement
desc employee;
desc Works_on;


select * from employee join works_on on Ssn = Essn;

-- Join

select * from employee join works_on;


-- Join on -> Inner join on

select * from employee join works_on on Ssn = Essn;
Select * from employee join departament on Ssn = Mgr_ssn;

select Fname, Lname, Adress
	from (employee join departament on Dno=Dnumber)
    where Dname = 'Research';
    
select Dnum, Dept_create_date, Dlocation
	from departament join dept_locations using (Dnumber) order by Dept_create_date;

-- Cross join - produto cartesiano 

select * from employee cross join dependent;
