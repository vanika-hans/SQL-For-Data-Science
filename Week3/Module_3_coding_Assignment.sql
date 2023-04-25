--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

------------------------------------------------------------------------------

--Question 1

--Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name, AlbumId as tracks_album_id
FROM tracks
WHERE tracks_album_id IN 
	(SELECT AlbumId
	FROM albums
	WHERE albums.Title = "Californication")

+-------------------+-----------------+
| Name              | tracks_album_id |
+-------------------+-----------------+
| Around The World  |             195 |
| Parallel Universe |             195 |
| Scar Tissue       |             195 |
| Otherside         |             195 |
| Get On Top        |             195 |
| Californication   |             195 |
| Easily            |             195 |
| Porcelain         |             195 |
| Emit Remmus       |             195 |
| I Like Dirt       |             195 |
+-------------------+-----------------+
(Output limit exceeded, 10 of 15 total rows shown)

--What is the title of the 8th track?

Porcelain

------------------------------------------------------------------------------

--Question 2

--Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT 
	COUNT(*) as num_invoices, 
	invoices.CustomerId, 
	customers.FirstName,
	customers.LastName,
	customers.Email
FROM invoices
LEFT JOIN customers
ON invoices.CustomerId = customers.CustomerId
GROUP BY invoices.CustomerId

+--------------+------------+-----------+-------------+--------------------------+
| num_invoices | CustomerId | FirstName | LastName    | Email                    |
+--------------+------------+-----------+-------------+--------------------------+
|            7 |          1 | Luís      | Gonçalves   | luisg@embraer.com.br     |
|            7 |          2 | Leonie    | Köhler      | leonekohler@surfeu.de    |
|            7 |          3 | François  | Tremblay    | ftremblay@gmail.com      |
|            7 |          4 | Bjørn     | Hansen      | bjorn.hansen@yahoo.no    |
|            7 |          5 | František | Wichterlová | frantisekw@jetbrains.com |
|            7 |          6 | Helena    | Holý        | hholy@gmail.com          |
|            7 |          7 | Astrid    | Gruber      | astrid.gruber@apple.at   |
|            7 |          8 | Daan      | Peeters     | daan_peeters@apple.be    |
|            7 |          9 | Kara      | Nielsen     | kara.nielsen@jubii.dk    |
|            7 |         10 | Eduardo   | Martins     | eduardo@woodstock.com.br |
+--------------+------------+-----------+-------------+--------------------------+
(Output limit exceeded, 10 of 59 total rows shown)


--After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).

frantisekw@jetbrains.com

------------------------------------------------------------------------------

--Question 3

--Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT 
	tracks.Name as track_name,
	albums.Title as album,
	albums.ArtistId as artistID,
	tracks.TrackId as TrackId
FROM tracks
INNER JOIN albums
ON tracks.AlbumId = albums.AlbumId

+-----------------------------------------+---------------------------------------+----------+---------+
| track_name                              | album                                 | artistID | TrackId |
+-----------------------------------------+---------------------------------------+----------+---------+
| For Those About To Rock (We Salute You) | For Those About To Rock We Salute You |        1 |       1 |
| Put The Finger On You                   | For Those About To Rock We Salute You |        1 |       6 |
| Let's Get It Up                         | For Those About To Rock We Salute You |        1 |       7 |
| Inject The Venom                        | For Those About To Rock We Salute You |        1 |       8 |
| Snowballed                              | For Those About To Rock We Salute You |        1 |       9 |
| Evil Walks                              | For Those About To Rock We Salute You |        1 |      10 |
| C.O.D.                                  | For Those About To Rock We Salute You |        1 |      11 |
| Breaking The Rules                      | For Those About To Rock We Salute You |        1 |      12 |
| Night Of The Long Knives                | For Those About To Rock We Salute You |        1 |      13 |
| Spellbound                              | For Those About To Rock We Salute You |        1 |      14 |
+-----------------------------------------+---------------------------------------+-
(Output limit exceeded, 10 of 3503 total rows shown)

--What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.

--Breaking The Rules

