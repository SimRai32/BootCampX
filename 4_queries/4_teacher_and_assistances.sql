SELECT total.teacher, total.total_assistances, cohorts.name
FROM cohorts, (
  SELECT teachers.name AS teacher,COUNT(assistance_requests.*) AS total_assistances
  FROM cohorts
  JOIN students ON cohort_id = cohorts.id
  JOIN assistance_requests ON student_id = students.id
  JOIN teachers ON teachers.id = teacher_id
  WHERE cohorts.name = 'JUL02'
  GROUP BY teachers.name
  ORDER BY teacher
) AS total
WHERE cohorts.name = 'JUL02'