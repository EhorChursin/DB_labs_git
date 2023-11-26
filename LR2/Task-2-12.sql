/*Находим дату последней регистрации(MAX(joindate))*/
USE cd;
SELECT MAX(joindate) FROM members;
