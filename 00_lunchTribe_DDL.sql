
-- 1. root 계정으로 heid SQL(혹은 dBeaver) 에 먼저 연결하세용
-- 데이터베이스 만들기
CREATE DATABASE lunchtribedb;

-- 계정 생성
CREATE USER 'lunchtribeuser'@'%' IDENTIFIED BY 'lunchtribeuser';

-- 권한 부여
GRANT ALL PRIVILEGES ON lunchtribedb.* TO 'lunchtribeuser'@'%';

-- 2. lunchtribeuser 계정으로 heid SQL(혹은 dBeaver) 에 연결하세용
-- 테이블 만들기 
CREATE TABLE IF NOT EXISTS `member` (
    `user_code` INT NOT NULL AUTO_INCREMENT COMMENT 'member 내에서 쓸 숫자 고유값',
    `student_code` INT NULL COMMENT '학원에서 주는대로 입력',
    `role_code` INT NOT NULL DEFAULT 1 COMMENT 'ex)학생1,점주2,관리자3',
    `user_id` VARCHAR(50) NOT NULL COMMENT 'ID',
    `user_name` VARCHAR(50) NOT NULL COMMENT '이름',
    `user_pw` VARCHAR(100) NOT NULL COMMENT '비밀번호',
    `user_phone` VARCHAR(20) NOT NULL COMMENT '전화번호',
    `nick_name` VARCHAR(50) NOT NULL COMMENT '커뮤니티닉네임',
    `gender` VARCHAR(10) NULL COMMENT '성별',
    `age` INT NULL COMMENT '나이',
    `status` ENUM('Y','N') DEFAULT 'Y' COMMENT "'Y': 존재 'N': 삭제",
    PRIMARY KEY (`user_code`)
);

CREATE TABLE IF NOT EXISTS `student` (
    `student_code` INT NOT NULL AUTO_INCREMENT COMMENT '학원에서 주는대로 입력',
    `student_name` VARCHAR(50) NOT NULL COMMENT '이름',
    `student_phone` VARCHAR(20) NOT NULL COMMENT '전화번호',
    `training_start` DATETIME NOT NULL COMMENT '기수 훈련시작날짜',
    `training_end` DATETIME NOT NULL COMMENT '기수 훈련종료날짜',
    `student_term` VARCHAR(20) NOT NULL COMMENT 'ex)20기',
    PRIMARY KEY (`student_code`)
);

CREATE TABLE IF NOT EXISTS `notification_history` (
    `notification_history_id` INT NOT NULL AUTO_INCREMENT COMMENT '알림내역고유식별자PK',
    `notification_send_id2` CHAR(3) NOT NULL COMMENT 'J1, J2, J3 방식',
    `user_code` INT NULL COMMENT 'member 내에서 쓸 숫자 고유값',
    `notification_num` INT NULL COMMENT '가게,댓글,게시판 PK',
    `notification_created_at` DATETIME NOT NULL COMMENT '발송당시 날짜 기록',
    PRIMARY KEY (`notification_history_id`)
);

CREATE TABLE IF NOT EXISTS `restaurant_bookmark_code` (
    `bookmark_code` INT NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
    `user_code2` INT NOT NULL COMMENT 'member 내에서 쓸 숫자 고유값',
    `restaurant_code2` INT NOT NULL COMMENT '가게고유의식별자',
    PRIMARY KEY (`bookmark_code`)
);

CREATE TABLE IF NOT EXISTS `board_bookmark` (
    `board_bookmark_code` INT NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
    `user_code2` INT NOT NULL COMMENT '즐겨찾기에 저장할 사용자',
    `board_code` INT NOT NULL COMMENT '게시글 코드',
    PRIMARY KEY (`board_bookmark_code`)
);

CREATE TABLE IF NOT EXISTS `complaint` (
    `complaint_code` INT NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
    `user_code` INT NOT NULL COMMENT '신고한 사용자',
    `common_code` VARCHAR(4) NOT NULL COMMENT '공통타입코드',
    `black_code` INT NOT NULL COMMENT '신고당한 사용자',
    `complaint_num` INT NULL COMMENT '게시판, 댓글 고유 식별자',
    PRIMARY KEY (`complaint_code`)
);

