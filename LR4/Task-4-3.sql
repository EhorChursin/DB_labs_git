/* Добавьте еще одно spa с такими же характеристиками как в задании 1 */

USE cd;



/* INSERT INTO facilities (facid, facility, membercost, guestcost, initialoutlay,monthlymaintenance ) */
SELECT (SELECT MAX(facid) + 1 FROM facilities), facility, membercost, guestcost, initialoutlay,monthlymaintenance  
FROM facilities WHERE facility = "SPA" LIMIT 1;

SELECT * FROM facilities;
