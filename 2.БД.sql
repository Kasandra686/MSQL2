use vk;
--2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT distinct firstname
FROM users ORDER by firstname




/* 3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)*/
ALTER TABLE profiles ADD  is_active INT  default 1;  -- Добавляем столбец, со значением по умолчанию 1
UPDATE profiles -- находим и помечаем всех несовершеннолетних
SET 
	is_active = 0
WHERE 
	 birthday <  (CURDATE()-INTERVAL 17 YEAR )
;



-- 4.Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
delete from messages
where created_at >  CURDATE()












