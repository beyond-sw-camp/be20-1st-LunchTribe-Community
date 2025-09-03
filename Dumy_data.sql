-- 테이블 삭제
DROP TABLE IF EXISTS member CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS notification_history CASCADE;
DROP TABLE IF EXISTS restaurant_bookmark CASCADE;
DROP TABLE IF EXISTS board_bookmark CASCADE;
DROP TABLE IF EXISTS complaint CASCADE;
DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS role CASCADE;
DROP TABLE IF EXISTS common CASCADE;
DROP TABLE IF EXISTS comment_likes CASCADE;
DROP TABLE IF EXISTS notification_send CASCADE;
DROP TABLE IF EXISTS restaurant_likes CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS notification_status CASCADE;
DROP TABLE IF EXISTS board CASCADE;
DROP TABLE IF EXISTS restaurant CASCADE;

-- 데이터 테이블 삽입

CREATE TABLE `member` (
	`user_code`	INT	NOT NULL AUTO_INCREMENT COMMENT 'member 내에서 쓸 숫자 고유값',
	`student_code`	INT	NULL	COMMENT '학원에서 주는대로 입력(혹은 들어온 순서대로일지?? 이부분 토의 필요)',
	`role_code`	INT	NOT NULL	COMMENT 'ex)학생1,점주2,관리자3',
	`user_id`	VARCHAR(30)	NOT NULL	COMMENT 'ID',
	`user_name`	VARCHAR(10)	NOT NULL	COMMENT '이름',
	`user_pw`	VARCHAR(30)	NOT NULL	COMMENT '비밀번호',
	`user_phone`	VARCHAR(11)	NOT NULL	COMMENT '전화번호',
	`nick_name`	VARCHAR(30)	NOT NULL	COMMENT '커뮤니티닉네임',
	`gender`	ENUM('M', 'W')	NULL	COMMENT '성별( M: 남자 / W:여자)',
	`age`	INT	NULL	COMMENT '나이',
	`status`	ENUM('Y', 'N')	NOT NULL DEFAULT 'N'	COMMENT 'Y: 활성화, N: 비활성화',
	`user_created_at`	DATETIME	NOT NULL	COMMENT '작성일',
	`user_updated_at`	DATETIME	NOT NULL	COMMENT '수정일',
	PRIMARY KEY (`user_code`)
);

CREATE TABLE `student` (
	`student_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '학원에서 주는대로 입력',
	`student_name`	VARCHAR(10)	NOT NULL	COMMENT '이름',
	`student_phone`	VARCHAR(11)	NOT NULL	COMMENT '전화번호',
	`training_start`	DATE	NOT NULL	COMMENT '기수 훈련시작날짜',
	`training_end`	DATE	NOT NULL	COMMENT '기수 훈련종료날짜',
	`student_term`	INT	NOT NULL,
	PRIMARY KEY (`student_code`)
);

CREATE TABLE `notification_history` (
	`notification_history_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '알림내역고유식별자PK',
	`notification_send_code`	VARCHAR(3)	NOT NULL	COMMENT 'J1, J2, J3 방식으로 설정',
	`user_code`	INT	NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`notification_num`	VARCHAR(9)	NULL	COMMENT '가게,댓글,게시판 PK',
	`notification_created_at`	DATETIME	NOT NULL	COMMENT '발송당시 날짜 기록',
	PRIMARY KEY (`notification_history_code`)
);

CREATE TABLE `restaurant_bookmark` (
	`restaurant_bookmark_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	PRIMARY KEY (`restaurant_bookmark_code`),
	UNIQUE (`user_code`, `restaurant_code`)
);

CREATE TABLE `board_bookmark` (
	`board_bookmark_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '즐겨찾기에 저장할 사용자',
	`board_code`	INT	NOT NULL	COMMENT '게시판 고유번호',
	PRIMARY KEY (`board_bookmark_code`),
	UNIQUE (`user_code`, `board_code`)
);

CREATE TABLE `complaint` (
	`complaint_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '신고한 사용자의 고유식별자',
	`common_code`	VARCHAR(3)	NOT NULL	COMMENT '공통타입코드',
	`black_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`complaint_num`	INT	NOT NULL	COMMENT '게시판, 댓글 고유 식별자',
	PRIMARY KEY (`complaint_code`)
);

