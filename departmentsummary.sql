CREATE OR ALTER VIEW vw_DeptSummary AS
SELECT
    d.DepartmentName,
    s.StatusName,
    COUNT(t.TicketID) AS TicketCount
FROM Ticket t
JOIN Users      u ON t.CreatedByID  = u.UserID
JOIN Department d ON u.DepartmentID = d.DepartmentID
JOIN Status     s ON t.StatusID     = s.StatusID
GROUP BY d.DepartmentName, s.StatusName;
