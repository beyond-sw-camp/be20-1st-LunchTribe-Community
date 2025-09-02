-- NTF-05 개인 알림 발송
-- 사용자의 게시물에 댓글이 달리거나 댓글에 좋아요가 눌리면 개인 알림 발송이 된다.

INSERT INTO NOTIFICATION_HISTORY 
(
	NOTIFICATION_SEND_CODE,
	USER_CODE,
	NOTIFICATION_NUM,
	NOTIFICATION_CREATED_AT
)
SELECT 
	'n01' AS notification_send_code,
    nsts.user_code,
	NULL AS notification_num,
	NOW()
FROM notification_status nsts
WHERE nsts.notification_received = 'Y'
  AND NSTS.COMMON_CODE = 'c02';