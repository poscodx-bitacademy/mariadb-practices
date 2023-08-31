-- outer join

-- 테스트 데이터
-- insert into dept values(null, '총무');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '기획');
select * from dept;

-- 테스트 데이터
-- insert into emp values(null, '둘리', 1);
-- insert into emp values(null, '마이콜', 2);
-- insert into emp values(null, '또치', 3);
-- insert into emp values(null, '길동', null);
select * from emp;

-- inner join
select emp.name, dept.name
  from emp join dept on emp.dept_no = dept.no;

-- left join(outer join)
select emp.name as '직원', ifnull(dept.name, '없음') as '부서'
  from emp left join dept on emp.dept_no = dept.no;

-- right join(outer join)
select ifnull(emp.name, '없음') as '직원', dept.name  as '부서' 
  from emp right join dept on emp.dept_no = dept.no;
 

