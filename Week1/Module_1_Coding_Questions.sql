--For all of the questions in this quiz, we are using the Chinook database. All of the interactive code blocks have been setup to retrieve data only from this database.

------------------------------------------------------------------------------

--Question 1 
--Retrieve all the records from the Employees table.

SELECT *
FROM Employees

--What is Robert King's mailing address? Note: You will have to scroll to the right in order to see it.

590 Columbia Boulevard West, Lethbridge, AB, CANADA T1K 5N8

------------------------------------------------------------------------------

--Question 2
--Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

SELECT FirstName,
        LastName,
        Birthdate,
        Address,
        City,
        State
FROM Employees;

--Which of the employees listed below has a birthdate of 3-3-1965?

Steve

------------------------------------------------------------------------------

--Question 3
--Retrieve all the columns from the Tracks table, but only return 20 rows.

SELECT *
FROM Tracks
LIMIT 20;

--What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn"? Note: You will need to scroll to the right to see it, and you may want to copy and paste the number to ensure it is entered correctly.

375418

