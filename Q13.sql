CREATE TRIGGER trg_LogStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurrentStatus)
    BEGIN
        INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
        SELECT BookID, CurrentStatus, GETDATE()
        FROM inserted;
    END
END;
