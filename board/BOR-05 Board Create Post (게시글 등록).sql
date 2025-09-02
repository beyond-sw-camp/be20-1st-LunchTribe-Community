-- BOR-05 게시글 등록
-- 사용자, 관리자는 제목 및 내용 입력 후에 게시판에 게시글을 등록한다.

INSERT INTO board
(
    	 user_code           -- 작성자고유식별자
	  , board_title			-- 제목 
	  , board_content			-- 내용
-- 	  , board_views			-- 조회수 default 값 0
	  , board_created_at		-- 게시글 작성일
	  , board_updated_at		-- 게시글 수정일
-- 	  , is_delete				-- 소프트삭제상태 default 값 'N' : 존재
)
VALUES
(
    1,
    '아 정말 하기 싫다~',
    '오늘은 쿼리짜는 날~',
--     0,                           
    NOW(),
    NOW()                       
--     'N'
);

