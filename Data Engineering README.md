# DATA ENGINEERING DOCUMENTATION

[![Fabric](https://img.shields.io/badge/Microsoft%20Fabric-2.0-blue?style=flat-square&logo=microsoft)](https://fabric.microsoft.com)
[![Lakehouse](https://img.shields.io/badge/Architecture-Medallion-green?style=flat-square)](https://www.databricks.com/glossary/medallion-architecture)
[![Status](https://img.shields.io/badge/Phase-Bronze%20Complete-success?style=flat-square)]()
[![Status](https://img.shields.io/badge/Silver%20Complete-success?style=flat-square)]()
[![Status](https://img.shields.io/badge/Gold%20Layer-Pending-yellow?style=flat-square)]()

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
**Data Characteristics & Requirements:**
- **Data Volumne:** ~ [X] MB initially, growing at ~[Y] TB/month
- **Change Frequency:**
  - **Daily Batch:** Transactional data, claims processing
  - **Monthly/Quarterly:** Financial reporting, regulatory data   
- **Query Performance Requirements**
  - **Operational queries:** < 1 second response time
  - **Analytical queries:** < 30 seconds for complex aggregations
  - **Batch reporting:** Completion within [X] hours window

The AIDW will follow a **Medallion Architecture** (Bronze, Silver, Gold) implemented in the Microsoft Fabric platform, combining the best of data lakes and warehouses.

**HIGH-LEVEL DATA ARCHITECTURE**
The AIDW encompasses four core data domains, each with specialized dimensional models:
![Data Architecture](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/High-level-data-architecture.png)

**Data Flow Details**
- **Source Systems:** Core insurance system, CRM, claims system, external data providers (hypothetical as everything is coming from github)
- **Ingestion Patterns:** Batch (daily) incremental loading 
- **Processing Windows:** Daily ETL completes by 6:00 AM, monthly jobs by 3rd business day
  
##### 4.1 Applicants Data Model
**Purpose: Comprehensive view of insurance applicants including demographic, financial, employment, and health information.

**Key Entities:**
* **fact_applicants:** Core applicant information with personal details
* **banking (SCD Type 2):** Applicant bank account details with historical tracking
* **employment (SCD Type 2):** Job and financial information with change tracking
* **health (SCD Type 2):** Lifestyle and health factors for risk assessment
* **demographics:** Ethnic and demographic classification
* **nationality:** Country and citizenship information
![Applicants Model](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/Applicants%20Data%20Model.png)

##### 4.2 Policies Data Model
**Purpose:** Management of insurance policies, coverage details, and agent relationships.

**Key Entities:**
* **fact_policy_coverage:** Coverage amounts, premiums, and deductibles
* **fact_insurance_policies:** Core policy information with risk factors
* **dim_policies_dates:** Policy lifecycle dates and tenure information
* **dim_agents:** Insurance agent details
* **fact_reinsurance:** Reinsurance arrangements and treaty details
* **dim_reinsurance_companies:** Reinsurance provider information

![Policies Model](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/Policies%20Data%20Models.png)

##### 4.3 Claims Data Model
**Purpose:** Tracking and analysis of insurance claims processing and settlement.
![Claims Model](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/Claims%20Data%20Model.png)

**Key Entities:**
**dim_claim_processing_details:** Claim initiation and processing information
**fact_claims:** Claims settlement and outcome details

##### 4.4 Payments Data Model
**Purpose:** Recording and analysis of premium payments and financial transactions.

**Key Entity:**
**payments:** Payment transactions with method and amount details
![Payments Model](https://raw.githubusercontent.com/inhamo/Insurance-Data-Engineering-and-Analysis-Project/main/Assets/Images/Payment%20Data%20Models.png)

**Data Relationships:**
Applicants are linked to Policies through `applicant_id`
Policies are linked to Claims through `policy_number`
Payments are linked to Policies through `policy_number`
SCD Type 2 implementations track historical changes in critical dimensions

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
- **Data Quality Framework Details:**
  - Bronze: Schema validation, null checks, data type validation
  - Silver: Business rule validation, referential integrity, deduplication
  - Gold: Cross-domain consistency, aggregation accuracy
- DQ Metrics: Completeness, accuracy, consistency, timeliness, uniqueness
- DQ Monitoring: Automated alerts for DQ breaches, DQ dashboards

**Data Classification:**
- **PII/Confidential:** Customer data, financial information
- **Internal:** Operational metrics, process data
- **Public:** Aggregated reports, anonymized datasets

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
### Phase 1: Foundation & Core Data (Weeks 1-2) 
- Set up Fabric environment and infrastructure
- Implement Bronze layer for key sources
- Build Silver dimensional models (Applicants, Policy, Premium, Claims)
- Implement basic data quality framework
- Deliver: Customer 360 view MVP, Policy performance reports

### Phase 2: Advanced Models & Analytics (Weeks 2-4)
- Implement remaining Silver layer models
- Build Gold layer semantic models
- Develop key views:
  - Claim amount approved vs settled amount
  - Claims by type analysis
  - Reinsurance exposure dashboard
- Implement advanced DQ and monitoring
- Enable Data Science team access
  
### Phase 3: Optimization & Expansion (Weeks 5)
- Performance tuning and optimization
- Implement advanced features (ML integration, real-time capabilities)
- Expand to additional data sources
- User training and documentation
- Production handover and support model

## 10. Appendices
#### A. Key Business Views & Use Cases: 
1. **Customer View 360**
- Purpose: Unified customer profile across all touchpoints
- Components: Demographics, policies, claims, interactions, risk score
- Users: Marketing, Customer Service, Underwriting
2. **Claims Analysis Suite:**
- Approved vs Settled Amount View
- Claims by Type & Category
- Claims Processing Efficiency Metrics
- Fraud Detection Indicators
3. **Policy Performance Dashboard:**
- Policy profitability by product line
- Retention and lapse rates
- Premium collection efficiency
- Cross-sell/upsell opportunities
4. **Reinsurance Management:**
- Exposure by treaty type
- Retention vs ceded amounts
- Reinsurance cost analysis
- Counterparty risk assessment
  
#### B. Technology Specifics:
**Data Transformation Approach:**
- Light transformations in Bronze (type casting, basic cleaning)
- Business logic in Silver (SCD2 handling, deduplication, enrichment)
- Aggregations and business metrics in Gold

**Governance Strategy:**
- Centralized data catalog
- Lineage tracking
- Access control by data classification
- Audit logging and compliance reporting

#### C. Implementation Considerations:
- **Team Structure:** Centralized vs Federated model
- **Skill Requirements**: SQL, PySpark, Fabric administration, data modeling
- **Training Plan:** 2-week onboarding for business users, technical deep dives
- **Success Metrics:**
  - Data availability > 99.5%
  - Report generation time reduced by 70%
  - Manual data consolidation eliminated
  - Regulatory reporting accuracy improved to 100%
  
---
How large is the data?
How often does it change?
What's the required query performance?
Is this for analysis or production?
Do you need to transform or enrich it?
What's your team's data governance strategy?
Views- claim amount approved vs settled amount, Customer view 360, claims by type, policy performance, reinsurance exposure 


23 minutes 41 seconds
