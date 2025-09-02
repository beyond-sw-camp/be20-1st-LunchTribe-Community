
USE lunchtribedb;

-- RES-21 : 사용자는 방문한 가게를 리뷰, 별점을 작성할 수 있다. (사진 선택사항)
INSERT INTO review (review_code, restaurant_code, user_code, menu_code, taste_score, cost_score, amount_score, comment, picture, is_delete)
VALUES (21, 1, 1, 1, 8, 7, 9, '맛있어요!', 'http://example.com/pic21.jpg', 'N');