------------------------------------------------------------------------------

--Question 4

--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT 
	A.LastName,
	A.FirstName, 
	A.EmployeeId,
	A.ReportsTo,
	B.EmployeeId as ManagerId,
	B.LastName as Managerlast,
	B.FirstName as ManagerFirst
FROM employees A
LEFT JOIN employees B
ON A.ReportsTo = B.EmployeeId

+----------+-----------+------------+-----------+-----------+-------------+--------------+
| LastName | FirstName | EmployeeId | ReportsTo | ManagerId | Managerlast | ManagerFirst |
+----------+-----------+------------+-----------+-----------+-------------+--------------+
| Adams    | Andrew    |          1 |      None |      None |        None |         None |
| Edwards  | Nancy     |          2 |         1 |         1 |       Adams |       Andrew |
| Peacock  | Jane      |          3 |         2 |         2 |     Edwards |        Nancy |
| Park     | Margaret  |          4 |         2 |         2 |     Edwards |        Nancy |
| Johnson  | Steve     |          5 |         2 |         2 |     Edwards |        Nancy |
| Mitchell | Michael   |          6 |         1 |         1 |       Adams |       Andrew |
| King     | Robert    |          7 |         6 |         6 |    Mitchell |      Michael |
| Callahan | Laura     |          8 |         6 |         6 |    Mitchell |      Michael |
+----------+-----------+------------+-----------+-----------+-------------+--------------+

--After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?

Callahan

King

------------------------------------------------------------------------------

--Question 5

--Find the name and ID of the artists who do not have albums. 

SELECT 
	artists.ArtistId as artists_id,
	albums.ArtistId as albums_artist_id,
	artists.Name,
	albums.Title as Album_Title,
	albums.AlbumId

+------------+------------------+----------------------------+-------------+---------+
| artists_id | albums_artist_id | Name                       | Album_Title | AlbumId |
+------------+------------------+----------------------------+-------------+---------+
|         25 |             None | Milton Nascimento & Bebeto |        None |    None |
|         26 |             None | Azymuth                    |        None |    None |
|         28 |             None | João Gilberto              |        None |    None |
|         29 |             None | Bebel Gilberto             |        None |    None |
|         30 |             None | Jorge Vercilo              |        None |    None |
|         31 |             None | Baby Consuelo              |        None |    None |
|         32 |             None | Ney Matogrosso             |        None |    None |
|         33 |             None | Luiz Melodia               |        None |    None |
|         34 |             None | Nando Reis                 |        None |    None |
|         35 |             None | Pedro Luís & A Parede      |        None |    None |
+------------+------------------+----------------------------+-------------+---------+
(Output limit exceeded, 10 of 71 total rows shown)

--After running the query described above, two of the records returned have the same last name. Enter that name below.

Gilberto

------------------------------------------------------------------------------

--Question 6

--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName, LastName
FROM customers
UNION
SELECT FirstName, LastName
FROM employees
ORDER BY LastName DESC

+-----------+--------------+
| FirstName | LastName     |
+-----------+--------------+
| Fynn      | Zimmermann   |
| Stanisław | Wójcik       |
| František | Wichterlová  |
| Johannes  | Van der Berg |
| François  | Tremblay     |
| Mark      | Taylor       |
| Ellie     | Sullivan     |
| Victor    | Stevens      |
| Puja      | Srivastava   |
| Jack      | Smith        |
+-----------+--------------+
(Output limit exceeded, 10 of 67 total rows shown)

--After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.

Taylor

------------------------------------------------------------------------------

--Question 7

--See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT
	c.FirstName,
	c.LastName,
	c.City as Customer_City,
	i.BillingCity
FROM customers as c
INNER JOIN invoices as i
ON c.CustomerId = i.CustomerId
WHERE Customer_City <> BillingCity

+-----------+----------+---------------+-------------+
| FirstName | LastName | Customer_City | BillingCity |
+-----------+----------+---------------+-------------+
+-----------+----------+---------------+-------------+
(Zero rows)

--No customers have a different city listed in their billing city versus customer city.
