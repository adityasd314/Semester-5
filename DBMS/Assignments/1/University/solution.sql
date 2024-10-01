-- Statement: Write the simple SQL queries on the given schema.
-- A.	Write the following simple SQL Queries on the University Schema.
-- •	Find the names of all the students whose total credits are greater than 100 .
SELECT name FROM student WHERE tot_cred > 100;
-- •	Find the course id and grades of all courses taken by any student named 'Tanaka'.
SELECT course_id, grade FROM takes WHERE ID = (SELECT ID FROM student WHERE name = 'Tanaka');
-- •	Find the courses which are offered in both 'Fall' and 'Spring' semester (not necessarily in the same year).
SELECT course_id FROM section WHERE semester = 'Fall' AND course_id IN (SELECT course_id FROM section WHERE semester = 'Spring');
-- •	Find the names of all the instructors from Comp. Sci. department.
SELECT name FROM instructor WHERE dept_name = 'Comp. Sci.';
-- •	Find the course id and titles of all courses taught by an instructor named 'Srinivasan'
SELECT course_id, title FROM course WHERE course_id IN (SELECT course_id FROM section WHERE instructor_id = (SELECT ID FROM instructor WHERE name = 'Srinivasan'));
-- •	Find the names of instructors who have taught at least one course in Spring 2009.
SELECT name FROM instructor WHERE ID IN (SELECT instructor_id FROM section WHERE semester = 'Spring' AND year = 2009);
-- B.	Create the Railway schema using the commands in the Railway DDL  script; The DDL script also contains a description of the railway Schema. Insert sample data using the command in the file SampleRailwayData.

-- Write the following Queries for Railway Schema.
-- •	Find pairs of stations (station codes) that have a track (direct connection) with distance less than 20Kms between them.
SELECT s1.station_code, s2.station_code FROM station s1, station s2, track t WHERE s1.station_code = t.station_code1 AND s2.station_code = t.station_code2 AND t.distance < 20;
-- •	Find the IDs of all the trains which have a stop at THANE
SELECT train_id FROM stops_at WHERE station_code = 'THANE';
-- •	Find the names of all trains that start at MUMBAI.
SELECT name FROM train WHERE train_id IN (SELECT train_id FROM stops_at WHERE station_code = 'MUMBAI' AND stop_number = 1);
-- •	List all the stations in order of visit by the train 'CST-AMR_LOCAL'.
SELECT station_code FROM stops_at WHERE train_id = 'CST-AMR_LOCAL' ORDER BY stop_number;
