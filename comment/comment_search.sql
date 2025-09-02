-- MEM-24 사용자는 본인이 작성한 게시글의 댓글 내역을 조회한다.


-- 사용자(회원)만 게시글의 댓글 조회 가능
SELECT
	    c.comments_code								AS '댓글 코드'	
 	  , a.user_id										AS '유저 아이디'
 	  , a.nick_name									AS ' 닉네임'
	  , b.board_title									AS '게시판 제목'		
	  , c.comments_content	 						AS '댓글 내용'
  FROM member a
  JOIN board b ON a.user_code = b.user_code
  JOIN comments c ON 	b.board_code = c.board_code
 WHERE a.user_code = 2								-- 로그인 과정에서 주고받은 사용자 고유pk입력
   AND role_code = 1	  								-- 사용자(회원)만 조회할 수 있다.								
   AND c.is_delete = 'N'						
 ORDER BY c.comments_created_at DESC			-- 게시글 댓글 최신순으로 정렬
 LIMIT 10 OFFSET 0;									-- 페이지당 10개씩 조회


-- 게시글이 너무 많아 페이지가 생길 때 다음 버튼을 누를 경우 작동하는 쿼리문
SELECT
	    c.comments_code								AS '댓글 코드'	
 	  , a.user_id										AS '유저 아이디'
 	  , a.nick_name									AS ' 닉네임'
	  , b.board_title									AS '게시판 제목'		
	  , c.comments_content	 						AS '댓글 내용'
  FROM member a
  JOIN board b ON a.user_code = b.user_code
  JOIN comments c ON 	b.board_code = c.board_code
 WHERE a.user_code = 2								-- 로그인 과정에서 주고받은 사용자 고유pk입력
   AND role_code = 1	  								-- 사용자(회원)만 조회할 수 있다.								
   AND c.is_delete = 'N'						
 ORDER BY c.comments_created_at DESC			-- 게시글 댓글 최신순으로 정렬
 LIMIT 10 OFFSET 0+i;	