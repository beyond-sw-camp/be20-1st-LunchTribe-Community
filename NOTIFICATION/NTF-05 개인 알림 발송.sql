-- NTF-05 개인 알림 발송
-- 사용자의 게시물에 댓글이 달리거나 댓글에 좋아요가 눌리면 개인 알림 발송이 된다.

-- 댓글 알림 기능 
DELIMITER //

CREATE PROCEDURE NOTICATION_COMMNENT_INSERT(
    IN p_user_code INT,
    IN p_board_code INT,
    IN p_recomments_code INT,
    IN p_comments_content VARCHAR(500)
)
BEGIN
    DECLARE v_new_comment_code INT;

    -- 1. 댓글 추가
    INSERT INTO comments (
        user_code, board_code, recomments_code, comments_content,
        comments_created_at, comment_updated_at, is_delete
    )
    VALUES (
        p_user_code, p_board_code, p_recomments_code, p_comments_content,
        NOW(), NOW(), 'N'
    );

    -- 2. 방금 추가된 댓글 ID 가져오기
    SET v_new_comment_code = LAST_INSERT_ID();

    -- 3. 알림 내역 추가
    INSERT INTO notification_history (
        notification_send_code,
        user_code,
        notification_num,
        notification_created_at
    )
    SELECT 'n02',
           b.user_code,               -- 게시글 작성자
           v_new_comment_code,        -- 방금 추가된 댓글 코드
           NOW()
      FROM board b
      JOIN notification_status ns ON ns.user_code = b.user_code
     WHERE ns.common_code = 'c31'
       AND b.board_code = p_board_code
       and ns.NOTIFICATION_RECEIVED = 'Y';

END; //

-- 댓글 좋아요 알림 기능 
DELIMITER ;

CALL NOTICATION_COMMNENT_INSERT (1, 7,  NULL , "테스트제발: 프로시저로 이용해서 댓글 알림 구현해보기!!");

DELIMITER //

CREATE PROCEDURE NOTICATION_LIKE_INSERT(
    IN p_comment_code INT 
    , IN p_user_code INT 
)
BEGIN
    DECLARE v_new_comment_like_code INT;

    -- 1. 좋아요  추가
    INSERT INTO comment_likes (
        comments_code, user_code
    )
    VALUES (
       p_comment_code, p_user_code
    );

    -- 2. 방금 추가된 댓글 좋아요  ID 가져오기
    SET v_new_comment_like_code = LAST_INSERT_ID();

    -- 3. 알림 내역 추가
    INSERT INTO notification_history (
        notification_send_code,
        user_code,
        notification_num,
        notification_created_at
    )
   SELECT 'n03'
		  , c.USER_CODE -- 댓글 작성자
		  , v_new_comment_like_code	-- 방금 추가된 댓글 좋아요 코드
		  , NOW()
     FROM comments c
     JOIN notification_status ns ON ns.USER_CODE = c.USER_CODE 
    WHERE ns.common_code = 'c32'
      AND ns.NOTIFICATION_RECEIVED = 'Y'
      AND c.COMMENTS_CODE = p_comment_code;	-- 방금 좋아요 누른 댓글 좋아요

END; //

DELIMITER ;

-- CALL NOTICATION_LIKE_INSERT( 'p_comment_code', 'user_code');
CALL NOTICATION_LIKE_INSERT(7,3);

/*SELECT * FROM comments; -- 6번 이쓴 댓글 : 6 / 7
SELECT * FROM comment_likes;
SELECT * FROM member;
SELECT * FROM notification_history;
SELECT * FROM notification_status;	-- Y user_code : 6 / N user_code : 7*/

