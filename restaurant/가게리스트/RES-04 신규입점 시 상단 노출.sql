
USE lunchtribedb;

-- RES-04 : 신규 입점 시 상단에 일주일 동안 상단 노출한다. 
SELECT 
	r.restaurant_code,
	r.restaurant_name,
	r.registration_date
from restaurant r 
where r.registration_date >= CURDATE() - INTERVAL 7 DAY;

