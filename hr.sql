-- employees 에서 전체 내용 조회
SELECT
	*
FROM
	EMPLOYEES e ;

-- first_name, last_name, job_id 조회
SELECT
	first_name,
	last_name,
	job_id
FROM
	EMPLOYEES e ;

-- 사원번호가 176인 사람의 LAST_NAME 과 DEPARTMENT_ID 조회
SELECT
	LAST_NAME,
	DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	EMPLOYEE_ID = 176;


-- 연봉이 12000 이상 되는 직원들의 LAST_NAME과 SALARY 조회
SELECT
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	SALARY >= 12000;

-- 연봉이 5000 에서 12000 의 범위 이외인 사람들의 LAST_NAME과 SALARY 조회
SELECT
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	SALARY < 5000
	OR SALARY > 12000;

-- 부서번호가 20, 50 부서에서 근무하는 사원들의 LAST_NAME, DEPARTMENT_ID 조회
SELECT
	LAST_NAME,
	DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID = 20
	OR DEPARTMENT_ID = 50;

-- last_name, department_id 오름차순
SELECT
	LAST_NAME,
	DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID IN (20, 50)
ORDER BY
	LAST_NAME ASC,
	DEPARTMENT_ID ASC;


-- 커미션을 버는 모든 사원들의 LAST_NAME, SALARY, COMMISION_PCT 조회
SELECT
	LAST_NAME,
	SALARY,
	COMMISSION_PCT
FROM
	EMPLOYEES e
WHERE
	COMMISSION_PCT > 0
ORDER BY
	SALARY DESC,
	COMMISSION_PCT DESC;


-- SALARY 가 2500,3500,7000  아니며 JOB 이 SA_REP 나 ST_CLERK 사원 조회
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	SALARY != 2500
	AND SALARY != 3500
	AND SALARY <> 7000
	AND (JOB_ID = 'SA_REP'
		OR JOB_ID = 'ST_CLERK');


SELECT
	*
FROM
	EMPLOYEES e
WHERE
	SALARY NOT IN (2500, 3500, 7000)
	AND JOB_ID IN ('SA_REP', 'ST_CLERK'); 

-- 2017-01-01 ~ 2017-12-31 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID,HIRE_DATE 조회
-- HIRE_DATE 내림차순 정렬
SELECT
	LAST_NAME,
	EMPLOYEE_ID,
	HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	HIRE_DATE >= '2017-01-01'
	AND HIRE_DATE <= '2017-12-31'
ORDER BY
	HIRE_DATE DESC;

-- BETWEEN A AND B

-- 부서번호가 20, 50 부서에서 근무하고, 연봉이 5000 ~ 12000 사이인 사원들의 LAST_NAME, SALARY 조회
-- SALARY 오름차순
SELECT
	LAST_NAME,
	DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID IN (20, 50)
	AND SALARY BETWEEN 5000 AND 12000
ORDER BY
	LAST_NAME ASC,
	DEPARTMENT_ID ASC;


-- 2017-01-01 ~ 2017-12-31 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID,HIRE_DATE 조회
-- HIRE_DATE 내림차순 정렬
SELECT
	LAST_NAME,
	EMPLOYEE_ID,
	HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	HIRE_DATE BETWEEN '2017-01-01' AND '2017-12-31'
ORDER BY
	HIRE_DATE DESC;


-- 연봉이 5000 에서 12000 의 범위 이외인 사람들의 LAST_NAME과 SALARY 조회
SELECT
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	SALARY NOT BETWEEN 5000 AND 12000;

-- LAST_NAME에 u가 포함되는 사원들의 사원번호, LAST_NAME 조회
SELECT
	EMPLOYEE_ID,
	LAST_NAME
FROM
	EMPLOYEES e
WHERE
	LAST_NAME LIKE '%U%'; 

-- LAST_NAME의 4번째 문자가 a인 사원들의 사원번호, LAST_NAME 조회
SELECT
	employee_ID,
	LAST_NAME
