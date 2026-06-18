CREATE OR ALTER TRIGGER tr_AuditTicketInsert
ON Ticket AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO AuditLog (TableName, RecordID, Action, ColumnName, OldValue, NewValue, ChangedBy, ChangedDate)
    SELECT 'Ticket', i.TicketID, 'INSERT', 'ALL', NULL,
           'New ticket created: ' + i.Title, SYSTEM_USER, GETDATE()
    FROM inserted i;
END;
