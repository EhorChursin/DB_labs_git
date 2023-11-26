/*делаем выборку по фамилии, имени, даты вступления последнего из вступивших*/
USE cd;
SELECT surname,firstname,joindate FROM members WHERE joindate= (SELECT MAX(joindate) FROM members);
