INSERT INTO board
(
    user_code, board_title, board_content, board_views, 
    board_created_at, board_updated_at, is_delete
)
VALUES
(
    1,
    '아 정말 하기 싫다~',
    '오늘은 쿼리짜는 날~',
    0,                           -- not null 인 상태인데 null로 해도 괜찮은지?
    NOW(),
    NOW(),                       -- not null 인 상태인데 '수정일'이라서 null로 변경해야 합니다.
    'Y'
);