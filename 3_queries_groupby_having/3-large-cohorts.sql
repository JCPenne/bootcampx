SELECT cohorts.name as cohort_name, COUNT(*) as total_students
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(*) >= 18
ORDER BY COUNT(*);