--
-- subquery
--

--
-- 1) select절의 컬럼 프로젝션의 서브쿼리, insert into t values(서브쿼리)
--

--
-- 2) select의 from 절의 서브쿼리
--
select a.n, a.s, a.r
  from (select now() as n, sysdate() as s, 3 + 1 as r from dual) a;

--
-- 3) select의 where절(having절)의 서브쿼리
--  
-- 예제: 현재, Fai Bale 이 근무하는 부서에서 근무하는 다름 직원의 사번, 이름을 출력

-- sol1) 비추
select b.dept_no
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and concat(first_name, ' ', last_name) = 'Fai Bale';

-- 'd004'

select a.emp_no, a.first_name
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = 'd004';  

-- sol2) subquery 사용
select a.emp_no, a.first_name
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = (select b.dept_no
					  from employees a, dept_emp b
					 where a.emp_no = b.emp_no
                       and b.to_date = '9999-01-01'
                       and concat(first_name, ' ', last_name) = 'Fai Bale');

-- 3-1) 단일행 연산자: =, >, <, >=, <=, <>, !=

-- 예제1: 현재, 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름과 급여를 출력
select avg(salary) from salaries where to_date='9999-01-01';

  select a.first_name, b.salary
    from employees a, salaries b
   where a.emp_no = b.emp_no
     and b.to_date = '9999-01-01'
     and b.salary < (select avg(salary)
                       from salaries
					  where to_date='9999-01-01')
order by b.salary desc;                    

-- 예제2: 현재, 가장 적은 평균 급여의 직책과 그 급여를 출력
-- Engineer 20000

  select a.title, avg(b.salary)
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title;




  select min(avg_salary)	
  from (select avg(b.salary) as avg_salary
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title) a;   



-- 3-2) 복수행 연산자: in                       