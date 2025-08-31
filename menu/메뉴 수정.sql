-- RES-17 [메뉴 수정] 점주는 가게의 메뉴를 수정한다.

-- 메뉴 코드 제외 나머지 항목을 수정함
UPDATE tbl_menu
   SET category_code = 1 -- 카테고리 코드
     , menu_name = '우동' -- 메뉴이름
     , restaurant_code = 1 -- 레스토랑 코드
     , menu_price =10000 -- 메뉴 가격
 WHERE menu_code = 1; -- 메뉴 코드
