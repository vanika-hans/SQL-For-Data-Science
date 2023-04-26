--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

------------------------------------------------------------------------------

--Question 1

--Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT TrackId, Name, Milliseconds
FROM Tracks
WHERE Milliseconds >= '5000000'

+---------+-------------------------+--------------+
| TrackId | Name                    | Milliseconds |
+---------+-------------------------+--------------+
|    2820 | Occupation / Precipice  |      5286953 |
|    3224 | Through a Looking Glass |      5088838 |
+---------+-------------------------+--------------+

--How many tracks are returned?
2

------------------------------------------------------------------------------

--Question 2

--Run Query: Find all the invoices whose total is between $5 and $15 dollars.

SELECT InvoiceID, Total
FROM Invoices
WHERE (Total >= '5' AND Total <= '15')
ORDER BY Total ASC

+-----------+-------+
| InvoiceId | Total |
+-----------+-------+
|         3 |  5.94 |
|        10 |  5.94 |
|        17 |  5.94 |
|        24 |  5.94 |
|        31 |  5.94 |
|        38 |  5.94 |
|        45 |  5.94 |
|        52 |  5.94 |
|        59 |  5.94 |
|        66 |  5.94 |
+-----------+-------+
(Output limit exceeded, 10 of 168 total rows shown)

--While the query in this example is limited to 10 records, running the query correctly will indicate how many total records there are - enter that number below.

168

------------------------------------------------------------------------------

--Question 3

--Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT CustomerId, FirstName, LastName, Company, State
FROM Customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY')
ORDER BY State ASC;

+------------+-----------+----------+-----------------------+-------+
| CustomerId | FirstName | LastName | Company               | State |
+------------+-----------+----------+-----------------------+-------+
|         14 | Mark      | Philips  | Telus                 | AB    |
|         15 | Jennifer  | Peterson | Rogers Canada         | BC    |
|         16 | Frank     | Harris   | Google Inc.           | CA    |
|         19 | Tim       | Goyer    | Apple Inc.            | CA    |
|         20 | Dan       | Miller   | None                  | CA    |
|         13 | Fernanda  | Ramos    | None                  | DF    |
|         18 | Michelle  | Brooks   | None                  | NY    |
|         12 | Roberto   | Almeida  | Riotur                | RJ    |
|         17 | Jack      | Smith    | Microsoft Corporation | WA    |
+------------+-----------+----------+-----------------------+-------+

--What company does Jack Smith work for?

Microsoft Corp

------------------------------------------------------------------------------

--Question 4

--Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT InvoiceID, CustomerID, InvoiceDate, Total
FROM Invoices
WHERE (CustomerID = '56' OR CustomerID = '58')
    AND (Total >= '1.00' AND Total <= '5.00' )
ORDER BY Total ASC;

+-----------+------------+---------------------+-------+
| InvoiceId | CustomerId | InvoiceDate         | Total |
+-----------+------------+---------------------+-------+
|       119 |         56 | 2010-06-12 00:00:00 |  1.98 |
|       337 |         56 | 2013-01-28 00:00:00 |  1.98 |
|       120 |         58 | 2010-06-12 00:00:00 |  1.98 |
|       315 |         58 | 2012-10-27 00:00:00 |  1.98 |
|       412 |         58 | 2013-12-22 00:00:00 |  1.99 |
|       142 |         56 | 2010-09-14 00:00:00 |  3.96 |
|       338 |         58 | 2013-01-29 00:00:00 |  3.96 |
+-----------+------------+---------------------+-------+

--What was the invoice date for invoice ID 315?
10-27-2012

------------------------------------------------------------------------------

--Question 5

--Run Query: Find all the tracks whose name starts with 'All'.

SELECT Name
FROM TRACKS
WHERE Name LIKE 'All%'

+----------------------------------------+
| Name                                   |
+----------------------------------------+
| All I Really Want                      |
| All For You                            |
| All Star                               |
| All My Life                            |
| All My Love                            |
| All Within My Hands                    |
| All or None                            |
| All Dead, All Dead                     |
| All the Best Cowboys Have Daddy Issues |
| All Because Of You                     |
+----------------------------------------+
(Output limit exceeded, 10 of 15 total rows shown)

--While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.

15

------------------------------------------------------------------------------

--Question 6

--Run Query: Find all the customer emails that start with "J" and are from gmail.com.

SELECT Email
FROM Customers
WHERE Email LIKE 'J%gmail.com'

+---------------------+
| Email               |
+---------------------+
| jubarnett@gmail.com |
+---------------------+

--Enter the one email address returned (you will likely need to scroll to the right) below.

jubarnett@gmail.com

------------------------------------------------------------------------------

--Question 7

--Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT InvoiceId, BillingCity, Total
FROM Invoices
WHERE 	
	(BillingCity LIKE 'Bras%')
	OR (BillingCity IN ('Edmonton', 'Vancouver'))
ORDER BY InvoiceId DESC;

+-----------+-------------+-------+
| InvoiceId | BillingCity | Total |
+-----------+-------------+-------+
|       362 | Edmonton    | 13.86 |
|       351 | Edmonton    |  1.98 |
|       328 | Vancouver   |  0.99 |
|       319 | Brasília    |  8.91 |
|       276 | Vancouver   |  5.94 |
|       264 | Brasília    | 13.86 |
|       254 | Vancouver   |  3.96 |
|       253 | Brasília    |  1.98 |
|       231 | Vancouver   |  1.98 |
|       230 | Edmonton    |  0.99 |
+-----------+-------------+-------+
(Output limit exceeded, 10 of 21 total rows shown)

--What is the total invoice amount of the first record returned? Enter the number below without a $ sign. Remember to sort in descending order to get the correct answer.

13.86

------------------------------------------------------------------------------

Question 8

--Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

SELECT CustomerId, COUNT(InvoiceId) as Num_Orders_Placed
FROM Invoices
GROUP BY CustomerId
ORDER BY Num_Orders_Placed DESC 

+------------+-------------------+
| CustomerId | Num_Orders_Placed |
+------------+-------------------+
|          1 |                 7 |
|          2 |                 7 |
|          3 |                 7 |
|          4 |                 7 |
|          5 |                 7 |
|          6 |                 7 |
|          7 |                 7 |
|          8 |                 7 |
|          9 |                 7 |
|         10 |                 7 |
+------------+-------------------+
(Output limit exceeded, 10 of 59 total rows shown)

--What is the number of items placed for the 8th person on this list? Enter that number below.

7

------------------------------------------------------------------------------

--Question 9

--Run Query: Find the albums with 12 or more tracks.

SELECT AlbumId, COUNT(TrackId) AS number_of_tracks
FROM Tracks
GROUP BY AlbumID
HAVING number_of_tracks >= 12
ORDER BY number_of_tracks ASC;

+---------+------------------+
| AlbumId | number_of_tracks |
+---------+------------------+
|       7 |               12 |
|      11 |               12 |
|      12 |               12 |
|      38 |               12 |
|      40 |               12 |
|      63 |               12 |
|      74 |               12 |
|      88 |               12 |
|      90 |               12 |
|      95 |               12 |
+---------+------------------+
(Output limit exceeded, 10 of 158 total rows shown)

--While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.

158
