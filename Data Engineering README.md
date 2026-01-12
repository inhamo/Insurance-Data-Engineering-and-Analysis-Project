# DATA ENGINEERING DOCUMENTATION
---
**Project Name:** Atlas Insurance Data Warehouse (AIDW)
**Version:** 1.0 
**Status:** Inception 
**Last Update:** 11 January 2026

### Table of Contents
1. [Project Charter & Executive Summary](#1-project-charter--executive-summary)  
2. [Vision & Business Objectives](#2-vision--business-objectives)  
3. [Architecture & Data Flow](#3-architecture--data-flow)  
4. [Technology Stack](#4-technology-stack)  
5. [Data Governance & Quality Framework](#5-data-governance--quality-framework)  
6. [Naming Conventions & Standards](#6-naming-conventions--standards)  
7. [Project Timeline & Milestones (Phased Approach)](#7-project-timeline--milestones-phased-approach)  
8. [Roles & Responsibilities](#8-roles--responsibilities)  
9. [Risks & Mitigations](#9-risks--mitigations)  
10. [Appendices](#10-appendices)  

### 1. Project Charter & Executive Summary 
The Atlas Insurance Data Warehouse (AIDW) project is a strategic initiative to create a single source of truth for all banking data. 
This centralized, modern data platform will empower the organization with accurate, timely, and accessible data for regulatory reporting, 
advanced customer analytics, risk management, and operational intelligence. By moving away from siloed data sources and fragmented reports, 
we aim to drive efficiency, enhance decision-making, and maintain a competitive edge in the market.

### 2. Vision & Business Objectives
Vision:
To enable a data-driven culture at Atlas Insurance by providing a secure, scalable, and trusted data platform that turns raw data into a strategic asset.

**Key Business Objectives:**
- **Regulatory Compliance:** Streamline and automate the generation of critical reports (e.g., Basel III, IFRS 9, AML/KYC).
- **360-Degree Customer View:** Unify customer data from core insurance and CRM to enable personalized marketing and improve customer service.
- **Risk Management:** Enhance credit, market, and operational risk modeling with integrated and historical data.
- **Operational Efficiency:** Automate manual data consolidation processes, reducing reporting cycle times and resource costs.
- **Advanced Analytics:** Provide a clean, modeled data foundation for Data Science and BI teams to build ML models and discover new business insights.

### 3. Architecture & Data Flow
---
The AIDW will follow a **Medallion Architecture** (Bronze, Silver, Gold) implemented in the Microsoft Fabric platform, combining the best of data lakes and warehouses.

**HIGH-LEVEL DATA ARCHITECTURE**
![Data Architecture](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/High-level-data-architecture.png)
![Applicants Model](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/Applicants%20Data%20Model.png)

### 4. Technology Stack
|  **Category**   |                   **Technology**                     |                     **Rationale**                      |
|-----------------|------------------------------------------------------|--------------------------------------------------------|
| Platform        | Microsoft Fabric                                     | Unified platform for ETL, collaboration, and analytics |
| Storage         | Microsoft Fabric (Lakehouse, Data Warehouse)         | Durable object storage for all data layers             |
| Orchestration   | Microsoft Fabric (Data Pipeline, Notebook)           | Schedule, manage, and monitor complex data pipelines   |
| Processing      | Microsoft Fabric (Dataflow Gen2, Notebook, Pipeline) | Easy for transforming the data                         |
| Version Control | Git (GitHub)                                         | For all code (SQL, PySpark, Python)                    |

### 5. Data Governance & Quality Framework
- **Data Ownership:** Each data domain will have a designated Business Data Owner.
- **Source System Documentation:** All data sources will be formally documented with metadata including:
  - Source System
  - Extraction Method
  - Extraction Frequency
  - Data Owner
  - Data Classification (PII, Confidential, Public)
  - Retention Policy
- **Data Quality (DQ):** DQ checks will be implemented at each layer

## 6. Naming Conventions & Standards

Adherence to these conventions is mandatory to ensure consistency, improve readability, and simplify maintenance.

### General Principles

- **Case:** Use `snake_case` for all names.
- **Reserved Words:** Avoid SQL reserved keywords (e.g., use `transaction_date` instead of `date`).
- **Clarity & Brevity:** Names must be clear and descriptive without unnecessary abbreviation.

### Table Naming Conventions by Layer

- **Bronze Layer (Raw):** `[source_system]_[entity]`  
  Example: `core_banking_customer`, `finance_transactions`

- **Silver Layer (Cleansed):** Use a clear, singular noun for the business entity. Use `fact` and `dim` prefixes for normalized tables.  
  Example: `dim_customer`, `fact_account`, `fact_customers`, `dim_customer_identifications`

- **Gold Layer (Business Semantics):** `[domain_entity_purpose]`  
  Example: `customer_360_wide`, `compliance_insurance_summary`

### Column Naming Conventions

- **General Rule:** Use descriptive, singular nouns in `snake_case`.  
  Example: `first_name`, `account_balance`, `effective_date`

- **Surrogate Keys:** `[table_name]_sk`  
  Example: `customer_sk`

- **Technical Columns:**  
  - `created_timestamp`  
  - `modified_timestamp`  
  - `source_system`  
  - `batch_id`

### Stored Procedure & Script Naming

- **Structure: Procedure** `pcd_[action]_[target_object]_[layer]`  
  Example: `pcd_merge_dim_customer_silver`, `pcd_insert_into_fct_transactions_silver`

  - **Structure: Script** `[action]_[target_object]_[layer]`  
  Example: `sp_merge_dim_customer_silver`, `sp_insert_into_fct_transactions_silver`

|     **Item**      | **Naming Conversion**                  | 
|-------------------|----------------------------------------|
| Workspace         | wk_[company]_[data]                    |
| Dataflow Gen2     | dfg2_[action]__[layer]_[data]          |
| Scripts           | sp_[action]__[target_object]_[layer]   |
| Pipelines         | pl_[action]__[target_object]_[layer]   |

---
## 7. Project Timeline & Milestones (Phased Approach)
### Phase 1: 
### Phase 2:
### Phase 3: 

---
How large is the data?
How often does it change?
What's the required query performance?
Is this for analysis or production?
Do you need to transform or enrich it?
What's your team's data governance strategy?

**dataflow refreshing pipeline. reasoning - changes can be automatically executed for us**



