-- Case statement

use company_constraints;

update employee set Salary = 
		case
			when Dno=5 then Salary+ 2000
            When Dno=4 then Salary+ 1500
            when Dno=1 then Salary+ 3000
            else Salary + 0
		end;