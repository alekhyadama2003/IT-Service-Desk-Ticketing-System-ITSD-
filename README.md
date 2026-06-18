# IT Service Desk & Ticketing System (ITSD)

A relational database project built during a Jr Engineer Internship to manage the complete lifecycle of IT support tickets — creation, assignment, SLA tracking, escalation, resolution and reporting.

---

## Skills

![SQL](https://img.shields.io/badge/SQL-SQL%20Server%202022-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![SDLC](https://img.shields.io/badge/SDLC-Agile%20Scrum-0078D4?style=for-the-badge)
![Debugging](https://img.shields.io/badge/Debugging-SQL%20Profiler%20%7C%20Execution%20Plans-228B22?style=for-the-badge)
![Troubleshooting](https://img.shields.io/badge/Troubleshooting-Bug%20Fixes%20%7C%20Index%20Optimisation-FF8C00?style=for-the-badge)
![DBMS](https://img.shields.io/badge/DBMS-Normalisation%20%7C%20Transactions%20%7C%20Integrity-6A0DAD?style=for-the-badge)
![Testing](https://img.shields.io/badge/Testing-Test%20Cases%20%7C%20Regression-DC143C?style=for-the-badge)

---

## Project Overview

The ITSD system digitises the IT support workflow for an organisation. It handles:
- Ticket creation, assignment, escalation and closure
- SLA breach detection and alerting
- Agent performance and workload tracking
- Full audit trail of all changes
- Analytical reports for management

---

## SQL Concepts Covered

| Area | Details |
|---|---|
| DDL | CREATE TABLE, ALTER TABLE, DROP — 10 tables with all constraints |
| DML | INSERT, UPDATE, DELETE, MERGE — across all modules |
| Constraints | PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT |
| Indexes | Clustered & non-clustered indexes for query optimisation |
| Views | 5 views for reporting and data abstraction |
| Stored Procedures | 6 parameterised SPs with TRY/CATCH and transaction handling |
| Triggers | AFTER INSERT / UPDATE triggers for audit logging |
| Functions | Scalar UDF for SLA status calculation |
| Joins | INNER JOIN, LEFT JOIN across 10 relational tables |
| Subqueries & CTEs | Common Table Expressions for multi-step logic |
| Window Functions | ROW_NUMBER(), DENSE_RANK(), LAG() with PARTITION BY |
| Aggregations | GROUP BY, ROLLUP, HAVING, PIVOT for reports |
| Transactions | BEGIN TRAN, COMMIT, ROLLBACK for data consistency |

---

## SDLC — Agile Scrum (7 Sprints)

| Phase | Activities |
|---|---|
| Requirement Gathering | Stakeholder interviews, 25 user stories, SRS v1.0 |
| System Design | ER diagram, normalisation (1NF–3NF), schema design |
| Development | DDL scripts, SPs, triggers, views, functions |
| Testing | 40 test cases, regression testing, integration testing |
| UAT | Sessions with stakeholders, 5 change requests implemented |
| Deployment | Staging deployment, SQL Agent job, deployment runbook |
| Support | Post go-live monitoring, bug fixes, knowledge transfer |

---

## Debugging

- Used **SQL Server Profiler** to trace slow-running queries during load testing
- Analysed **Execution Plans** to detect Table Scans and missing index warnings
- Used **SET STATISTICS TIME** and **SET STATISTICS IO** to measure query cost
- Used **Git blame** and **diff** to trace logic bugs across commits
- Reduced average query time from **380ms → 145ms** via index optimisation

---

## Troubleshooting

| Bug | Root Cause | Fix Applied |
|---|---|---|
| sp_CloseTicket re-closing tickets | Missing status guard | Added IF check before UPDATE |
| SLA breach not triggering on weekends | Date boundary logic error | Corrected DATEDIFF calculation |
| AuditLog duplicate rows on bulk update | Trigger firing per row | Added batch-level dedup check |
| vw_SLABreach false positives | Wrong comparison operator | Corrected `>` to `<=` |
| Description truncation error | VARCHAR(255) too small | Migrated to VARCHAR(MAX) |
| Collation mismatch on JOIN | Tables had different collation | Added COLLATE clause |

---

## Database Schema

| Table | Purpose |
|---|---|
| `Ticket` | Core ticket records with status, priority and timestamps |
| `Users` | Agents and end-users with role-based access |
| `Department` | Organisational department mapping |
| `Category` | Ticket category classification |
| `Priority` | Priority levels P1–P4 with SLA hours |
| `Status` | Ticket lifecycle states: Open → In Progress → Resolved → Closed |
| `Comment` | Agent and user comments on tickets |
| `Attachment` | File attachments linked to tickets |
| `SLA` | Resolution and response hours per priority |
| `AuditLog` | Full audit trail of all INSERT and UPDATE events |

---

## Repository Structure

```
ITSD/
├── schema/
│   ├── 01_create_tables.sql
│   ├── 02_constraints_indexes.sql
│   └── 03_seed_data.sql
│
├── views/
│   ├── vw_OpenTickets.sql
│   ├── vw_SLABreach.sql
│   ├── vw_TicketsByAgent.sql
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
│   └── rpt_PendingOver72Hrs.sql
│
└── README.md
```

---

## How to Run

1. Open **SQL Server Management Studio (SSMS)**
2. Create a new database: `CREATE DATABASE ITSD_DB;`
3. Run scripts in order:
   - `schema/01_create_tables.sql`
   - `schema/02_constraints_indexes.sql`
   - `schema/03_seed_data.sql`
   - All files in `views/`, `functions/`, `triggers/`, `stored_procedures/`
   - Reports can be run anytime after setup

---

## Intern Details

| | |
|---|---|
| **Name** | Alekhya Dama |
| **Designation** | Jr Engineer Intern |
| **Candidate ID** | HF 1024 |
| **Duration** | 12 January 2026 – 12 July 2026 |


> *This project was developed as part of the Jr Engineer Internship Programme at High Flows IT Solutions Pvt. Ltd. from January 2026 to July 2026.*
