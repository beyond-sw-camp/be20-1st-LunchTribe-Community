-- 게시판 목록 : 게시글은 게시글 번호, 작성자, 제목, 조회수, 등록순 날짜(YYYY-MM-DD) 항목을 최신순으로 나타낸다.
-- 한 페이지 당 10개 항목 보여주기

SELECT ROW_NUMBER() OVER(ORDER BY B.BOARD_CODE DESC) AS ROW_NUM     -- 번호
	 , m.NICK_NAME  -- 작성자
	 , b.BOARD_TITLE    -- 제목
	 , b.BOARD_VIEWS    -- 조회수
	 , DATE_FORMAT(B.BOARD_CREATED_AT , '%Y년%m월%d일% %T') AS board_create_at -- 등록일
  from board b
  join member m using(user_code)
 WHERE b.IS_DELETE = 'N'
 ORDER BY B.BOARD_CODE DESC
 LIMIT 10 OFFSET 0; -- 첫 페이지 0 / 두번째 페이지 10 / 세번째 페이지 20

