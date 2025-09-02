-- BOR-15 댓글 좋아요  comment_like
-- 사용자, 관리자는 게시글에 있는 댓글을 '좋아요'한다.
DELIMITER //

CREATE PROCEDURE toggle_comment_like(IN p_comments_code INT, IN p_user_code INT)
BEGIN
    IF EXISTS (SELECT 1 FROM comment_likes 
               WHERE comments_code = p_comments_code AND user_code = p_user_code) THEN
        DELETE FROM comment_likes 
        WHERE comments_code = p_comments_code AND user_code = p_user_code;
    ELSE
        INSERT INTO comment_likes (comments_code, user_code)
        VALUES (p_comments_code, p_user_code);
    END IF;
END //

DELIMITER ;

CALL toggle_comment_like(21, 1); -- 1번 실행하면 좋아요, 1번 더 실행하면 데이터 삭제