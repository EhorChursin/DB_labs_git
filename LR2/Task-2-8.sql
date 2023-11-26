/*Делаем выборку по качетсвенной стоимости*/
USE cd;
/*Качетсвенная стоимость==дешевый*/
SELECT facility, "дешевый" AS "качественная стоимость" FROM facilities WHERE monthlymaintenance<100 UNION
/*Качественная стоимость==дорогой*/
SELECT facility, "дорогой" FROM facilities WHERE monthlymaintenance>=100;
