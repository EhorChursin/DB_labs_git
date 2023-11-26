
/* Создайте список объектов с общим доходом менее 1000. 
Создайте выходную таблицу, состоящую из названия объекта и дохода, 
отсортированного по доходу. Помните, что для гостей и участников 
действуют разные цены! */

USE cd;

SELECT facility, SUM(

CASE WHEN 
    bookings.memid = 0 THEN facilities.guestcost
ELSE
    facilities.membercost
END) AS "total revenue"

FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
GROUP BY facility HAVING "total revenue" < 1000 ORDER BY "total revenue";