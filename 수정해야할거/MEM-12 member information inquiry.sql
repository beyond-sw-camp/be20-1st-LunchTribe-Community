-- MEM-12	회원 정보 조회	사용자는 본인의 회원 정보를 조회한다.

-- 사용자(회원, 점주) 본인의 회원 정보를 조회하는 기능입니다.
-- SELECT *
--   FROM MEMBER;
-- WHERE user_code = (INT)'자신의 유저 코드(pk)'

SELECT 
		 user_code						AS '유저코드'
	  , student_code					AS '학생번호'
	  , role_code						AS '역할코드'
	  , user_name						AS '이름'
	  , user_id							AS '아이디'
	  , user_pw							AS '비밀번호'
	  , user_phone						AS '전화번호'
	  , nick_name						AS '닉네임'
	  , gender							AS '성별'
	  , age								AS '나이'
	  , user_created_at				AS '가입날짜'
	  , user_updated_at				AS '수정날짜'
  FROM member
 WHERE user_code = 1;			/*로그인한 사람의 유저코드(pk)를 받아와 자동입력*/
 

 -- 관리자가 회원 전체를 조회하는 기능입니다.
SELECT 
      user_code						AS '유저코드'
	  , student_code					AS '학생번호'
	  , role_code						AS '역할코드'
	  , user_name					   AS '이름'
	  , user_id							AS '아이디'
	  , user_pw							AS '비밀번호'
	  , user_phone						AS '전화번호'
	  , nick_name						AS '닉네임'
	  , gender							AS '성별'
	  , age								AS '나이'
	  , user_created_at				AS '가입날짜'
	  , user_updated_at				AS '수정날짜'
  FROM member;