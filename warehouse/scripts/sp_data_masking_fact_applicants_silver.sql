CREATE OR ALTER PROCEDURE pcd_data_masking_fact_applicants_warehouse
AS
BEGIN
    DECLARE @LakehouseDB VARCHAR(100) = 'lk_atlas_insurance_data_SILVER';
    
    -- Applicants fact data masking
    EXEC('
        USE [' + @LakehouseDB + '];
        ALTER TABLE [applicants].[fact_applicants]
        ALTER COLUMN full_name 
        ADD MASKED WITH (FUNCTION = ''default()'')
    ');

    EXEC('
        USE [' + @LakehouseDB + '];
        ALTER TABLE [applicants].[fact_applicants]
        ALTER COLUMN id_number 
        ADD MASKED WITH (FUNCTION = ''partial(2,"XXX-XXX-XXX",2)'')
    ');

    -- Contacts data masking
    EXEC('
        USE [' + @LakehouseDB + '];
        ALTER TABLE [applicants].[applicants_contacts]
        ALTER COLUMN contact 
        ADD MASKED WITH (FUNCTION = ''default()'')
    ');

    -- Banking data masking
    EXEC('
        USE [' + @LakehouseDB + '];
        ALTER TABLE [applicants].[applicants_banking]
        ALTER COLUMN bank_account_number
        ADD MASKED WITH (FUNCTION = ''default()'')
    ');

    EXEC
    (
        '
            USE [' + @LakehouseDB + '];
            REVOKE UNMASK TO [Nomusa@takueinnogmail.onmicrosoft.com]
            REVOKE UNMASK TO [nolwazi@takueinnogmail.onmicrosoft.com]
        '
    );
    
    PRINT 'Data masking applied to Warehouse: ' + @LakehouseDB;
END;
