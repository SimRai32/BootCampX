SELECT average_times.group_name AS name, MAX(average_times.average_assistance_time) as max_assistance_time
FROM (SELECT cohorts.name AS group_name, AVG(completed_at-started_at) AS average_assistance_time
FROM cohorts
JOIN students ON cohort_id = cohorts.id
JOIN assistance_requests ON student_id = students.id
GROUP BY cohorts.name) as average_times
GROUP BY average_times.group_name
ORDER BY max_assistance_time DESC
LIMIT 1;