CREATE TABLE `menu` (
	`menu_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '메뉴고유의식별자',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	`category_code`	INT	NOT NULL	COMMENT '카테고리코드',
	`menu_name`	VARCHAR(30)	NOT NULL	COMMENT '메뉴이름',
	`menu_price`	INT	NOT NULL	COMMENT '메뉴가격',
	PRIMARY KEY (`menu_code`)
);

CREATE TABLE `role` (
	`role_code`	INT	NOT NULL COMMENT 'ex)학생1,점주2,관리자3',
	`role_name`	VARCHAR(10)	NOT NULL	COMMENT '1 : 학생, 2 : 점주 , 3 : 관리자',
	PRIMARY KEY (`role_code`)
);

CREATE TABLE `common` (
	`common_code`	VARCHAR(3)	NOT NULL	COMMENT '공통타입코드',
	`common_name`	VARCHAR(10)	NOT NULL	COMMENT '1: 회원 2 : 가게, 3: 게시글, 4: 댓글 5.게시판',
	PRIMARY KEY (`common_code`)
);

CREATE TABLE `comment_likes` (
	`comment_likes_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`comments_code`	INT	NOT NULL	COMMENT '댓글고유번호',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	PRIMARY KEY (`comment_likes_code`),
	UNIQUE (`user_code`, `comments_code`)
);

CREATE TABLE `notification_send` (
	`notification_send_code`	VARCHAR(3)	NOT NULL	COMMENT 'J1, J2, J3',
	`common_code`	VARCHAR(3)	NOT NULL	COMMENT '공통타입코드',
	`notification_content`	VARCHAR(50)	NOT NULL	COMMENT '알림 내용',
	PRIMARY KEY (`notification_send_code`)
);

CREATE TABLE `restaurant_likes` (
	`restaurant_likes_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	PRIMARY KEY (`restaurant_likes_code`),
	UNIQUE (`user_code`, `restaurant_code`)
);

CREATE TABLE `review` (
	`review_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '리뷰고유의식별자',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`menu_code`	INT	NOT NULL	COMMENT '메뉴고유의식별자',
	`taste_score`	INT	NOT NULL DEFAULT 0	COMMENT '맛점수',
	`cost_score`	INT	NOT NULL DEFAULT 0	COMMENT '가격점수',
	`amount_score`	INT	NOT NULL DEFAULT 0	COMMENT '양점수',
	`comment`	VARCHAR(300)	NULL	DEFAULT NULL	COMMENT '리뷰 상세',
	`picture`	VARCHAR(500)	NULL	COMMENT 'URL 형식',
	`is_delete`	ENUM('Y', 'N')	NOT NULL DEFAULT 'N'	COMMENT 'Y: 삭제, N: 존재',
	PRIMARY KEY (`review_code`)
);

CREATE TABLE `category` (
	`category_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '카테고리코드',
	`category_name`	VARCHAR(10)	NOT NULL	COMMENT '음식의 카테고리',
	PRIMARY KEY (`category_code`)
);

CREATE TABLE `comments` (
	`comments_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '댓글 작성자',
	`board_code`	INT	NOT NULL	COMMENT '게시판 고유번호',
	`recomments_code`	INT	NULL	COMMENT '대댓글 참조',
	`comments_content`	VARCHAR(500)	NOT NULL	COMMENT '댓글 내용',
	`comments_created_at`	DATETIME	NOT NULL	COMMENT '작성일',
	`comment_updated_at`	DATETIME	NOT NULL	COMMENT '수정일',
	`is_delete`	ENUM('Y', 'N')	NOT NULL DEFAULT 'N'	COMMENT 'Y: 삭제, N: 존재',
	PRIMARY KEY (`comments_code`)
);

CREATE TABLE `notification_status` (
	`notification_status_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '알림상태고유식별자PK',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`common_code`	VARCHAR(3)	NOT NULL	COMMENT '공통타입코드',
	`notification_received`	ENUM('Y', 'N')	NOT NULL DEFAULT 'N'	COMMENT 'Y 받음 N안받음',
	PRIMARY KEY (`notification_status_code`)
);

CREATE TABLE `board` (
	`board_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '게시글 작성자',
	`board_title`	VARCHAR(200)	NOT NULL	COMMENT '제목',
	`board_content`	TEXT	NOT NULL	COMMENT '내용',
	`board_views`	INT	NOT NULL DEFAULT 0	COMMENT '조회수',
	`board_created_at`	DATETIME	NOT NULL	COMMENT '작성일',
	`board_updated_at`	DATETIME	NOT NULL	COMMENT '수정일',
	`is_delete`	ENUM('Y', 'N')	NOT NULL DEFAULT 'N'	COMMENT 'Y: 삭제, N: 존재',
	PRIMARY KEY (`board_code`)
);

