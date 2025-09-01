-- Developer : Sunghyun, Kim
-- Date : 2025. 08. 31 
-- Feature : 가게 관련 요구사항 기능구현 SQL 쿼리문 
-- Version : v1.0

USE lunchtribedb;

-- 1. RES * : 가게
-- RES-01 : 사용자는 검색창의 가게이름을 기준으로 특정 가게를 검색한다.
-- 가게를 검색했을 때 조회되어야할 컬럼 항목들이 뭔가 ?
select restaurant_code, restaurant_name      
from restaurant
where restaurant_name = '모스키친'; 

-- RES-02 : 사용자는 가격이 가성비 순으로 가게 목록을 보여준다.
SELECT 
    rv.restaurant_code,
    res.restaurant_name,
    ROUND(AVG(rv.taste_score + rv.cost_score + rv.amount_score) / 3, 1) AS avg_total_score,
    COUNT(*) AS review_count
FROM review rv
JOIN restaurant res ON rv.restaurant_code = res.restaurant_code
GROUP BY rv.restaurant_code, res.restaurant_name
ORDER BY avg_total_score DESC;

-- RES-03 : 사용자는 가격이 좋아요 순으로 가게 목록을 보여준다.
select 
	r.restaurant_code,
	r.restaurant_name,
	count(rl.restaurant_likes_code) AS like_count
FROM restaurant r
LEFT JOIN restaurant_likes rl ON r.restaurant_code = rl.restaurant_code
GROUP BY r.restaurant_code , r.restaurant_name 
ORDER BY COUNT(rl.restaurant_likes_code) DESC, r.restaurant_name ASC;

-- RES-04 : 신규 입점 시 상단에 일주일 동안 상단 노출한다. 
-- 신규입점의 기준이 뭐였죠 ??
SELECT 
	r.restaurant_code,
	r.restaurant_name,
	r.registration_date
from restaurant r 
where r.registration_date >= CURDATE() - INTERVAL 7 DAY;


-- RES-05 : 사용자는 가게리스트 목록을 조회할 수 있다.
select restaurant_code, restaurant_name
from restaurant;


-- RES-06 : 사용자는 가게리스트에서 하나의 리스트를 클릭 후 상세 조회를 할 수 있다.
select *
from restaurant r 
join member m ON r.user_code = m.user_code
left join menu me ON r.restaurant_code = me.restaurant_code
left join category c ON me.category_code = c.category_code
left join review rv ON r.restaurant_code = rv.restaurant_code AND rv.is_delete = 'N'
where r.restaurant_name = '모스키친';   -- 조회할 가게의 이름


-- RES 07 : 사용자들이 가게리스트들 중 좋아요 상위 3개 맛집 인증 마크 자동 등록
-- 자동 등록이기 때문에 트리거 기능 구현 필요
-- 맛집 인증 마크를 가게 테이블에 is_hot 이라는 별도컬럼으로 구현해야하지않을까 ?

DELIMITER $$
CREATE TRIGGER trg_restaurant_likes_insert
AFTER INSERT ON restaurant_likes
FOR EACH ROW
BEGIN
    -- 모든 가게 초기화
    UPDATE restaurant
    SET is_hot = 'N';

    -- 좋아요 상위 3개 가게 업데이트
    UPDATE restaurant r
    JOIN (
        SELECT r.restaurant_code
        FROM restaurant r
        LEFT JOIN restaurant_likes rl ON r.restaurant_code = rl.restaurant_code
        GROUP BY r.restaurant_code
        ORDER BY COUNT(rl.restaurant_likes_code) DESC
        LIMIT 3
    ) top3 ON r.restaurant_code = top3.restaurant_code
    SET r.is_hot = 'Y';
END$$

DELIMITER ;


-- RES-08 : 사용자는 가게를 즐겨찾기 추가한다.
INSERT INTO restaurant_bookmark (restaurant_bookmark_code, user_code, restaurant_code)
VALUES (1, 1, 3); 


-- RES-09 : 사용자는 즐겨찾기에 있는 가게를 삭제한다.
DELETE FROM restaurant_bookmark
WHERE user_code = 1 AND restaurant_code = 3;


-- RES-10 : 사용자는 가게 좋아요를 클릭한다.
INSERT INTO restaurant_likes (restaurant_likes_code, user_code, restaurant_code)
VALUES (1, 1, 3);  -- user_code=1이 restaurant_code=3에 좋아요


-- RES-11 : 사용자는 가게 좋아요를 취소한다.
DELETE FROM restaurant_likes
WHERE user_code = 1 AND restaurant_code = 3;  -- 회원고유식별자가 1 인 사람이 가게고유식별자 3인 가게의 좋아요를 취


-- RES-12 : 점주는 등록한 가게를 조회한다.
SELECT 
    r.restaurant_code,
    r.restaurant_name,
    r.phone,
    r.registration_date,
    r.biz_number,
    r.is_hot
