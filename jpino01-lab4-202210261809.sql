-- Lab 4
-- jpino01
-- Oct 26, 2022

USE `STUDENTS`;
-- STUDENTS-1
-- Find all students who study in classroom 111. For each student list first and last name. Sort the output by the last name of the student.
-- display all tables in DataBase
-- SHOW FULL TABLES;

-- display the content from list table
-- SELECT * FROM list;

-- select columns FirstName and LastName
SELECT DISTINCT FirstName, LastName
-- from table list
FROM list
-- get values from above columns where classroom is 111
WHERE classroom = 111
-- order by lastname in ascending order
ORDER BY LastName ASC;


USE `STUDENTS`;
-- STUDENTS-2
-- For each classroom report the grade that is taught in it. Report just the classroom number and the grade number. Sort output by classroom in descending order.
-- select distinct values from columns classroom and grade (no duplicates)
SELECT DISTINCT classroom, grade
-- from list table
FROM list
-- order by classroom in descending order
ORDER BY classroom DESC;


USE `STUDENTS`;
-- STUDENTS-3
-- Find all teachers who teach fifth grade. Report first and last name of the teachers and the room number. Sort the output by room number.
-- SELECT * FROM list;

-- find distinct values from first, last, and classroom columns in teacher table
SELECT DISTINCT teachers.First, teachers.Last, teachers.classroom
-- natural join based on Classroom 
FROM teachers INNER JOIN list ON teachers.classroom = list.classroom
-- get values where grade is 5
WHERE list.grade = 5;


USE `STUDENTS`;
-- STUDENTS-4
-- Find all students taught by OTHA MOYER. Output first and last names of students sorted in alphabetical order by their last name.
-- SELECT * FROM list;
-- SELECT * FROM teachers;

-- select attributes (column names)
SELECT DISTINCT FirstName, LastName
-- natural join list and teachers (find common attributes)
FROM list NATURAL JOIN teachers
-- where teacher is OTHA MOYER
WHERE teachers.first = "OTHA" AND teachers.last = "MOYER"
-- order by ascending order of student last name
ORDER BY LastName ASC;


USE `STUDENTS`;
-- STUDENTS-5
-- For each teacher teaching grades K through 3, report the grade (s)he teaches. Output teacher last name, first name, and grade. Each name has to be reported exactly once. Sort the output by grade and alphabetically by teacher’s last name for each grade.
-- SELECT * FROM list;
-- SELECT * FROM teachers;

-- select distinct (no dups) attributes
SELECT DISTINCT teachers.Last, teachers.First, list.grade
-- natural join teachers and list (find common attributes) (classroom)
FROM teachers NATURAL JOIN list
-- filter join clause by k - 3 grades
WHERE list.grade >= 0 AND list.grade <= 3
-- sort by output of grade and teachers last name
ORDER BY list.grade ASC, teachers.Last ASC;


USE `BAKERY`;
-- BAKERY-1
-- Find all chocolate-flavored items on the menu whose price is under $5.00. For each item output the flavor, the name (food type) of the item, and the price. Sort your output in descending order by price.
-- SHOW tables;

-- SELECT * FROM customers;
-- SELECT * FROM goods;
-- SELECT * FROM items;
-- SELECT * FROM receipts;

-- get attributes
SELECT DISTINCT Flavor, Food, Price
-- from goods table
FROM goods
-- where flavor equals chocolate and price is below 5
WHERE Flavor = "Chocolate" AND Price < 5
-- sort by price (descending)
ORDER BY Price DESC;


USE `BAKERY`;
-- BAKERY-2
-- Report the prices of the following items (a) any cookie priced above $1.10, (b) any lemon-flavored items, or (c) any apple-flavored item except for the pie. Output the flavor, the name (food type) and the price of each pastry. Sort the output in alphabetical order by the flavor and then pastry name.
-- SELECT * FROM customers;
-- SELECT * FROM goods;
-- SELECT * FROM items;
-- SELECT * FROM receipts;

-- select attributes (column names of table goods)
SELECT DISTINCT Flavor, Food, Price
-- from table goods
FROM goods
-- filter condition
WHERE (Food = "Cookie" AND Price > 1.10) OR (Flavor = "Lemon") OR (Flavor = "Apple" AND Food != "Pie")
-- sort by flavor and food ascending
ORDER BY Flavor ASC, Food ASC;


USE `BAKERY`;
-- BAKERY-3
-- Find all customers who made a purchase on October 3, 2007. Report the name of the customer (last, first). Sort the output in alphabetical order by the customer’s last name. Each customer name must appear at most once.
-- SELECT * FROM customers;
-- SELECT * FROM goods;
-- SELECT * FROM items;
-- SELECT * FROM receipts;

