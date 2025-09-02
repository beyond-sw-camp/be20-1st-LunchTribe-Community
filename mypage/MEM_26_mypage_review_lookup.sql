-- MEM-27	본인이 작성한 리뷰 목록을 조회한다.

-- 사용자(회원)만 본인이 작성한  댓글 조회 가능
SELECT
	    c.restaurant_name								AS '식당이름'
	  , b.COMMENT											AS '리뷰내용'
  FROM member a
  JOIN review b ON a.user_code = b.user_code
  JOIN restaurant c ON c.restaurant_code = b.restaurant_code
 WHERE a.user_code = 2								-- 로그인 과정에서 주고받은 사용자 고유pk입력													
 ORDER BY b.review_code DESC				   	-- 본인이 작성한 리뷰 최신순으로 정렬
 LIMIT 10 OFFSET 0;									