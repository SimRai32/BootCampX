SELECT cohorts.name, COUNT(students.cohort_id) AS student_total
FROM students 
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.cohort_id) > 17
ORDER BY COUNT(students.cohort_id);
