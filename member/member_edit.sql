-- MEM-13	회원 정보 수정	사용자는 본인의 회원 정보를 수정한다.

-- 회원 코드user_code(pk)로 회원코드, 역할, 아이디, 비밀번호 등을 변경한다.
UPDATE member
   SET student_code = 0999
 WHERE user_code = 1;
  
UPDATE member
   SET role_code = 3
 WHERE user_code = 1; 
 
UPDATE member
   SET user_id = 'okokok123'
 WHERE user_code = 1;
 
 
UPDATE member
   SET user_name = '강성현'
 WHERE user_code = 1;
 
 
UPDATE member
   SET user_pw = 'okok321'
 WHERE user_code = 1;
 
 
UPDATE member
   SET user_phone = '010-0012-0034'
 WHERE user_code = 1;
 
 
UPDATE member
   SET nick_name = 'baby'
 WHERE user_code = 1;
 
UPDATE member
   SET gender = '여'
 WHERE user_code = 1;
 
 
UPDATE member
   SET age = 77
 WHERE user_code = 1;