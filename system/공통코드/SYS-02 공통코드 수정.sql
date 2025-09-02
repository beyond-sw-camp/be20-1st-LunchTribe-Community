
USE lunchtribedb;

-- SYS-02 : 관리자는 공통코드(신고, 알림)를 수정한다.
UPDATE common
SET common_name = '사용자'
WHERE common_code = '001';