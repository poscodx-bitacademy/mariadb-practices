select version(), current_date, now() from dual;

-- 수학 함수도 사용할 수 있다.(사칙 연산도 된다)
select sin(pi() / 4), 1 + 2 * 3 - 4 /5 from dual;

-- 대소문자 구분 안한다.
sELECT VERSION(), current_DATE, NOW() froM duAl;

-- table 생성: DDL
create table pet(
	name varchar(100),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

-- schema 확인
show tables;
describe pet;
desc pet;

-- table 삭제: DDL
drop table pet;
show tables;

-- insert: DML(C)
insert into pet values('성탄이', '안대혁', 'dog', 'm', '2019-12-25', null);

-- select: DML(R)
select * from pet;

-- update: DML(U)
update pet set name='성타니' where name='성탄이';

-- delete: DML(D)
delete from pet where name='성타니';

-- load data
load data local infile 'd:\pet.txt' into table pet;
update pet set death = null where name != 'bowser';

-- select 연습
-- 문1) bowser의 주인의 이름은?
select owner from pet where name='bowser';

-- 문2) 1998 이 후에 태어난 애들은?
select * from pet where birth >= '1998-01-01';

-- 문3) 종이 뱀이거나 새인 애들은?
select * from pet where species = 'snake' or species = 'bird';

-- 예4) order by ~ [asc]
select name, birth from pet order by birth asc;

-- 예5) order by ~ desc
select name, birth from pet order by birth desc;

-- 예6) where절에 null 다루기
select name, birth, death from pet where death is null;
select name, birth, death from pet where death is not null;

-- 예7) like 검색(패턴검색)
select name from pet where name like 'b%';
select name from pet where name like '%fy';
select name from pet where name like '%w%';
select name from pet where name like '____';
select name from pet where name like 'b____';

-- 예8) 집계: count, avg, sum, max, min,...
select count(*) from pet;

select max(birth)
  from pet;










 