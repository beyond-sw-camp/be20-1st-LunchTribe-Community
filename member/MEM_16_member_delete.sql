-- MEM-16	회원 탈퇴	서비스 탈퇴를 통해 DB에 저장되어 있는 사용자의 모든 데이터를 삭제한다.

-- 회원고유식별자(user_code)(pk)로 조회하여 해당 유저데이터를 삭제한다.
DELETE FROM MEMBER
WHERE user_code = 1;

