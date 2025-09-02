-- MEM-07	학생부 수정	관리자는 학생부의 내용을 수정 할 수 있다.	
-- 학생고유식별자(pk)는 학생부 조회버튼(쿼리문)을 통해 나온 결과 중 student_code를 받아와서 수정 할 예정입니다.


-- '학생부고유식별자(pk)로 확인 후 학생의 이름  변경한다.'
-- UPDATE student
--   SET student_name = 변경할 이름(ex. 이상도)
-- WHERE student_code = 수정할 학생의 고유식별자(ex. 1);
 
 -- '학생부고유식별자(pk)로 확인 후 학생의 이름  변경한다.'
UPDATE student
   SET student_name = '신광운'
 WHERE student_code = 1;
 
 
 -- '학생부고유식별자(pk)로 확인 후 전화번호를  변경한다.'
 -- UPDATE student
 --    SET student_phone = (ex. 010-0000-0000)
 -- WHERE student_code = 수정할 학생의 고유식별자(ex. 1);
UPDATE student
   SET student_phone = '010-4749-2242'
WHERE student_code = 1;
 
 
 -- '학생부고유식별자(pk)로 확인 후 훈련날짜 시작을 변경한다.'
 -- UPDATE student
 --    SET training_start (ex. 2025-08-13)
 -- WHERE student_code = 수정할 학생의 고유식별자(ex. 1);
UPDATE student
   SET training_start = '2025-08-20'
WHERE student_code = 1;
 
 -- '학생부고유식별자(pk)로 확인 후 훈련날짜 종료을 변경한다.'
 -- UPDATE student
 --    SET training_end (ex. 2026-12-31)
 -- WHERE student_code = 수정할 학생의 고유식별자(ex. 1);
UPDATE student
   SET training_end = '2026-08-20'
WHERE student_code = 1;
 
 
 -- '학생부고유식별자(pk)로 확인 후 훈련 기수을 변경한다.'
 -- UPDATE student
 --    SET student_term (ex. 20기)
 -- WHERE student_code = 수정할 학생의 고유식별자(ex. 1);
UPDATE student
   SET student_term = '10기'
WHERE student_code = 1;
 
 
 
 