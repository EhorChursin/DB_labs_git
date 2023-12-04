
/* Выберите процент использования объектов по месяцам, упорядочив по возрастанию */

USE cd;

SELECT 
    MONTH(bookings.starttime) AS Months,
    facilities.facility,
    (SUM(bookings.slots) / (COUNT(DISTINCT bookings.facid) * 720 * COUNT(DISTINCT YEAR(bookings.starttime)))) * 100 AS Percent

FROM bookings
JOIN facilities ON bookings.facid = facilities.facid 
GROUP BY Months, facilities.facility
ORDER BY Percent ASC;