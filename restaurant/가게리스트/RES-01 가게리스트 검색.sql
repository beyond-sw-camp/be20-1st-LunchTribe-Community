

USE lunchtribedb;

-- RES-01 : 사용자는 검색창의 가게이름을 기준으로 특정 가게를 검색한다.
-- 가게를 검색했을 때 조회되어야할 컬럼 항목들이 뭔가 ?
SELECT restaurant_code,restaurant_name      
from restaurant
where restaurant_name = '모스키친'; 
