-- MEM-26	사용자는 본인이 즐겨찾기를 누른 맛집의 내역을 조회한다


-- 본인이 즐겨찾기한 맛집 조회
SELECT
	    b.restaurant_bookmark_code 			AS '즐겨찾기 고유코드'
	  , c.restaurant_name 						AS '식당이름'
  FROM member a
  JOIN restaurant_bookmark b ON a.user_code = b.user_code
  JOIN restaurant c ON b.restaurant_code = c.restaurant_code
 WHERE a.user_code = 1  			-- 로그인한 사용자의pk를 불러온다
   AND role_code = 1					-- 사용자(회원)만 조회할 수 있다.
 ORDER BY registration_date DESC	-- 가게 등록일 최신순 조회
 LIMIT 10 OFFSET 0; 		