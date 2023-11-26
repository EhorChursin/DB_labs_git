
/* Составьте список общего количества часов, забронированных на 
один объект, помня, что интервал длится полчаса. Выходная таблица 
должна состоять из идентификатора объекта, имени и забронированных 
часов, отсортированных по идентификатору объекта. Попробуйте 
отформатировать часы с точностью до двух десятичных знаков. */

USE cd;

SELECT facilities.facid, facilities.facility, ROUND(SUM(bookings.slots) , 2)  AS "Hours"
FROM facilities 
JOIN bookings ON facilities .facid = bookings.facid
GROUP BY facilities.facid, facilities.facility ORDER BY facilities.facid;