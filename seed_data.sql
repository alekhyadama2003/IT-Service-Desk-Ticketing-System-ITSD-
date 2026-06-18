-- ============================================================
-- Script  : 03_seed_data.sql
-- ============================================================

INSERT INTO Priority (PriorityName, SLAHours) VALUES
('P1', 4), ('P2', 8), ('P3', 24), ('P4', 48);

INSERT INTO Status (StatusName) VALUES
('Open'), ('In Progress'), ('Resolved'), ('Closed'), ('Reopened');

INSERT INTO Department (DepartmentName) VALUES
('IT Support'), ('HR'), ('Finance'), ('Operations'), ('Admin');

INSERT INTO Category (CategoryName) VALUES
('Hardware'), ('Software'), ('Network'), ('Access & Permissions'), ('Email'), ('Other');

INSERT INTO SLA (PriorityID, ResolutionHrs, ResponseHrs) VALUES
(1, 4, 1), (2, 8, 2), (3, 24, 4), (4, 48, 8);

INSERT INTO Users (FullName, Email, Role, DepartmentID) VALUES
('Admin User',   'admin@company.com',   'Admin',   1),
('Agent One',    'agent1@company.com',  'Agent',   1),
('Agent Two',    'agent2@company.com',  'Agent',   1),
('HR Manager',   'hr@company.com',      'EndUser', 2),
('Finance Lead', 'finance@company.com', 'EndUser', 3);

INSERT INTO Ticket (Title, Description, CategoryID, PriorityID, StatusID, CreatedByID, AssignedToID) VALUES
('Laptop not starting',       'System powers off immediately on boot',  1, 1, 1, 4, 2),
('VPN access issue',          'Unable to connect to VPN from home',     3, 2, 2, 5, 3),
('Excel crashing on open',    'MS Excel crashes when opening any file', 2, 3, 1, 4, 2),
('New joiner access request', 'Need AD account and email for new hire', 4, 3, 2, 4, 3),
('Printer offline',           'Floor 3 printer showing offline status', 1, 4, 1, 5, 2);
