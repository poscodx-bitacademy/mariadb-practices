## employees db install(restore)

1.  백업 db 압축 풀기
```sh
# unzip employees_db.zip
# ls employees_db
```

2.  employees 데이터베이스 생성 및 hr 계정 생성 및 권한 주기
```sh
# mysql -u root -p
Enter password:
MariaDB [(none)]> create database employees;
MariaDB [(none)]> show databases;
MariaDB [(none)]> create user 'hr'@'192.168.%' identified by 'hr';
MariaDB [(none)]> grant all privileges on employees.* to 'hr'@'192.168.%'; 
MariaDB [(none)]> flush privileges;
MariaDB [(none)]> flush privileges;
MariaDB [(none)]> flush privileges;
```

3.  restore
```sh
# cd employees_db
# mysql -u root -D employees -p < employees.sql
Enter password:
```
