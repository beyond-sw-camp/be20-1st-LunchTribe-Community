
USE lunchtribedb;

-- RES-22 : 사용자는 방문한 가게의 자신이 작성한 리뷰를 수정한다.
UPDATE review
SET taste_score = 9,
    cost_score = 8,
    amount_score = 10,
    comment = '정말 맛있어요!',
    picture = 'http://example.com/pic21_updated.jpg'
WHERE review_code = 21 AND user_code = 1;
