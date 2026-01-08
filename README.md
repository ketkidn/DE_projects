# SQL Server to Snowflake ELT Pipeline (Data Engineering Project)

## Overview

This project demonstrates an end-to-end **ELT (Extract, Load, Transform)** data engineering pipeline built using a modern analytics stack.  
The goal is to simulate a real-world data ingestion workflow, handle common engineering challenges, and apply best practices around layering, transformations, and analytics readiness.

The project intentionally focuses not just on the happy path, but also on **practical issues encountered while developing on macOS**, such as environment setup, database case sensitivity, timestamp handling, and dbt configuration.

---

## Architecture

SQL Server (Docker)
↓
Python (Extract & Load)
↓
Snowflake (RAW schema)
↓
dbt (Transformations)
↓
Analytics / BI-ready Models


---

## Tech Stack

- **Source Database**: SQL Server (Docker container)
- **Programming Language**: Python 3
- **Data Transfer**: pandas + Snowflake Connector (`write_pandas`)
- **Cloud Data Warehouse**: Snowflake
- **Transformations**: dbt (Data Build Tool)
- **OS**: macOS
- **Version Control**: Git

---

## Project Structure

sqlserver_to_snowflake/
│
├── extract_sqlserver.py # Extract data from SQL Server
├── load_snowflake.py # Load data into Snowflake RAW schema
├── .env # Environment variables (not committed)
├── requirements.txt # Python dependencies
├── venv/ # Python virtual environment
│
├── snowflake_analytics/ # dbt project
│ ├── models/
│ │ ├── sources.yml
│ │ ├── staging/
│ │ └── marts/
│ └── dbt_project.yml
│
└── README.md


---

## Data Flow Explanation

### 1. SQL Server (Docker)
- SQL Server runs inside a Docker container.
- Sample tables such as `customers` and `orders` are created and populated.
- Acts as the transactional source system.

### 2. Python – Extract & Load
- Python connects to SQL Server using `pyodbc`.
- Data is extracted into pandas DataFrames.
- Data is loaded into Snowflake using `write_pandas()` into the **RAW schema**.

### 3. Snowflake – RAW Layer
- RAW schema stores data **as-is** from the source.
- No transformations are applied at this stage.
- Acts as a landing zone for upstream systems.

### 4. dbt – Transformations
- dbt models reference RAW tables via `sources.yml`.
- Staging models standardize naming, data types, and structure.
- Mart models create analytics-ready fact and dimension tables.

---

## Key Challenges & Learnings

- **Timestamp handling**:  
  Required explicit handling while loading data using `write_pandas()` to avoid type mismatch errors.

- **Case sensitivity in Snowflake**:  
  Tables created as `"orders"` required quoted identifiers. This was resolved by standardizing table creation without quoted names.

- **Reserved keywords**:  
  `orders` being a reserved keyword caused query issues and required careful handling.

- **dbt model placement**:  
  Understanding correct folder structure (`staging`, `marts`, `sources`) was critical for clean transformations.

- **macOS environment setup**:  
  Managing Python versions, virtual environments, and database drivers on macOS required additional configuration.

- **Virtual environments (`venv`)**:  
  Ensured dependency isolation and prevented system-level conflicts.

---

## Setup Instructions (High Level)

1. Start SQL Server using Docker
2. Create source tables and insert sample data
3. Create and activate Python virtual environment
4. Install dependencies
5. Configure `.env` file
6. Run Python scripts to load data into Snowflake
7. Initialize and run dbt models

---

## Why This Project?

This project is designed to showcase:
- Practical ELT pipeline design
- Real-world debugging and problem-solving
- Cloud data warehouse best practices
- dbt-based transformation workflows
- macOS-specific data engineering setup experience

It is suitable as a **portfolio project for Data Engineering roles**.

---

## Future Enhancements

- Incremental loading logic
- Slowly Changing Dimensions (SCD)
- Data quality tests in dbt
- Orchestration using Airflow or Prefect
- CI/CD for dbt models
- Monitoring and logging

---

## Author

**Ketki Shastri**  
Data Engineering | SQL | Python | Snowflake | dbt


