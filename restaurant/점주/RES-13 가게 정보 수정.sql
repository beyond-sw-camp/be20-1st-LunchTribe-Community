
USE lunchtribedb;

-- RES-13 : 점주는 등록한 가게를 수정한다.
-- 가게 정보가 수정되면 가게 테이블에 수정로그가 기록 되어야하지 않을까 ? ex. restaurant_updated_at 컬럼 추가?
UPDATE restaurant
SET 
    restaurant_name = '수정된 가게명',
    phone = '05012345678',
    biz_number = '9876543210'
WHERE user_code = 2 AND restaurant_code = 3;  -- 점주의 회원고유식별자가 2, 가게고유식별자가 3인 경
