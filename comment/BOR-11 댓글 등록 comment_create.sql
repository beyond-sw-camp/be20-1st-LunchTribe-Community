-- BOR-11 댓글 등록 comment_create
-- 사용자, 관리자는 게시글에 댓글을 작성한다.

INSERT INTO comments
(
    	 comments_code,          -- 댓글 고유 식별자
	  user_code					-- 유저 고유 식별자 			
	  , board_code					-- 게시판 고유 식별자
	  , recomments_code			-- 댓글 고유 식별자
	  , comments_content			-- 댓글 내용
	  , comments_created_at		-- 댓글 등록일
	  , comment_updated_at		-- 댓글 수정일
	  , is_delete					-- 소프트삭제상태 default 값 'N' : 존재
)
VALUES
(
	21,									-- 고유 식별자라 존재하지 않아도 된다.
	1
	, 1
	, null
	, '할 일 이 너 무 많 아'
	, NOW()
	, NOW()
	, 'N'
);