SELECT DISTINCT customers.LastName, customers.FirstName
-- match up common attributes and their values
FROM customers INNER JOIN receipts ON customers.CId = receipts.Customer
-- filter by date sold October 3, 2007
WHERE receipts.SaleDate = "2007-10-03"
-- sort by customer last name (ascending)
ORDER BY customers.LastName ASC;


USE `BAKERY`;
-- BAKERY-4
-- Find all different cakes purchased on October 4, 2007. Each cake (flavor, food) is to be listed once. Sort output in alphabetical order by the cake flavor.
-- SELECT * FROM customers;
-- SELECT * FROM goods;
-- SELECT * FROM items;
-- SELECT * FROM receipts;

-- select distinct (no dups) column Flavor and Food
SELECT DISTINCT goods.Flavor, goods.Food
-- from table goods
FROM goods
-- join on items.Item and goods.GId (same data type)
INNER JOIN items ON items.Item = goods.GId
-- join receipts.RNumber and items.Receipt
INNER JOIN receipts ON receipts.RNumber = items.Receipt
-- condition of saleDate is October 4, 2007 and Food is Cake
WHERE receipts.SaleDate = "2007-10-04" AND goods.Food = "Cake"
-- sort on goods.Flavor in ascending order
ORDER BY goods.Flavor ASC;


USE `BAKERY`;
-- BAKERY-5
-- List all pastries purchased by ARIANE CRUZEN on October 25, 2007. For each pastry, specify its flavor and type, as well as the price. Output the pastries in the order in which they appear on the receipt (each pastry needs to appear the number of times it was purchased).
-- SELECT * FROM customers;
-- SELECT * FROM goods;
-- SELECT * FROM items;
-- SELECT * FROM receipts;

-- select distinct columns Flavor, Food, Price
SELECT DISTINCT goods.Flavor, goods.Food, goods.Price
-- from table goods
FROM goods
-- join items on condition (both same type of data)
JOIN items ON goods.GId = items.Item
-- join receipts on condition (both same type of data)
JOIN receipts ON items.Receipt = receipts.RNumber
-- join customers on condition (both same type of data)
JOIN customers ON receipts.Customer = customers.CId
-- filter selected columns
WHERE customers.LastName = "CRUZEN" AND customers.FirstName = "ARIANE" AND receipts.SaleDate = "2007-10-25";


USE `BAKERY`;
-- BAKERY-6
-- Find all types of cookies purchased by KIP ARNN during the month of October of 2007. Report each cookie type (flavor, food type) exactly once in alphabetical order by flavor.

-- SELECT * FROM customers;
-- SELECT * FROM goods;
-- SELECT * FROM items;
-- SELECT * FROM receipts;

-- select distinct columns Flavor, Food
SELECT DISTINCT goods.Flavor, goods.Food
-- from table goods
FROM goods
-- join items on condition (both same type of data)
JOIN items ON goods.GId = items.Item
-- join receipts on condition (both same type of data)
JOIN receipts ON items.Receipt = receipts.RNumber
-- join customers on condition (both same type of data)
JOIN customers ON receipts.Customer = customers.CId
-- filter columns by condition below
WHERE customers.LastName = "ARNN" AND customers.FirstName = "KIP" AND goods.Food = "Cookie"
-- sort by goods.Flavor in ascending order
ORDER BY goods.Flavor ASC;


USE `CSU`;
-- CSU-1
-- Report all campuses from Los Angeles county. Output the full name of campus in alphabetical order.
-- display all tables in DataBase
-- SHOW FULL TABLES;
-- SELECT * FROM campuses;

-- select column
SELECT DISTINCT Campus 
-- from campuses table
FROM campuses
-- filter by condition below
WHERE County = "Los Angeles"
-- sort by campus name in ascending order
ORDER BY Campus ASC;


USE `CSU`;
-- CSU-2
-- For each year between 1994 and 2000 (inclusive) report the number of students who graduated from California Maritime Academy Output the year and the number of degrees granted. Sort output by year.
-- display all tables in DataBase
-- SHOW FULL TABLES;

-- show contents of table
-- SELECT * FROM campuses;
-- SELECT * FROM degrees;
-- SELECT * FROM discEnr;
-- SELECT * FROM disciplines;
-- SELECT * FROM enrollments;
-- SELECT * FROM faculty;
-- SELECT * FROM fees;

-- select columns year and degrees
SELECT DISTINCT degrees.year, degrees.degrees
-- from table degrees
FROM degrees
-- join campuses on condition below (both same data type)
JOIN campuses ON campuses.Id = degrees.CampusId
-- filter columns based on condtions below
WHERE degrees.year >= 1994 AND degrees.year <= 2000 AND campuses.Campus = "California Maritime Academy"
-- sort by degree year in ascending order
ORDER BY degrees.YEAR ASC;