CREATE TABLE `restaurant` (
	`restaurant_code`	INT	NOT NULL AUTO_INCREMENT COMMENT '가게고유의식별자',
	`user_code`	INT	NOT NULL	COMMENT '점주의 회원 식별자',
	`restaurant_name`	VARCHAR(50)	NOT NULL	COMMENT '가게이름',
	`phone`	VARCHAR(20)	NOT NULL	COMMENT '가게연락처',
	`registration_date`	DATETIME	NOT NULL	COMMENT '가게등록일자',
	`biz_number`	VARCHAR(10)	NOT NULL	COMMENT '사업자번호(숫자만)',
	PRIMARY KEY (`restaurant_code`)
);

-- 데이터 삽입

-- 회원

INSERT INTO `member`
(`user_code`, `student_code`, `role_code`, `user_id`, `user_name`, `user_pw`, `user_phone`, `nick_name`, `gender`, `age`, `status`, `user_created_at`, `user_updated_at`)
VALUES
(1, 1, 1, 'kimcs', '김철수', 'pw1001', '01012345601', '철수짱', 'M', 25, 'Y', NOW(), NOW()),
(2, 2, 1, 'leeyh', '이영희', 'pw1002', '01012345602', '영희짱', 'W', 23, 'Y', NOW(), NOW()),
(3, 3, 1, 'parkms', '박민수', 'pw1003', '01012345603', '민수킹', 'M', 26, 'Y', NOW(), NOW()),
(4, 4, 1, 'choije', '최지은', 'pw1004', '01012345604', '지은짱', 'W', 24, 'Y', NOW(), NOW()),
(5, 5, 1, 'jungws', '정우성', 'pw1005', '01012345605', '우성킹', 'M', 28, 'Y', NOW(), NOW()),
(6, 6, 1, 'hangae', '한가은', 'pw1006', '01012345606', '가은짱', 'W', 22, 'Y', NOW(), NOW()),
(7, 7, 1, 'ohsh', '오세훈', 'pw1007', '01012345607', '세훈킹', 'M', 27, 'Y', NOW(), NOW()),
(8, 8, 1, 'yujina', '유진아', 'pw1008', '01012345608', '진아짱', 'W', 23, 'Y', NOW(), NOW()),
(9, 9, 1, 'jangdg', '장동건', 'pw1009', '01012345609', '동건킹', 'M', 30, 'Y', NOW(), NOW()),
(10, 10, 1, 'seohj', '서현진', 'pw1010', '01012345610', '현진짱', 'W', 25, 'Y', NOW(), NOW()),
(11, NULL, 2, 'moskitchen', '모스', 'pw1234', '01012340001', '모스킹', 'M', 35, 'Y', NOW(), NOW()),
(12, NULL, 2, 'gigye_udon', '기계', 'pw1234', '01012340002', '우동왕', 'M', 40, 'Y', NOW(), NOW()),
(13, NULL, 2, 'homemade_kalguksu', '고향', 'pw1234', '01012340003', '칼국수짱', 'W', 38, 'Y', NOW(), NOW()),
(14, NULL, 2, 'ssada_kimbap', '싸다', 'pw1234', '01012340004', '김밥맨', 'M', 30, 'Y', NOW(), NOW()),
(15, NULL, 2, 'big_sundae', '큰맘', 'pw1234', '01012340005', '순대대장', 'W', 45, 'Y', NOW(), NOW()),
(16, NULL, 2, 'donghwa_jang', '동화', 'pw1234', '01012340006', '장인', 'M', 50, 'Y', NOW(), NOW()),
(17, NULL, 2, 'sumibi_butatong', '스미비', 'pw1234', '01012340007', '부타킹', 'M', 29, 'Y', NOW(), NOW());



