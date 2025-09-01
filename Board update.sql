-- BOR-06 게시글 수정
-- 사용자, 관리자는 본인의 게시글에 한해 수정한다.

UPDATE board
	SET board_title = '와~ 너무 재밌다'		-- 게시글 제목 수정
	  , board_updated_at = NOW()				-- 게시글 수정 시 반드시 수정일 최신화
 WHERE board_code = 1; 							-- 수정해야하는 게시글 번호 입력
 
UPDATE board
	SET board_content = '와아아아아아아아' -- 게시글 내용 수정
	  , board_updated_at = NOW()				-- 게시글 수정 시 반드시 수정일 최신화
 WHERE board_code = 1; 							-- 수정해야하는 게시글 번호 입력
 
-- SELECT * FROM board; -- 변경 내용 확인