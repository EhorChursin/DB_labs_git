
/* Составьте список трех крупнейших объектов, приносящих доход 
(включая связи). Вывод названия и ранга объекта, отсортированный по рангу и 
названию объекта. */

USE cd;

SELECT facilities.facility, RANK() OVER (ORDER BY SUM(IF(bookings.memid = 0, facilities.guestcost * bookings.slots, facilities.membercost * bookings.slots)) DESC) as ranks
FROM facilities
JOIN bookings ON facilities.facid = bookings.facid 
GROUP BY facilities.facility ORDER BY ranks, facilities.facility
LIMIT 3;