
/* Составьте список участников (включая гостей) вместе с количеством 
часов, которые они забронировали для объекта,  округленным до ближайших 
десяти часов. Ранжируйте их по этой округленной цифре, получая в результате 
имя, фамилию, округленные часы и звание. Сортировка по званию, фамилии и 
имени. */

USE cd;

SELECT CONCAT(members.firstname, ' ', members.surname) AS 'member', ROUND(SUM(COALESCE(bookings.slots / 2, 0)), -1) as 'Hours', RANK() OVER (ORDER BY ROUND(SUM(COALESCE(bookings.slots / 2, 0)), -1)) as ranks
FROM members LEFT JOIN bookings ON members.memid = bookings.memid 
GROUP BY members.memid
ORDER BY members.surname, members.firstname;