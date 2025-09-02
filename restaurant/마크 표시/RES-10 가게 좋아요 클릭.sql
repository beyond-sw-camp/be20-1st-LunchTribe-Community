
USE lunchtribedb;

-- RES-10 : 사용자는 가게 좋아요를 클릭한다.
INSERT INTO restaurant_likes (restaurant_likes_code, user_code, restaurant_code)
VALUES (1, 1, 3);  -- user_code=1이 restaurant_code=3에 좋아요