USE `CSU`;
-- CSU-3
-- Report undergraduate and graduate enrollments (as two numbers) in ’Mathematics’, ’Engineering’ and ’Computer and Info. Sciences’ disciplines for both Polytechnic universities of the CSU system in 2004. Output the name of the campus, the discipline and the number of graduate and the number of undergraduate students enrolled. Sort output by campus name, and by discipline for each campus.
-- show contents of table
-- SELECT * FROM campuses;
-- SELECT * FROM degrees;
-- SELECT * FROM discEnr;
-- SELECT * FROM disciplines;
-- SELECT * FROM enrollments;
-- SELECT * FROM faculty;
-- SELECT * FROM fees;

-- select columns from tables that are joined below
SELECT DISTINCT campuses.Campus, disciplines.name, discEnr.Gr, discEnr.Ug
FROM campuses
JOIN discEnr ON campuses.Id = discEnr.CampusId
JOIN disciplines ON discEnr.Discipline = disciplines.Id
-- filter selected columns by condition
WHERE (disciplines.Name = "Mathematics" OR disciplines.Name = "Engineering" OR disciplines.Name = "Computer and Info. Sciences") AND (discEnr.Year = 2004) AND (campuses.Campus = 'California State Polytechnic University-Pomona' OR campuses.Campus = "California Polytechnic State University-San Luis Obispo")
-- order by campus name
ORDER BY campuses.Campus, disciplines.name ASC;


USE `CSU`;
-- CSU-4
-- Report graduate enrollments in 2004 in ’Agriculture’ and ’Biological Sciences’ for any university that offers graduate studies in both disciplines. Report one line per university (with the two grad. enrollment numbers in separate columns), sort universities in descending order by the number of ’Agriculture’ graduate students.
-- show contents of table
-- SELECT * FROM campuses;
-- SELECT * FROM degrees;
-- SELECT * FROM discEnr;
-- SELECT * FROM disciplines;
-- SELECT * FROM enrollments;
-- SELECT * FROM faculty;
-- SELECT * FROM fees;

-- select distinct columns
SELECT DISTINCT campuses.Campus, AgDE.Gr AS "Agriculture", discEnr.Gr AS "Biological Sciences"
FROM campuses
-- self join two tables
-- biology tables
JOIN discEnr ON campuses.Id = discEnr.CampusId
JOIN disciplines ON discEnr.Discipline = disciplines.Id
-- agriculture tables
JOIN discEnr AS AgDE ON campuses.Id = AgDE.CampusId
JOIN disciplines AS AgD ON AgDE.Discipline = AgD.Id
-- filter columns by condition below (need a set of 2 for each condition)
WHERE (discEnr.Year = 2004 AND AgDE.Year = 2004) AND (discEnr.GR > 0 AND AgDE.GR > 0) AND (disciplines.Name = "Biological Sciences" AND AgD.Name = "Agriculture")
-- sort by Ag gradutate student number in descending order
ORDER BY AgDE.Gr DESC;


USE `CSU`;
-- CSU-5
-- Find all disciplines and campuses where graduate enrollment in 2004 was at least three times higher than undergraduate enrollment. Report campus names, discipline names, and both enrollment counts. Sort output by campus name, then by discipline name in alphabetical order.
-- show contents of table
-- SELECT * FROM campuses;
-- SELECT * FROM degrees;
-- SELECT * FROM discEnr;
-- SELECT * FROM disciplines;
-- SELECT * FROM enrollments;
-- SELECT * FROM faculty;
-- SELECT * FROM fees;

-- select distinct (no dups) columns 
SELECT DISTINCT campuses.Campus, disciplines.Name, discEnr.Ug, discEnr.Gr
-- from tables joined below
FROM campuses
-- join table on same data types that form relationships with each other
JOIN discEnr ON campuses.Id = discEnr.CampusId
JOIN disciplines ON discEnr.Discipline = disciplines.Id
-- filter rows values by conditions stated below
WHERE discEnr.Year = 2004 AND discEnr.Ug * 3 < discEnr.Gr
-- order by campuses then discipline name
ORDER BY campuses.Campus, disciplines.Name;


USE `CSU`;
-- CSU-6
-- Report the amount of money collected from student fees (use the full-time equivalent enrollment for computations) at ’Fresno State University’ for each year between 2002 and 2004 inclusively, and the amount of money (rounded to the nearest penny) collected from student fees per each full-time equivalent faculty. Output the year, the two computed numbers sorted chronologically by year.
SELECT DISTINCT fees.Year, ROUND((fee * enrollments.FTE),2) AS "Collected" , ROUND((((fee * enrollments.FTE) / faculty.FTE)),2) AS "Per Faculty"
FROM campuses
JOIN enrollments ON campuses.Id = enrollments.CampusId 
JOIN faculty ON faculty.CampusId = campuses.Id AND enrollments.Year = faculty.Year
JOIN fees ON campuses.Id = fees.CampusId AND faculty.Year = fees.Year
WHERE (campuses.Campus = "Fresno State University") AND (fees.Year >= 2002 AND fees.Year <= 2004)
-- ORDER BY enrollments.Year, fees.Year ASC

