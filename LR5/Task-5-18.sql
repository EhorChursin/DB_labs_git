
/*  Для каждого дня августа 2012 года рассчитайте скользящее 
среднее общего дохода за предыдущие 15 дней. Вывод должен содержать 
столбцы даты и дохода, отсортированные по дате. Не забудьте учесть 
возможность того, что в день будет нулевой доход.  */

USE cd;

SET @start_date = '2012-08-01';
SET @end_date = '2012-08-31';
SET @Count = 15;

WITH RECURSIVE RecursiveDates(SelectDate) AS
(
    SELECT @start_date as SelectDate
    UNION ALL
    SELECT DATE_ADD(SelectDate, INTERVAL 1 day) FROM RecursiveDates WHERE SelectDate < @end_date
)

SELECT SelectDate, Income / @Count as MovingAverage FROM 

    (SELECT 
        SelectDate, SUM(facilities.membercost * bookings.slots + facilities.guestcost * bookings.slots) as Income
        FROM RecursiveDates
        LEFT JOIN bookings ON DATE(bookings.starttime) = RecursiveDates.SelectDate
        LEFT JOIN facilities ON bookings.facid = facilities.facid
        WHERE RecursiveDates.SelectDate >= DATE_SUB(@start_date, INTERVAL 14 DAY) AND RecursiveDates.SelectDate <= @end_date
        GROUP BY SelectDate
    ) AS Income

ORDER BY SelectDate;