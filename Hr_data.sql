select *
from employees_raw_data;
----------------------------------------------------------------------------------------------------------------------------------
/*Checking the Duplicate values*/

select  emp_name, count(*)
from employees_raw_data
group by emp_name
having count(*) >1;

----------------------------------------------------------------------------------------------------------------------------------
/*Checking the Null values*/

select * from employees_raw_data
where department is Null;


select * from employees_raw_data
where department = '';
----------------------------------------------------------------------------------------------------------------------------------
/*Update the Empty values into 'no_department'*/

update  employees_raw_data
set department = 'no_department'
where department = '';

select department from employees_raw_data;
----------------------------------------------------------------------------------------------------------------------------------
/*check whether it updated*/

select department from employees_raw_data
where department = 'no_department';
----------------------------------------------------------------------------------------------------------------------------------
/*Create a new Column 'Age_category'*/

alter table employees_raw_data
add column Age_category varchar(20);
----------------------------------------------------------------------------------------------------------------------------------
/*Categories the age into 4 buggets*/

Update employees_raw_data
set Age_category = 
	case 
		when age is null then 'Unknow'
		when age < 25 then 'Young'
		when age <= 35 then 'Adult'
		when age <= 55 then 'Middle-age'
		else 'Senior'
	end;
----------------------------------------------------------------------------------------------------------------------------------
select * from employees_raw_data;

/*Convert all the characters into uppercase*/

update employees_raw_data
set remote_work = upper(remote_work);
----------------------------------------------------------------------------------------------------------------------------------
select * from employees_raw_data;

/*Create a two new Column for Date & Time*/

alter table employees_raw_data
add column Joining_date date,
add column Joining_time time;
----------------------------------------------------------------------------------------------------------------------------------
select * from employees_raw_data;
/*Splite the date and time*/

update employees_raw_data
set 
Joining_date = date(join_date),
Joining_time = time(join_date);
----------------------------------------------------------------------------------------------------------------------------------
select * from employees_raw_data;

/*Group the city by sum of salary*/

select city, round(sum(salary),2) 
from employees_raw_data
group by city;

/*Group the Age category by the average rating*/

select Age_category, round(avg(performance_rating),1) as avg_rating
from employees_raw_data
group by Age_category;

----------------------------------------------------------------------------------------------------------------------------------
/*Group the department by average salary*/

Select department, round(avg(salary), 2) as avg_salary
from employees_raw_data
group by department;

----------------------------------------------------------------------------------------------------------------------------------
/*Create a Temporary table of High salary >35000 using CTE*/

WITH High_salary as (
	select emp_name, department, salary, city, Age_category
    from employees_raw_data
    where salary > 35000

)
select * from High_salary;
----------------------------------------------------------------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

/*Update the NAN values into NO in Remote work*/

update employees_raw_data
set remote_work = 'NO'
where remote_work = 'NAN'


	