-- (fees.fee * enrollments.FTE) AS "Collected" , (((fees.fee * enrollments.FTE) / faculty.FTE)) AS "Per Faculty"
-- AND (fees.Year >= 2002 AND fees.Year <= 2004) AND (enrollments.Year >= 2002 AND enrollments.Year <= 2004);


USE `CSU`;
-- CSU-7
-- Find all campuses where enrollment in 2003 (use the FTE numbers), was higher than the 2003 enrollment in ’San Jose State University’. Report the name of campus, the 2003 enrollment number, the number of faculty teaching that year, and the student-to-faculty ratio, rounded to one decimal place. Sort output in ascending order by student-to-faculty ratio.
-- show contents of table
-- SELECT * FROM campuses;
-- SELECT * FROM degrees;
-- SELECT * FROM discEnr;
-- SELECT * FROM disciplines;
-- SELECT * FROM enrollments;
-- SELECT * FROM faculty;
-- SELECT * FROM fees;

-- sjsu code = 19, fte in 2003 = 21027

-- ASK: about where to place condition on the ON clause or WHERE clause???????

-- select columns 
SELECT DISTINCT otherCampus.Campus, otherEnroll.FTE AS "STUDENTS", otherFac.FTE AS "Faculty", ROUND((otherEnroll.FTE / otherFac.FTE), 1) AS "RATIO"
-- from tables that are joined
FROM enrollments
-- sjsu tables
JOIN campuses AS sjsuCampus ON sjsuCampus.Campus = "San Jose State University"
-- join on year 2003
JOIN enrollments AS sjsuEnroll ON sjsuCampus.Id = sjsuEnroll.CampusId AND sjsuEnroll.Year = 2003
JOIN faculty AS sjsuFac ON sjsuCampus.Id = sjsuFac.CampusId

-- all other campuses tables
JOIN campuses AS otherCampus ON otherCampus.Id = otherCampus.Id
-- join on year 2003
JOIN enrollments AS otherEnroll ON otherCampus.Id = otherEnroll.CampusId AND otherEnroll.Year = 2003
JOIN faculty AS otherFac ON otherCampus.Id = otherFac.CampusId AND otherFac.Year = 2003
-- filter row values by condition below
WHERE (otherEnroll.FTE > sjsuEnroll.FTE)
-- sort by ratio in ascending order
ORDER BY RATIO ASC;


USE `INN`;
-- INN-1
-- Find all modern rooms with a base price below $160 and two beds. Report room code and full room name, in alphabetical order by the code.
-- show contents of table
-- SELECT * FROM reservations;
-- SELECT * FROM rooms;

-- select columns RoomCode and RoomName
SELECT DISTINCT rooms.RoomCode, rooms.RoomName
-- from rooms table
FROM rooms
-- filter with conditions stated below
WHERE rooms.basePrice < 160 AND rooms.decor = "modern" AND rooms.Beds = 2
-- order by roomCode ascending order
ORDER BY rooms.RoomCode ASC;


USE `INN`;
-- INN-2
-- Find all July 2010 reservations (a.k.a., all reservations that both start AND end during July 2010) for the ’Convoke and sanguine’ room. For each reservation report the last name of the person who reserved it, checkin and checkout dates, the total number of people staying and the daily rate. Output reservations in chronological order.
-- show contents of table
-- SELECT * FROM reservations;
-- SELECT * FROM rooms;

-- select columns listed below
SELECT DISTINCT LastName, CheckIn, Checkout, (Adults + Kids) AS Guest, Rate
-- from reservations table
FROM reservations
-- filter columns by condition below
WHERE (MONTH(Checkin) = 7 AND YEAR(Checkin) = 2010) AND (MONTH(Checkout) = 7 AND YEAR(Checkout) = 2010) AND Room = "CAS"
-- order by checkin date in ascending order
ORDER BY Checkin ASC;


USE `INN`;
-- INN-3
-- Find all rooms occupied on February 6, 2010. Report full name of the room, the check-in and checkout dates of the reservation. Sort output in alphabetical order by room name.
-- show contents of table
-- SELECT * FROM reservations;
-- SELECT * FROM rooms;

-- select columns below
SELECT DISTINCT rooms.RoomName, reservations.Checkin, reservations.Checkout
-- from rooms and reservations table
FROM rooms
JOIN reservations ON rooms.RoomCode = reservations.Room
-- filter row values by conditions below
WHERE ("2010-02-06" BETWEEN reservations.Checkin AND reservations.Checkout) AND reservations.Checkout != "2010-02-06"
-- sort by room name in ascending order
ORDER BY rooms.RoomName ASC;


