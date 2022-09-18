-- funções e cláusulas de agrupamento

select * from employee;
select count(*) from employee;

select count(*) from employee, departament 
	where Dno=Dnumber and Dname = 'Research';
    
select Dno, count(*), round(avg(Salary),2) from employee, departament 
	 group by Dno;
    
select Dno, count(*) as Number_of_employees, round(avg(Salary),2) as Salary_avg from employee, departament
		group by Dno;
        
select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber = Pno
    group by Pnumber, Pname;
    

select count(distinct Salary) from employee;

select sum(Salary) as total_Sal, max(Salary) as Max_sal, min(Salary) as Mini_sal, avg(Salary) as Avg_sal from employee;

