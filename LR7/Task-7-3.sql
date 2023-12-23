
/* Task-7-3. Напишите процедуру, которая считает окупаемость каждого объекта клуба на основании оплаты аренд за месяц. Применить ее к июлю 2012 года.  */

USE cd;

DELIMITER //
CREATE PROCEDURE CalculateProfitability(IN monthYear DATE)
BEGIN
    DECLARE totalCost DECIMAL(10, 2);
    DECLARE totalIncome DECIMAL(10, 2);

    SELECT SUM(initialoutlay + (monthlymaintenance * DATEDIFF(month(now()), monthYear)))
    INTO totalCost
    FROM facilities;

    SELECT SUM(payment)
    INTO totalIncome
    FROM payments
    JOIN bookings ON payments.bookid = bookings.bookid
    WHERE MONTH(bookings.starttime) = MONTH(monthYear) AND YEAR(bookings.starttime) = YEAR(monthYear);

    SELECT totalIncome - totalCost AS Profitability;
END;
//
DELIMITER ;