-- MEM-14	아이디 찾기	사용자는 가입시 사용한   이름과 전화 번호를 사용하여 아이디를 찾느다.


-- 회원의 user_name과 user_phone을 통해 아이디를 조회합니다.
-- SELECT user_id
--   FROM member
-- WHERE user_name = ex.'이상도' AND user_phone = ex.'010-4749-2442';


SELECT user_id
  FROM member
WHERE user_name = '이상도' AND user_phone = '010-4749-2442';
