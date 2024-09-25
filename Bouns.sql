WITH LoanDays AS (
    -- Extract the day of the week for each loan
    SELECT 
        DATENAME(WEEKDAY, DateBorrowed) AS DayOfWeek, 
        COUNT(*) AS LoanCount
    FROM Loans
    GROUP BY DATENAME(WEEKDAY, DateBorrowed)
),
TotalLoans AS (
    -- Calculate the total number of loans
    SELECT COUNT(*) AS TotalLoanCount
    FROM Loans
)
-- Calculate percentage share for each day of the week and sort by highest percentage
SELECT 
    LD.DayOfWeek, 
    (LD.LoanCount * 100.0 / TL.TotalLoanCount) AS PercentageOfLoans
FROM LoanDays LD
CROSS JOIN TotalLoans TL
ORDER BY PercentageOfLoans DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY; -- Fetch the top 3 days
