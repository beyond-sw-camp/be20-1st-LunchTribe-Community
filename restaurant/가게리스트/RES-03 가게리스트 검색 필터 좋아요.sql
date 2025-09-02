
USE lunchtribedb;

-- RES-03 : 사용자는 좋아요 순으로 가게 목록을 보여준다.
SELECT
	r.restaurant_code,
	r.restaurant_name,
	count(rl.restaurant_likes_code) AS like_count
FROM restaurant r
LEFT JOIN restaurant_likes rl ON r.restaurant_code = rl.restaurant_code
GROUP BY r.restaurant_code , r.restaurant_name 
ORDER BY COUNT(rl.restaurant_likes_code) DESC, r.restaurant_name ASC;