FROM
	EMPLOYEES e
WHERE
	LAST_NAME LIKE '___a%';

-- LAST_NAME에 a 혹은 e 글자가 들어있는 사원들의 사원번호, LAST_NAME 조회 후 LAST_NAME 오름차순 조회
SELECT
	employee_ID,
	LAST_NAME
FROM
	EMPLOYEES e
WHERE
	LAST_NAME LIKE '%a%'
	OR LAST_NAME LIKE '%e%'
ORDER BY
	LAST_NAME ASC;

-- LAST_NAME에 a 와 e 글자가 들어있는 사원들의 사원번호, LAST_NAME 조회 후 LAST_NAME 오름차순 조회
SELECT
	employee_ID,
	LAST_NAME
FROM
	EMPLOYEES e
WHERE
	LAST_NAME LIKE '%a%'
	AND LAST_NAME LIKE '%e%'
ORDER BY
	LAST_NAME ASC;

--OR를 사용해서 a, e 포함
SELECT
	employee_ID,
	LAST_NAME
FROM
	EMPLOYEES e
WHERE
	LAST_NAME LIKE '%a%e%'
	OR LAST_NAME LIKE '%e%a%'
ORDER BY
	LAST_NAME ASC;

SELECT * FROM EMPLOYEES e;
-- 매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT
	LAST_NAME,
	JOB_ID
FROM
	EMPLOYEES e
WHERE
	MANAGER_ID IS NULL;

-- ST_CLERK 인 JOB_ID를 가진 사원이 없는 부서 ID 조회(단, 부서번호가 NULL 인 사원 제외)
SELECT
	DISTINCT DEPARTMENT_ID
FROM
	EMPLOYEES e
WHERE
	JOB_ID NOT IN('ST_CLERK')
	AND DEPARTMENT_ID IS NOT NULL;

-- COMMISSION_PCT가 NULL 이 아닌 사원들 중에서 COMISSION = SALARY * COMMISSION_PCT
-- 를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID를 조회
SELECT
	employee_ID,
	FIRST_NAme,
	JOB_ID,
	SALARY * COMMISSION_PCT AS COMISSION
FROM
	EMPLOYEES e
WHERE
	COMMISSION_PCT IS NOT NULL;
	
-- NULL * 숫자 = NULL
SELECT
	employee_ID,
	FIRST_NAme,
	JOB_ID,
	SALARY,
	COMMISSION_PCT,
	SALARY * COMMISSION_PCT AS COMISSION
FROM
	EMPLOYEES e;
	
-- FIRST_NAME 이 'Curtis' 인 사원의 first_name, last_name, email, phone_number, job_id 를 조회한다. 단 job_id 결과는 소문자로 출력한다.
-- INITCAP (첫번째 문자만 대문자로 나머지는 소문자로 변환)
SELECT
	INITCAP(first_name),
	last_name,
	email,
	phone_number,
	lower(job_id)
FROM
	EMPLOYEES e
WHERE
	FIRST_NAME = 'Curtis';
-- 부서번호가 60, 70, 80, 90인 사원들의 employee_id, first_name, hire_date, job_id 조회
-- 단, job_id가 IT_PROG 인 사원의 경우 프로그래머 변경하여 출력한다.
-- REPLACE (문자열데이터, 찾는 문자, 변경할 문자)
SELECT
	employee_id,
	first_name,
	hire_date,
	REPLACE(job_id, 'IT_PROG', '프로그래머')
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID IN(60, 70, 80, 90);

-- JOB_ID가 AD_PRES, PU_CLERK 인 사원들의 employee_id, first_name, job_id 조회
-- 단, 사원명은 FIRST_NAME 과 LAST_NAME을 공백을 포함하여 연결
-- 'ABC' 'DEF' => 'ABC DEF'
SELECT
	employee_id,
	first_name || ' ' || LAST_NAME AS NAME,
	job_id
