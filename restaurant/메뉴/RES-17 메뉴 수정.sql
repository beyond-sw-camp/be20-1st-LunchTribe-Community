
USE lunchtribedb;

-- RES-17 : 점주는 등록한 가게의 메뉴를 수정한다.
UPDATE menu
SET menu_name = '김치찌개(특)',
    menu_price = 9000
WHERE menu_code = 1 AND restaurant_code = 1;
