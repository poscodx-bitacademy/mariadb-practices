-- 사원
ALTER TABLE `emp`
	DROP FOREIGN KEY `FK_dept_TO_emp`; -- 부서 -> 사원

-- 부서
DROP TABLE IF EXISTS `dept` RESTRICT;

-- 사원
DROP TABLE IF EXISTS `emp` RESTRICT;

-- 부서
CREATE TABLE `dept` (
	`no`   int         NOT NULL, -- 번호
	`name` varchar(45) NOT NULL  -- 이름
);

-- 부서
ALTER TABLE `dept`
	ADD CONSTRAINT `PK_dept` -- 부서 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `dept`
	MODIFY COLUMN `no` int NOT NULL AUTO_INCREMENT;

-- 사원
CREATE TABLE `emp` (
	`no`      int         NOT NULL, -- 번호
	`name`    varchar(45) NOT NULL, -- 이름
	`dept_no` int         NULL      -- 부서번호
);

-- 사원
ALTER TABLE `emp`
	ADD CONSTRAINT `PK_emp` -- 사원 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `emp`
	MODIFY COLUMN `no` int NOT NULL AUTO_INCREMENT;

-- 사원
ALTER TABLE `emp`
	ADD CONSTRAINT `FK_dept_TO_emp` -- 부서 -> 사원
		FOREIGN KEY (
			`dept_no` -- 부서번호
		)
		REFERENCES `dept` ( -- 부서
			`no` -- 번호
		);