CREATE DATABASE less_5;
USE less_5;
DROP TABLE users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	created_at VARCHAR(20),
	updated_at VARCHAR(20)
);

INSERT INTO users VALUES (NULL, NOW(), NOW());
INSERT INTO users VALUES (NULL, NOW(), NOW());
INSERT INTO users VALUES (NULL, NOW(), NOW());
INSERT INTO users VALUES (NULL, NOW(), NOW());
INSERT INTO users VALUES (NULL, NOW(), NOW());

ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME;
DROP TABLE products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	value INT NOT NULL,
	if_zero INT AS (IF(value = 0, 1, 0))
);

INSERT INTO products(value) VALUES (0);
INSERT INTO products(value) VALUES (FLOOR(RAND() * 100));


SELECT * FROM products ORDER BY if_zero, value;
DROP TABLE users1;
CREATE TABLE users1 (
	id SERIAL PRIMARY KEY,
	birthdate DATE,
	birthdate_month VARCHAR(20) AS (
	CASE WHEN MONTH(birthdate) = 5 THEN 'may'
	WHEN MONTH(birthdate) = 8 THEN 'august'
	ELSE 'else'
	END
)
);

INSERT INTO users1 (birthdate) VALUES ('1970-04-11');
INSERT INTO users1 (birthdate)  VALUES ('1970-01-20');
INSERT INTO users1 (birthdate)  VALUES ('1970-05-20');
INSERT INTO users1 (birthdate)  VALUES ('1970-06-20');
INSERT INTO users1 (birthdate)  VALUES ('1970-03-20');
INSERT INTO users1 (birthdate)  VALUES ('1970-08-20');
INSERT INTO users1 (birthdate)  VALUES ('1970-08-20');


SELECT * FROM users1  WHERE birthdate_month IN ('may', 'august');


SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) FROM users;


SELECT COUNT(*) AS amount, DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthdate), DAY(birthdate))), '%W') AS weekday
FROM
  users1
GROUP BY
  weekday
ORDER BY
  amount DESC;