FROM
	EMPLOYEES e
WHERE
	JOB_ID IN('AD_PRES', 'PU_CLERK');
	
SELECT * FROM EMPLOYEES e;

SELECT
	LAST_NAME,
	SALARY,
	CASE
		WHEN SALARY BETWEEN 0 AND 1999 THEN 0
		WHEN SALARY BETWEEN 2000 AND 3999 THEN 0.09
		WHEN SALARY BETWEEN 4000 AND 5999 THEN 0.20
		WHEN SALARY BETWEEN 6000 AND 7999 THEN 0.30
		WHEN SALARY BETWEEN 8000 AND 9999 THEN 0.40
		WHEN SALARY BETWEEN 10000 AND 11999 THEN 0.42
		WHEN SALARY BETWEEN 12000 AND 13999 THEN 0.44
		WHEN SALARY >= 14000 THEN 0.45
	END AS TAX_RATE
	FROM EMPLOYEES e;
	



-- 2000단위로 SALARY를 나누고 첫째자리를 버림
SELECT 
last_name,
salary,
CASE trunc(SALARY/2000,0)
	WHEN 0 THEN '0%'
	WHEN 1 THEN '0.09%'
	WHEN 2 THEN '0.20%'
	WHEN 3 THEN '0.30%'
	WHEN 4 THEN '0.40%'
	WHEN 5 THEN '0.42%'
	WHEN 6 THEN '0.44%'
	ELSE '0.45%'
		END AS TAX_RATe
		FROM EMPLOYEES e
	WHERE DEPARTMENT_ID = 80; 

SELECT * FROM EMPLOYEES e; 

-- 최대 연봉 - 최소 연봉 차이 조회
SELECT 
Max(SALARY) - Min(SALARY) AS gap
FROM EMPLOYEES e;

-- 매니저로 근무하는 사원들의 총 수 조회(매니저번호 중복 제거)
SELECT
count(DISTINCT MANAGER_ID) AS mananger
FROM EMPLOYEES e;



-- 부서별 직원 수 구하기(부서번회의 오름차순 출력)
SELECT
DEPARTMENT_ID,
count(EMPLOYEE_ID)
FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID
ORDER  BY DEPARTMENT_ID;

-- 부서별 평균 급여 부서번호, 평균연봉 조회
SELECT DEPARTMENT_ID, AVG(SALARY)  
FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 동일한 직무(job_id)를 가진 사원들의 총 수
SELECT JOB_ID, count(EMPLOYEE_ID)
FROM EMPLOYEES e
GROUP BY Job_id
ORDER BY JOB_ID;

SELECT * FROM EMPLOYEES e;

-- 매니저가 관리하는 사원들 중에서 최소급여 조회
-- 매니저가 관리하는 사원들 중에서 최소급여가 6000 미만인 최소급여는 제외
-- 매니저가 없는 사원 제외
SELECT min(SALARY) AS "최소급여", MANAGER_ID
FROM EMPLOYEES e
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID HAVING min(SALARY) >= 6000
ORDER BY "최소급여" ASC;

-- 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기
-- hire_date, last_name, manager_id 출력
SELECT
	e.employee_id AS 내사원번호,
	e.hire_date AS 내입사일,
    e.last_name AS 내이름,
	e.manager_id AS 매니저번호, 
	e2.HIRE_DATE AS 매니저입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.manager_ID = e2.EMPLOYEE_ID
	AND e.hire_date < e2.HIRE_DATE
;

-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
-- (도시명은 Locations 테이블에)

SELECT
	d.DEPARTMENT_ID,
	l.CITY,
	e.EMPLOYEE_ID,
	e.LAST_NAME
FROM
	EMPLOYEES e 
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID  = d.DEPARTMENT_ID 
	JOIN LOCATIONS l  ON
	d.LOCATION_ID = l.LOCATION_ID
	WHERE l.CITY LIKE 'T%'
;

