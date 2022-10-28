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
declare	startPay	numeric	:= 36000;
		emp_id		int		:= 1;
		
begin
	while (startPay < 120000) loop
	
		raise notice 'emp_id %', emp_id;
		
		insert into HR_Employee(emp_id, annual_salary)
		values(emp_id, startPay);
		
		if emp_id = 10 then
			EXIT;
		end if;
		
		emp_id 		:= emp_id + 1;
		startPay 	:= startPay + 5000;
		
		
	end loop;
end;
$$;

select *
from HR_Employee