create database MySql


use MySql

------------------------CREATE TABLE EMP------------------------
create table EMP( 
	EMPNO int primary key not null, 
	ENAME varchar(20), 
	JOB varchar(10),
	MGR_ID int, 
	HIRE_DATE date, 
	SAL float, 
	COMM float, 
	DEPTNO int 
	foreign key (DEPTNO)references DEPT(DEPTNO)
	)

select * from EMP

-------------------- INSERT VALUES TO TABLE EMP-------------------------

insert into EMP values (7369, 'SMITH', 'CLERK', 7902, '1980/12/17', 800, NULL, 20)
insert into EMP values (7499, 'ALLEN', 'SALESMAN', 7698, '1981/02/20', 1600, 300, 30)
insert into EMP values (7521, 'WARD', 'SALESMAN', 7698, '1980/02/22', 1250, 500, 30)
insert into EMP values (7566, 'JONES', 'MANAGER', 7839, '1981/04/02', 2975, NULL, 20)
insert into EMP values (7654, 'MARTIN', 'SALESMAN', 7698, '1981/09/28', 1250, 1400, 30)
insert into EMP values (7698, 'BLAKE', 'MANAGER', 7839, '1981/05/01', 2850, NULL, 30)
insert into EMP values (7782, 'CLARK', 'MANAGER', 7839, '1981/06/09', 2450, NULL, 10)
insert into EMP values (7788, 'SCOTT', 'ANALYST', 7566, '1987/04/19', 3000, NULL, 20)
insert into EMP values (7839, 'KING', 'PRESIDENT', NULL, '1981/11/17', 5000, NULL, 10)
insert into EMP values (7844, 'TURNER', 'SALESMAN', 7698, '1981/09/08', 1500, 0, 30)
insert into EMP values (7876, 'ADAMS', 'CLERK', 7788, '1987/05/23', 1100, NULL, 20)
insert into EMP values (7900, 'JAMES', 'CLERK', 7698, '1981/12/03', 950, NULL, 30)
insert into EMP values (7902, 'FORD', 'ANALYST', 7566, '1981/12/03', 3000, NULL, 20)
insert into EMP values (7934, 'MILLER', 'CLERK', 7782, '1982/01/23', 1300, NULL, 10)


-------------- CREATE TABLE DEPT --------------------------

create table DEPT(
	DEPTNO int primary key not null,
	DNAME varchar(20),
	LOCATION varchar(20)
	)

---------------------- INSERT VALUES INTO TABLE DEPT ------------------

insert into DEPT values(10, 'ACCOUNTING', 'NEW YORK'), (20, 'RESEARCH', 'DALLAS'), (30,'SALES','CHICAGO'), (40, 'OPERATIONS','BOSTON')


------------PRACTISE---------------

select * from DEPT

select * from DEPT where DEPTNO between 20 and 40

--7. 'IN'
select * from DEPT where LOCATION in ('dallas', 'BOSTON')

select * from DEPT where LOCATION NOT in ('dallas', 'BOSTON')

--8. LIKE OPERATOR
-- % -> ONE OR MORE SUBSTITUTION
-- _ -> ONE CHAR SUBSTITUTION
-- ^ -> NOT
-- [] -> ANY ONE CHAR WHICH IS REPRESENTED INSIDE

select * from DEPT where DNAME like '%G'

select * from DEPT where DNAME like '__[CSL]%'	



------------------- QUERIES -----------------------

--1
select ENAME from EMP where ENAME like 'a%'

--2
select ENAME from EMP where MGR_ID is NULL

--3
select ENAME, EMPNO, SAL from EMP where SAL between 1200 and 1400

select ENAME, EMPNO, SAL, DEPTNO from EMP where DEPTNO = 20
--4
select *, SAL as 'Old Salary', SAL+(SAL*0.1) as 'New Salary' from EMP where DEPTNO = 20

--5
select count (JOB) as 'Number of Clerks' from EMP where JOB = 'CLERK'

--6
select JOB as 'Job Type', avg(SAL) as 'Average Salary', count(*) as 'No. of Employees' from EMP group by JOB

--7
select * from EMP where SAL in((select max(SAL) from EMP) union (select min(SAL) from EMP))

--8
select * from DEPT where DEPTNO NOT IN ( select DEPTNO from EMP)

--9
select ENAME, SAL from EMP where JOB='Analyst' and SAL>1200 and DeptNo=20 order by ENAME ASC

--10
select DEPT.DEPTNO, DEPT.DNAME, sum(SAL) as 'TOTAL SALARY' from EMP, DEPT where EMP.DEPTNO=DEPT.DEPTNO group by DEPT.DEPTNO, DEPT.DNAME

--11
select ENAME, SAL from EMP where ENAME = 'MILLER' UNION (select ENAME, SAL from EMP where ENAME = 'SMITH')

--12
select ENAME from EMP where ENAME like '[aM]%'

--13
select ENAME, SAL*12 as 'Annual Salary' from EMP where ENAME = 'SMITH'

--14
select ENAME, SAL from EMP where SAL NOT BETWEEN 1500 and 2850 ORDER BY SAL ASC
-----------------------------------------------------------------------------------------------------------------------------------------------------
select e2.ENAME, e1.SAL, e1.ENAME as MANAGER_NAME from EMP e1 join EMP e2 on e1.EMPNO=e2.MGR_ID

select EMPNO, SUM(SAL) FROM EMP GROUP BY DEPTNO



