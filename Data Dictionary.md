# **Column Definitions Dictionary**

## **Applicant-Related Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **applicant_id** | Unique identifier for the insurance applicant |
| **full_name** | Complete legal name of the applicant |
| **gender** | Gender identity (Male/Female/Other) |
| **date_of_birth** | Birth date of the applicant |
| **id_number** | Government-issued identification number |
| **proof_of_address** | Document that verifies residential address |
| **ethnicity** | Cultural/racial background or ethnic group |
| **country** | Country of nationality or citizenship |

## **Banking & Financial Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **bank_name** | Name of the financial institution |
| **bank_account_number** | Account number at the bank |
| **monthly_income_zar** | Monthly earnings in South African Rand |
| **owned_assets_value_zar** | Total value of owned assets in ZAR |
| **owned_debt_value_zar** | Total value of outstanding debts in ZAR |
| **credit_score** | Numerical representation of creditworthiness |

## **Employment Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **job_title** | Official job position/occupation |
| **is_current** | Flag indicating if this is the current/active record (SCD Type 2) |

## **Health & Lifestyle Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **is_current_smoker** | Whether applicant currently smokes tobacco |
| **no_of_smoking_years** | Total number of years spent smoking |
| **is_previous_smoker** | Whether applicant smoked in the past but quit |
| **years_since_quit_smoking** | Years elapsed since quitting smoking |
| **alcohol_usage** | Pattern of alcohol consumption (e.g., Occasional, Regular) |
| **alcohol_units_per_week** | Number of standard alcohol units consumed weekly |
| **is_on_long_term_medication** | Whether taking medication for a chronic condition |
| **no_of_years_on_medication** | Duration of long-term medication use in years |
| **dual_substance_use** | Concurrent use of multiple substances (e.g., tobacco + alcohol) |
| **smoker_category** | Classification of smoking habits (e.g., Light, Heavy, Former) |
| **quit_success_score** | Score indicating likelihood of maintaining smoking cessation |

## **Policy-Related Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **policy_number** | Unique identifier for an insurance policy |
| **coverage** | Maximum amount the policy will pay |
| **premium** | Regular payment amount for the insurance |
| **deductible** | Amount paid out-of-pocket before insurance pays |
| **exposure_amount** | Total risk value insured by the policy |
| **channel** | Sales/source channel (e.g., Online, Agent, Broker) |
| **risk_factor** | Numerical rating of policy risk (higher = riskier) |
| **discount_percentage** | Percentage discount applied to premium |
| **effective_date** | Date when policy coverage begins |
| **expiration_date** | Date when policy coverage ends |
| **renewal_notice_date** | Date when renewal reminder is sent |
| **policy_tenure** | Total duration of policy in days |
| **renewals_days_before_expiration** | Days before expiry when renewal process starts |

## **Claim-Related Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **claim_id** | Unique identifier for an insurance claim |
| **claim_type** | Category of claim (e.g., Health, Auto, Property) |
| **claim_amount** | Amount requested by the claimant |
| **date_of_claim** | Date when claim was submitted |
| **claim_handler** | Person responsible for processing the claim |
| **claim_status** | Current state of claim (e.g., Pending, Approved, Denied) |
| **settlement_amount** | Final amount paid to settle claim |
| **date_of_settlement** | Date when claim was settled/paid |
| **processing_days** | Number of days to process the claim |
| **complexity_level** | Rating of claim complexity (e.g., Simple, Complex) |
| **documentation_status** | Status of required supporting documents |

## **Payment Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **payment_id** | Unique identifier for a payment transaction |
| **payment_date** | Date when payment was made |
| **payment_method** | Method of payment (e.g., Credit Card, Bank Transfer) |
| **amount_paid** | Amount of money paid |
| **load_timestamp** | Date/time when record was loaded into database |

## **Agent & Reinsurance Columns**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **agent_name** | Name of insurance agent/salesperson |
| **has_excess_of_loss** | Whether policy has excess of loss reinsurance |
| **is_reinsured** | Whether policy is shared with reinsurance company |
| **reinsurance_share** | Percentage of risk transferred to reinsurer |
| **excess_of_loss_retention_amount** | Amount insurer retains before reinsurance pays |
| **reinsurance_type** | Type of reinsurance arrangement |
| **reinsurance_company** | Name of reinsurance company |

## **Technical/Surrogate Keys**

| Column Name | Meaning / Definition |
|-------------|----------------------|
| **_sk suffix** | Surrogate Key - system-generated unique identifier |
| **load_timestamp** | When the record was loaded/updated in the system |
| **is_current** | Flag for SCD Type 2 - identifies current version of record |

---

**Abbreviations:**
- **ZAR** = South African Rand (currency)
- **SCD** = Slowly Changing Dimension
- **PK** = Primary Key
- **FK** = Foreign Key
