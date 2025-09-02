
USE lunchtribedb;

-- RES-15 : 점주는 자신의 가게 정보를 삭제한다.
-- restaurant_code = 1 점주 자신이 등록한 가게 삭제
DELETE FROM restaurant
WHERE user_code = 1;
