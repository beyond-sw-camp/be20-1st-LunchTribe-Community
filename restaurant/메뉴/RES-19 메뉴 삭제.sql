
USE lunchtribedb;

-- RES-19 : 점주는 등록한 가게의 메뉴를 삭제한다.
DELETE FROM menu
WHERE menu_code = 2 AND restaurant_code = 1;
