-- RES-16 [메뉴추가] 점주는 등록한 가게의 메뉴를 추가한다

-- 점주가 자신이 등록한 가게의 메뉴를 등록하는 기능입니다

INSERT
  INTO menu
VALUES
(
NULL,
restaurant_code,
category_code,
'menu_name',
10000
)