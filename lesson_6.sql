SELECT (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = from_user_id),
COUNT(*) AS summary
FROM messages WHERE to_user_id = 3 AND from_user_id IN (
	SELECT user_id FROM friendship WHERE friend_id = to_user_id
	UNION
	SELECT friend_id FROM friendship WHERE user_id = to_user_id
) GROUP BY messages.from_user_id ORDER BY summary DESC;


SELECT SUM(amount) FROM (SELECT target_id, COUNT(*) AS amount FROM likes WHERE target_type_id = 2 AND target_id IN (
	SELECT * FROM (SELECT user_id FROM profiles ORDER BY birthdate DESC LIMIT 10) AS sorted
) GROUP BY target_id) AS answer;


SELECT SUM(amount) FROM (SELECT user_id, COUNT(*) AS amount FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE sex = 'm') GROUP BY user_id )AS male_likes;
SELECT SUM(amount) FROM (SELECT user_id, COUNT(*) AS amount FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE sex = 'f') GROUP BY user_id )AS female_likes;


SELECT user_id,
	(SELECT COUNT(*) FROM likes WHERE  likes.user_id = profiles.user_id) +
	(SELECT COUNT(*) FROM messages m WHERE  m.from_user_id = profiles.user_id) +
	(SELECT COUNT(*) FROM media WHERE  media.user_id = profiles.user_id)
	AS likes_amount
FROM profiles
ORDER BY likes_amount
LIMIT 10;
