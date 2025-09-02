
USE lunchtribedb;

-- RES-09 : 사용자는 즐겨찾기에 있는 가게를 삭제한다.
DELETE FROM restaurant_bookmark
WHERE user_code = 1 AND restaurant_code = 3;