-- 학생
INSERT INTO `student`
(`student_name`, `student_phone`, `training_start`, `training_end`, `student_term`)
VALUES
('김철수', '01012345601', '2025-01-01', '2025-07-01', 10),
('이영희', '01012345602', '2025-01-15', '2025-07-15', 11),
('박민수', '01012345603', '2025-02-01', '2025-08-01', 12),
('최지은', '01012345604', '2025-02-15', '2025-08-15', 13),
('정우성', '01012345605', '2025-03-01', '2025-09-01', 14),
('한가은', '01012345606', '2025-03-15', '2025-09-15', 15),
('오세훈', '01012345607', '2025-04-01', '2025-10-01', 16),
('유진아', '01012345608', '2025-04-15', '2025-10-15', 18),
('장동건', '01012345609', '2025-05-01', '2025-11-01', 19),
('서현진', '01012345610', '2025-05-15', '2025-11-15', 20);

-- 게시글
INSERT INTO board 
(board_code, user_code, board_title, board_content, board_views, board_created_at, board_updated_at, is_delete)
VALUES
(1, 1, '첫 번째 게시글', '안녕하세요! 첫 글입니다.', 12, '2025-09-01 10:00:00', '2025-09-01 10:00:00', 'N'),
(2, 2, 'SQL 공부중', '오늘은 CREATE TABLE을 배웠습니다.', 8, '2025-09-01 10:05:00', '2025-09-01 10:05:00', 'N'),
(3, 3, '점심 메뉴 추천', '점심 뭐 먹을까요?', 20, '2025-09-01 10:10:00', '2025-09-01 10:15:00', 'N'),
(4, 9, '공지사항', '이번 주 토요일에 서버 점검이 있습니다.', 55, '2025-09-01 11:00:00', '2025-09-01 11:30:00', 'N'),
(5, 4, '에러 발생 도움 요청', 'MySQL 쿼리 실행 중 오류가 나요.', 14, '2025-09-01 11:15:00', '2025-09-01 11:20:00', 'N'),
(6, 5, '좋은 책 추천', '최근 읽은 개발 서적 공유합니다.', 6, '2025-09-01 12:00:00', '2025-09-01 12:00:00', 'N'),
(7, 10, '여행 후기', '지난주에 다녀온 부산 여행 사진입니다.', 33, '2025-09-01 12:30:00', '2025-09-01 12:40:00', 'N'),
(8, 6, '잡담', '오늘 날씨가 좋네요.', 3, '2025-09-01 13:00:00', '2025-09-01 13:00:00', 'N'),
(9, 7, '공지: 새 기능 추가', '게시판 즐겨찾기 기능이 추가되었습니다.', 71, '2025-09-01 13:30:00', '2025-09-01 14:00:00', 'N'),
(10, 8, '삭제 테스트', '이 글은 삭제 처리 예정입니다.', 1, '2025-09-01 14:10:00', '2025-09-01 14:10:00', 'Y');


-- 게시글 북마크
INSERT INTO `board_bookmark` (`user_code`, `board_code`)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(7, 1),
(8, 2),
(9, 3),
(10, 4),
(10, 5);

