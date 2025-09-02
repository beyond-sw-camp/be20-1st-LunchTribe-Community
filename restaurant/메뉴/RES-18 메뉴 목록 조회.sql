
USE lunchtribedb;

-- RES-18 : 점주는 등록한 가게의 메뉴를 목록 조회한다.
SELECT m.menu_code, m.menu_name, m.menu_price, c.category_name
FROM menu m
JOIN category c ON m.category_code = c.category_code
WHERE m.restaurant_code = 1;
