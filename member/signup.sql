-- 관리자용 강제 입력
INSERT
INTO member
(
    `student_code`
  , `role_code` 
  , `user_id` 
  , `user_name` 
  , `user_pw` 
  , `user_phone` 
  , `nick_name` 
  , `gender` 
  , `age` 
)
VALUES
(
	 i++
  , 1
  , a + i++
  , 이름 + i++
  , pw + i++
  , i++
  , 닉네임 + i++
  , 'M'
  , 25
)


-- 더미 100개 만드는 반복문
DELIMITER //
CREATE PROCEDURE dowhile()
BEGIN
  DECLARE i INT DEFAULT 1;

  WHILE i < 100 DO
    INSERT
		INTO member
		(
		    `student_code`
		  , `role_code` 
		  , `user_id` 
		  , `user_name` 
		  , `user_pw` 
		  , `user_phone` 
		  , `nick_name` 
		  , `gender` 
		  , `age` 
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
		);
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;
CALL dowhile();