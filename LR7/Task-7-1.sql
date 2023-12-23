
/* Task-7-1. Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings).  */

USE cd;

DELIMITER //
CREATE FUNCTION CalculateRent(BookId INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE cost DECIMAL(10, 2);
    SELECT (slots * CASE WHEN memid IS NULL THEN guestcost ELSE membercost END) INTO cost
    FROM bookings
    WHERE bookid = BookId;
    RETURN cost;
END; 
//
DELIMITER ;