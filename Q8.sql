SELECT B.BookID,B.Title , BR.FirstName , BR.LastName , L.DueDate
FROM Books B
JOIN Loans L ON B.BookID = L.BookID
JOIN Borrowers BR ON L.BorrowerID = BR.BorrowerID
WHERE DATEDIFF(DAY, L.DueDate, GETDATE()) > 30;
