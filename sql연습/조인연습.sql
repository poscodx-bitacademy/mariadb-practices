-- inner join

-- 예제1: 현재, 근무하고 있는 직원 사번, 이름과 직책을 모두 출력
select a.emp_no, a.first_name, b.title
  from employees a, titles b
 where a.emp_no = b.emp_no       -- join 조건 (n-1)
   and b.to_date = '9999-01-01'; -- row 선택 조건
   
-- 예제2: 현재, 근무하고 있는 직원 사번, 이름과 직책을 모두 출력하되
--       여성 엔지니어(Engineer)만 출력

select a.emp_no, a.first_name, a.gender, b.title
  from employees a, titles b
 where a.emp_no = b.emp_no       -- join 조건 (n-1)
   and b.to_date = '9999-01-01'  -- row 선택 조건1
   and a.gender = 'f'            -- row 선택 조건2
   and b.title = 'Engineer';     -- row 선택 조건3

--
-- ANSI / ISO SQL1999 JOIN 표준 문법
--

-- 1) join ~ on *
-- 예제: 현재, 직책별 평균 연봉을 큰 순서대로 출력
  select a.title, avg(b.salary)
    from titles a join salaries b on a.emp_no = b.emp_no
   where a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) desc;  

-- 2) natural join
--	  조인 대상이 되는 테이블들에 이름이 같은 공통 컬럼이 있는 경우
--    조인 조건을 명시적으로 암묵적으로 조인이 된다.  	
--    예제: 현재 근무하고 있는 직원의 이름과 직책을 출력
  select a.first_name, b.title
    from employees a join titles b on a.emp_no = b.emp_no 
   where b.to_date = '9999-01-01'
order by a.first_name asc; 

  select a.first_name, b.title
    from employees a natural join titles b
   where b.to_date = '9999-01-01'
order by a.first_name asc; 

-- 3) join ~ using
--    ntural join의 문제점
-- 예제: 현재, 근무하고 있는 직원의 직책과 연봉을 출력
select count(*)
  from titles a natural join salaries b
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

-- 해결1: join ~ using
select count(*)
  from titles a join salaries b using(emp_no)
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

-- 해결2: join ~ on
select count(*)
  from titles a join salaries b on a.emp_no = b.emp_no
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';
