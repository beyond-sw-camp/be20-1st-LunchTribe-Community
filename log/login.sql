-- MEM-10 올바른 아이디와 비밀번호의 조합을 통해 로그인한다.


-- 아이디 비밀번호가 일치할 경우 '로그인 성공입니다'출력
SELECT 
		 user_code
	  , nick_name
	  , user_id 
	  , '로그인 성공'
  FROM member
 WHERE user_id = 'korsh111' AND user_pw = 'javayanolja';
    




