SELECT day, COUNT(id) AS number_of_assigments, SUM(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;