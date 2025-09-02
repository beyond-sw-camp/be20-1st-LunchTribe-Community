-- NTF-04 전체 알림 발송
-- 신규 가게 입점시 전체 알림 Y 인 사람들에게 신규 입점 알림 보내기 
DELIMITER //

CREATE PROCEDURE insert_restaurant_with_notify (
    IN p_user_code INT,
    IN p_restaurant_name VARCHAR(50),
    IN p_phone VARCHAR(20),
    IN p_registration_date DATETIME,
    IN p_biz_number VARCHAR(10)
)
 BEGIN
    DECLARE v_new_restaurant_code INT;

    -- 1. 가게 추가
    INSERT INTO restaurant (user_code, restaurant_name, phone, registration_date, biz_number)
    VALUES (p_user_code, p_restaurant_name, p_phone, p_registration_date, p_biz_number);

    -- 2. 방금 추가된 restaurant_code 가져오기
    SET v_new_restaurant_code = LAST_INSERT_ID();

    -- 3. 알림 내역 한 번만 추가
    INSERT INTO notification_history (
        notification_send_code,
        user_code,
        notification_num,
        notification_created_at
    )
    SELECT 'n01',
           nsts.user_code,
           v_new_restaurant_code,
           NOW()
      FROM notification_status nsts
     WHERE nsts.notification_received = 'Y'
       AND nsts.common_code = 'c02';
END;
//
DELIMITER ;

-- CALL 프로시저 사용
CALL insert_restaurant_with_notify(
    10,                    -- p_user_code: 가게 등록한 사용자 ID
    '혜인이네 분식',         -- p_restaurant_name: 가게 이름
    '01055556666',      -- p_phone: 전화번호
    NOW(),                -- p_registration_date: 현재 시간
    '5161515651'          -- p_biz_number: 사업자 등록번호
);