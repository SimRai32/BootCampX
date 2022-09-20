SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, completed_at-started_at AS total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN teachers ON teachers.id = teacher_id
JOIN assignments ON assignment_id = assignments.id
ORDER BY total_duration;