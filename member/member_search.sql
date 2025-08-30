-- MEM-12	회원 정보 조회	사용자는 본인의 회원 정보를 조회한다.

-- 사용자(회원, 점주) 본인의 회원 정보를 조회하는 기능입니다.
-- SELECT *
--   FROM MEMBER;
-- WHERE user_code = (INT)'자신의 유저 코드(pk)'

SELECT *
  FROM member
 WHERE user_code = 1;
 

 -- 관리자가 회원 전체를 조회하는 기능입니다.
SELECT *
  FROM MEMBER;