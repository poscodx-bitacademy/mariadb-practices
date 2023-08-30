--
-- 문자열 함수
--

-- upper
select upper('seoul'), ucase('SeOuL') from dual;
select upper(first_name) from employees;

-- lower
select lower('SEOUL'), lcase('sEoUl') from dual;
select lower(first_name) from employees;

-- substring(문자열, index, length)
select substring('Hello World', 3, 2) from dual;

-- 예제) employees 테이블에서 1989년에 입사한 직원들의 이름, 입사일을 출력
select first_name, hire_date
  from employees
 where substring(hire_date, 1, 4) = '1989';

-- lpad, rpad: 정렬함수
select lpad('1234', 10, '-'), rpad('1234', 10, '-') from dual;
-- 예제) 직원들의 월급을 오른쪽 정렬(빈공간 *)
select lpad(salary, 10, '*')
  from salaries;
  
-- trim, ltrim, rtirm
select
	   concat('---', ltrim('   hello   '), '---'),
	   concat('---', rtrim('   hello   '), '---'),
	   concat('---', trim(leading 'x' from 'xxxhelloxxx'), '---'),
	   concat('---', trim(trailing 'x' from 'xxxhelloxxx'), '---'),
	   concat('---', trim(both 'x' from 'xxxhelloxxx'), '---')
  from dual; 

-- length
select length('Hello World') from dual;

 
 
