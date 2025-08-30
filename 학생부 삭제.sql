-- MEM-08	학생부 삭제	관리자는 학생부의 학생정보를 삭제한다.	


-- 학생부 고유식별자(pk)를 통해 (학생부 단일 행)을 삭제한다.
-- DELETE
--   FROM sutdent
--  WHERE student_code = 2;
 
DELETE
 FROM student
WHERE student_code = 1;