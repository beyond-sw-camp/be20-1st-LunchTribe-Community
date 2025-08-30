-- MEM-15	비밀번호 찾기	아이디에 대응하는 비밀번호를 재설정한다.

-- 유저의 아이디로 비밀번호 조회후 비밀번호를 재 설정한다.
-- SELECT user_pw
--   FROM member
-- WHERE user_id = 'korsh111';(아이디)
 
-- UPDATE member
--    SET user_pw = 'javayanolja'(재설정 비밀번호)
--  WHERE user_id = 'korsh111'
--    AND user_pw = 'dltkdeh90'(기존 비밀번호)


SELECT user_pw
  FROM member
WHERE user_id = 'korsh111';

UPDATE member
   SET user_pw = 'javayanolja'
 WHERE user_id = 'korsh111'
   AND user_pw = 'dltkdeh90'