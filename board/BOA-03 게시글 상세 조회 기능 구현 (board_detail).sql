-- 게시글 상세 페이지 : 게시글 제목, 내용, 등록일(YYYY-MM-DD), 조회수, 작성자를 보여준다.

SELECT m.NICK_NAME  -- 작성자
	 , b.BOARD_TITLE -- 제목
	 , B.BOARD_CONTENT  -- 내용
	 , b.BOARD_VIEWS    -- 조회수
	 , DATE_FORMAT(B.BOARD_CREATED_AT , '%Y년%m월%d일% %T') AS board_create_at -- 등록일
  FROM BOARD B
  JOIN MEMBER M using(USER_CODE)
 WHERE B.BOARD_CODE = 10;