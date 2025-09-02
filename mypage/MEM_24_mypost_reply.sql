

-- 사용자(회원)만 게시글의 댓글 조회 가능
SELECT	
 	    d.user_id										AS '유저 아이디'
 	  , d.nick_name									AS '닉네임'
	  , b.board_title									AS '게시글 제목'		
	  , c.comments_content	 						AS '댓글 내용'
	  , CONCAT(
	  YEAR(c.comments_created_at),
	  '년',
	  MONTH(c.comments_created_at),
	  '월',
	  DAYOFMONTH(c.comments_created_at),
	  '일'
	  )													AS '댓글 작성일시'
  FROM board b
  JOIN member a ON a.user_code = b.user_code
  JOIN comments c ON b.board_code = c.board_code
  JOIN member d ON d.user_code = c.user_code
 WHERE b.user_code = 2								-- 로그인 과정에서 주고받은 사용자 고유pk입력								
   AND c.is_delete = 'N'						
 ORDER BY c.comments_created_at DESC			-- 게시글 댓글 최신순으로 정렬
 LIMIT 10 OFFSET 0/*+i 페이지수가 많을 경우 i라는 변수로 오프셋 조정*/;				      	-- 페이지당 10개씩 조회  
 																
