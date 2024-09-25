CREATE FUNCTION fn_CalculateOverdueFees(@LoanID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @OverdueDays INT, @Fee DECIMAL(10, 2);

    SELECT @OverdueDays = DATEDIFF(DAY, DueDate, ISNULL(DateReturned, GETDATE()))
    FROM Loans
    WHERE LoanID = @LoanID;

    IF @OverdueDays <= 0
        SET @Fee = 0;
    ELSE IF @OverdueDays <= 30
        SET @Fee = @OverdueDays * 1.00;
    ELSE
        SET @Fee = 30 * 1.00 + (@OverdueDays - 30) * 2.00;

    RETURN @Fee;
END;
