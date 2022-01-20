-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);  

INSERT INTO moons (name) VALUES 
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'), 
  ('Despina'), 
  ('Galatea'), 
  ('Larissa'), 
  ('S/2004 N 1'), 
  ('Proteus'), 
  ('Triton'), 
  ('Nereid'), 
  ('Halimede'), 
  ('Sao'), 
  ('Laomedeia'),
  ('Psamathe'), 
  ('Neso'); 

CREATE TABLE planets_moons(
   planet_name TEXT REFERENCES planets(name),
   moon_name TEXT REFERENCES moons(name)
 );  

INSERT INTO planets_moons 
  (planet_name, moon_name)
VALUES
  ('Earth', 'The Moon'),
  ('Mars', 'Phobos'),
  ('Mars', 'Deimos'),
  ('Neptune', 'Naiad'),
  ('Neptune', 'Thalassa'), 
  ('Neptune', 'Despina'), 
  ('Neptune', 'Galatea'), 
  ('Neptune', 'Larissa'), 
  ('Neptune', 'S/2004 N 1'), 
  ('Neptune', 'Proteus'), 
  ('Neptune', 'Triton'), 
  ('Neptune', 'Nereid'), 
  ('Neptune', 'Halimede'), 
  ('Neptune', 'Sao'), 
  ('Neptune', 'Laomedeia'),
  ('Neptune', 'Psamathe'), 
  ('Neptune', 'Neso'); 




