SELECT B.Title , L.DateBorrowed, L.DateReturned
FROM Loans L
JOIN Books B on B.BookID = L.BookID
WHERE (L.DateReturned IS Not Null OR L.DateBorrowed > L.DueDate);