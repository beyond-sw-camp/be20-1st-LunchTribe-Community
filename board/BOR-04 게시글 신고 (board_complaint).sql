-- BOR-04 :게시글 신고

-- complaint_code는 auto_increment 생략가능
INSERT INTO complaint (
	   user_code	-- 신고하는 사용자 PK
	 , common_code	-- 신고 유형 신고 common_code : c31
	 , black_code	-- 신고 당한 사용자 PK
	 , complaint_num	-- 신고 당한 게시글 PK
	 )
values ( 3
	 , 'c31'
	 ,  5
	 , 12
);