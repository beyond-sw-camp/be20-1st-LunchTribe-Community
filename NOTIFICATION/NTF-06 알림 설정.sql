-- NTF-06 알림 설정
-- 사용자는 마이페이지에서 알림 설정을 확인한다.
SELECT
    CC.common_name AS '회원',
    NS.notification_received AS '알 림 상 태'
FROM notification_status NS
JOIN common CC ON CC.common_code = NS.common_code
WHERE NS.user_code = 1; -- user 1에 대한 알림 설정 확인