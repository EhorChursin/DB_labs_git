/*стоимость месячного обслуживания. Делаем выборку по объектам, задав условия membercost <= monthlymaintenance / 50  и membercost !=0*/
USE cd;
SELECT facility FROM facilities WHERE membercost <= monthlymaintenance/50 AND membercost !=0;
