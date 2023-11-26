
/* Рассчитайте количество аренд каждого из объектов клуба за 
сентябрь 2012 года. */ 

USE cd;

SELECT facilities.facility, bookings.facid, SUM(bookings.slots) 
FROM bookings 
JOIN facilities ON bookings.facid = facilities.facid 
WHERE starttime > '2012-08-31' AND starttime <= '2012-09-30'  
GROUP BY facid; 