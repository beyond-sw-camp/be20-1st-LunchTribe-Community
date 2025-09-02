
USE lunchtribedb;

-- RES-25 : 관리자는 메뉴 카테고리를 수정한다.
UPDATE category
SET category_name = '면류'
WHERE category_code = 3;
