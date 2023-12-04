
/* Составьте список объектов вместе с их общим доходом. Выходная 
таблица должна состоять из названия объекта и доходов, отсортированных 
по доходам. Помните, что для гостей и участников действуют разные цены! */

USE cd;

SELECT facility, SUM(
    
CASE WHEN bookings.memid = 0 THEN 
    facilities.guestcost * bookings.slots 
ELSE
    facilities.membercost * bookings.slots
END) AS "total revenue"

FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
GROUP BY facility ORDER BY "total revenue" DESC;