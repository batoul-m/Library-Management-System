DECLARE @Month INT = 5
SELECT B.Genre, COUNT(*) AS BorrowedCount,
       RANK() OVER (PARTITION BY MONTH(L.DateBorrowed) ORDER BY COUNT(*) DESC) AS GenreRank
FROM Books B
JOIN Loans L ON B.BookID = L.BookID
WHERE MONTH(L.DateBorrowed) = @Month
GROUP BY B.Genre, MONTH(L.DateBorrowed);
