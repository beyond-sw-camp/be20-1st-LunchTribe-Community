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