
/* Рассчитайте для каждого члена количество рекомендаций, 
данных этим членом клуба, искючив членов, которые не давали 
рекомендаций. */

USE cd;

SELECT m1.memid AS "memid", m1.firstname AS "name", m1.surname AS "surname", COUNT(m2.memid) AS "recommended" 
FROM members m1 JOIN members m2 ON m1.memid = m2.recommendedby GROUP BY m1.memid, m1.firstname, m1.surname

