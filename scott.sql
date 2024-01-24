-- scott

-- select(데이터 조회)
SELECT
	*
FROM
	EMP e;
-- e : 별칭(임의 조정 가능) / 업어도 됨
-- * : 전체 필드를(컬럼)를 의미함

SELECT EMPNO, ENAME, JOB
FROM EMP;

-- emp 테이블에서 부서번호만(중복 데이터 제거) 조회
SELECT DISTINCT  deptno
FROM EMP e ;

-- emp 테이블
-- empno(사원번호), ename(사원명), job(직책), mgr(매니저번호), hiredate(고용일), sal(급여), comm(보너스)
-- deptno(부서번호)

-- emp 테이블에서 사원번호, 매니저 번호, 부서번호만 조회
SELECT EMPNO, MGR, DEPTNO
FROM EMP; 

-- 데이터 출력 시 필드명 별칭 부여
-- 쌍따음표는 별칭에 공백이 있는 경우 무조건 사용
-- as 생략 가능
SELECT
	EMPNO AS 사원번호, MGR AS 매니저번호, DEPTNO "부서 번호"
FROM EMP; 


-- 연봉 게산
-- 월굽 * 12 + 수당
-- sal * 12 + comm
SELECT empno, sal, sal * 12 + comm AS "연봉"
FROM emp e;

-- 정렬
-- order by 정렬기준컬럼명 desc or asc
-- desc : 내림차순  asc : 오름차순(default)
SELECT *
FROM EMP ORDER BY sal DESC;

-- emp 테이블에서 empno, ename, sal 조회(단, emono 내림차순)
SELECT empno, sal, ename
FROM emp
ORDER BY empno DESC ;

SELECT empno, ename, sal
FROM emp
ORDER BY sal;

-- 전체조회, 부서번호 오름차순, sal 내림차순
SELECT *
FROM emp e
ORDER BY DEPTNO ASC, SAL DESC;
-- asc 는 디폴트 값이라 안써도 된다


-- 조건
-- deptno가 30번인 사원 조회
-- sal > 1000 이상인 사원 조회
-- =(같다) 산술연산(>, <, >=, <=)
SELECT * 
FROM  emp e 
WHERE DEPTNO = 30;

SELECT * 
FROM  emp e 
WHERE sal >= 1000;

SELECT * 
FROM  emp e 
WHERE sal >= 1000
ORDER BY sal DESC;

-- empno 가 7782 인 사원 조회
SELECT * 
FROM  emp e 
WHERE empno = 7782;

-- deptno 가 30번 이고, job 이 salesman 인 사원을 조회
-- 데이터는 대소문자 구별 함
SELECT * 
FROM  emp e 
WHERE DEPTNO = 30 AND job = 'SALESMAN';

-- empno가 7499 이고 deptno가 30인 사원 조회
SELECT  *
FROM  emp e
WHERE empno = 7499 AND DEPTNO = 30;

-- 이거나(혹은) : or
-- deptno가 30 이거나 job 이 salesman 인 사원조회
SELECT  *
FROM  emp e
WHERE DEPTNO = 30 OR job = 'salesman';


-- 연봉이 36000 인 사원 조회
SELECT *
FROM  emp e
WHERE sal * 12 + comm  = 36000;

-- 문자 비교도 가능 - 산숭연산 기호 가능
-- 알파벳 순서로 F 다음에 잇는
SELECT *
FROM  emp e
WHERE ENAME >= 'F';

-- ~이 아닌 : !=(자주사용) <> ^=
-- SAL 이 3000 이 아닌 사원 조회
SELECT *
FROM  emp e
WHERE SAL != 3000;

SELECT *
FROM  emp e
WHERE SAL <> 3000;

SELECT *
FROM  emp e
WHERE SAL ^= 3000;

-- JOB 이 MANAGER OR SALESMAN OR CLERK 인 사람
SELECT *
FROM  emp e
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- IN (~이거나)
SELECT *
FROM  emp e
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');

-- NOT IN (~가 아니거나)
SELECT *
FROM  emp e
WHERE JOB NOT IN  ('MANAGER','SALESMAN','CLERK');

--HIREDATE 가 1981 10 31 이후에 고용된 사원 조회
--날짜 데이터 산술 연상 가능, 날짜 데이터 ''로 처리
SELECT *
FROM EMP e 
WHERE HIREDATE > '1981-10-31';

-- BETWEEN A AND B (~이상 ~이하)
-- SAL 2000 이상 3000 이하인 사원 조회
SELECT *
FROM EMP e
WHERE SAL >=2000 AND SAL <= 3000;

SELECT *
FROM EMP e
WHERE SAL BETWEEN 2000 AND 3000;

-- NOT BETWEEN A AND B (BETWEEN 의 반대)
SELECT *
FROM EMP e
WHERE SAL NOT BETWEEN 2000 AND 3000;








