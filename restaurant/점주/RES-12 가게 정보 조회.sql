
USE lunchtribedb;

-- RES-12 : 점주는 등록한 가게를 조회한다.
SELECT 
    r.restaurant_code,
    r.restaurant_name,
    r.phone,
    r.registration_date,
    r.biz_number,
    r.is_hot
FROM restaurant r
WHERE r.user_code = 2; -- 예: user_code = 2 점주

