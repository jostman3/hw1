-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off
.width 30 20 20 20 
-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;


-- Create new tables, according to your domain model
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year_released INTEGER,
    director_id INTEGER,
    MPAA_rating TEXT
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cast_id INTEGER,
    movie_id INTEGER,
    role_name TEXT
);


-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
INSERT INTO people (name)
VALUES ('Christian Bale');
INSERT INTO people (name)
VALUES ('Michael Caine');
INSERT INTO people (name)
VALUES ('Liam Neeson');
INSERT INTO people (name)
VALUES ('Katie Holmes');
INSERT INTO people (name)
VALUES ('Gary Oldman');
INSERT INTO people (name)
VALUES ('Heath Ledger');
INSERT INTO people (name)
VALUES ('Aaron Eckhart');
INSERT INTO people (name)
VALUES ('Maggie Gyllenhaal');
INSERT INTO people (name)
VALUES ('Tom Hardy');
INSERT INTO people (name)
VALUES ('Joseph Gordon-Levitt');
INSERT INTO people (name)
VALUES ('Anne Hathaway');
INSERT INTO people (name)
VALUES ('Christopher Nolan');

INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(1, 1, 'Bruce Wayne');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(2, 1, 'Alfred');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(3, 1, 'Ras Al Ghul');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(4, 1, 'Rachel Dawes');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(5, 1, 'Commissioner Gordon');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(1, 2, 'Bruce Wayne');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(6, 2, 'Joker');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(7, 2, 'Harvey Dent');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(2, 2, 'Alfred');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(8, 2, 'Rachel Dawes');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(1, 3, 'Bruce Wayne');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(5, 3, 'Commissioner Gordon');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(9, 3, 'Bane');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(10, 3, 'John Blake');
INSERT INTO roles (cast_id, movie_id, role_name)
VALUES(11, 3, 'Selina Kyle');

INSERT INTO movies (title, year_released, director_id, MPAA_rating)
VALUES ('Batman Begins', 2005, 12, 'PG-13');
INSERT INTO movies (title, year_released, director_id, MPAA_rating)
VALUES ('The Dark Knight', 2008, 12, 'PG-13');
INSERT INTO movies (title, year_released, director_id, MPAA_rating)
VALUES ('The Dark Knight Rises', 2012, 12, 'PG-13');

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
SELECT movies.title, movies.year_released, movies.MPAA_rating, people.name FROM movies INNER JOIN people ON movies.director_id = people.id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!

SELECT movies.title, people.name, roles.role_name FROM roles
    INNER JOIN movies ON movies.id = roles.movie_id
    INNER JOIN people ON people.id = roles.cast_id;
