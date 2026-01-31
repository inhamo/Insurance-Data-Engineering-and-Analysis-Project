CREATE OR ALTER PROCEDURE pcd_cls_lk_atlas_insurance_data_SILVER_silver
AS
BEGIN

    DECLARE @LakehouseDB VARCHAR(100) = 'lk_atlas_insurance_data_SILVER';

    -- LAKEHOUSE 
-- Apply column level security
    EXEC
    (
        '
            USE [' + @LakehouseDB + '];
            DENY SELECT ON lk_atlas_insurance_data_SILVER.dbo.fact_applicants(full_name, id_number) TO [Nomusa@takueinnogmail.onmicrosoft.com]
            DENY SELECT ON lk_atlas_insurance_data_SILVER.dbo.fact_applicants(full_name, id_number) TO [nolwazi@takueinnogmail.onmicrosoft.com]
        '
    );

    -- Applicants banking
    EXEC
    (
        '
            USE [' + @LakehouseDB + '];
            DENY SELECT ON lk_atlas_insurance_data_SILVER.dbo.applicants_banking(bank_account_number) TO [Nomusa@takueinnogmail.onmicrosoft.com]
            DENY SELECT ON lk_atlas_insurance_data_SILVER.dbo.applicants_banking(bank_account_number) TO [nolwazi@takueinnogmail.onmicrosoft.com]
        '
    );

    -- Applicants contacts
    EXEC
    (
        '
            USE [' + @LakehouseDB + '];
            DENY SELECT ON lk_atlas_insurance_data_SILVER.dbo.applicants_contacts(contact) TO [Nomusa@takueinnogmail.onmicrosoft.com]
            DENY SELECT ON lk_atlas_insurance_data_SILVER.dbo.applicants_contacts(contact) TO [nolwazi@takueinnogmail.onmicrosoft.com]
        '
    );
END;