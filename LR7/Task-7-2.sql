
/* Task-7-2. Создайте таблицу payments со структурой (payid INT PK, FK on booking.bookid; payment  DECIMAL. Добавьте в таблицу bookings поле payed, смысл которого оплачена или не оплачена аренда. Создайте триггеры, которые 
Запрещают удаление записей, если они уже оплачены;
После отметки оплаты, заносят в таблицу  payments запись с соответствующим значением PK и суммой оплаты,  для вычисления которой используется функция созданная в Task-7-1.
При отмене оплаты - удаляет соответствующую запись в таблице payments.    
Напишите скрипт, который отмечает, что все аренды июля 2012 года оплачены. Посчитайте (написав соответствующий скрипт) оплату на июль 2012 года двумя способами: 
используя данные таблицы payments
используя только функцию из Task-7-1 и данные таблицы bookings.
Сравните результаты расчета.
*/

USE cd;

DELIMITER //

CREATE PROCEDURE AddPaidColumn1()
BEGIN
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLSTATE '42S21' BEGIN END;
        ALTER TABLE bookings ADD COLUMN paid BOOLEAN DEFAULT FALSE;
    END;
END //

DELIMITER ;

CALL AddPaidColumn1();

DELIMITER //
CREATE TRIGGER DeletePaidBookings
BEFORE DELETE ON bookings
FOR EACH ROW
BEGIN
    IF OLD.paid THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete paid bookings';
    END IF;
END //
DELIMITER ;