
/* Составьте список имен и идентификаторов каждого участника, а 
также их первого бронирования после 1 сентября 2012 г. Упорядочите по 
идентификатору участника. */ 

USE cd;

SELECT members.memid, members.firstname AS "name", members.surname, MIN(bookings.starttime) AS "FirstDate"
FROM members
LEFT JOIN bookings ON members.memid = bookings.memid
WHERE DATE(bookings.starttime) > '2012-09-01'
GROUP BY members.memid, members.firstname, members.surname ORDER BY members.memid;