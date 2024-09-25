SELECT B.Author , COUNT(L.BookID) AS BorrowedCount
FROM Books B
JOIN Loans L ON B.BookID= L.LoanID
GROUP BY Author
ORDER BY BorrowedCount DESC;