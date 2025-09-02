-- MEM-15	비밀번호 찾기	아이디에 대응하는 비밀번호를 재설정한다.

-- 유저의 아이디로 비밀번호 조회후 비밀번호를 재 설정한다.
-- SELECT user_pw
--   FROM member
-- WHERE user_id = 'korsh111';(아이디)
 
-- UPDATE member
--    SET user_pw = 'javayanolja'(재설정 비밀번호)
--  WHERE user_id = 'korsh111'
--    AND user_pw = 'dltkdeh90'(기존 비밀번호)
--    AND USER_name = '이상도'(아아디만으론 해킹위험이 있어 이름을 추가함)


SELECT 
      IF(COUNT(*) = 1, '비밀번호를 변경해주세요.' , '입력을 다시 한번 확인바랍니다.')		AS'대조 결과'
  FROM member
WHERE user_id = 'kimcss'							AS '아이디'
  AND user_name = '김철수'						AS '이름'
  AND user_phone = '01047490000';				AS '전화번호'			--전부 일치해야 함.

-- 위 쿼리문에서 비밀번호 변경 쿼리 접수 후
 

UPDATE member
   SET user_pw = 'javayanolja'					AS '변경된 비밀번호'
 WHERE user_id = 'kimcss'							AS '아이디'
   AND user_phone = '01047490000'				AS '전화번호'
   AND USER_name = '김철수';					AS '이름'