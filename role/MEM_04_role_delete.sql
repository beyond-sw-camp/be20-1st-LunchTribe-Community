-- MEM-04	역할 삭제	관리자는 학생부의 학생정보를 삭제한다.\


-- 역할 고유식별자를 통해 (역할 단일 행)을 삭제한다.
-- DELETE 
--   FROM ROLE
--  WHERE role_code = 1;
 
DELETE 
  FROM ROLE
 WHERE role_code = 1;			/*삭제할 역할의 고유식별자*/