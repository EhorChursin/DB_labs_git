/*Делаем объединие по именам членов клуба и названиям объектов.
Первый столбец отвечает за объединие имен членов клуба и названия объектов.
Второй столбец отвечает за то, откуда были взяты они(из members или facilities).*/
USE cd;
SELECT firstname AS "union", "member" AS "members/facilies" FROM members WHERE firstname !="GUEST"
UNION ALL
SELECT facility, "facility" FROM facilities;
