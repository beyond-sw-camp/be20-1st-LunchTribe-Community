-- NTF-03 알림 삭제
-- 관리자는 알림 내역을 정리할 수 있다. (특정 기간이후 알림 제거)
-- 임의로 6개월이전의 데이터를 10개 만들어서 확인
INSERT INTO notification_history 
(notification_send_code, user_code, notification_num, notification_created_at)
VALUES
('n01', 1, 5, '2025-02-01 10:00:00'),
('n02', 2, 3, '2025-02-02 11:00:00'),
('n03', 3, 8, '2025-02-03 12:00:00'),
('n01', 4, 1, '2025-02-04 13:00:00'),
('n02', 5, 7, '2025-02-05 14:00:00'),
('n03', 6, 2, '2025-02-06 15:00:00'),
('n01', 7, 9, '2025-02-07 16:00:00'),
('n02', 8, 4, '2025-02-08 17:00:00'),
('n03', 9, 6, '2025-02-09 18:00:00'),
('n01', 10, 10, '2025-02-10 19:00:00');
-- 6개월이 지난 알림 내용 전부 삭제
DELETE FROM notification_history
WHERE notification_created_at < NOW() - INTERVAL 6 MONTH;
