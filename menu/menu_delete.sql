-- RES-19 [메뉴 삭제] 점주는 본인가게의 메뉴를 삭제할수있다

DELETE FROM menu
WHERE restaurant_code = 1 
  AND menu_code IN (1, 2, 3); -- 여러가지 메뉴들을 삭제함