CREATE TABLE IF NOT EXISTS `menu` (
    `menu_code` INT NOT NULL AUTO_INCREMENT COMMENT '메뉴고유의식별자',
    `restaurant_code` INT NOT NULL COMMENT '가게고유의식별자',
    `Category_code` INT NOT NULL COMMENT '카테고리코드',
    `menu_name` VARCHAR(100) NOT NULL COMMENT '메뉴이름',
    `menu_price` INT NOT NULL COMMENT '메뉴가격',
    PRIMARY KEY (`menu_code`)
);

CREATE TABLE IF NOT EXISTS `role` (
    `role_code` INT NOT NULL COMMENT '1=학생,2=점주,3=관리자',
    `role_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`role_code`)
);

CREATE TABLE IF NOT EXISTS `common_code` (
    `common_code` VARCHAR(4) NOT NULL COMMENT '공통타입코드',
    `common_name` VARCHAR(50) NOT NULL COMMENT '1:회원 2:가게 3:게시글 4:댓글 5:게시판',
    PRIMARY KEY (`common_code`)
);

CREATE TABLE IF NOT EXISTS `comment_likes` (
    `comment_likes_code` INT NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
    `comments_code` INT NOT NULL,
    `user_code` INT NOT NULL,
    PRIMARY KEY (`comment_likes_code`)
);

CREATE TABLE IF NOT EXISTS `notification_send` (
    `notification_send_id` CHAR(3) NOT NULL COMMENT 'J1, J2, J3 방식',
    `common_code` VARCHAR(4) NOT NULL,
    `notification_content` VARCHAR(200) NOT NULL,
    `notification_type` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`notification_send_id`)
);

CREATE TABLE IF NOT EXISTS `restaurant_likes` (
    `restaurant_likes_code` INT NOT NULL AUTO_INCREMENT COMMENT '고유번호(PK)',
    `user_code` INT NOT NULL,
    `restaurant_code` INT NOT NULL,
    PRIMARY KEY (`restaurant_likes_code`)
);

CREATE TABLE IF NOT EXISTS `review` (
    `review_code` INT NOT NULL AUTO_INCREMENT COMMENT '리뷰고유의식별자',
    `restaurant_code2` INT NOT NULL,
    `user_code` INT NOT NULL,
    `menu_code` INT NOT NULL,
    `taste_score` INT NOT NULL DEFAULT 0,
    `cost_score` INT NOT NULL DEFAULT 0,
    `amount_score` INT NOT NULL DEFAULT 0,
    `comment` VARCHAR(500) DEFAULT NULL,
    `picture` VARCHAR(255) DEFAULT NULL,
    `is_delete` ENUM('Y','N') NOT NULL DEFAULT 'N',
    PRIMARY KEY (`review_code`)
);

CREATE TABLE IF NOT EXISTS `category` (
    `Category_code` INT NOT NULL,
    `Category_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`Category_code`)
);

CREATE TABLE IF NOT EXISTS `comments` (
    `comments_code` INT NOT NULL AUTO_INCREMENT,
    `user_code` INT NOT NULL,
    `board_code` INT NOT NULL,
    `recomments_code` INT NULL,
    `comments_content` VARCHAR(500) NOT NULL,
    `comments_created_at` DATETIME NOT NULL,
    `comment_updated_at` DATETIME NOT NULL,
    `is_delete` ENUM('Y','N') NOT NULL DEFAULT 'N',
    PRIMARY KEY (`comments_code`)
);

CREATE TABLE IF NOT EXISTS `notification_status` (
    `notification_status_id` INT NOT NULL AUTO_INCREMENT,
    `user_code` INT NOT NULL,
    `common_code` VARCHAR(4) NOT NULL,
    `notification_received` ENUM('Y','N') NOT NULL DEFAULT 'Y',
    PRIMARY KEY (`notification_status_id`)
);

CREATE TABLE IF NOT EXISTS `board` (
    `board_code` INT NOT NULL AUTO_INCREMENT,
    `user_code` INT NOT NULL,
    `board_title` VARCHAR(200) NOT NULL,
    `board_content` TEXT NOT NULL,
    `board_views` INT NOT NULL,
    `board_created_at` DATETIME NOT NULL,
    `board_updated_at` DATETIME NOT NULL,
    `is_delete` ENUM('Y','N') NOT NULL DEFAULT 'N',
    PRIMARY KEY (`board_code`)
);

CREATE TABLE IF NOT EXISTS `restaurant` (
    `restaurant_code` INT NOT NULL AUTO_INCREMENT,
    `user_code` INT NOT NULL,
    `restaurant_name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `registration_date` DATETIME NOT NULL,
    `biz_number` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`restaurant_code`)
);
