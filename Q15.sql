CREATE PROCEDURE sp_OverdueBooksReport
AS
BEGIN
    -- Create temporary table
    CREATE TABLE #OverdueBorrowers (
        BorrowerID INT
    );
    INSERT INTO #OverdueBorrowers (BorrowerID)
    SELECT DISTINCT BorrowerID
    FROM Loans
    WHERE DateReturned IS NULL AND DATEDIFF(DAY, DueDate, GETDATE()) > 0;

    SELECT Br.BorrowerID, Br.FirstName, Br.LastName, B.BookID, B.Title, L.DueDate
    FROM #OverdueBorrowers OB
    JOIN Borrowers Br ON OB.BorrowerID = Br.BorrowerID
    JOIN Loans L ON Br.BorrowerID = L.BorrowerID
    JOIN Books B ON L.BookID = B.BookID
    WHERE L.DateReturned IS NULL AND DATEDIFF(DAY, L.DueDate, GETDATE()) > 0;

    DROP TABLE #OverdueBorrowers;
END;
