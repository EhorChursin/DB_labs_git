
/* Найдите общее количество участников (члены + гости), 
совершивших хотя бы одно бронирование.   */

USE cd;

SELECT COUNT(DISTINCT memid) FROM bookings;