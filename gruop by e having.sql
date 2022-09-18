-- group by e having 

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname
having count(*) > 2;

select Dno, count(*)
	from employee 
    where Salary > 30000
    group by Dno
    having count(*) >=2;
    
select Dno, count(*) from employee
	where Salary > 20000 and Dno in (select Dno from employee group by Dno having count(*)>=2)
    group by Dno;
    
select Dno as Departament, count(*) as NumberOFEmployees from employee
	where Salary > 20000 and Dno in (select Dno from employee group by Dno having count(*)>=2)
    group by Dno;