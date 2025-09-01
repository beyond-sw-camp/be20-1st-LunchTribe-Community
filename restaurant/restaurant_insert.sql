-- Developer : Sunghyun, Kim
-- Date : 2025. 08. 31 
-- Feature : 가게 관련 더미데이터 생성SQL 쿼리문 
-- Version : v1.0


USE lunchtribedb;

-- 식당 테이블 생성 (테스트용)
/*
DROP TABLE IF EXISTS restaurant;

CREATE TABLE IF NOT EXISTS restaurant (
    `restaurant_code` INT NOT NULL AUTO_INCREMENT,
    `user_code` INT NOT NULL,
    `restaurant_name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `registration_date` DATE NOT NULL,
    `biz_number` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`restaurant_code`)
);
*/
-- 데이터 삽입 : 가게 테이블
INSERT INTO restaurant
VALUES 
(1, 1, '모스키친', '050713073529','2025-01-20','1'),
(2, 2, '기계우동', '028219397','2025-02-25','2'),
(3, 3, '고향엄마손생바지락칼국수', '0232800605','2025-03-10','3'),
(4, 4, '싸다김밥', '050713268828','2025-08-15','4'),
(5, 5, '큰맘할매순대국', '028225151','2023-05-05','5'),
(6, 6, '동화장', '028213322','2020-04-20','6'),
(7, 7, '스미비부타동', '050714211829','2022-06-20','7');

/*
-- 리뷰 테이블 생성 (테스트용)
DROP TABLE IF EXISTS review;
CREATE TABLE IF NOT EXISTS review (
	`review_code`	INT	NOT NULL	COMMENT '리뷰고유의식별자',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`menu_code`	INT	NOT NULL	COMMENT '메뉴고유의식별자',
	`taste_score`	INT	NOT NULL	DEFAULT 0	COMMENT '맛점수',
	`cost_score`	INT	NOT NULL	DEFAULT 0	COMMENT '가격점수',
	`amount_score`	INT	NOT NULL	DEFAULT 0	COMMENT '양점수',
	`comment`	VARCHAR(300)	NULL	DEFAULT NULL	COMMENT '리뷰의 상세코멘트',
	`picture`	VARCHAR(500)	NULL	COMMENT 'URL 형식으로 불러옴',
	`is_delete`	ENUM('Y', 'N')	NOT NULL	DEFAULT 'N'	COMMENT 'Y: 삭제, N: 존재'
);
*/

-- 데이터 삽입 : 리뷰 테이블
INSERT INTO review 
(review_code, restaurant_code, user_code, menu_code, taste_score, cost_score, amount_score, comment, picture, is_delete)
VALUES
(1, 1, 1, 1001, 9, 8, 10, '맛이 정말 좋아요!', 'http://example.com/pic1.jpg', 'N'),
(2, 1, 2, 1002, 7, 6, 8, '가격대비 괜찮음', 'http://example.com/pic2.jpg', 'N'),
(3, 1, 3, 1003, 5, 7, 6, '보통 수준', NULL, 'N'),
(4, 1, 4, 1004, 3, 5, 4, '다시 가고 싶진 않음', NULL, 'N'),
(5, 1, 5, 1005, 10, 9, 8, '가성비 최고!', 'http://example.com/pic5.jpg', 'N'),
(6, 2, 6, 1006, 8, 8, 7, '추천합니다', NULL, 'N'),
(7, 2, 7, 1007, 6, 4, 5, '맛은 평범하고 양이 적음', 'http://example.com/pic7.jpg', 'N'),
(8, 2, 8, 1008, 9, 7, 9, '친구들이랑 가기 좋아요', 'http://example.com/pic8.jpg', 'N'),
(9, 2, 9, 1009, 8, 10, 7, '양 많고 만족스러움', NULL, 'N'),
(10, 3, 10, 1010, 5, 6, 5, '무난무난', NULL, 'N'),
(11, 3, 11, 1011, 2, 3, 4, '전체적으로 별로였음', 'http://example.com/pic11.jpg', 'Y'),
(12, 3, 12, 1012, 10, 10, 10, '최고의 식사 경험', 'http://example.com/pic12.jpg', 'N'),
(13, 4, 13, 1013, 7, 6, 5, '맛있지만 양은 아쉬움', NULL, 'N'),
(14, 4, 14, 1014, 6, 8, 6, '가격은 괜찮음', 'http://example.com/pic14.jpg', 'N'),
(15, 4, 15, 1015, 10, 9, 10, '대만족! 또 올 예정', 'http://example.com/pic15.jpg', 'N'),
(16, 5, 16, 1016, 8, 7, 8, '서비스도 좋아요', NULL, 'N'),
(17, 5, 17, 1017, 3, 5, 3, '음식이 늦게 나왔음', 'http://example.com/pic17.jpg', 'N'),
(18, 6, 18, 1018, 4, 4, 5, '재방문은 글쎄...', NULL, 'N'),
(19, 6, 19, 1019, 9, 8, 9, '맛, 양, 가격 모두 굿', 'http://example.com/pic19.jpg', 'N'),
(20, 7, 20, 1020, 7, 9, 8, '가격 대비 훌륭', 'http://example.com/pic20.jpg', 'N');

-- 데이터 삽입 : 가게 좋아요
INSERT INTO restaurant_likes 
(restaurant_likes_code, user_code, restaurant_code)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 4),
(11, 11, 4),
(12, 12, 5),
(13, 13, 5),
(14, 14, 6),
(15, 15, 6),
(16, 16, 6),
(17, 17, 7),
(18, 18, 7),
(19, 1, 7),
(20, 2, 5);