USE `INN`;
-- INN-4
-- For each stay by GRANT KNERIEN in the hotel, calculate the total amount of money, he paid. Report reservation code, room name (full), checkin and checkout dates, and the total stay cost. Sort output in chronological order by the day of arrival.

-- show contents of table
-- SELECT * FROM reservations;
-- SELECT * FROM rooms;

-- select columns below
SELECT reservations.Code, rooms.RoomName, reservations.Checkin, reservations.Checkout, (reservations.Rate * DATEDIFF(reservations.Checkout, reservations.Checkin)) AS Paid
-- from reservations and rooms table
FROM reservations
JOIN rooms ON reservations.Room = rooms.RoomCode
-- filter by condition below
WHERE reservations.FirstName = "GRANT" AND reservations.LastName = "KNERIEN"
-- sort by checkin in ascending order
ORDER BY reservations.Checkin ASC;


USE `INN`;
-- INN-5
-- For each reservation that starts on December 31, 2010 report the room name, nightly rate, number of nights spent and the total amount of money paid. Sort output in descending order by the number of nights stayed.
-- show contents of table
-- SELECT * FROM reservations;
-- SELECT * FROM rooms;

-- select columns below
SELECT rooms.RoomName, reservations.Rate, DATEDIFF(reservations.Checkout, reservations.Checkin) AS Nights, (reservations.Rate * DATEDIFF(reservations.Checkout, reservations.Checkin)) AS Money
-- from reservations and rooms tables
FROM reservations
JOIN rooms ON reservations.Room = rooms.RoomCode
-- filter by condition below
WHERE reservations.Checkin = "2010-12-31"
-- sort by nights in descending order
ORDER BY Nights DESC;


USE `INN`;
-- INN-6
-- Report all reservations in rooms with double beds that contained four adults. For each reservation report its code, the room abbreviation, full name of the room, check-in and check out dates. Report reservations in chronological order, then sorted by the three-letter room code (in alphabetical order) for any reservations that began on the same day.
-- show contents of table
-- SELECT * FROM reservations;
-- SELECT * FROM rooms;

-- select columns below
SELECT DISTINCT reservations.CODE, reservations.Room, rooms.RoomName, reservations.Checkin, reservations.Checkout
-- from reservations and rooms tables
FROM reservations
JOIN rooms ON reservations.Room = rooms.RoomCode
-- filter by condition below
WHERE reservations.Adults = 4 AND reservations.Kids = 0 AND rooms.BedType = "Double"
-- sort by checkin and code in ascending order
ORDER BY reservations.Checkin, reservations.CODE ASC;


USE `MARATHON`;
-- MARATHON-1
-- Report the overall place, running time, and pace of TEDDY BRASEL.
-- show contents of table
-- SELECT * FROM marathon;

-- select columns below
SELECT DISTINCT Place, RunTime, Pace
-- from marathon table
FROM marathon
-- filter rows by condition stated below
WHERE FirstName = "TEDDY" AND LastName = "BRASEL";


USE `MARATHON`;
-- MARATHON-2
-- Report names (first, last), overall place, running time, as well as place within gender-age group for all female runners from QUNICY, MA. Sort output by overall place in the race.
-- show contents of table
-- SELECT * FROM marathon;

-- select columns below
SELECT DISTINCT FirstName, LastName, Place, RunTime, GroupPlace
-- from marathon table
FROM marathon
-- filter row values by condition stated below
WHERE Sex = "F" AND Town = "QUNICY" AND State = "MA"
-- order by place
ORDER BY Place ASC;


USE `MARATHON`;
-- MARATHON-3
-- Find the results for all 34-year old female runners from Connecticut (CT). For each runner, output name (first, last), town and the running time. Sort by time.
-- show contents of table
-- SELECT * FROM marathon;

-- select columns below
SELECT DISTINCT FirstName, LastName, Town, RunTime
-- from marathon table
FROM marathon
-- filter row values by condition stated below
WHERE Age = 34 AND Sex = "F" AND State = "CT"
-- sort by runtime
ORDER BY RunTime;


USE `MARATHON`;
-- MARATHON-4
-- Find all duplicate bibs in the race. Report just the bib numbers. Sort in ascending order of the bib number. Each duplicate bib number must be reported exactly once.
-- show contents of table
--  * FROM marathon;

-- select column bibNumber
SELECT DISTINCT marathon.BibNumber
-- from marathon table
FROM marathon
-- join marathon table with itself on BibNumber
JOIN marathon AS mar2 ON marathon.BibNumber = mar2.BibNumber 
-- filter by place (primary key), compare primary keys of both tables select rows where they are different
WHERE marathon.Place != mar2.Place
-- sort by bib number in ascending order
ORDER BY marathon.BibNumber ASC;