-- 댓글 테이블
INSERT INTO `comments`
(`comments_code`, `user_code`, `board_code`, `recomments_code`, `comments_content`, `comments_created_at`, `comment_updated_at`, `is_delete`)
VALUES
(1, 1, 1, NULL, '김치찌개가 진하고 밥이랑 잘 어울렸어요.', '2025-08-01 10:00:00', '2025-08-01 10:00:00', 'N'),
(2, 2, 1, 1, '맞아요, 국물이 정말 시원했습니다.', '2025-08-01 10:05:00', '2025-08-01 10:05:00', 'N'),
(3, 3, 1, NULL, '가격 대비 양이 많아서 만족했어요.', '2025-08-02 09:10:00', '2025-08-02 09:10:00', 'N'),
(4, 4, 2, NULL, '사장님이 친절하시고 반찬도 깔끔했어요.', '2025-08-02 12:30:00', '2025-08-02 12:30:00', 'N'),
(5, 5, 2, 4, '저도 반찬이 정갈해서 좋았습니다.', '2025-08-02 12:35:00', '2025-08-02 12:35:00', 'N'),
(6, 6, 2, NULL, '고기가 두툼하고 불향이 살아있네요.', '2025-08-03 08:20:00', '2025-08-03 08:20:00', 'N'),
(7, 7, 3, NULL, '가성비 좋은 점심 메뉴 추천합니다.', '2025-08-03 14:00:00', '2025-08-03 14:00:00', 'N'),
(8, 8, 3, 7, '네, 특히 제육볶음이 맛있었어요.', '2025-08-03 14:05:00', '2025-08-03 14:05:00', 'N'),
(9, 9, 3, NULL, '분위기가 조용해서 식사하기 편했습니다.', '2025-08-04 11:40:00', '2025-08-04 11:40:00', 'N'),
(10, 10, 3, NULL, '테이블 간격이 넓어 쾌적했어요.', '2025-08-04 11:50:00', '2025-08-04 11:50:00', 'N'),
(11, 1, 4, NULL, '칼국수 면발이 쫄깃하고 국물이 시원했습니다.', '2025-08-05 09:15:00', '2025-08-05 09:15:00', 'N'),
(12, 2, 4, 11, '저는 조개향이 진하게 나서 좋았어요.', '2025-08-05 09:20:00', '2025-08-05 09:20:00', 'N'),
(13, 3, 4, NULL, '대기 시간이 길었지만 음식은 만족스러웠습니다.', '2025-08-05 10:00:00', '2025-08-05 10:00:00', 'N'),
(14, 4, 5, NULL, '포장했는데 양도 많고 따뜻했어요.', '2025-08-06 08:50:00', '2025-08-06 08:50:00', 'N'),
(15, 5, 5, NULL, '순댓국이 깊은 맛이 나서 추천합니다.', '2025-08-06 09:10:00', '2025-08-06 09:10:00', 'N'),
(16, 6, 5, 15, '순대가 전혀 안 퍼지고 식감이 좋더군요.', '2025-08-06 09:20:00', '2025-08-06 09:20:00', 'N'),
(17, 7, 5, NULL, '서비스로 주신 반찬이 신선했어요.', '2025-08-07 07:30:00', '2025-08-07 07:30:00', 'N'),
(18, 8, 2, NULL, '가격이 조금 비싸지만 맛은 확실합니다.', '2025-08-07 15:45:00', '2025-08-07 15:45:00', 'N'),
(19, 9, 1, NULL, '음식이 조금 짰지만 전반적으로 괜찮았어요.', '2025-08-08 13:00:00', '2025-08-08 13:00:00', 'Y'),
(20, 10, 4, NULL, '가게가 깔끔하고 다시 방문하고 싶습니다.', '2025-08-08 16:20:00', '2025-08-08 16:20:00', 'N');

-- 댓글 좋아요
INSERT INTO `comment_likes` (`comments_code`, `user_code`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);



-- 가게 테이블
INSERT INTO restaurant
VALUES 
(1, 11, '모스키친', '050713073529','2025-01-20','1'),
(2, 12, '기계우동', '028219397','2025-02-25','2'),
(3, 13, '고향엄마손생바지락칼국수', '0232800605','2025-03-10','3'),
(4, 14, '싸다김밥', '050713268828','2025-08-15','4'),
(5, 15, '큰맘할매순대국', '028225151','2023-05-05','5'),
(6, 16, '동화장', '028213322','2020-04-20','6'),
(7, 17, '스미비부타동', '050714211829','2022-06-20','7');

-- 메뉴 테이블
INSERT INTO menu (`restaurant_code`, `category_code`, `menu_name`, `menu_price`) VALUES
-- 모스키친 (restaurant_code 1, 양식/디저트/음료)
(1, 4, '스파게티', 12000),
(1, 4, '리조또', 15000),
(1, 6, '치즈케이크', 7000),
(1, 10, '아메리카노', 4000),

-- 기계우동 (restaurant_code 2, 일식)
(2, 3, '가케우동', 6000),
(2, 3, '카레우동', 7500),
(2, 3, '튀김우동', 8000),

-- 고향엄마손생바지락칼국수 (restaurant_code 3, 한식)
(3, 1, '바지락칼국수', 9000),
(3, 1, '김치칼국수', 8500),
(3, 1, '수육', 12000),

-- 싸다김밥 (restaurant_code 4, 분식)
(4, 5, '참치김밥', 3000),
(4, 5, '햄김밥', 2500),
(4, 5, '라면', 3500),
(4, 5, '떡볶이', 4000),

-- 큰맘할매순대국 (restaurant_code 5, 한식)
(5, 1, '순대국', 8000),
(5, 1, '돼지국밥', 9000),
(5, 1, '순대', 6000),

-- 동화장 (restaurant_code 6, 중식)
(6, 2, '짜장면', 7000),
(6, 2, '짬뽕', 8000),
(6, 2, '탕수육', 15000),

