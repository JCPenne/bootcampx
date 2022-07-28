SELECT COUNT(assistance_requests.*) as total_assistance, teachers.name as name
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
group by teachers.name;