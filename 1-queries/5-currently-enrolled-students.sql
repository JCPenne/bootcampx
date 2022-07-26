SELECT  name
       ,id
       ,cohort_id
FROM students
WHERE end_date is null
ORDER BY cohort_id;