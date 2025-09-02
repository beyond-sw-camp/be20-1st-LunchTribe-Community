-- Developer : Sunghyun, Kim
-- Date : 2025. 08. 31 
-- Feature : 관리자 관련 기능 구현 SQL 쿼리문 
-- Version : v1.0

USE lunchtribedb;

-- SYS-01 : 관리자는 공통코드(신고, 알림)를 추가한다.
INSERT INTO common (common_code, common_name)
VALUES ('001', '회원'), ('002', '가게');

-- SYS-02 : 관리자는 공통코드(신고, 알림)를 수정한다.
UPDATE common
SET common_name = '사용자'
WHERE common_code = '001';

-- SYS-03 : 관리자는 공통코드(신고, 알림)를 목록 조회한다.
SELECT *
FROM common;

-- SYS-04 : 관리자는 공통코드(신고, 알림)를 삭제한다.
DELETE FROM common
WHERE common_code = '002';