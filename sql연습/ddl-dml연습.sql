--
-- ddl
--

drop table member;
create table member (
	no int not null auto_increment,
    email varchar(200) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);
desc member;

alter table member add column juminbunho char(13) not null;
desc member;

alter table member drop column juminbunho;
desc member;

alter table member add column juminbunho char(13) not null after email;
desc member;

alter table member change column department dept varchar(200) not null;
desc member;

alter table member add self_intro text;
desc member;

alter table member drop column juminbunho;
desc member;

--
-- dml
--

-- insert
insert
  into member
values (null, 'kickscar@gmail.com', password('1234'), '안대혁', '개발팀', null);
select * from member; 

insert
  into member(no, email, password, name, dept, self_intro)
values (null, 'kickscar2@gmail.com', password('1234'), '안대혁2', '개발팀2', null);
select * from member;
 
insert
  into member(email, password, name, dept)
values ('kickscar3@gmail.com', password('1234'), '안대혁3', '개발팀3');
select * from member;

insert
  into member(email, name, dept, password)
values ('kickscar4@gmail.com', '안대혁4', '개발팀4', password('1234'));
select * from member;

-- update
update member
   set email='kixxcar@gmail.com', name='킥스카'
 where no = 4;
select * from member;

-- delete
delete
  from member
 where no = 4;
select * from member;
 

