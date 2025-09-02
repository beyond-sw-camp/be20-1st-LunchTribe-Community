
USE lunchtribedb;

-- RES-11 : 사용자는 가게 좋아요를 취소한다.
DELETE FROM restaurant_likes
WHERE user_code = 1 AND restaurant_code = 3;  -- 회원고유식별자가 1 인 사람이 가게고유식별자 3인 가게의 좋아요를 취
