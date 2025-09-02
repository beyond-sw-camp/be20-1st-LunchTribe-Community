
USE lunchtribedb;

-- SYS-04 : 관리자는 공통코드(신고, 알림)를 삭제한다.
DELETE FROM common
WHERE common_code = '002';