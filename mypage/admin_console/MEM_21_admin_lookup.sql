
-- MEM-21 회원정보 수정 기능

-- (1) 전체 회원 조회 (역할 포함)
SELECT 
       c.role_name							AS '학생점주관리자'
	  , b.user_name							AS '이름'
	  , b.age									AS '나이'
	  , b.gender								AS '성별'
	  , b.nick_name							AS '닉네임'
     , b.user_id						   	AS '아이디'
     , b.user_pw								AS '비밀번호'
     , b.user_phone							AS '전화번호'
     , b.status								AS '활성화'   
     , a.training_start						AS '훈련시작일'
     , a.training_end						AS '훈련종료일'
     , a.student_term						AS '기수'
 FROM student a
 JOIN member b ON a.student_code = b.student_code
 JOIN role c ON b.role_code = c.role_code
ORDER BY a.training_start DESC;	