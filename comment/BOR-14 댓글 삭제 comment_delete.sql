-- BOR-14 댓글 삭제 comment_delete
-- 사용자, 관리자는 게시글에 있는 본인 댓글을 삭제한다.
DELETE
  FROM comments
 WHERE comments_code = 21; 

-- 아래 트리거를 먼저 실행을 합니다.
-- 댓글을 삭제하면 해당 댓글에 눌린 좋아요도 같이 삭제가 됩니다.

DELIMITER //

CREATE TRIGGER trg_comment_delete
BEFORE DELETE ON comments
FOR EACH ROW
BEGIN
    DELETE FROM comment_likes
    WHERE comments_code = OLD.comments_code;
END;
//

DELIMITER ;