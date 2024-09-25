CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
    AS
    BEGIN
        SELECT B.BookID,B.Title,BR.FirstName,BR.LastName,L.DueDate
        FROM Books B
        JOIN Loans L ON L.BookID = B.BookID
        JOIN Borrowers BR ON L.BorrowerID = BR.BorrowerID
        WHERE L.DateBorrowed BETWEEN @StartDate AND @EndDate;
    END;