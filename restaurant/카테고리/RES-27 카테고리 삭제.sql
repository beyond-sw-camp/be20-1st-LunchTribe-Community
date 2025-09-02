
USE lunchtribedb;

-- RES-27 : 관리자는 메뉴 카테고리를 삭제한다.
DELETE FROM category
WHERE category_code = '3';