FROM restaurant r
WHERE r.user_code = 2; -- 예: user_code = 2 점주


-- RES-13 : 점주는 등록한 가게를 수정한다.
-- 가게 정보가 수정되면 가게 테이블에 수정로그가 기록 되어야하지 않을까 ? ex. restaurant_updated_at 컬럼 추가?
UPDATE restaurant
SET 
    restaurant_name = '수정된 가게명',
    phone = '05012345678',
    biz_number = '9876543210'
WHERE user_code = 2 AND restaurant_code = 3;  -- 점주의 회원고유식별자가 2, 가게고유식별자가 3인 경


-- RES-14 : 점주는 회원가입을 하면서 1개의 사업자 등록과 가게 정보( 메뉴, 가격, 연락처, 이름), 카테고리를 선택하여 등록한다.
-- 메뉴 카테고리 값들 정해져야 할
-- 점주 회원가입
INSERT INTO member (user_code, role_code, user_id, user_name, user_pw, user_phone, nick_name, gender, age, status, user_created_at, user_updated_at)
VALUES (1, 2, 'owner01', '홍길동', 'pw1234', '01012345678', 'honggildong', 'M', 35, 'Y', NOW(), NOW());
-- 가게 등록 

INSERT INTO restaurant (restaurant_code, user_code, restaurant_name, phone, registration_date, biz_number)
VALUES (1, 1, '홍길동식당', '05012345678', NOW(), '1234567890');
-- 메뉴 등록
INSERT INTO menu (menu_code, restaurant_code, category_code, menu_name, menu_price)
VALUES 
(1, 1, 1, '김치찌개', 8000),
(2, 1, 2, '된장찌개', 7500);
-- 카테고리 등록
INSERT INTO category (category_code, category_name)
VALUES
(1, '찌개류'),
(1, '볶음류');


-- RES-15 : 점주는 자신의 가게 정보를 삭제한다.
-- restaurant_code = 1 점주 자신이 등록한 가게 삭제
DELETE FROM restaurant
WHERE restaurant_code = 1 AND user_code = 1;

-- RES-16 : 점주는 등록한 가게의 메뉴를 추가한다.
INSERT INTO menu (menu_code, restaurant_code, category_code, menu_name, menu_price)
VALUES (3, 1, 3, '제육볶음', 10000);

-- RES-17 : 점주는 등록한 가게의 메뉴를 수정한다.
UPDATE menu
SET menu_name = '김치찌개(특)',
    menu_price = 9000
WHERE menu_code = 1 AND restaurant_code = 1;

-- RES-18 : 점주는 등록한 가게의 메뉴를 목록 조회한다.
SELECT m.menu_code, m.menu_name, m.menu_price, c.category_name
FROM menu m
JOIN category c ON m.category_code = c.category_code
WHERE m.restaurant_code = 1;

-- RES-19 : 점주는 등록한 가게의 메뉴를 삭제한다.
DELETE FROM menu
WHERE menu_code = 2 AND restaurant_code = 1;

-- RES-20 : 사용자는 방문한 가게의 리뷰 목록을 조회한다.
SELECT 
    r.review_code,
    r.user_code,
    m.user_name,
    r.menu_code,
    r.taste_score,
    r.cost_score,
    r.amount_score,
    r.comment,
    r.picture,
    r.is_delete
FROM review r
JOIN member m ON r.user_code = m.user_code
WHERE r.restaurant_code = 1 AND r.is_delete = 'N';

-- RES-21 : 사용자는 방문한 가게를 리뷰, 별점을 작성할 수 있다. (사진 선택사항)
INSERT INTO review (review_code, restaurant_code, user_code, menu_code, taste_score, cost_score, amount_score, comment, picture, is_delete)
VALUES (21, 1, 1, 1, 8, 7, 9, '맛있어요!', 'http://example.com/pic21.jpg', 'N');


-- RES-22 : 사용자는 방문한 가게의 자신이 작성한 리뷰를 수정한다.
UPDATE review
SET taste_score = 9,
    cost_score = 8,
    amount_score = 10,
    comment = '정말 맛있어요!',
    picture = 'http://example.com/pic21_updated.jpg'
WHERE review_code = 21 AND user_code = 1;

-- RES-23 : 관리자는 방문한 리뷰를 삭제한다.
UPDATE review
SET is_delete = 'Y'
WHERE review_code = 21;


-- RES-24 : 관리자는 메뉴 카테고리를 추가한다.
INSERT INTO category (category_code, category_name)
VALUES (3, '국수류');

-- RES-25 : 관리자는 메뉴 카테고리를 수정한다.
UPDATE category
SET category_name = '면류'
WHERE category_code = 3;


-- RES-26 : 관리자는 메뉴 카테고리 목록을 조회한다.
SELECT category_code, category_name
FROM category;

-- RES-27 : 관리자는 메뉴 카테고리를 삭제한다.
DELETE FROM category
WHERE category_code = 'C03';