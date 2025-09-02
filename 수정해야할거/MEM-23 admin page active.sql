-- /* ============================================
   회원 활성화 비활성화  관리 (조회 / 삭제)
   ============================================ */

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