--
-- select 연습
--

-- 예제1: departments 데이블의 모든 데이터를 출력
select * from departments;

-- 프로젝션(projection)
-- 예제2: employees 테이블에서 직원 이름, 성별,  입사일을 출력
select first_name as '이름',
       gender as '성',
       hire_date as '입사일'
  from employees;
  
-- distinct
-- 예제1: titles 테이블에서 모든 직급을 출력하세요
select distinct title from titles;
  