-- 스미비부타동 (restaurant_code 7, 일식)
(7, 3, '부타동', 9000),
(7, 3, '규동', 9500),
(7, 3, '오니기리', 4000);


-- 카테고리 코드
INSERT INTO `category` (`category_code`, `category_name`) VALUES
(1, '한식'),
(2, '중식'),
(3, '일식'),
(4, '양식'),
(5, '분식'),
(6, '디저트'),
(7, '패스트푸드'),
(8, '채식'),
(9, '야식'),
(10, '음료');

-- 가게 즐겨찾기
INSERT INTO `restaurant_bookmark` (`user_code`, `restaurant_code`)
VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 7),
(5, 2),
(6, 4),
(7, 6),
(8, 1),
(9, 3),
(10, 5);

-- 데이터 삽입 : 리뷰 테이블
INSERT INTO review (review_code, restaurant_code, user_code, menu_code, taste_score, cost_score, amount_score, comment, picture, is_delete) VALUES
(1, 1, 1, 1, 9, 8, 10, '맛이 정말 좋아요!', 'http://example.com/pic1.jpg', 'N'),
(2, 1, 2, 2, 7, 6, 8, '가격대비 괜찮음', 'http://example.com/pic2.jpg', 'N'),
(3, 1, 3, 3, 5, 7, 6, '보통 수준', NULL, 'N'),
(4, 1, 4, 4, 3, 5, 4, '다시 가고 싶진 않음', NULL, 'N'),
(5, 1, 5, 1, 10, 9, 8, '가성비 최고!', 'http://example.com/pic5.jpg', 'N'),
(6, 2, 6, 5, 8, 8, 7, '추천합니다', NULL, 'N'),
(7, 2, 7, 6, 6, 4, 5, '맛은 평범하고 양이 적음', 'http://example.com/pic7.jpg', 'N'),
(8, 2, 8, 7, 9, 7, 9, '친구들이랑 가기 좋아요', 'http://example.com/pic8.jpg', 'N'),
(9, 2, 9, 5, 8, 10, 7, '양 많고 만족스러움', NULL, 'N'),
(10, 3, 10, 8, 5, 6, 5, '무난무난', NULL, 'N'),
(11, 3, 1, 9, 2, 3, 4, '전체적으로 별로였음', 'http://example.com/pic11.jpg', 'Y'),
(12, 3, 2, 10, 10, 10, 10, '최고의 식사 경험', 'http://example.com/pic12.jpg', 'N'),
(13, 4, 3, 11, 7, 6, 5, '맛있지만 양은 아쉬움', NULL, 'N'),
(14, 4, 4, 12, 6, 8, 6, '가격은 괜찮음', 'http://example.com/pic14.jpg', 'N'),
(15, 4, 5, 13, 10, 9, 10, '대만족! 또 올 예정', 'http://example.com/pic15.jpg', 'N'),
(16, 5, 6, 15, 8, 7, 8, '서비스도 좋아요', NULL, 'N'),
(17, 5, 7, 16, 3, 5, 3, '음식이 늦게 나왔음', 'http://example.com/pic17.jpg', 'N'),
(18, 6, 8, 18, 4, 4, 5, '재방문은 글쎄...', NULL, 'N'),
(19, 6, 9, 19, 9, 8, 9, '맛, 양, 가격 모두 굿', 'http://example.com/pic19.jpg', 'N'),
(20, 7, 10, 21, 7, 9, 8, '가격 대비 훌륭', 'http://example.com/pic20.jpg', 'N');


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
(11, 1, 4),
(12, 2, 5),
(13, 3, 5),
(14, 4, 6),
(15, 5, 6),
(16, 6, 6),
(17, 7, 7),
(18, 8, 7),
(19, 9, 7),
(20, 10, 5);

-- common 테이블
insert into common 
values ('c01', '회원')
     , ('c02', '가게')
     , ('c03', '게시판')
     , ('c31', '게시글')
     , ('c32', '댓글');
     
     
     
-- 알림 발송 테이블
insert into notification_send 
values ('n01','c02', '따끈따끈 신규 입점, [가게명] 오픈!')
     , ('n02','c31', '작성하신 글에 댓글이 달렸습니다. 지금 확인해보세요.')
     , ('n03','c32', '좋아요 알림: 회원님의 댓글이 반응을 얻고 있습니다.');
     
