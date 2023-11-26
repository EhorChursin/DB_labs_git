
/* Составьте список общего количества бронирований на каждый 
объект в месяц в 2012 году. */

USE cd;

SELECT EXTRACT(MONTH FROM starttime) AS "month", bookings.facid, COUNT(*) AS "bookings"
FROM bookings
WHERE YEAR(starttime) = 2012
GROUP BY MONTH, facid;