CREATE OR ALTER VIEW vw_TicketHistory AS
SELECT
    a.AuditID,
    a.RecordID   AS TicketID,
    a.Action,
    a.ColumnName,
    a.OldValue,
    a.NewValue,
    a.ChangedBy,
    a.ChangedDate
FROM AuditLog a
WHERE a.TableName = 'Ticket';
