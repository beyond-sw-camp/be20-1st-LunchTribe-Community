-- MEM-24 사용자는 본인이 작성한 게시글의 댓글 내역을 조회한다.

SELECT
 		 a.user_id										AS '유저 아이디'
 	  , a.nick_name									AS '닉네임'
	  , b.board_title									AS '게시판 제목'
	  , c.comments_code								AS '댓글 코드'		
	  , c.comments_content	 						AS '댓글 내용'
  FROM member a
  JOIN board b ON a.user_code = b.user_code
  JOIN comments c ON 	b.board_code = c.board_code
 WHERE a.user_code = 2  								-- 로그인 과정에서 주고받은 사용자 고유pk입력								
   AND c.is_delete = 'N'						
 ORDER BY c.comments_created_at DESC			-- 게시글의 댓글 최신순으로 정렬
 LIMIT 10 OFFSET 0;									-- 페이지당 10개씩 조회
	