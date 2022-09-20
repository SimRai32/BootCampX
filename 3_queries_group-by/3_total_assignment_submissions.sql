SELECT cohorts.name, COUNT(assignment_submissions.id) AS total_submissions
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;