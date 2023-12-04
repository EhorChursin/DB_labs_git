
/* Классифицируйте объекты на группы одинакового размера 
(высокие, средние и низкие в зависимости от их доходов). Упорядочите по 
классификации и названию объекта */

USE cd;

SELECT facility, 
CASE 
    WHEN incomegroup = 1 THEN 'Высокий доход'
    WHEN incomegroup = 2 THEN 'Средний доход'
    WHEN incomegroup = 3 THEN 'Низкий доход'
END AS "group"

FROM 

(SELECT 
    facilities.facility, 
    SUM(IF(bookings.memid = 0, facilities.guestcost * bookings.slots, facilities.membercost * bookings.slots)) AS revenue,
    NTILE(3) OVER (ORDER BY SUM(IF(bookings.memid = 0, facilities.guestcost * bookings.slots, facilities.membercost * bookings.slots))) AS incomegroup
  
FROM facilities 
INNER JOIN bookings ON facilities.facid = bookings.facid
GROUP BY facilities.facility
) as subquery

ORDER BY incomegroup, facility;