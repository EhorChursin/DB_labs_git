/* Рассчитайте количество зарегистрированных объектов в 
теннисном клубе. */

USE cd;
SELECT COUNT (DISTINCT facility)
FROM facilities;