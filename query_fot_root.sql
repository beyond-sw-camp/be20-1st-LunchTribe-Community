-- 팀프로젝트용 데이터베이스 생성
CREATE DATABASE lunchtribedb;

-- 계정 생성
CREATE USER 'lunchtribeuser'@'%' IDENTIFIED BY 'lunchtribeuser';

-- 권한 부여
GRANT ALL PRIVILEGES ON lunchtribedb.* TO 'lunchtribeuser'@'%';