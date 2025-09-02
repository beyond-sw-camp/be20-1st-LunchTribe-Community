-- MEM-06	학생부 조회	관리자는 학생부를 조회 할 수 있다.	관리자		이상도, 신광운
-- 학생부의 모든 입력 상태를 조회하여 확인한다.

SELECT 
       student_code				AS '학생고유코드'
     , student_name				AS '학생이름'
     , student_phone				AS '학생전화번호'
     , training_start			AS '훈련시작날짜'
     , training_end				AS '훈련종료날짜'
     , student_term				AS '기수'
  FROM student;