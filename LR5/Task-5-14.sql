
/* Выведите идентификатор объекта, в котором забронировано 
наибольшее количество мест (slot). Убедитесь, что в случае ничьей все 
результаты привязки будут выведены. */

USE cd;
WITH SlotCounts AS (
    SELECT facid, 
    SUM(slots) AS TotalSlots
    FROM bookings
    GROUP BY facid
)

SELECT facilities.facid AS FacilityID, facilities.facility AS FacilityName, SlotCounts.TotalSlots AS TotalReservedSlots
FROM facilities
JOIN SlotCounts ON facilities.facid = SlotCounts.facid
WHERE SlotCounts.TotalSlots = (SELECT MAX(TotalSlots) FROM SlotCounts);