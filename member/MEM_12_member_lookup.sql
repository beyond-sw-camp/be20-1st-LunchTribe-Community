-- MEM-12	회원 정보 조회	사용자는 본인의 회원 정보를 조회한다.

-- 사용자(회원, 점주) 본인의 회원 정보를 조회하는 기능입니다.
-- SELECT *
--   FROM MEMBER;
-- WHERE user_code = (INT)'자신의 유저 코드(pk)'

SELECT 
	    b.role_name						AS '역할코드'
	  , user_name							AS '이름'
	  , user_id								AS '아이디'
	  , user_phone							AS '전화번호'
	  , nick_name							AS '닉네임'
	  , gender								AS '성별'
	  , age									AS '나이'
	  , CONCAT(
	  		YEAR(c.training_start),
	  		'년',
	  		MONTH(c.training_start),
	  		'월',
	  		DAYOFMONTH(c.training_start),
	  		'일'
	  	 )										AS '훈련시작일'
	  , CONCAT(
	  		YEAR(c.training_end),
	  		'년',
	  		MONTH(c.training_end),
	  		'월',
	  		DAYOFMONTH(c.training_end),
	  		'일'
	    )										AS '훈련종료일'
	  , CONCAT(c.student_term,'기')  AS '기수'
	  , CONCAT(
	      YEAR(a.user_created_at),
	      '년',
	      MONTH(a.user_created_at),
	      '월',
	      DAYOFMONTH(a.user_created_at),
	      '일'
  	    )										AS '가입날짜'
	  , CONCAT(
	      YEAR(a.user_updated_at),
	      '년',
	      MONTH(a.user_updated_at),
	      '월',
	      DAYOFMONTH(a.user_updated_at),
	      '일'
	    )										AS '수정날짜'
  FROM member a
  JOIN role b USING (role_code)
  JOIN student c USING (student_code)
 WHERE user_code = 1;			/*로그인한 사람의 유저코드(pk)를 받아와 자동입력*/
 

