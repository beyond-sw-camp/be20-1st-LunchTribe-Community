-- MEM-03	역할 수정	관리자는 역할의 내용을 수정 할 수 있다.


-- UPDATE
--   FROM role_name = '점주'
--  WHERE role_code = 2;

-- 역할 고유식별자(pk)를 통해 역할 이름을 변경한다.
UPDATE role
   SET role_name = '관리자'
 WHERE role_code = 2;