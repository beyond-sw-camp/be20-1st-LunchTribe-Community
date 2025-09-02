-- MEM-02	역할 조회	관리자는 역할을 조회 할 수 있다.

-- role 역할 테이블 조회를 통해 확인.
SELECT 
		 role_code				AS '역할코드'
	  , role_name				AS '역할이름'
  FROM ROLE;