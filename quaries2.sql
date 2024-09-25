WITH ActiveBorrwers AS(
    SELECT BorrowerID,Count(*) AS BorrowedBook
    FROM Loans
    WHERE DateReturned IS NULL
    GROUP BY BorrowerID
    HAVING COUNT(*) >= 2

)
SELECT AB.BorrowerID , B.FirstName , B.LastName
FROM ActiveBorrwers AB
JOIN Borrowers B ON B.BorrowerID = AB.BorrowerID;
