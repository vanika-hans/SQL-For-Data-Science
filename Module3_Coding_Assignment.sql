All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.


------------------------------------------------------------------------------

Question 1

Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name, AlbumId as tracks_album_id
FROM tracks
WHERE tracks_album_id IN 
	(SELECT AlbumId
	FROM albums
	WHERE albums.Title = "Californication")

What is the title of the 8th track?

Porcelain

------------------------------------------------------------------------------

Question 2

Find the total number of invoices for each customer along with the customer's full name, city and email.

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

After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).

frantisekw@jetbrains.com

------------------------------------------------------------------------------

Question 3

Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT 
	tracks.Name as track_name,
	albums.Title as album,
	albums.ArtistId as artistID,
	tracks.TrackId as TrackId
FROM tracks
INNER JOIN albums
ON tracks.AlbumId = albums.AlbumId

What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.

Breaking The Rules

------------------------------------------------------------------------------

Question 4

Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

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

After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?


Callahan

King

------------------------------------------------------------------------------
5.
Question 5

Find the name and ID of the artists who do not have albums. 

123456789101112131415
/*
SELECT artists.ArtistId, artists.Name, albums.Title as Album_Title
FROM artists
LEFT JOIN albums
ON artists.ArtistId = albums.ArtistId
WHERE albums.Title is NULL
ORDER BY Album_Title DESC
*/

SELECT artists.ArtistId as artists_id, albums.ArtistId as albums_artist_id, artists.Name, albums.Title as Album_Title, albums.AlbumId

Reset
After running the query described above, two of the records returned have the same last name. Enter that name below.

1 / 1 point
Gilberto
Correct

------------------------------------------------------------------------------
6.
Question 6

Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

123456
SELECT FirstName, LastName
FROM customers
UNION
SELECT FirstName, LastName
FROM employees
ORDER BY LastName DESC
Reset
After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.

1 / 1 point
Taylor
Correct

------------------------------------------------------------------------------
7.
Question 7

See if there are any customers who have a different city listed in their billing city versus their customer city.

12345
SELECT c.FirstName, c.LastName, c.City as Customer_City, i.BillingCity
FROM customers as c
INNER JOIN invoices as i
ON c.CustomerId = i.CustomerId
WHERE Customer_City <> BillingCity
Reset
Indicate your answer below.

1 / 1 point

No customers have a different city listed in their billing city versus customer city.


3 customers have a different city listed in their billing city versus customer city.


8 customers have a different city listed in their billing city versus customer city.


17 customers have a different city listed in their billing city versus customer city.

Correct


