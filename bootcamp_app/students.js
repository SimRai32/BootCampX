const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'vagrant'
});

const args = process.argv.slice(2);
pool.query(`
SELECT students.id, students.name, cohorts.name AS cohorts_name
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '${args[0]}%'
LIMIT ${args[1] || 5};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohorts_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));