USE `MARATHON`;
-- MARATHON-5
-- List all runners who took first place and second place in their respective age/gender groups. List gender, age group, name (first, last) and age for both the winner and the runner up (in a single row). Include only age/gender groups with both a first and second place runner. Order the output by gender, then by age group.
-- show contents of table
-- SELECT * FROM marathon;

-- select columns
SELECT DISTINCT marathon.Sex, marathon.AgeGroup, marathon.FirstName, marathon.LastName, marathon.Age, msecond.FirstName, msecond.LastName, msecond.Age
-- from marathon table
FROM marathon
-- join same marathon table (one for first place, the other for second place)
-- join on ageGroup and sex
JOIN marathon AS msecond ON marathon.AgeGroup = msecond.AgeGroup AND marathon.Sex = msecond.Sex
-- filter by condition below, find first and second place in their respective groups
WHERE (marathon.GroupPlace = 1 AND msecond.GroupPlace = 2)
-- order by sex and marathon
ORDER BY marathon.Sex, marathon.AgeGroup;


USE `AIRLINES`;
-- AIRLINES-1
-- Find all airlines that have at least one flight out of AXX airport. Report the full name and the abbreviation of each airline. Report each name only once. Sort the airlines in alphabetical order.
-- show contents of table
-- SELECT * FROM airlines;
-- SELECT * FROM airports;
-- SELECT * FROM flights;

-- select columns (no dups)
SELECT DISTINCT airlines.Name, airlines.Abbr
-- from airlines and flights tables
FROM airlines
-- join flights and airlines based on airline Id
JOIN flights ON airlines.Id = flights.Airline
-- filter row values by condition below
WHERE flights.Source = "AXX"
-- sort by airline name in ascending order
ORDER BY airlines.Name ASC;


USE `AIRLINES`;
-- AIRLINES-2
-- Find all destinations served from the AXX airport by Northwest. Re- port flight number, airport code and the full name of the airport. Sort in ascending order by flight number.

-- select columns
SELECT DISTINCT flights.FlightNo, airports.Code, airports.Name
-- from all three tables in set
FROM airlines
-- join tables based on similar attributes (foreign keys)
JOIN flights ON airlines.Id = flights.Airline
JOIN airports ON airports.Code = flights.Destination
-- filter rows by condition below
WHERE airlines.Name = "Northwest Airlines" AND flights.Source = "AXX"
-- sort by flight number in ascending order
ORDER BY flights.FlightNo ASC;


USE `AIRLINES`;
-- AIRLINES-3
-- Find all *other* destinations that are accessible from AXX on only Northwest flights with exactly one change-over. Report pairs of flight numbers, airport codes for the final destinations, and full names of the airports sorted in alphabetical order by the airport code.
-- select columns below
SELECT DISTINCT flights.FlightNo, f2.FlightNo, f2.Destination , a2.Name
-- from joined tables below
FROM airlines
-- join base flights
JOIN flights ON airlines.Id = flights.Airline
JOIN airports ON airports.Code = flights.Destination OR airports.Code = flights.Source
-- duplicate flights table
JOIN flights AS f2 ON airlines.Id = f2.Airline 
JOIN airports AS a2 ON a2.Code = f2.Destination
-- filter by condition below
WHERE (airlines.Name = "Northwest Airlines") AND (flights.Source = "AXX") AND (f2.Source = flights.Destination) AND (f2.Destination != "AXX")
-- order by flight airport code
ORDER BY f2.Destination ASC;


USE `AIRLINES`;
-- AIRLINES-4
-- Report all pairs of airports served by both Frontier and JetBlue. Each airport pair must be reported exactly once (if a pair X,Y is reported, then a pair Y,X is redundant and should not be reported).
SELECT DISTINCT f1.Destination, f1.Source
FROM airlines
-- jetBlue airline
JOIN airlines AS airlines1 ON airlines1.Abbr = "JetBlue"
JOIN flights AS f1 ON f1.Airline = airlines1.Id
JOIN airports AS airports1 ON f1.Source OR f1.Destination = airports1.Code
-- frontier airline
JOIN airlines AS airlines2 ON airlines2.Abbr = "Frontier"
JOIN flights AS f2 ON f2.Airline = airlines2.Id
JOIN airports AS airports2 ON f2.Source OR f2.Destination = airports2.Code
-- filter rows by condition below
WHERE f1.Source = f2.Source AND f1.Destination = f2.Destination
LIMIT 1;


