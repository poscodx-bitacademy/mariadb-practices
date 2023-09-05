-- emaillist

-- insert
insert into emaillist values(null, '안', '대혁', 'kickscar@gmail.com');

-- findAll
select no, first_name, last_name, email from emaillist order by no desc;

-- delete
delete from emaillist where email='kickscar@gmail.com';

-- findAll
select no, first_name, last_name, email from emaillist order by no desc;
