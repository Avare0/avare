SELECT CONCAT(users.first_name, ' ', users.last_name) AS friend,
  COUNT(*) AS total_messages 
  FROM messages
  JOIN friendship
  ON user_id = to_user_id AND friend_id = to_user_id
  JOIN users
  ON users.id = from_user_id
  WHERE to_user_id = 3
  GROUP BY messages.from_user_id
  ORDER BY total_messages DESC
    LIMIT 1;
   
SELECT SUM(total) AS likes_total FROM ( 
	SELECT * FROM (
		SELECT CONCAT(users.first_name, ' ', users.last_name) AS name, profiles.birthdate, COUNT(DISTINCT likes.id) AS total
		FROM users
		JOIN profiles
		ON profiles.user_id = users.id
		LEFT JOIN likes
		ON likes.target_id = profiles.user_id AND target_type_id = 2
		GROUP BY profiles.user_id
		ORDER BY birthdate DESC
		LIMIT 10
		) AS a)
AS asdasd;


SELECT COUNT(*) AS male_likes 
FROM users
JOIN profiles
ON users.id = profiles.user_id AND profiles.sex = 'm'
JOIN likes
ON likes.user_id = profiles.user_id;
SELECT COUNT(*) AS male_likes 
FROM users
JOIN profiles
ON users.id = profiles.user_id AND profiles.sex = 'f'
JOIN likes
ON likes.user_id = profiles.user_id;


SELECT CONCAT(first_name, ' ', last_name) AS 'user', COUNT(DISTINCT messages.from_user_id) + COUNT(DISTINCT likes.user_id) + COUNT(DISTINCT media.user_id) AS summary
FROM users
LEFT JOIN likes
ON likes.user_id = users.id
LEFT JOIN messages
ON messages.from_user_id = users.id
LEFT JOIN media
ON media.user_id = users.id
GROUP BY users.id
ORDER BY summary
LIMIT 10;


ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
	FOREIGN KEY(user_id) REFERENCES users(id)
	ON DELETE CASCADE,
	ADD CONSTRAINT profiles_family_status_id_fk
	FOREIGN KEY(family_status_id) REFERENCES family_statuses(id),
	ADD CONSTRAINT profiles_photo_id_fk
	FOREIGN KEY(photo_id) REFERENCES media(id);
	
ALTER TABLE posts
	ADD CONSTRAINT posts_author_id_fk
	FOREIGN KEY(author_id) REFERENCES users(id),
	ADD CONSTRAINT posts_media_id_fk
	FOREIGN KEY(media_id) REFERENCES media_types(id);

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
   
ALTER TABLE media
  ADD CONSTRAINT media_media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id),
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT likes_target_id_fk 
    FOREIGN KEY (target_id) REFERENCES users(id),
  ADD CONSTRAINT likes_target_type_id_fk 

   
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);
   
ALTER TABLE communities_users
  ADD CONSTRAINT communities_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT communities_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

