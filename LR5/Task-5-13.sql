
/* Создайте монотонно увеличивающийся нумерованный список 
участников (включая гостей), упорядоченный по дате присоединения. 
Помните, что идентификаторы участников не обязательно будут 
последовательными. */

USE cd;

SELECT ROW_NUMBER() OVER (ORDER BY joindate) AS JoinNumber, memid, firstname, surname
FROM members
ORDER BY JoinNumber;
