-- MEM-20 : 일정 신고 횟수
-- TRIGGER 사용
-- 사용자가 5회 신고가 접수된다면 계정이 비활성화 처리

DELIMITER //

CREATE PROCEDURE TOGGLE_COMPLAIN_COUNT(
    IN p_user_code INT,
    IN p_common_code VARCHAR(3),
    IN p_black_code INT,
    IN p_complaint_num INT
)
BEGIN
    DECLARE v_count INT;

    -- 1. 신고 추가
    INSERT INTO COMPLAINT (user_code, common_code, black_code, complaint_num)
    VALUES (p_user_code, p_common_code, p_black_code, p_complaint_num);

    -- 2. 신고 횟수 가져오기
    SELECT COUNT(*) INTO v_count
    FROM COMPLAINT
    WHERE USER_CODE = p_user_code;

    -- 3. 신고 5회 이상이면 회원 정지
    IF v_count >= 5 THEN
        UPDATE MEMBER
        SET STATUS = 'N'
        WHERE USER_CODE = p_user_code;
    END IF;
END //

DELIMITER ;

-- call 사용
CALL TOGGLE_COMPLAIN_COUNT( 6, 'c32',  5, 12);