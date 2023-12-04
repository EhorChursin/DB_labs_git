
/* Выберите количество аренд объектов клуба в каждый месяц. */

USE cd;

SELECT YEAR(bookings.starttime)AS "Year",MONTH(bookings.starttime) AS "Month", COUNT(*) AS "Count"
from bookings 
JOIN facilities ON bookings.facid = facilities.facid
GROUP BY month(bookings.starttime), year(bookings.starttime);