create table logs (
	id INT,
	table_name VARCHAR(20),
	date_added DATE CURRENT_TIMESTAMP,
	name VARCHAR(20)
) ENGINE = Archive;

create trigger add_to_log after insert on products
for each row
insert into logs(table_name , name, id) values ("products",new.name, new.id);

create trigger add_to_log after insert on catalogs
for each row
insert into logs(table_name , name, id) values ("catalogs",new.name, new.id);

create trigger add_to_log after insert on users
for each row
insert into logs(table_name , name, id) values ("users",new.name, new.id);


HSET ipaddr 127.0.0.1 1

SET Alex mail@mail.ru
SET mail@mail Alex
GET Alex
GET mail@mail.ru

db.shop.insert({category: 'Молочка'})
db.shop.insert({category: 'Мясо'})

db.shop.update({category: 'Молочка'}, {$set: { products:['сыр', 'йогурт', 'молоко'] }})
db.shop.update({category: 'Мясо'}, {$set: { products:['свинина', 'говядина', 'барранина'] }})
