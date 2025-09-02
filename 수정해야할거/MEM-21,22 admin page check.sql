-- 관리자의 관리자 페이지 조회

/* ============================================
   1. 회원 관리 (조회 / 수정 / 삭제)
   ============================================ */

-- (1) 전체 회원 조회 (역할 포함)
SELECT 
       a.user_id						   	AS '아이디'
     , a.nick_name							AS '닉네임'
     , a.user_phone							AS '전화번호'
     , a.gender								AS '성별'
     , a.age									AS '나이'
     , a.status								AS '활성화'   --트리거사용
     , b.training_start						AS '훈련시작일'
     , b.training_end							AS '훈련종료일'
     , b.student_term							AS '기수'
 FROM member a
 JOIN student b ON a.student_code = b.student_code
ORDER BY b.training_start DESC;			-- 

-- (2-1) 회원 정보 수정 (닉네임, 전화번호 예시)
UPDATE member a
JOIN student b ON a.student_code = b.student_code
   SET 
       a.user_id        = 'kimcss'				-- '아이디'
     , a.nick_name      = '철수짱'					-- '닉네임'
     , a.user_phone     = '01047490000'					-- '전화번호'
     , a.gender			= 'M'					-- '성별'
     , a.age				= 25					-- '나이'
     , a.status			= 'Y'					-- '활성화'   
     , b.training_start	= NOW()				-- '훈련시작일'
     , b.training_end	= NOW()				-- '훈련종료일'
     , b.student_term	= 20					-- '기수'
 WHERE user_code = 1;
 

/* ============================================
   2. 회원 역할(Role) 변경
   ============================================ */

UPDATE member
   SET role_code = ? 					 AS ' 1: 학생, 2: 점주, 3: 관리자'
 WHERE user_code = ?;
   

/* ============================================
   3. 신고 내역 관리 (조회 / 삭제)
   ============================================ */

-- (3-1) 신고 내역 조회
SELECT 
      a.complaint_code								   AS '신고코드'
    , b.user_code  										AS '신고한 유저코드'
    , a.black_code  									  	AS '신고당한 유저코드'
    , a.complaint_num								   AS '게시판, 댓글 고유식별자'
  FROM complaint a
  JOIN member b ON a.user_code = b.user_code
 ORDER BY a.complaint_code ASC;						-- 신고내역 오래된 순으로 처리

-- (3-2) 신고 내역 삭제
DELETE 
  FROM complaint
 WHERE complaint_code = ?;
 
 
-- /* ============================================
   4. 회원 활성화 비활성화  관리 (조회 / 삭제)
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