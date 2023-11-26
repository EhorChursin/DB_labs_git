/* Рассчитайте количество зарегистрированных объектов в 
теннисном клубе, стоимость аренды гостя в котором не менее 10. */

USE cd;
SELECT COUNT (DISTINCT facility) 
FROM facilities WHERE facilities.guestcost > 10;