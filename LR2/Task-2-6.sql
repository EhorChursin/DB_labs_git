/*Делаем выборку, чтобы объекты включали в себя слово "Tennis" ("%Tennis%")*/
USE cd;
SELECT facility FROM facilities WHERE facility LIKE "%Tennis%";
