--Books table values
DECLARE @i INT = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO Books (BookID, Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus)
    VALUES (
        @i,
        CONCAT('Book Title ', @i),
        CONCAT('Author ', @i),
        CONCAT('9781234567', 890 + @i),
        '2020-01-01',
        CASE WHEN @i % 5 = 1 THEN 'Fiction'
             WHEN @i % 5 = 2 THEN 'Non-Fiction'
             WHEN @i % 5 = 3 THEN 'Science Fiction'
             WHEN @i % 5 = 4 THEN 'Fantasy'
             ELSE 'Mystery'
        END,
        CONCAT(CHAR(65 + (@i % 5)), @i % 10),
        CASE WHEN @i % 3 = 0 THEN 'Borrowed' ELSE 'Available' END
    );

    SET @i = @i + 1;
END
--Borrowers table values
SET @i = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO Borrowers (BorrowerID, FirstName, LastName, Email, DateOfBirth, MembershipDate)
    VALUES(
        @i,
        CONCAT('First Name',@i),
        CONCAT('Last Name',@i),
        CONCAT(@i,'@gmail.com'),
        DATEADD(YEAR, - (20 + ABS(CHECKSUM(NEWID()) % 40)), GETDATE()), -- Random DateOfBirth between 20 and 60 years ago
        DATEADD(DAY, - ABS(CHECKSUM(NEWID()) % 365), GETDATE()) 
    );
    SET @i= @i + 1;
END
--loans table values
SET @i = 1;
WHILE @i <= 1000
BEGIN
    -- Insert random data into the Loans table
    INSERT INTO Loans (LoanID, BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
    VALUES (
        @i,
        @i,
        @i, 
        DATEADD(DAY, - ABS(CHECKSUM(NEWID()) % 365), GETDATE()), -- Random DateBorrowed within the last year
        DATEADD(DAY, 14, DATEADD(DAY, - ABS(CHECKSUM(NEWID()) % 365), GETDATE())), -- DueDate is 14 days after DateBorrowed
        CASE
            WHEN @i % 5 = 0 THEN NULL -- Every 5th loan has not been returned (NULL for DateReturned)
            ELSE DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30), DATEADD(DAY, - ABS(CHECKSUM(NEWID()) % 365), GETDATE())) -- Random DateReturned within 30 days after DateBorrowed
        END
    );

    SET @i = @i + 1;
END;

