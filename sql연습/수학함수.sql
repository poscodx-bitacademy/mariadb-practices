--
-- 수학 함수
--

-- abs
select abs(1), abs(-1) from dual;

-- floor
select floor(3.14), floor(3.9999) from dual; 

-- ceil
select ceil(3.14), ceiling(3.9999) from dual; 

-- mod
select mod(10, 3) from dual;

-- round(x): x에 가장 가까운 정수
-- round(x, d): x값 중에 소수점 d 자리에 가장 근접한 실수
select round(1.498), round(1.498, 1), round(1.498, 0) from dual;

-- power(x, y): x의 y승
select power(2, 10), pow(2, 10) from dual;

-- sign(x): 양수 1, 음수 -1, 0 0
select sign(20), sign(-100), sign(0) from dual;

-- greatest(x, y, ....), least(x, y, ....)
select greatest(10, 40, 20, 50, 30), least(10, 40, 20, 50, 30) from dual;
select greatest('A', 'C', 'X', 'O', 'N'), least('hello', 'hela', 'hell') from dual;

  

