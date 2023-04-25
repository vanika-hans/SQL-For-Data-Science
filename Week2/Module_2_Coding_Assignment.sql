--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

------------------------------------------------------------------------------

--Question 1

--Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT TrackId, Name, Milliseconds
FROM Tracks
WHERE Milliseconds >= '5000000'

--How many tracks are returned?
2

------------------------------------------------------------------------------

--Question 2

--Run Query: Find all the invoices whose total is between $5 and $15 dollars.

SELECT InvoiceID, Total
FROM Invoices
WHERE (Total >= '5' AND Total <= '15')
ORDER BY Total ASC

--While the query in this example is limited to 10 records, running the query correctly will indicate how many total records there are - enter that number below.

168

------------------------------------------------------------------------------

--Question 3

--Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT CustomerId, FirstName, LastName, Company, State
FROM Customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY')
ORDER BY State ASC;

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

--What was the invoice date for invoice ID 315?
10-27-2012

------------------------------------------------------------------------------

--Question 5

--Run Query: Find all the tracks whose name starts with 'All'.

SELECT Name
FROM TRACKS
WHERE Name LIKE 'All%'

--While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.

15

------------------------------------------------------------------------------

--Question 6

--Run Query: Find all the customer emails that start with "J" and are from gmail.com.

SELECT Email
FROM Customers
WHERE Email LIKE 'J%gmail.com'

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

--What is the total invoice amount of the first record returned? Enter the number below without a $ sign. Remember to sort in descending order to get the correct answer.

13.86

------------------------------------------------------------------------------

Question 8

--Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

SELECT CustomerId, COUNT(InvoiceId) as Num_Orders_Placed
FROM Invoices
GROUP BY CustomerId
ORDER BY Num_Orders_Placed DESC 

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

--While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.

158
