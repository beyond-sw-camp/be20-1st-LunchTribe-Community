-- NTF-01 : 알림 추가
-- TRIGGER 사용
-- 사용자(학생)이 회원가입을 하면 기본적으로 개인, 전체알림이 Y값으로 설정

DELIMITER //

CREATE TRIGGER AFTER_MEMBER_INSERT
AFTER INSERT ON member  -- 회원가입
FOR EACH ROW
BEGIN
    IF NEW.role_code = 1 THEN       -- 사용자(학생) role_code = 1 > 학생
        INSERT INTO notification_status (user_code, common_code)
        VALUES (NEW.user_code, 'c02'),  -- 전체알림
               (NEW.user_code, 'c03');  -- 개인알림
    END IF;
END;

//lunchtribedb
DELIMITER ;