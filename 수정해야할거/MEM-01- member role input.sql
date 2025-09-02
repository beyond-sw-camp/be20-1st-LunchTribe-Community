-- MEM-01	역할 입력	관리자는 역할(학생, 점주, 관리자)을 입력한다
-- 구문 형태와 사용법은 아래와 같다
-- INSERT 
--  INTO role
-- (
--  role_code, role_name
-- )
-- VALUES 
-- (
--   '이 필드엔 숫자가 와야하며 Null이어도 Auto 인크리먼트가 적용됨', '이외에 새로 구분될 역할 명을 입력하면 됨'
-- );

-- 학생의 역할 입력 예시
INSERT 
  INTO role
(
  role_code, role_name
)
VALUES 
(
  '1', '학생'
);

-- 점주의 역할 입력 예시
INSERT 
  INTO role
(
  role_code, role_name
)
VALUES 
(
  '2', '점주'
);

-- 관리자의 역할 입력 예시
INSERT 
  INTO role
(
  role_code, role_name
)
VALUES 
(
  '3', '관리자'
);