USE `AIRLINES`;
-- AIRLINES-5
-- Find all airports served by ALL five of the airlines listed below: Delta, Frontier, USAir, UAL and Southwest. Report just the airport codes, sorted in alphabetical order.
SELECT DISTINCT f1.Source
-- select columns
FROM airlines 
-- delta airline
JOIN airlines AS airlines1 JOIN flights AS f1 ON airlines1.Abbr = "Delta" AND f1.Airline = airlines1.Id
-- frontier airline
JOIN airlines AS airlines2 JOIN flights AS f2 ON airlines2.Abbr = "Frontier" AND f2.Airline = airlines2.Id
-- USAir airline
JOIN airlines AS airlines3 JOIN flights AS f3 ON airlines3.Abbr = "USAir" AND f3.Airline = airlines3.Id
-- UAL airline
JOIN airlines AS airlines4 JOIN flights AS f4 ON airlines4.Abbr = "UAL" AND f4.Airline = airlines4.Id
-- Southwest airline
JOIN airlines AS airlines5 JOIN flights AS f5 ON airlines5.Abbr = "Southwest" AND f5.Airline = airlines5.Id
-- JOIN flights AS f5 ON f5.Airline = airlines5.Id
WHERE (f1.Source = f2.Source AND f2.Source = f3.Source AND f3.Source = f4.Source AND f4.Source = f5.Source)
-- sort by airport code 
ORDER BY f1.Source ASC;


USE `AIRLINES`;
-- AIRLINES-6
-- Find all airports that are served by at least three Southwest flights. Report just the three-letter codes of the airports — each code exactly once, in alphabetical order.
-- show contents of table
-- SELECT * FROM airlines;
-- SELECT * FROM airports;
-- SELECT * FROM flights;

-- southwest code = 4
-- airport codes (output) = aaf, aet, anc, ann, anq, any, arb, ayz, lts, wkk

-- select columns
SELECT DISTINCT f1.Source
FROM airlines
-- Southwest airline
JOIN airlines AS airlines1 ON airlines1.Abbr = "Southwest"
JOIN flights AS f1 ON f1.Airline = airlines1.Id
-- other two flights table
-- first other flight
JOIN flights AS f2 ON f2.Airline = airlines1.Id
-- second other flight
JOIN flights AS f3 ON f3.Airline = airlines1.Id
-- filter row values by condition below
WHERE (f1.FlightNo != f2.FlightNo) AND (f1.FlightNo != f3.FlightNo) AND (f2.FlightNo != f3.FlightNo) AND(f1.Source = f2.Source) AND (f1.Source = f3.Source) AND (f2.Source = f3.Source)
-- sort by airport code in ascending order
ORDER BY f1.Source ASC;


USE `KATZENJAMMER`;
-- KATZENJAMMER-1
-- Report, in order, the tracklist for ’Le Pop’. Output just the names of the songs in the order in which they occur on the album.
SELECT DISTINCT Songs.Title
-- from three tables that were joined
FROM Albums
-- joined tables based on foreign key attributes
JOIN Tracklists ON Albums.AId = Tracklists.Album
JOIN Songs ON Tracklists.Song = Songs.SongId
-- filter row values by condition below
WHERE Albums.Title = "Le Pop";


USE `KATZENJAMMER`;
-- KATZENJAMMER-2
-- List the instruments each performer plays on ’Mother Superior’. Output the first name of each performer and the instrument, sort alphabetically by the first name.
SELECT DISTINCT Band.Firstname, Instruments.Instrument
-- from joined tables
FROM Band
JOIN Instruments ON Band.Id = Instruments.Bandmate
JOIN Songs ON Instruments.Song = Songs.SongId
-- filter rows based on condition below
WHERE Songs.Title = "Mother Superior"
-- sort by first name of band members in ascending order
ORDER BY Band.Firstname ASC;


USE `KATZENJAMMER`;
-- KATZENJAMMER-3
-- List all instruments played by Anne-Marit at least once during the performances. Report the instruments in alphabetical order (each instrument needs to be reported exactly once).
-- select columns
SELECT DISTINCT Instruments.Instrument
-- from joined tables
FROM Instruments
JOIN Band ON Instruments.Bandmate = Band.Id
-- filter row values by condition below
WHERE Band.Firstname = "Anne-Marit"
-- sort by instruments in ascending order
ORDER BY Instruments.Instrument ASC;


USE `KATZENJAMMER`;
-- KATZENJAMMER-4
-- Find all songs that featured ukalele playing (by any of the performers). Report song titles in alphabetical order.
-- select columns
SELECT DISTINCT Songs.Title
-- from joined tables Song, Instruments
FROM Songs
JOIN Instruments ON Songs.SongId = Instruments.Song
-- filter row values by condition below
WHERE Instruments.Instrument = "ukalele"
-- order by song title in ascending order
ORDER BY Songs.Title ASC;


