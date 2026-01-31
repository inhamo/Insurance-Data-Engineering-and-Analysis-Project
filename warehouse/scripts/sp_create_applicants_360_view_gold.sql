CREATE OR ALTER VIEW applicants_360_view
AS 
WITH ClaimStatusAgg AS (
    -- Pre-aggregate claim status counts and amounts via insurance_policies
    SELECT 
        ip.applicant_id,
        COUNT(DISTINCT c.claim_id) AS total_claims,
        COUNT(DISTINCT CASE WHEN cpd.claim_status = 'APPROVED' THEN c.claim_id END) AS approved_no_claims,
        COUNT(DISTINCT CASE WHEN cpd.claim_status = 'PENDING' THEN c.claim_id END) AS pending_no_claims,
        COUNT(DISTINCT CASE WHEN cpd.claim_status = 'REJECTED' THEN c.claim_id END) AS rejected_no_claims,
        SUM(CASE WHEN cpd.claim_status = 'APPROVED' THEN cpd.settlement_amount ELSE 0 END) AS approved_settlement_amount
    FROM claims.fact_claims c
    LEFT JOIN claims.dim_claim_processing_details cpd
        ON cpd.claim_id = c.claim_id
    LEFT JOIN policies.fact_insurance_policies ip
        ON ip.policy_number = c.policy_number
    GROUP BY ip.applicant_id
),
PolicyAgg AS (
    -- Pre-aggregate policy metrics
    SELECT 
        ip.applicant_id,
        AVG(ip.risk_factor) AS avg_risk_factor,
        COUNT(DISTINCT ip.policy_number) AS no_of_policies
    FROM policies.fact_insurance_policies ip
    GROUP BY ip.applicant_id
),
PaymentAgg AS (
    -- Pre-aggregate payment metrics
    SELECT 
        ip.applicant_id,
        SUM(ph.amount_paid) AS total_premium_amount
    FROM policies.fact_insurance_policies ip
    LEFT JOIN premiums.fact_payment_history ph
        ON ph.policy_number = ip.policy_number
    GROUP BY ip.applicant_id
)
SELECT DISTINCT
    fa.applicant_id, 
    fa.date_of_birth,
    CAST(ISNULL(pa.avg_risk_factor, 0) AS DECIMAL(5, 2)) AS avg_risk_factor,
    ISNULL(pa.no_of_policies, 0) AS no_of_policies,
    ISNULL(pay.total_premium_amount, 0) AS total_premium_amount, 
    ISNULL(csa.total_claims, 0) AS total_claims, 
    ISNULL(csa.approved_no_claims, 0) AS approved_no_claims, 
    ISNULL(csa.pending_no_claims, 0) AS pending_no_claims,
    ISNULL(csa.rejected_no_claims, 0) AS rejected_no_claims,
    ISNULL(csa.approved_settlement_amount, 0) AS approved_settlement_amount
FROM applicants.fact_applicants fa
LEFT JOIN PolicyAgg pa
    ON pa.applicant_id = fa.applicant_id
LEFT JOIN PaymentAgg pay
    ON pay.applicant_id = fa.applicant_id
LEFT JOIN ClaimStatusAgg csa
    ON csa.applicant_id = fa.applicant_id
