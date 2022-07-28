SELECT students.name as student, AVG(assignment_submissions.duration) as avg_assignment_duration, AVG(assignments.duration) as avg_suggested_duration
FROM assignment_submissions
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY avg_assignment_duration;