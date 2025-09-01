-- RES-20 [리뷰 목록] 사용자는 리뷰 목록을 조회

-- 게시판 목록 : 게시글은 게시글 번호, 작성자, 제목, 조회수, 등록순 날짜(YYYY-MM-DD) 항목을 최신순으로 나타낸다.
-- 한 페이지 당 10개 항목 보여주기 
 
SELECT ROW_NUMBER() OVER(ORDER BY r.review_code DESC) AS ROW_NUM   -- 리뷰 번호
	,m.NICK_NAME  -- 닉네임
	,res.restaurant_name  -- 가게 이름
	,r.comment  -- 코멘트
	,r.taste_score  -- 맛점수
	,r.cost_score -- price로 가야되는거 아닌지 명칭이
	,r.amount_score  -- 양점수
	,r.picture  -- 사진
	FROM review r
	JOIN member m USING(user_code)
	JOIN restaurant res USING(restaurant_code)
	WHERE r.IS_DELETE = 'N' AND r.user_code = 1  
	ORDER BY r.review_code DESC 
	LIMIT 10 OFFSET 0; -- 1페이지 10개 / 2페이지 10 ~ 20 /3페이지 ````
	
	