
USE lunchtribedb;

-- RES-05 : 사용자는 가게리스트 목록을 조회할 수 있다.

SELECT ROW_NUMBER() OVER(ORDER BY restaurant_code DESC) AS ROW_NUM -- 가게 번호(최근등록순)
	,res.restaurant_code -- 레스토랑 코드
	,mem.user_name  -- 유저 이름
	,res.restaurant_name  -- 가게 이름
	,res.phone -- 전화번호
	,res.registration_date  -- 등록날짜
	FROM restaurant res
	JOIN member mem USING(user_code)
	WHERE restaurant_code = 1
	ORDER BY restaurant_code DESC
	LIMIT 10 OFFSET 0;
	
