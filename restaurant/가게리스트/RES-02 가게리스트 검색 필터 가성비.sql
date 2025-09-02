
USE lunchtribedb;

-- RES-02 : 사용자는 가격이 가성비 순으로 가게 목록을 보여준다.
SELECT ROW_NUMBER() OVER(ORDER BY rv.restaurant_code DESC) AS ROW_NUM
    rv.restaurant_code,
    res.restaurant_name,
    ROUND(0.4 * SUM(rv.taste_score) + 0.3 * SUM(rv.amount_score) / SUM(rv.cost_score), 1) AS avg_total_score
FROM review rv
JOIN restaurant res ON rv.restaurant_code = res.restaurant_code
GROUP BY rv.restaurant_code
ORDER BY avg_total_score DESC
LIMIT 10 OFFSET 0;