-- 위치 아이디가 1700인 사원들의 last_name, 부서번호, 연봉 조회
SELECT
e.LAST_NAME, d.DEPARTMENT_ID, e.SALARY, l.LOCATION_ID
FROM
	LOCATIONS l
JOIN DEPARTMENTS d ON
	l.LOCATION_ID = d.LOCATION_ID
JOIN EMPLOYEES e ON
    d.DEPARTMENT_ID = e.EMPLOYEE_ID
GROUP BY l.LOCATION_ID, e.LAST_NAME, e.SALARY, d.DEPARTMENT_ID 
HAVING l.LOCATION_ID = 1700;
	-- 부서명, 위치ID, 각부서별 사원 수 , 각 부서별 평균 연봉 조회
-- 평균 연봉은 소수점 2자리까지만 표현
SELECT
d.DEPARTMENT_NAME, d.LOCATION_ID, count(e.employee_id), round(avg(e.SALARY),2)
FROM EMPLOYEES e
JOIN DEPARTMENTS d ON
e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME, d.LOCATION_ID
ORDER BY d.LOCATION_ID
;
-- Excutive 부서에 근무하는 사원들의 부서번호, last_name, job_id 조회
SELECT
d.DEPARTMENT_ID, e.LAST_NAME, e.JOB_ID
FROM
	DEPARTMENTS d
JOIN EMPLOYEES e ON
	d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME LIKE 'Executive';

	-- 각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 많은 연봉을 받는 사원이 존재하는
	-- 사원들의 이름 조회(이름은 first_name과 last_name을 결합하여 하나로 나오게 하기)
	-- 부서번호, 결합된 이름, salary, hire_date 출력
SELECT
	DISTINCT e.department_id,
	e.first_name || ' ' || e.last_name AS "내이름",
	e.salary AS 내급여,
	e.hire_date AS 내입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.department_id = e2.DEPARTMENT_ID
	AND e.salary < e2.SALARY
WHERE
	e.HIRE_DATE < e2.HIRE_DATE;
	
-- 4
-- LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에서 근무하는 사원들의 사번 및 last_name 조회
-- 사번 오름차순
SELECT
	EMPLOYEE_ID,
	LAST_NAME
FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID IN (
	SELECT
		DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		LAST_NAME LIKE '%u%')
ORDER BY
	EMPLOYEE_ID ASC;
	
-- 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 job_id 조회
SELECT
	e.EMPLOYEE_ID, e.JOB_ID
FROM
	EMPLOYEES e
WHERE (e.employee_id, e.job_id) IN (SELECT jh.employee_id, jh.job_id FROM JOB_HISTORY jh);


-- JOIN 함수 사용
SELECT DISTINCT 
	e.employee_id,
	e.job_id
FROM
	EMPLOYEES e
JOIN JOB_HISTORY jh ON
	e.EMPLOYEE_ID = jh.EMPLOYEE_ID
WHERE (e.EMPLOYEE_ID, e.JOB_ID) IN (SELECT jh.EMPLOYEE_ID, jh.JOB_ID FROM JOB_HISTORY jh);

-- SELECT 서브쿼리
-- 각 직무별 연봉 총합 및 각 부서별 연봉 총합 조회
-- JOB_ID, 부서별연봉총합, 전체총합
SELECT
JOB_ID, (SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 10 AND E.job_id = E2.JOB_ID) AS DEPT10,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 20 AND E.job_id = E2.JOB_ID) AS DEPT20,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 30 AND E.job_id = E2.JOB_ID) AS DEPT30,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 40 AND E.job_id = E2.JOB_ID) AS DEPT40,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 50 AND E.job_id = E2.JOB_ID) AS DEPT50,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 60 AND E.job_id = E2.JOB_ID) AS DEPT60,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 70 AND E.job_id = E2.JOB_ID) AS DEPT70,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 80 AND E.job_id = E2.JOB_ID) AS DEPT80,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 90 AND E.job_id = E2.JOB_ID) AS DEPT90,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 100 AND E.job_id = E2.JOB_ID) AS DEPT100,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE department_id = 110 AND E.job_id = E2.JOB_ID) AS DEPT110,
(SELECT SUM(SALARY) FROM EMPLOYEES e2 WHERE E.job_id = E2.JOB_ID) AS TOTAL
FROM EMPLOYEES e
GROUP BY JOB_ID
ORDER BY JOB_ID;


