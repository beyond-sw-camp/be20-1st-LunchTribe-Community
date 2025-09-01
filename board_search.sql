-- MEM-21	사용자는 본인이 작성한 게시글 내역을 조회한다.



-- 사용자는 본인의 코드를 입력하여 본인이 작성한 게시글 내역을 조회할 수있다.

SELECT
       a.nick_name  		   	AS '닉네임'
     , a.user_id	  		   	AS	'아이디'
     , b.board_code 		   	AS '게시판고유식별자'
     , b.board_content	  	   AS '게시판내용'
     , b.board_title 	   	AS '게시판제목'
     , b.board_created_at		AS '작성일' 			
  FROM member a
  JOIN board b ON a.user_code = b.user_code
 WHERE a.user_code = 3							-- 로그인한 사용자의pk를 불러온다
   AND b.is_delete = 'N'
 ORDER BY b.board_created_at DESC			-- 게시판 작성일 최신순으로 조회
 LIMIT 10 OFFSET 0 ;								-- 페이지당 10개씩 보여준다
 
 
   