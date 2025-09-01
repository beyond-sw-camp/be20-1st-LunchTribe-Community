-- BOR-10 : 게시글 삭제 내역 조회
-- 관리자가 사용자들이 게시글을 삭제한 내역 조회할 수 있다.


SELECT ROW_NUMBER() OVER(ORDER BY B.BOARD_CODE DESC) AS ROW_NUM    -- 번호
	 , m.NICK_NAME     -- 작성자 닉네임
	 , b.BOARD_TITLE   -- 제목
     , b.BOARD_VIEWS    -- 조회수
     , B.IS_DELETE 	-- 삭제 여부
     , DATE_FORMAT(B.BOARD_CREATED_AT , '%Y년%m월%d일% %T') AS board_create_at    -- 등록일
  FROM BOARD B
  JOIN MEMBER M USING(USER_CODE)
 WHERE B.IS_DELETE = 'Y'
 ORDER BY B.BOARD_CODE DESC
 LIMIT 10 OFFSET 0;








 -- LIMIT 10 OFFSET 0;

