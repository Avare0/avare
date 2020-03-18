CREATE DATABASE lesson8;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	thing VARCHAR(20)
);

INSERT INTO users(name) VALUES ('Pasha'), ('Vova'), ('Masha'), ('Petya');

INSERT INTO orders(user_id, thing) VALUES (1, 'asd'), (3, 'werwerwer');

SELECT name FROM users WHERE id IN (SELECT user_id FROM orders);

SELECT c.name, p.name FROM catalogs AS c JOIN products AS p ON p.catalog_id = c.id;


CREATE TABLE flights( id SERIAL PRIMARY key, from_name VARCHAR(20), to_name VARCHAR(20));

CREATE TABLE cities (label VARCHAR(20), name VARCHAR(20));

INSERT INTO flights(from_name, to_name) VALUES ('moscow', 'omsk'), ('novgorod','kazan'), ('irkutsk','moscow'), ('omsk','irkutsk'),('moscow','kazan');

INSERT INTO cities(label, name) VALUES ('moscow', 'Москва'), ('novgorod','Новгород'), ('irkutsk','Иркутск'), ('omsk','Омск'),('kazan','Казань');


SELECT id, (SELECT name FROM cities WHERE flights.from_name = label) AS departure_city, (SELECT name FROM cities WHERE flights.to_name = label) AS arrival_city FROM flights;

