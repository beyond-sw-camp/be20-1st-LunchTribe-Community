
USE lunchtribedb;

-- RES-06 : 사용자는 가게리스트에서 하나의 리스트를 클릭 후 상세 조회를 할 수 있다. 

SELECT 
    r.restaurant_code,
    r.restaurant_name,
    r.phone,
    r.registration_date,
    menu_info.menu_list,
    review_info.review_count
FROM restaurant r
JOIN member m ON r.user_code = m.user_code
LEFT JOIN (
    SELECT
        me.restaurant_code,
        GROUP_CONCAT(me.menu_name SEPARATOR ',') AS menu_list
    FROM
        menu me
    LEFT JOIN
        category c ON me.category_code = c.category_code
    GROUP BY 
        me.restaurant_code
) menu_info ON r.restaurant_code = menu_info.restaurant_code
LEFT JOIN (
    SELECT
        rv.restaurant_code,
        COUNT(rv.review_code) AS review_count
    FROM
        review rv
    WHERE
        rv.is_delete = 'N'
    GROUP BY
        rv.restaurant_code
) review_info ON r.restaurant_code = review_info.restaurant_code
WHERE
    r.restaurant_name = '모스키친';

