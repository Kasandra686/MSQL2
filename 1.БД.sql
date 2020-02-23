/*Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
 создадим процедуры с циклами в которых мы будем генерировать данные для всех таблиц
  */

use vk;
DELIMITER //  -- меняем ; на // это нужно для выполнения процедуры и цикла

CREATE PROCEDURE users_profiles() -- создаем процедуру генерации заполнения таблицы users
BEGIN
	DECLARE i INT default 0; -- берем переменную число равную 0
  	WHILE (i < 100) DO -- циклим до 100
  	  	INSERT INTO users ( firstname , lastname , email , phone ) 
		values	(CONCAT('vera',i),CONCAT('zvereva',i),CONCAT(i,'mail@.ru'),('9235566'+i));
		-- используем конкацию для создания уникальных данных
		INSERT INTO profiles ( birthday) 
		-- уменьшим возраст пользователей в профиле на +1 год 
		values	(('1920.01.01'+ interval i year));
   		 SET i = i + 1;
	 END WHILE;
END
//

CREATE PROCEDURE media_types() -- создаем процедуру генерации заполнения таблицы media_types
BEGIN
	DECLARE i INT default 0; -- берем переменную число равную 0
  	WHILE (i < 10) DO -- циклим до 10
  	  	INSERT INTO media_types ( name , created_at , updated_at  ) 
		values	(CONCAT('media types',i),CONCAT('2019.12.20',i),CONCAT('2020.01.20',(i+1)));
		-- используем конкацию для создания уникальных данных
   		 SET i = i + 1;
	 END WHILE;
END
//

CREATE PROCEDURE media()
BEGIN
	DECLARE i INT default 0; -- берем переменную число равную 0
  	WHILE (i < 100) DO -- циклим до 100
  		
  	  	INSERT INTO media ( media_type_id , user_id , body  ) 
		values	(FLOOR(RAND()*(10-1)+1), i+1 ,'iiiiiii');
		-- используем конкацию для создания уникальных данных
   		 SET i = i + 1;
	 END WHILE;
END
//

CREATE PROCEDURE messages()
BEGIN
	DECLARE i INT default 0; -- берем переменную число равную 0
  	WHILE (i < 100) DO -- циклим до 100
  		
  	  	INSERT INTO messages ( from_user_id , to_user_id , body ,created_at ) 
		values	(FLOOR(RAND()*(100-1)+1), FLOOR(RAND()*(100-1)+1) ,'iiiiiii',('1999.01.01'+ interval (i*5) month));
		-- используем конкацию для создания уникальных данных
   		 SET i = i + 1;
	 END WHILE;
END
//


CREATE PROCEDURE photo_albums()
BEGIN
	DECLARE i INT default 0; -- берем переменную число равную 0
  	WHILE (i < 10) DO -- циклим до 10
  		
  	  	INSERT INTO photo_albums ( name , user_id ) 
		values	(CONCAT('name_',i),FLOOR(RAND()*(100-1)+1));						
   		 SET i = i + 1;
	 END WHILE;
end
//

CREATE PROCEDURE other()
BEGIN
	DECLARE i INT default 0; -- берем переменную число равную 0
  	WHILE (i < 100) DO -- циклим до 100
  		
  	  	INSERT INTO communities ( name ) 
		values	(CONCAT('name_',i));		-- используем конкацию для создания уникальных данных
		
		INSERT INTO users_communities ( user_id ,community_id ) 
		values	(FLOOR(RAND()*(100-1)+1), i+1);	
	
		INSERT INTO friend_requests (initiator_user_id, target_user_id, status)
		VALUES (FLOOR(RAND()*(100-1)+1), FLOOR(RAND()*(100-1)+1), 'requested');
	
		INSERT INTO likes (user_id, media_id )
		VALUES (FLOOR(RAND()*(100-1)+1), FLOOR(RAND()*(100-1)+1));
	
		INSERT INTO photos (album_id, media_id )
		VALUES (FLOOR(RAND()*(10-1)+1), FLOOR(RAND()*(100-1)+1));
	
		
   		 SET i = i + 1;
	 END WHILE;
END
//




-- сгенерируем данные для  таблиц
CALL users_profiles // -- выполняем процедуры и заполняем данные
CALL media_types //
CALL media //
CALL messages //
CALL photo_albums //
CALL other //



