-- 알림 상태
INSERT INTO notification_status (user_code, common_code, notification_received) VALUES
(1, 'c02', 'Y'),
(1, 'c31', 'N'),
(1, 'c32', 'N'),
(2, 'c02', 'N'),
(2, 'c31', 'Y'),
(2, 'c32', 'N'),
(3, 'c02', 'Y'),
(3, 'c31', 'Y'),
(3, 'c32', 'N'),
(4, 'c02', 'N'),
(4, 'c31', 'N'),
(4, 'c32', 'Y'),
(5, 'c02', 'Y'),
(5, 'c31', 'N'),
(5, 'c32', 'N'),
(6, 'c02', 'N'),
(6, 'c31', 'Y'),
(6, 'c32', 'Y'),
(7, 'c02', 'Y'),
(7, 'c31', 'N'),
(7, 'c32', 'N'),
(8, 'c02', 'N'),
(8, 'c31', 'Y'),
(8, 'c32', 'Y'),
(9, 'c02', 'Y'),
(9, 'c31', 'N'),
(9, 'c32', 'N'),
(10, 'c02', 'N'),
(10, 'c31', 'N'),
(10, 'c32', 'N');

-- 알림내역

INSERT INTO notification_history
(notification_send_code, user_code, notification_num, notification_created_at)
VALUES
('n01', NULL, '3', '2025-09-01 10:01:00'),
('n02', 5, '7', '2025-09-01 10:05:00'),
('n03', 2, '15', '2025-09-01 10:10:00'),
('n01', NULL, '1', '2025-09-01 10:15:00'),
('n02', 8, '3', '2025-09-01 10:20:00'),
('n03', 4, '19', '2025-09-01 10:25:00'),
('n01', NULL, '5', '2025-09-01 10:30:00'),
('n02', 1, '10', '2025-09-01 10:35:00'),
('n03', 7, '2', '2025-09-01 10:40:00'),
('n01', NULL, '7', '2025-09-01 10:45:00'),
('n02', 9, '1', '2025-09-01 10:50:00'),
('n03', 10, '8', '2025-09-01 10:55:00'),
('n01', NULL, '2', '2025-09-01 11:00:00'),
('n02', 3, '6', '2025-09-01 11:05:00'),
('n03', 1, '11', '2025-09-01 11:10:00'),
('n01', NULL, '6', '2025-09-01 11:15:00'),
('n02', 2, '9', '2025-09-01 11:20:00'),
('n03', 5, '20', '2025-09-01 11:25:00'),
('n01', NULL, '4', '2025-09-01 11:30:00'),
('n02', 7, '2', '2025-09-01 11:35:00'),
('n03', 6, '16', '2025-09-01 11:40:00'),
('n01', NULL, '3', '2025-09-01 11:45:00'),
('n02', 4, '8', '2025-09-01 11:50:00'),
('n03', 9, '5', '2025-09-01 11:55:00'),
('n01', NULL, '1', '2025-09-01 12:00:00'),
('n02', 10, '4', '2025-09-01 12:05:00'),
('n03', 3, '12', '2025-09-01 12:10:00'),
('n01', NULL, '5', '2025-09-01 12:15:00'),
('n02', 6, '10', '2025-09-01 12:20:00'),
('n03', 8, '7', '2025-09-01 12:25:00');

-- 신고

INSERT INTO complaint (user_code, common_code, black_code, complaint_num)
VALUES
(1, 'c31', 3, 7),
(2, 'c32', 5, 18),
(3, 'c31', 4, 2),
(4, 'c32', 1, 12),
(5, 'c31', 6, 9),
(6, 'c32', 2, 5),
(7, 'c31', 1, 10),
(1, 'c32', 4, 16),
(2, 'c31', 5, 1),
(3, 'c32', 7, 19),
(4, 'c31', 6, 3),
(5, 'c32', 2, 7),
(6, 'c31', 3, 8),
(7, 'c32', 1, 11),
(1, 'c31', 2, 6),
(2, 'c32', 3, 20),
(3, 'c31', 4, 4),
(4, 'c32', 5, 13),
(5, 'c31', 7, 5),
(6, 'c32', 1, 9);

-- role
INSERT 
  INTO role (role_code, role_name)
VALUES ( '1', '학생')
     , ('2', '점주')
     , ('3', '관리자');