# 🖥️ IT Service Desk & Ticketing System (ITSD)
### Internship Project — High Flows IT Solutions Pvt. Ltd.

---

## 👩‍💻 Intern Details

| Field | Details |
|---|---|
| **Name** | Alekhya Dama |
| **Designation** | Jr Engineer Intern |
| **Candidate ID** | HF 1024 |
| **Company** | High Flows IT Solutions Pvt. Ltd., Hyderabad |
| **Internship Duration** | 12 January 2026 – 12 July 2026 |

---

## 📌 Project Overview

The **IT Service Desk & Ticketing System (ITSD)** is an internal database-driven application built to digitise and streamline IT support operations. It manages the complete lifecycle of IT support tickets — from creation and assignment to SLA tracking, escalation, resolution and reporting.

This project was designed, developed, tested and deployed entirely during the 6-month internship at High Flows IT Solutions using **SQL Server 2022** and **T-SQL**, following an **Agile-Scrum SDLC** methodology.

---

## 🛠️ Skills & Technologies Used

### 🗄️ SQL & Database
![SQL Server](https://img.shields.io/badge/SQL%20Server-2022-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-CC2927?style=for-the-badge)

- **DDL** — CREATE, ALTER, DROP for tables, views, indexes
- **DML** — INSERT, UPDATE, DELETE, MERGE for data operations
- **Joins** — INNER JOIN, LEFT JOIN across 10 relational tables
- **Subqueries & CTEs** — Common Table Expressions for multi-step logic
- **Window Functions** — ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), PARTITION BY
- **Stored Procedures** — 6 parameterised SPs with TRY/CATCH and transaction handling
- **Triggers** — AFTER INSERT/UPDATE triggers for audit trail logging
- **User Defined Functions** — Scalar functions for SLA status and date calculations
- **Indexes** — Clustered and non-clustered indexes for query optimisation
- **Views** — 5 views for reporting and data abstraction
- **Aggregations** — GROUP BY, ROLLUP, CUBE, HAVING, PIVOT

---

### 🔄 SDLC (Software Development Life Cycle)

Followed **Agile-Scrum** methodology across **7 sprints** from January to July 2026.

| Phase | Activities |
|---|---|
| **Requirement Gathering** | Stakeholder interviews, 25 user stories, SRS v1.0 document |
| **System Design** | ER diagram, normalisation (1NF–3NF), HLD & schema design |
| **Development** | DDL scripts, stored procedures, triggers, views, functions |
| **Testing** | 40 test cases, regression testing, integration testing |
| **UAT** | UAT sessions with stakeholders, 5 change requests implemented |
| **Deployment** | Staging deployment, SQL Agent job setup, deployment runbook |
| **Support** | Post go-live monitoring, bug fixes, knowledge transfer |

---

### 🐛 Debugging

- Used **SQL Server Profiler** to trace and identify slow-running queries
- Analysed **Execution Plans** to detect Table Scans and missing indexes
- Used **SET STATISTICS TIME** and **SET STATISTICS IO** to measure query cost
- Resolved **foreign key constraint violations**, **trigger recursion warnings**, **collation mismatch errors** and **data truncation errors**
- Used **Git blame** and **diff** to trace logic bugs introduced in previous commits
- Identified and fixed **8 bugs** logged and tracked in Jira across development and UAT

---

### 🔧 Troubleshooting

- Fixed **SLA breach logic** not triggering for P1 tickets created on weekends
- Resolved **AuditLog trigger** inserting duplicate rows on bulk update operations
- Corrected **vw_SLABreach** view returning false positives due to operator error
- Fixed **sp_CloseTicket** allowing re-closure of already-closed tickets
- Reduced average query time from **380ms → 145ms** through index optimisation
- Used **DBCC CHECKDB** to verify database integrity across environments
- Resolved **VARCHAR(255) truncation** error by migrating to VARCHAR(MAX)

---

## 🗂️ Database Schema

| Table | Purpose |
|---|---|
| `Ticket` | Core ticket records with status, priority and timestamps |
| `User` | Agent and end-user details with role-based access |
| `Department` | Organisational department mapping |
| `Category` | Ticket category classification |
| `Priority` | Priority levels P1 to P4 |
| `Status` | Ticket lifecycle states: Open, In Progress, Resolved, Closed |
| `Comment` | Agent and user comments on tickets |
| `Attachment` | File attachments linked to tickets |
| `SLA` | SLA resolution hours per priority level |
| `AuditLog` | Full audit trail of all INSERT and UPDATE events |

---

## 📁 Repository Structure

```
ITSD/
│
├── schema/
│   ├── 01_create_tables.sql         # DDL scripts for all 10 tables
│   ├── 02_constraints_indexes.sql   # FK, UK, CHECK constraints and indexes
│   └── 03_seed_data.sql             # Sample/test data for all tables
│
├── views/
│   ├── vw_OpenTickets.sql
│   ├── vw_TicketsByAgent.sql
│   ├── vw_SLABreach.sql
│   ├── vw_DeptSummary.sql
│   └── vw_TicketHistory.sql
│
├── stored_procedures/
│   ├── sp_CreateTicket.sql
│   ├── sp_UpdateTicketStatus.sql
│   ├── sp_AssignTicketToAgent.sql
│   ├── sp_CloseTicket.sql
│   ├── sp_EscalateTicket.sql
│   └── sp_GetTicketsByUser.sql
│
├── triggers/
│   ├── tr_AuditTicketInsert.sql
│   └── tr_AuditTicketUpdate.sql
│
├── functions/
│   └── fn_GetSLAStatus.sql
│
├── reports/
│   ├── rpt_OpenTicketsByDept.sql
│   ├── rpt_AgentPerformance.sql
│   ├── rpt_SLABreachRate.sql
│   ├── rpt_MonthlyVolume.sql
│   ├── rpt_FirstResponseTime.sql
│   └── rpt_PendingOver72Hrs.sql
│
├── docs/
│   ├── SRS_v1.0.pdf                 # Software Requirements Specification
│   ├── ER_Diagram.png               # Entity Relationship Diagram
│   ├── Data_Dictionary.xlsx         # All tables, columns and constraints
│   └── Deployment_Runbook.pdf       # Step-by-step deployment guide
│
└── README.md
```

---

## 📅 Monthly Progress

| Month | Focus Area |
|---|---|
| **Jan 2026** | Onboarding, project introduction, requirement gathering, ER diagram |
| **Feb 2026** | Database schema design, DDL scripting, views, seed data |
| **Mar 2026** | Stored procedures, triggers, advanced SQL, CTEs, window functions |
| **Apr 2026** | Debugging, troubleshooting, testing, QA, query optimisation |
| **May 2026** | Report generation, advanced SQL analytics, documentation |
| **Jun 2026** | UAT support, change requests, deployment preparation |
| **Jul 2026** | Production support, final handover, internship closure |

---

## 🏢 Company

**High Flows IT Solutions Pvt. Ltd.**
Plot #682, 5th Floor, Babukhan Rasheed Plaza,
Road No:36, Aditya Enclave, Jubilee Hills,
Hyderabad, Telangana – 500033

📞 +91-9059830801
🌐 [www.highflowsitsolutions.com](https://www.highflowsitsolutions.com)
📧 info@highflowsitsolutions.com

---

> *This project was developed as part of the Jr Engineer Internship Programme at High Flows IT Solutions Pvt. Ltd. from January 2026 to July 2026.*
