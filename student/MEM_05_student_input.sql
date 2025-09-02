-- MEM-05	학생부 입력	관리자는 학생으로 가입할 시 비교할 학생부를 입력한다. 

-- INSERT
-- INTO student
-- (
--  student_name, student_phone, training_start, training_end, student_term
-- )
--  VALUES
-- (
--  '학생의 이름 입력.', '전화번호 입력.', '훈련 시작날짜 입력', '훈련 종료날짜 입력', '훈련 기수 입력'
-- );

-- 학생부 입력 예시입니다.
INSERT
  INTO student
(
    student_name				-- 학생이름
  , student_phone				-- 학생전화번호
  , training_start			-- 훈련시작날짜
  , training_end				-- 훈련종료날짜
  , student_term				-- 기수
)
  VALUES
(
   '이상도'
  , '01047490000'
  , 20250813
  , 20250209
  , 20
); 

