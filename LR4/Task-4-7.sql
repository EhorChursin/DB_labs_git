/* удаляем все данные из таблицы bookings, а потом возвращаем их обратно */

USE cd;
START TRANSACTION;
/* удаляем все данные из таблицы bookings */

DELETE FROM bookings;
SELECT * FROM bookings;
/* отменяем все предыдущие изменения */

ROLLBACK;
SELECT * FROM bookings;
/* Когда мы удалили все данный таблица стала пустой, а когда отменили изменения, все вернулось в норму. */
