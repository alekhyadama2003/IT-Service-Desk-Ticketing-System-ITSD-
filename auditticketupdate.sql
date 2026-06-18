CREATE OR ALTER TRIGGER tr_AuditTicketUpdate
ON Ticket AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(StatusID)
        INSERT INTO AuditLog (TableName, RecordID, Action, ColumnName, OldValue, NewValue, ChangedBy, ChangedDate)
        SELECT 'Ticket', i.TicketID, 'UPDATE', 'StatusID',
               CAST(d.StatusID AS NVARCHAR), CAST(i.StatusID AS NVARCHAR), SYSTEM_USER, GETDATE()
        FROM inserted i JOIN deleted d ON i.TicketID = d.TicketID
        WHERE i.StatusID <> d.StatusID;

    IF UPDATE(AssignedToID)
        INSERT INTO AuditLog (TableName, RecordID, Action, ColumnName, OldValue, NewValue, ChangedBy, ChangedDate)
        SELECT 'Ticket', i.TicketID, 'UPDATE', 'AssignedToID',
               CAST(d.AssignedToID AS NVARCHAR), CAST(i.AssignedToID AS NVARCHAR), SYSTEM_USER, GETDATE()
        FROM inserted i JOIN deleted d ON i.TicketID = d.TicketID
        WHERE ISNULL(i.AssignedToID,0) <> ISNULL(d.AssignedToID,0);
END;
