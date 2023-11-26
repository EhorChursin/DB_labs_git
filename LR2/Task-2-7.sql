/*Делаем выборку, чтобы выбрались объекты с facid=1 и facid=5*/
USE cd;
SELECT * FROM facilities WHERE facid IN (5,1);
