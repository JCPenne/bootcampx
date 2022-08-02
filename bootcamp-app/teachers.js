const { Pool } = require('pg');
const process = require('process');
const arguments = process.argv.slice(2);
const cohortName = arguments[0];
const values = [`%${cohortName}%`];

const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
    FROM assistance_requests
    JOIN teachers on teachers.id = teacher_id
    JOIN students on students.id = student_id
    JOIN cohorts on cohorts.id = cohort_id
    WHERE cohorts.name LIKE $1
    GROUP BY teachers.name, cohorts.name
    ORDER BY teacher
`;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx',
});

pool
  .query(queryString, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
  })
  .catch(err => console.log('query error', err.stack));
