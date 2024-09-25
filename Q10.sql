SELECT B.Genre, 
       CASE 
           WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
           WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
           WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
           WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 31 AND 40 THEN '31-50'
           WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
           WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
           ELSE 'Other'
       END AS AgeGroup,
       COUNT(L.BookID) AS BorrowedCount
FROM Borrowers Br
JOIN Loans L ON Br.BorrowerID = L.BorrowerID
JOIN Books B ON L.BookID = B.BookID
GROUP BY B.Genre, 
         CASE 
            WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 31 AND 40 THEN '31-50'
            WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
            WHEN DATEDIFF(YEAR, Br.DateOfBirth, GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
            ELSE 'Other'
         END;
