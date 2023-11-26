
/* Рассчитайте количество аренд каждого из объектов клуба. */

USE cd;

SELECT facility, COUNT(bookings.facid)
FROM facilities JOIN bookings ON bookings.facid = facilities.facid
GROUP BY facilities.facid, facilities.facility;