-- 예시문제 --
-- JOB_ID 가 SA_MAN 인 사원들의 최대 연봉보다 높게 받는 사원들의 LAST_NAME, JOB_ID, SALARY 조회
SELECT last_name, job_id, SALARY
FROM EMPLOYEES e
WHERE SALARY < ANY (SELECT Max(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'SA_MAN');
/*오답노트*/
SELECT
	last_name,
	job_id,
	salary
FROM
	EMPLOYEES e
WHERE
	SALARY > (
	SELECT
		Max(SALARY)
	FROM
		EMPLOYEES e
	WHERE
		JOB_ID = 'SA_MAN'); 

-- 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서번호, 연봉 조회
/*내가 한 문제풀이*/
SELECT
	Last_name,
	DEPARTMENT_ID,
	SALARY
FROM
	EMPLOYEES e
WHERE
	COMMISSION_PCT = ANY (
	SELECT
		COMMISSION_PCT
	FROM
		EMPLOYEES e);
/*오답노트*/
SELECT
	last_name,
	department_id,
	salary
FROM
	EMPLOYEES e
where
(DEPARTMENT_ID,
	SALARY) IN (
	SELECT
	DEPARTMENT_ID, SALARY
	FROM
		EMPLOYEES e
	WHERE
		COMMISSION_PCT IS NOT NULL); 

-- 회사 전체 평균 연봉보다 더 많이 버는 사원들 중 LAST_NAME에 u가 있는 사원들이 근무하는 부서에서 근무하는
-- 사원들의 사번, LAST_NAME, 연봉 조회
/*내가 한 문제풀이*/
SELECT
	EMPLOYEE_ID,
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	SALARY > (
	SELECT
		avg(SALARY)
		FROM EMPLOYEES e)
	AND LAST_NAME LIKE '%u%';
/*오답노트*/
SELECT
	EMPLOYEE_ID,
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	department_id IN
(
	SELECT
		DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		salary > (
		SELECT
			avg(SALARY)
		FROM
			EMPLOYEES e)
		AND last_name LIKE '%u%'); 
-- 각 부서별 평균 연봉보다 더 받는 동일 부서 근무사원들의 LAST_NAME, 부서번호, 연봉 및 해당 부서의 평균 연봉 조회
-- 부서별 연봉을 기준으로 정렬
/*내가 한 문제풀이*/
SELECT
	LAST_NAME,
	DEPARTMENT_ID,
	SALARY
FROM
	EMPLOYEES e
WHERE
    SALARY < (SELECT avg(SALARY) FROM EMPLOYEES e)
  ORDER BY DEPARTMENT_ID;
 /*오답노트*/
SELECT
E1.last_name, E1.DEPARTMENT_ID, E1.SALARY, E2.DEPT_SAL_AVG
FROM
	EMPLOYEES E1,
	(
	SELECT
		DEPARTMENT_ID,
		avg(SALARY) AS DEPT_SAL_AVG
	FROM
		EMPLOYEES e
	GROUP BY
		DEPARTMENT_ID) E2
WHERE             
	E1.department_ID = E2.department_ID AND E1.Salary > E2.DEPT_SAL_AVG 
ORDER BY DEPARTMENT_ID
;

-- 

-- LAST_NAME이 Davies 인 사람보다 후에 고용된 사원들의 last_name, hire_date 조회
SELECT
	LAST_NAME,
	HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	HIRE_DATE > (
	SELECT
		HIRE_DATE
	FROM
		EMPLOYEES e
	WHERE
		LAst_name LIKE 'Davies');

-- last_name 이 king 인 사원을 매니저로 두고 있는 모든 사원들의 last_name, salary 조회
/*내가 한 문제풀이*/
SELECT
	last_name,
	SALARY,
	MANAGER_ID
FROM
	EMPLOYEES e
WHERE
	(MANAGER_ID,
	DEPARTMENT_ID) IN (
	SELECT
		MANAGER_ID,
		DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		last_name = 'King');
 /*오답노트*/
SELECT
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	manager_ID IN (
	SELECT
		EMPLOYEE_ID
	FROM
		EMPLOYEES e
	WHERE
		LAST_NAME = 'King');
-- last_name 이 Kochhar 인 사원과 동일한 연봉 및 커미션을 버는 사원들의 last_name, 부서번호, salary 조회
-- Kochhar은 제외한다
SELECT
	last_name,
	DEPARTMENT_ID,
	SALARY
FROM
	EMPLOYEES e
WHERE
	(salary,
	nvl(commission_pct, 0)) IN (
	SELECT
		salary,
		nvl(commission_pct, 0)
	FROM
		EMPLOYEES e
	WHERE
		last_name = 'Kochhar') AND e.LAST_NAME != 'Kochhar';
	
-- 부서가 위치한 국가 ID, 국가 이름 조회
-- countries 테이블과 loactions, departments 이용
SELECT
	COUNTRY_ID,
	COUNTRY_NAME
FROM
	COUNTRIES c
WHERE
	country_ID IN (
	SELECT
		l.COUNTRY_ID
	FROM
		LOCATIONS l ,
		(
		SELECT
			LOCATION_ID
		FROM
			DEPARTMENTS d) D
	WHERE
		l.LOCATION_ID = D.location_ID)
	
-- 총 사원 수 및 2013,2014,2015,2016 년도 별 고용된 사원들의 총 수를 조회한다.

--SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES e WHERE to_char(HIRE_DATE, 'YYYY') = '13';
--SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES e WHERE HIRE_DATE LIKE '13%'	


SELECT DISTINCT
    (SELECT
		count(EMPLOYEE_ID) FROM EMPLOYEES e2) AS "총 사원수" ,
	(
	SELECT
		COUNT(EMPLOYEE_ID)
	FROM
		EMPLOYEES e
	WHERE
		to_char(HIRE_DATE, 'YY') = '13'
	) AS "2013",
	(
	SELECT
		COUNT(EMPLOYEE_ID)
	FROM
		EMPLOYEES e
	WHERE
		to_char(HIRE_DATE, 'YY') = '14'
	) AS "2014",
	(
	SELECT
		COUNT(EMPLOYEE_ID)
	FROM
		EMPLOYEES e
	WHERE
		to_char(HIRE_DATE, 'YY') = '15'
	) AS "2015",
	(
	SELECT
		COUNT(EMPLOYEE_ID)
	FROM
		EMPLOYEES e
	WHERE
		to_char(HIRE_DATE, 'YY') = '16'
	) AS "2016"
FROM
	EMPLOYEES e;

-- 위치 ID 가 1700인 사원들의 연봉과 커미션을 추출한 뒤, 추출된 사원들의 연봉과 커미션이
-- 동일한 사원정보 조회
-- 사원번호, 이름( frist+last 결합), 부서번호, 급여 출력

SELECT
	EMPLOYEE_ID,
	FIRST_NAME || ' ' || LAST_NAME AS NAME,
	DEPARTMENT_ID,
	SALARY
FROM
	EMPLOYEES e
WHERE
	(salary,
	nvl(COMMISSION_PCT, 0)) IN (
	SELECT
		SALARY,
		nvl(COMMISSION_PCT, 0)
	FROM
		EMPLOYEES e
	WHERE
		department_ID IN (
		SELECT
			DEPARTMENT_ID
		FROM
			DEPARTMENTS d
		WHERE
			D.LOCATION_ID = 1700));
			
