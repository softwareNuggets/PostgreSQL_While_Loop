/*
truncate table HR_Employee;
create table HR_Employee
(
	emp_id 			int		not null,
	annual_salary	numeric	not null,
	hourly_rate		numeric	generated always as (annual_salary / (52*40)) stored
)
*/

do 
$$
declare startPay 		numeric		:= 36000;
		maxNumEmp		int			:= 10;
		emp_id			int			:= 1;

begin
		while emp_id < maxNumEmp loop
		
			raise notice 'emp_id %',emp_id;
			
			insert into HR_Employee(emp_id, annual_salary)
			values(emp_id, startPay);
			
			emp_id 		:= emp_id + 1;
			startPay	:= startPay + 4000;
		end loop;
end;
$$;

select *
from HR_Employee