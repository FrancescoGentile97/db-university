--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--relativo dipartimento, in ordine alfabetico per cognome e nome
--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

---------------------------------------------------------------------------------------------------------------------------


--1
SELECT `students`.`name` as "nome",
`students`.`surname` as "cognome",
`degrees`.`name` as "nome corso"
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` LIKE "%economia%";

-- Results = 262

--2
SELECT * FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` LIKE "%neuroscienze%"
AND `degrees`.`level` = "magistrale";

--Result = 1

--3
SELECT * FROM `course_teacher`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teacher_id` = 44;

--Results = 11

--4
SELECT * FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN 	`departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`,
`students`.`name`;

--5
SELECT * FROM `degrees`
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`

--6
SELECT `teachers`.`name` as `nome`,`teachers`.`surname` as `cognome`, `teachers`.`id`,`departments`.`name` as `dipartimento`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica"
GROUP BY `teachers`.`id`;

--Results = 54 

--7 

--?