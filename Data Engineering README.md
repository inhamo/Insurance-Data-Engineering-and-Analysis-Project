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

### Architecture & Data Flow
---
The AIDW will follow a **Medallion Architecture** (Bronze, Silver, Gold) implemented in the Microsoft Fabric platform, combining the best of data lakes and warehouses.

**HIGH-LEVEL DATA ARCHITECURE**











