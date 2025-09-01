-- 회원 가입 여부 확인(공통)
SELECT
		 IF(COUNT(*) = 1, '이미 가입된 아이디가 있습니다.', IF(COUNT(*) = 0, '중복된 아이디가 없습니다', '관리자에게 문의해주세요')) AS '회원가입여부'
  FROM member
 WHERE user_name = '김철수' 				/*입력 이름*/
 	AND user_phone = '01012345601' 		/*입력 전화 번호*/;
 
-- 학생용 회원 가입시 아래 쿼리문 실행
-- 학생부에 등록되어 있는지 1차적으로 대조
SELECT
		 IF(COUNT(*) = 1, '가입가능 다음 쿼리문 실시', '관리자에게 문의해주세요') AS '학생부 등록 여부'
  FROM student
 WHERE student_name = '신광운' 			/*위에서 입력한 (이름) 입력 불필요*/
   AND student_phone = '01051707811'	/*위에서 입력한 (전화번호) 입력 불필요*/;

-- 아이디 중복 조회(공통)
SELECT
		 IF(COUNT(*) = 1, '이미 사용중인 ID입니다', '사용가능합니다') AS '아이디 중복 검사'
  FROM member
 WHERE user_id = 'carino93'	/*확인할 아이디 입력*/;

-- 나머지 데이터 입력
INSERT INTO member
(
    student_code
  , user_id
  , user_name
  , user_pw
  , user_phone
  , nick_name
  , gender
  , age
  , role_code
  , user_created_at
  , user_updated_at
)
SELECT 
    student_code	/*입력 불필요*/
  , 'carino93'		/*입력 불필요*/
  , student_name	/*입력 불필요*/
  , 'testpw007'
  , student_phone	/*입력 불필요*/
  , '테스트용닉네임'
  , 'M'
  , 33
  , 1					/*입력 불필요 학생 회원 가입 선택으로 1을 미리 기입*/
  , CURDATE()		/*입력 불필요*/
  , CURDATE()		/*입력 불필요*/
FROM student
WHERE student_name = '신광운'				/*위에서 입력한 (이름) 입력 불필요*/
  AND student_phone = '01051707811';	/*위에서 입력한 (전화번호) 입력 불필요*/

-- 테스트 및 시연용 코드
SELECT
		*
  FROM member 
 WHERE user_name = '신광운'
   AND user_phone = '01051707811';
   
-- 점주용 회원 가입 (시나리오 : 수원 왕갈비 통닭 사장의 회원 가입 예시)
INSERT
INTO member
(
    user_id				
  , user_name
  , user_pw
  , user_phone
  , nick_name
  , gender
  , age
  , role_code			
  , user_created_at	
  , user_updated_at	
)
VALUES
(
    'kosanggi'				/*입력 불필요 중복 검사 하고 받을 값*/
  , '고상기'
  , 'testpassword000'
  , 01087654321
  , '지금까지이런맛'
  , 'M'
  , 54
  , 2							/*입력 불필요 점주 회원 가입 선택으로 2를 미리기입*/
  , CURDATE()				/*입력 불필요*/
  , CURDATE()				/*입력 불필요*/
);

-- 테스트용
SELECT
		*
  FROM member 
 WHERE user_name = '고상기';

-- 관리자용 강제 입력
INSERT
INTO member
(
    user_id				
  , user_name
  , user_pw
  , user_phone
  , nick_name
  , gender
  , age
  , role_code			
  , user_created_at	
  , user_updated_at	
)
VALUES
(
  , /*아이디*/				
  , /*이름*/
  , /*비밀번호*/
  , /*전화번호*/
  , /*닉네임*/
  , /*성별*/
  , /*나이*/
  , /*역할코드*/							
  , CURDATE()/*작성일*/				
  , CURDATE()/*수정일*/				
);


-- 더미 100개(학생) 만드는 반복문
DELIMITER //
CREATE PROCEDURE mkdummy()
BEGIN
  DECLARE i INT DEFAULT 1;

  WHILE i < 100 DO
    INSERT
		INTO member
		(
		    student_code
		  , role_code 
		  , user_id 
		  , user_name 
		  , user_pw 
		  , user_phone 
		  , nick_name 
		  , gender 
		  , age			
  		  , user_created_at	
  		  , user_updated_at	 
		)
		VALUES
		(
			 i
		  , 1
		  , CONCAT('a', CONCAT(i))
		  , CONCAT('이름', CONCAT(i))
  		  , CONCAT('pw', CONCAT(i))
  		  , CONCAT(i)
  		  , CONCAT('닉네임', CONCAT(i))
  		  , 'M'
  		  , 25
  		  , CURDATE()
  		  , CURDATE()
		);
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;

CALL mkdummy();