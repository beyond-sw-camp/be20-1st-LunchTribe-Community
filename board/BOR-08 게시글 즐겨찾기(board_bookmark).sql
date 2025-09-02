-- BOR-08 : 게시글 즐겨찾기

-- 게시물 즐겨찾기 즐겨찾기 있을 경우 DELETE, 없을 경우 INSERT
-- TRIGGER 쿼리 만들기
DELIMITER //

CREATE PROCEDURE TOGGLE_COMPLAIN_BOOKMARK(IN p_bookmark_code INT, IN p_user_code INT)
 BEGIN
    IF EXISTS ( --
       SELECT BOARD_BOOKMARK_CODE
            , USER_CODE
         FROM BOARD_BOOKMARK
        WHERE BOARD_BOOKMARK_CODE = p_bookmark_code
          AND USER_CODE = p_user_code
     )
  THEN
       DELETE FROM BOARD_BOOKMARK
        WHERE BOARD_BOOKMARK_CODE = p_bookmark_code
          AND USER_CODE = p_user_code;
  ELSE
       INSERT INTO BOARD_BOOKMARK (BOARD_BOOKMARK_CODE, USER_CODE)
       VALUES (p_bookmark_code, p_user_code);
   END IF;
END //

DELIMITER ;

-- TRIGGER 사용
CALL TOGGLE_COMPLAIN_BOOKMARK(13, 9);
