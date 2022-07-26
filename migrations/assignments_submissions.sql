CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
  );


CREATE TABLE assignment_submissions ( 
  id serial primary key not null, 
  assignment_id integer references assignments(id) ON DELETE CASCADE,
  student_id integer references students(id) ON DELETE cascade,
  duration integer, 
  submission_date date 
  );