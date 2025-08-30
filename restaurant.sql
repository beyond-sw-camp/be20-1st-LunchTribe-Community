USE lunchtribedb;

DROP TABLE IF EXISTS restaurant;

CREATE TABLE IF NOT EXISTS restaurant (
    `restaurant_code` INT NOT NULL AUTO_INCREMENT,
    `user_code` INT NOT NULL,
    `restaurant_name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `registration_date` DATETIME NOT NULL,
    `biz_number` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`restaurant_code`)
);

INSERT INTO restaurant (`user_code`,`restaurant_name`,`phone`,`registration_date`,`biz_number`)
VALUES 
(1, '모스키친', '0507-1307-3529','2025-01-20 00:00:00','1'),
(2, '기계우동', '02-821-9397','2025-02-25 00:00:00','2'),
(3, '고향엄마손생바지락칼국수', '02-3280-0605','2025-03-10 00:00:00','3'),
(4, '싸다김밥', '0507-1326-8828','2025-08-15 00:00:00','4'),
(5, '큰맘할매순대국', '02-822-5151','2023-05-05 00:00:00','5'),
(6, '동화장', '02-821-3322','2020-04-20 00:00:00','6'),
(7, '스미비부타동', '0507-1421-1829','2022-06-20 00:00:00','7');


