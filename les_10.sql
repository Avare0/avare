create index posts_id_inx on posts(id);
create index communities_id_inx on communities(id);
create index communities_users_id_inx on communities_users(user_id);
create index friendship_user_id_inx on friendship(user_id);
create index friendship_friend_id_inx on friendship(friend_id);


/*  ��� ������� ����������� �� ����, �� ���� ��� ���� � ��������� ��� ����� ��������. �� �� ������� ������ ������� 
 * �� �� �������, ������� ������������ ����� ����������, �� ��� � ������� ����������� ��� ������� ���. ���� ����������
 * ����� �����, ������� ������ ������������� �� ���, ������ ��� ����� ���������� ����� ������ "��������" ���� ��������.
 * ��� ��� �� ��� ��� ������ �����, ��� �������������� ��������, ������ ��������� �������? ���� ������������� �� ������� ��
 */


select DISTINCT communities.name,
AVG(communities_users.community_id) over (partition by communities.id)  / count(communities_users.community_id) over() * 100 as 'percentage',
first_value(users.first_name) over(partition by communities.id order by birthdate DESC) as 'youngest',
first_value(users.first_name) over(partition by communities.id order by birthdate) as 'oldest',
count(communities_users.community_id) over (partition by communities.id) as 'total',
count(users.id) over () as 'total',
count(communities_users.community_id) over (partition by communities.id)  / count(communities_users.community_id) over() * 100 as 'percentage'
from communities_users
join
communities
on communities_users.community_id = communities.id
join users
on users.id = communities_users.user_id
join profiles
on profiles.user_id = communities_users.user_id;
