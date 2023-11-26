/* Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2. */
USE cd;
SELECT DISTINCT surname, firstname FROM members
JOIN bookings ON members.memid = bookings.memid
/*WHERE bookid IN (1,2)*/
JOIN facilities ON facilities.facid = bookings.facid
WHERE facility LIKE "%Court 1%" OR facility LIKE "%Court 2%"
