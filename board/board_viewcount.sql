-- BOR-09 조히수

-- update문 작성 전 select문으로 데이터 확인
--select board_code	-- 게시글
--	 , board_views 	-- 조회수
--  from board b
-- where b.board_code = 3
-- 결과 : 21

update board
   set board_views = board_views  + 1
 where board_code = 3;

-- 렬과 : 22