--1. Contare quanti iscritti ci sono stati ogni anno
--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
--3. Calcolare la media dei voti di ogni appello d'esame
--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

------------------------------------------------------------------------------


--1
SELECT YEAR(`enrolment_date`) as `anno`,
COUNT(`enrolment_date`) as `iscritti`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--2018=912
--2019=1709
--2020=1645
--2021=734

--2
SELECT COUNT(`id`) as `insegnanti`,
(`office_address`) as `ufficio`
FROM (`teachers`)
GROUP BY (`office_address`);

--Results = 29

--3

