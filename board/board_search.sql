
-- 게시판 검색 : 닉네임 또는 게시판 제목에 키워드가 일치하는 게시판 목록 나온다.
-- 게시글은 게시글 번호, 작성자, 제목, 조회수, 등록일(YYYY-MM-DD) 항목을 최신순으로 나타낸다.
-- 한 페이지 당 10개 항목 보여주기

 SELECT ROW_NUMBER() OVER(ORDER BY B.BOARD_CODE DESC) AS ROW_NUM    -- 번호
	  , m.NICK_NAME     -- 작성자 닉네임
	  , b.BOARD_TITLE   -- 제목
	  , b.BOARD_VIEWS    -- 조회수
	  , DATE_FORMAT(B.BOARD_CREATED_AT , '%Y년%m월%d일% %T') AS board_create_at    -- 등록일
   from board b
   join member m using(user_code)
  where b.is_delete = 'N'
    and (b.board_title like '%테스트%' or m.nick_name like '%Hy%')
  ORDER BY B.BOARD_CODE DESC
  LIMIT 10 OFFSET 0; -- 첫 페이지 0 / 두번째 페이지 10 / 세번째 페이지 20

