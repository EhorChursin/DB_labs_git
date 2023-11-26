
/* Создайте список общего количества мест, забронированных на 
один объект в месяц в 2012 году. Включите выходные строки, содержащие 
итоговые суммы за все месяцы по каждому объекту а также итоговые 
суммы за все месяцы для всех объектов. Выходная таблица должна 
состоять из идентификатора объекта, месяца и слотов, отсортированных по 
идентификатору и месяцу. При вычислении агрегированных значений для 
всех месяцев и всех facid возвращайте нулевые значения в столбцах 
месяца и facid. */

USE cd;

SELECT 
    IFNULL(derived_table.facid, 'Total') as facid, 
    IFNULL(derived_table.month, 'Total') as month, 
    SUM(derived_table.slots) AS 'Забронированные места'

FROM 

    (
        SELECT facilities.facid AS facid, MONTH(bookings.starttime) AS "month", SUM(bookings.slots) as slots
        FROM facilities
        INNER JOIN bookings ON facilities.facid = bookings.facid
        WHERE YEAR(bookings.starttime) = 2012
        GROUP BY facid, month, slots
        
    ) AS derived_table

GROUP BY facid, month WITH ROLLUP;
