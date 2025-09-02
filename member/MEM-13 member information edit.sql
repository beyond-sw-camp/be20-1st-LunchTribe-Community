-- MEM-13	회원 정보 수정	사용자는 본인의 회원 정보를 수정한다.

-- 회원 코드user_code(pk)로 회원코드, 역할, 아이디, 비밀번호 등을 변경한다.
UPDATE member
   SET student_code = 0999								AS '학생번호'
 WHERE user_code = 1;
  
UPDATE member
   SET role_code = 3										AS '역할코드'
 WHERE user_code = 1; 
 
UPDATE member
   SET user_id = 'okokok123'							AS '아이디'
 WHERE user_code = 1;
 
 
UPDATE member
   SET user_name = '강성현'							AS '이름'
 WHERE user_code = 1;
 
 
UPDATE member
   SET user_pw = 'okok321'								AS '비밀번호'
 WHERE user_code = 1;
 
 
UPDATE member
   SET user_phone = '010-0012-0034'					AS '전화번호'
 WHERE user_code = 1;
 
 
UPDATE member
   SET nick_name = 'baby'								AS '닉네임'
 WHERE user_code = 1;
 
UPDATE member
   SET gender = '여'									  AS  '성별'
 WHERE user_code = 1;
 
 
UPDATE member
   SET age = 77											AS '나이'
 WHERE user_code = 1;