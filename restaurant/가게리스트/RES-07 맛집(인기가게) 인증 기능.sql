
USE lunchtribedb;

-- RES 07 : 사용자들이 가게리스트들 중 좋아요 상위 3개 맛집 인증 마크 자동 등록
-- 자동 등록이기 때문에 트리거 기능 구현 필요
-- 맛집 인증 마크를 가게 테이블에 is_hot 이라는 별도컬럼으로 구현해야하지않을까 ?

SELECT 
    r.restaurant_code, 
    r.restaurant_name, 
    COUNT(rl.restaurant_likes_code) as like_count   -- 좋아요 개수 를 의미함
FROM restaurant r
LEFT JOIN restaurant_likes rl ON r.restaurant_code = rl.restaurant_code
GROUP BY r.restaurant_code
ORDER BY like_count DESC
LIMIT 3;
