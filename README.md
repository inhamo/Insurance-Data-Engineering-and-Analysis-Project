# INSURANCE DATA PLATFORM - BUSINESS STRATEGIC

## Table of Contents

1. [Project Context & Vision](#1-project-context-and-vision)  
2. [Stakeholder Requirements by Department](#2-stakeholder-requirements-by-department)
---
### 1. Project Context & Vision
- **Project Name:** Atlas Insurance Analytics Platform
- **Vision:** Transform insurance operation through data-driven insights and automation 
- **Core Problem Statement**: Siloed data across policy, claims, customer systems leading to inefficient pricing, slow claims, and missed opportunities

##### 1.1 Background 
The Atlas Insurance Company data engineering and analysis project is a strategic initiative to create a single source of truth for all insurance data for anlysis and modelling. This centralized, modern data platform will empower the organization with accurate, timely, and accessible data for regulatory reporting, advanced customer analytics, risk management, and operational intelligence. By moving away from seperate data sources and fragemented reports, we aim to drive efficiency, enhance decision-making, and maintain a competitive edge in the market. 

#### 1.2 Business Objective 
**Vision:**
To enable a data-driven culture at Atlas Insurance by providing a secure, scalable, and trusted data platform that turns raw data into a strategic asset.

**Key Business Objectives:**
1. **Quantify Current State:** Determine actual loss ratios and combined ratios across all products
2. **Identify Problem Areas:** Pinpoint specific products, segments, or regions with unsustainable loss experience or reasons why applicants are not renewing policies
3. **Establish Benchmarks:** Compare performance against available industry standards.
4. **Create Baseline Models:** Develop initial pricing and reserving models based on historical data
5. **Building Monitoring Foundation:** Implement systems to track ongoing performance.

**Note:** Specific numerical targets will be established after initial analysis reveals current performance levels. The project will first answer "Where are we?" before determining "Where should we go?"

##### Business Success Criteria

#### 1.3 Inventory Resources
#### Personnel
---
| **Name** | **Organization** | **Role** | **Contact Information** |
|----------|------------------|----------|-------------------------|
|Innocent | Data Engineering | Data engineer | takueinno@takueinnogmail.onmicrosoft.com |
|Nomusa| Data Analyst and BI Intelligence | Data Analyst | Nomusa@takueinnogmail.onmicrosoft.com |

##### Data
---
| **Location** | **Storage Type** | **Description** | **Contacts** |
|----------|------------------|----------|-------------------------|
|[github](https://github.com/inhamo/Datasets-Final/blob/main/insurance_data/claims_history.parquet) | Parquet | Claims history data | nhamo.innotaku@gmail.com |
|[github](https://github.com/inhamo/Datasets-Final/blob/main/insurance_data/insurance_applicants.parquet) | Parquet | Insurance Applicants data| nhamo.innotaku@gmail.com |
|[github](https://github.com/inhamo/Datasets-Final/blob/main/insurance_data/insurance_policies.parquet) | Parquet | Insurance policies data | nhamo.innotaku@gmail.com |
|[github](https://github.com/inhamo/Datasets-Final/blob/main/insurance_data/payment_history.parquet) | Parquet | Premium payment data| nhamo.innotaku@gmail.com |

**Tech Stack**
**Data Engineering**
- **Orchestration**
  - Microsoft Fabric (PySpark, Python)
- **Quality**
  - 
- **Storage**
  - Lakehouse (raw data and staging data)
  - Warehouse (cleaned data)
- **Processing**
  - Microsoft Fabric (Dataflow Gen2, Pipeline, Notebook(Python, PySpark))


**Data Analysis**
- Power BI
- Microsoft Fabric

**Business Assumptions**
1. Historical loss patterns will continue into the near future.
2. Historical data (2015-2020) is sufficiently representative to build foundational models.
3. Regulatory environment remains stable during implementation
4. Customer behaviour won't change dramatically due to price increases
5. The business has capacity to implement recommended changes.

**Data Assumptions**
1. Historical data is representative of future business
2. Claim reporting patterns are consistent across time
3. Data completeness > 85% for critical fields
4. No systematic bias in data collection process
5. External data sources will remain available and reliable

### Constraints
**Project Constraints**
- **Unknown Starting Point:** Cannot pre-define specific numerical targets.


















## 10. Appendices

### Document History

| Version | Date         | Author         | Changes                        |
|---------|--------------|----------------|--------------------------------|
| 1.0     | 10 Jan 2026  | Innocent Nhamo | Initial version created        |




