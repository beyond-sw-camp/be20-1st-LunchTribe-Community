-- BOR-07 : 게시글 삭제

-- update 전 board_code 7번의 데이터가 있는지 확인!
-- select *
--   from board b
--  where b.board_code = 7
--  limit 1;

-- soft delete 로 게시글 삭제
update board b
   set B.is_delete = 'Y'
 where board_code = 7;