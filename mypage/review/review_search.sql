-- MEM-27	사용자는 본인이 작성한 리뷰 목록을 조회한다.

-- 사용자(회원)만 본인이 작성한  댓글 조회 가능
SELECT
	    a.user_code   									AS '유저고유 코드'
	  , b.review_code									AS '리뷰고유 코드'
	  , b.restaurant_code								AS '식당고유 코드'
	  , b.COMMENT											AS '리뷰내용'
  FROM member a
  JOIN review b ON a.user_code = b.user_code
 WHERE a.user_code = 2								-- 로그인 과정에서 주고받은 사용자 고유pk입력
   AND role_code = 1	  								-- 사용자(회원)만 조회할 수 있다.								
   AND b.is_delete = 'N'						
 ORDER BY b.review_code DESC				   	-- 본인이 작성한 리뷰 최신순으로 정렬
 LIMIT 10 OFFSET 0;									-- 페이지당 10개씩 조회