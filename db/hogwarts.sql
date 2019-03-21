DROP TABLE whizzies;
DROP TABLE houses;


CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  house_name VARCHAR(255)
);

CREATE TABLE whizzies(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house VARCHAR(255),
  age INT4,
  house_id INT4 REFERENCES houses(id) ON DELETE CASCADE
);