USE `KATZENJAMMER`;
-- KATZENJAMMER-5
-- Find all instruments Turid ever played on the songs where she sang lead vocals. Report the names of instruments in alphabetical order (each instrument needs to be reported exactly once).
-- select columns
SELECT DISTINCT Instruments.Instrument
-- from joined tables below
FROM Instruments
-- join instruments on band id and song id
JOIN Band ON Instruments.Bandmate = Band.Id
JOIN Songs ON Instruments.Song = Songs.SongId
-- join vocals on song id and band id
JOIN Vocals ON Vocals.Song = Songs.SongId AND Vocals.Bandmate = Band.Id
-- filter rows by condition below
WHERE Band.Firstname = "Turid" AND Vocals.VocalType = "lead"
-- sort by instruments in ascending order
ORDER BY Instruments.Instrument ASC;


USE `KATZENJAMMER`;
-- KATZENJAMMER-6
-- Find all songs where the lead vocalist is not positioned center stage. For each song, report the name, the name of the lead vocalist (first name) and her position on the stage. Output results in alphabetical order by the song, then name of band member. (Note: if a song had more than one lead vocalist, you may see multiple rows returned for that song. This is the expected behavior).
SELECT DISTINCT Songs.Title, Band.Firstname, Performance.StagePosition
-- from songs, vocals, band, performance (all joined together)
FROM Songs
JOIN Vocals ON Vocals.Song = Songs.SongId
JOIN Band ON Band.Id = Vocals.Bandmate
-- join performance on both song id and band id
JOIN Performance ON Performance.Song = Songs.SongId AND Performance.Bandmate = Band.Id
-- filter row values by lead vocalist and not center stage
WHERE (Vocals.VocalType = "lead") AND (Performance.StagePosition != "center")
-- order by song title in ascending order
ORDER BY Songs.Title;


USE `KATZENJAMMER`;
-- KATZENJAMMER-7
-- Find a song on which Anne-Marit played three different instruments. Report the name of the song. (The name of the song shall be reported exactly once)
-- select columns
SELECT DISTINCT Songs.Title
-- from the tables joined below
FROM Songs
-- join instruments on song id and band id 
JOIN Instruments ON Songs.SongId = Instruments.Song
-- join on same instrument table
JOIN Instruments AS instr1 ON Songs.SongId = instr1.Song
JOIN Instruments AS instr2 ON Songs.SongId = instr2.Song
-- join band id with instrument
JOIN Band ON Instruments.Bandmate = Band.Id AND instr1.Bandmate = Band.Id AND instr2.Bandmate = Band.Id
-- filter by condition below
WHERE Band.Firstname = "Anne-Marit" AND (Instruments.Instrument != instr1.Instrument != instr2.Instrument);


USE `KATZENJAMMER`;
-- KATZENJAMMER-8
-- Report the positioning of the band during ’A Bar In Amsterdam’. (just one record needs to be returned with four columns (right, center, back, left) containing the first names of the performers who were staged at the specific positions during the song).
-- show contents of table
-- SELECT * FROM Albums;
-- SELECT * FROM Band;
-- SELECT * FROM Instruments;
-- SELECT * FROM Performance;
-- SELECT * FROM Songs;
-- SELECT * FROM Tracklists;
-- SELECT * FROM Vocals;

-- select columns
SELECT DISTINCT Bright.Firstname AS "Right", Bcenter.Firstname AS "Center", Band.Firstname AS "Back", Bleft.Firstname AS "Left"
-- from joined tables below
FROM Performance
-- performance tables for all stage positions: right, center, back, and left
JOIN Performance AS Pright ON Performance.Song = Pright.Song
JOIN Performance AS Pleft ON Performance.Song = Pleft.Song
JOIN Performance AS Pcenter ON Performance.Song = Pcenter.Song
-- song table for each table
JOIN Songs ON Performance.Song = Songs.SongId
JOIN Songs AS Sright ON Pright.Song = Sright.SongId
JOIN Songs AS Sleft ON Pright.Song = Sleft.SongId
JOIN Songs AS Scenter ON Pright.Song = Scenter.SongId
-- band tables for each band member
JOIN Band ON Performance.Bandmate = Band.Id
JOIN Band AS Bright ON Pright.Bandmate = Bright.Id
JOIN Band AS Bleft ON Pleft.Bandmate = Bleft.Id
JOIN Band AS Bcenter ON Pcenter.Bandmate = Bcenter.Id
-- filter rows by conditions below
WHERE (Songs.Title = "A Bar In Amsterdam" AND Performance.StagePosition = "back") AND (Sright.Title = "A Bar In Amsterdam" AND Pright.StagePosition = "right") AND (Sleft.Title = "A Bar In Amsterdam" AND Pleft.StagePosition = "left") AND (Scenter.Title = "A Bar In Amsterdam" AND Pcenter.StagePosition = "center");


