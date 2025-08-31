-- DB나 계정 만든 후 TABLE 생성
CREATE TABLE `member` (
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`student_code`	INT	NULL	COMMENT '학원에서 주는대로 입력(혹은 들어온 순서대로일지?? 이부분 토의 필요)',
	`role_code`	INT	NOT NULL	DEFAULT 1	COMMENT 'ex)학생1,점주2,관리자3',
	`user_id`	VARCHAR(30)	NOT NULL	COMMENT 'ID',
	`user_name`	VARCHAR(10)	NOT NULL	COMMENT '이름',
	`user_pw`	VARCHAR(30)	NOT NULL	COMMENT '비밀번호',
	`user_phone`	VARCHAR(11)	NOT NULL	COMMENT '전화번호',
	`nick_name`	VARCHAR(30)	NOT NULL	COMMENT '커뮤니티닉네임',
	`gender`	ENUM('M', 'W')	NULL	COMMENT '성별( M: 남자 / W:여자)',
	`age`	INT	NULL	COMMENT '나이',
	`status`	ENUM('Y', 'N')	NOT NULL	DEFAULT 'N'	COMMENT 'Y: 활성화, N: 비활성화',
	`user_created_at`	DATETIME	NOT NULL	COMMENT '작성일',
	`user_updated_at`	DATETIME	NOT NULL	COMMENT '수정일'
);

CREATE TABLE `student` (
	`student_code`	INT	NOT NULL	COMMENT '학원에서 주는대로 입력(혹은 들어온 순서대로일지?? 이부분 토의 필요)',
	`student_name`	VARCHAR(10)	NOT NULL	COMMENT '이름',
	`student_phone`	VARCHAR(11)	NOT NULL	COMMENT '전화번호',
	`training_start`	DATE	NOT NULL	COMMENT '기수 훈련시작날짜',
	`training_end`	DATE	NOT NULL	COMMENT '기수 훈련종료날짜',
	`student_term`	INT	NOT NULL
);

CREATE TABLE `notification_history` (
	`notification_history_code`	INT	NOT NULL	COMMENT '알림내역고유식별자PK',
	`notification_send_code`	VARCHAR(3)	NOT NULL	COMMENT 'J1, J2, J3 방식으로 설정',
	`user_code`	INT	NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`notification_num`	VARCHAR(9)	NULL	COMMENT '가게,댓글,게시판 PK',
	`notification_created_at`	DATETIME	NOT NULL	COMMENT 'curdate등 발송당시 날짜 기록'
);

CREATE TABLE `restaurant_bookmark` (
	`restaurant_bookmark_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자'
);

CREATE TABLE `board_bookmark` (
	`board_bookmark_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '즐겨찾기에 저장할 사용자',
	`board_code`	INT	NOT NULL	COMMENT '고유번호(PK)'
);

CREATE TABLE `complaint` (
	`complaint_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '신고한 사용자의 고유식별자',
	`common_code`	CHAR(3)	NOT NULL	COMMENT '공통타입코드 고유번호(PK)',
	`black_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`complaint_num`	INT	NOT NULL	COMMENT '게시판, 댓글 고유 식별자'
);

CREATE TABLE `menu` (
	`menu_code`	INT	NOT NULL	COMMENT '메뉴고유의식별자',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	`category_code`	INT	NOT NULL	COMMENT '카테고리코드',
	`menu_name`	VARCHAR(30)	NOT NULL	COMMENT '메뉴이름',
	`menu_price`	INT	NOT NULL	COMMENT '메뉴가격'
);

CREATE TABLE `role` (
	`role_code`	INT	NOT NULL	DEFAULT 1	COMMENT 'ex)학생1,점주2,관리자3',
	`role_name`	VARCHAR(10)	NOT NULL	COMMENT '1 : 학생, 2 : 점주 , 3 : 관리자'
);

CREATE TABLE `common` (
	`common_code`	VARCHAR(3)	NOT NULL	COMMENT '공통타입코드 고유번호(PK)',
	`common_name`	VARCHAR(10)	NOT NULL	COMMENT '1: 회원 2 : 가게, 3: 게시글, 4: 댓글 5.게시판'
);

CREATE TABLE `comment_likes` (
	`comment_likes_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`comments_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값'
);

CREATE TABLE `notification_send` (
	`notification_send_code`	VARCHAR(3)	NOT NULL	COMMENT 'J1, J2, J3 방식으로 설정',
	`common_code`	VARCHAR(9)	NOT NULL	COMMENT '공통타입코드 고유번호(PK)',
	`notification_content`	VARCHAR(50)	NOT NULL	COMMENT '알림 나갈 내용'
);

CREATE TABLE `restaurant_likes` (
	`restaurant_likes_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자'
);

CREATE TABLE `review` (
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

CREATE TABLE `category` (
	`category_code`	VARCHAR(3)	NOT NULL	COMMENT '카테고리코드',
	`category_name`	VARCHAR(10)	NOT NULL	COMMENT '음식의 카테고리'
);

CREATE TABLE `comments` (
	`comments_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '댓글 작성자 식별',
	`board_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`recomments_code`	INT	NULL	COMMENT '대댓글이 댓글지목할 때 쓰는 값, 없으면 NULL',
	`comments_content`	VARCHAR(500)	NOT NULL	COMMENT '댓글 내용',
	`comments_created_at`	DATETIME	NOT NULL	COMMENT '작성일',
	`comment_updated_at`	DATETIME	NOT NULL	COMMENT '수정일',
	`is_delete`	ENUM('Y', 'N')	NOT NULL	DEFAULT 'N'	COMMENT 'Y: 삭제, N: 존재'
);

CREATE TABLE `notification_status` (
	`notification_status_code`	INT	NOT NULL	COMMENT '알림상태고유식별자PK',
	`user_code`	INT	NOT NULL	COMMENT 'member 내에서 쓸 숫자 고유값',
	`common_code`	VARCHAR(3)	NOT NULL	COMMENT '공통타입코드 고유번호(PK)',
	`notification_received`	ENUM('Y', 'N')	NOT NULL	DEFAULT 'N'	COMMENT '''Y'' 받음 ''N'' 안받음'
);

CREATE TABLE `board` (
	`board_code`	INT	NOT NULL	COMMENT '고유번호(PK)',
	`user_code`	INT	NOT NULL	COMMENT '게시글 작성자 식별',
	`board_title`	VARCHAR(200)	NOT NULL	COMMENT '제목',
	`board_content`	TEXT	NOT NULL	COMMENT '내용',
	`board_views`	INT	NOT NULL	DEFAULT 0	COMMENT '조회수',
	`board_created_at`	DATETIME	NOT NULL	COMMENT '작성일(reg_date)',
	`board_updated_at`	DATETIME	NOT NULL	COMMENT '수정일(mod_date)',
	`is_delete`	ENUM('Y', 'N')	NOT NULL	DEFAULT 'N'	COMMENT 'Y: 삭제, N: 존재'
);

CREATE TABLE `restaurant` (
	`restaurant_code`	INT	NOT NULL	COMMENT '가게고유의식별자',
	`user_code`	INT	NOT NULL	COMMENT '점주의 회원 식별자',
	`restaurant_name`	VARCHAR(50)	NOT NULL	COMMENT '가게이름',
	`phone`	VARCHAR(20)	NOT NULL	COMMENT '가게연락처',
	`registration_date`	DATETIME	NOT NULL	COMMENT '가게등록일자',
	`biz_number`	VARCHAR(10)	NOT NULL	COMMENT '사업자번호(숫자만)'
);
