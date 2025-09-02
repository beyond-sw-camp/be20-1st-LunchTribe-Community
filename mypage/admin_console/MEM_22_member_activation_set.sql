	/* ============================================
   회원 활성화 비활성화  관리 (조회 / 삭제)
   ============================================ */

UPDATE member
	SET STATUS ='N' 		/*변경할 상태를 Y,N 중 선택*/
 WHERE user_code = 1;	/*변경할 사용자의 고유식별자를 입력*/	

-- 작동중인 이벤트 스케줄러와 이벤트 스케줄러 설정 확인
SHOW EVENTS;

SHOW VARIABLES LIKE 'event_scheduler';

-- root로 실행
SET GLOBAL event_scheduler = ON;

-- 매 자정에 전날이 훈련 종료일일경우 계정 비활성화(status값을 N으로 변경)
CREATE EVENT IF NOT EXISTS update_sign_in_disable
ON SCHEDULE EVERY 1 DAY
STARTS NOW()																	-- 테스트용 지금 즉시 실행
-- STARTS TIMESTAMP(CURDATE() + INTERVAL 1 DAY)						-- 내일 자정부터 실행
ON COMPLETION PRESERVE
DO
  UPDATE member a
    JOIN student b ON a.student_code = b.student_code
     SET a.status = 'N'														-- 상태를 N으로 변경
   WHERE b.training_end = SUBDATE(CURDATE(), INTERVAL 1 DAY);	-- 어제가 훈련 종료일이면

-- 실행중인 이벤트 스케줄러들 재확인
SHOW EVENTS;

-- 이벤트 스케줄러 update_sign_in_disable 삭제
DROP EVENT update_sign_in_disable;

-- update_sign_in_disable 스케줄러 재실행
-- ALTER EVENT update_sign_in_disable ENABLE;



/*
DROP TRIGGER IF EXISTS member_update;

DELIMITER //

CREATE TRIGGER member_update
AFTER UPDATE ON student FOR EACH ROW
BEGIN
    IF NEW.training_end > CURDATE() THEN				-- '훈련종료날짜' 가 오늘을 기준 
        UPDATE member										-- 지났으면 '비활성화삭제'
        SET status = 'Y'
        WHERE student_code = NEW.student_code;		-- '훈련종료날짜' 가 오늘을 기준 
    ELSEIF NEW.training_end < CURDATE() THEN			-- 기간이 남았으면  '활성화'
    	  UPDATE member 
        SET status = 'N'
        WHERE student_code = NEW.student_code;		-- '훈련종료날짜' 가 오늘을 기준 
    ELSE	
	 		UPDATE member										-- 같으면   '활성화'
	 		SET status = 'N'
			WHERE student_code = NEW.student_code; 
    END IF;
END //



DELIMITER ;
*/
