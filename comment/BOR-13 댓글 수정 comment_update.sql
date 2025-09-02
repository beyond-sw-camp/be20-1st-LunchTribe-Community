-- BOR-13 댓글 수정 comment_update
-- 사용자, 관리자는 댓글을 수정한다.

UPDATE comments
	SET comments_content	  = '와 너무 힘들다'		-- 댓글 내용
	  , comment_updated_at = NOW()		-- 댓글 수정일
 WHERE comments_code = 21;

